<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;
use App\Mail\RendezVousConfirme;
use App\Mail\RendezVousAnnule;

use Illuminate\Support\Facades\DB;
use App\Models\Creneau;
use App\Models\Medecin;
use App\Models\RendezVous;
use App\Models\User;

class RendezVousController extends Controller
{
    public function reserver(Request $request)
{
    $data = $request->validate([
        'creneau_id' => ['required', 'integer', 'exists:creneaux,id'],
    ]);

    $user = $request->user();
    $patient = $user->patient;

    if (!$patient) {
        return response()->json(['message' => 'Profil patient introuvable'], 403);
    }

    return DB::transaction(function () use ($data, $patient) {

        $creneau = \App\Models\Creneau::where('id', $data['creneau_id'])
            ->lockForUpdate()
            ->first();
            
            // Vérifier si le patient a déjà un RDV avec ce médecin le même jour
         $already = \App\Models\RendezVous::where('patient_id', $patient->id)
          ->where('medecin_id', $creneau->medecin_id)
          ->whereHas('creneau', function ($q) use ($creneau) {
            $q->where('date', $creneau->date);
            })
            ->where('statut', 'reserve')
            ->exists();
            if ($already) {
                return response()->json([
                    'message' => 'Vous avez déjà un rendez-vous avec ce médecin ce jour.'
                    ], 409);
        }


        if (!$creneau) {
            return response()->json(['message' => 'Créneau introuvable'], 404);
        }

        // Vérifier dispo 
        if (!$creneau->disponible) {
            return response()->json(['message' => 'Créneau déjà réservé'], 409);
        }
         
         
        // Vérifier RDV existant 
        $exists = \App\Models\RendezVous::where('creneau_id', $creneau->id)
        ->where('statut', '!=', 'annule')   // ignore les RDV annulés
        ->exists();
        if ($exists) {
            // si jamais disponible est resté true à cause d’un bug
            $creneau->update(['disponible' => false]);
            return response()->json(['message' => 'Créneau déjà réservé'], 409);
        }

        $rdv = \App\Models\RendezVous::create([
            'medecin_id' => $creneau->medecin_id,
            'patient_id' => $patient->id,
            'creneau_id' => $creneau->id,
            'statut' => 'reserve',
        ]);

        $creneau->update(['disponible' => false]);

        return response()->json([
            'message' => 'Rendez-vous réservé',
            'data' => $rdv->load(['medecin.user', 'patient.user', 'creneau']),
        ], 201);
    });
}
       public function mesRendezVous(Request $request)
{
    $user = $request->user();
    $patient = $user->patient;

    if (!$patient) {
        return response()->json(['message' => 'Profil patient introuvable'], 403);
    }

    $rendezvous = \App\Models\RendezVous::with([
            'medecin.user',   
            'creneau'        
        ])
        ->where('patient_id', $patient->id)
        ->where('statut','reserve')
        ->get();
        return response()->json([
        'data' => $rendezvous
        ]);
        }
         public function annuler($id, Request $request)
{
    $user = $request->user();
    $patient = $user->patient;

    if (!$patient) {
        return response()->json(['message' => 'Profil patient introuvable'], 403);
    }

    $rdv = \App\Models\RendezVous::with('creneau')
        ->where('id', $id)
        ->where('patient_id', $patient->id)
        ->first();

    if (!$rdv) {
        return response()->json(['message' => 'Rendez-vous introuvable'], 404);
    }

    if (!$rdv->creneau) {
        return response()->json(['message' => 'Créneau introuvable pour ce rendez-vous'], 404);
    }

    DB::transaction(function () use ($rdv) {
        // rendre le créneau disponible
        $rdv->creneau->update(['disponible' => 1]);

        // annuler le rendez-vous
        $rdv->update(['statut' => 'annule']);
        $rdv->save();
    });

    return response()->json(['message' => 'Rendez-vous annulé']);
}
 public function rendezvousMedecin(Request $request)
{
    $user = $request->user();

    if ($user->role !== 'medecin') {
        return response()->json(['message' => 'Accès médecin requis'], 403);
    }

    $medecin = $user->medecin;

    if (!$medecin) {
        return response()->json(['message' => 'Profil médecin introuvable'], 403);
    }

    $rdvs = \App\Models\RendezVous::with(['patient.user','creneau','medecin.user'])
        ->where('medecin_id', $medecin->id)
        ->orderByDesc('id')
        ->get();

    return response()->json(['data' => $rdvs]);
} 

public function confirmParMed(Request $request, $id)
{
    $user = $request->user();

    if ($user->role !== 'medecin') {
        return response()->json(['message' => 'Accès médecin requis'], 403);
    }

    $medecin = $user->medecin;
    if (!$medecin) {
        return response()->json(['message' => 'Profil médecin introuvable'], 403);
    }

    $rdv = RendezVous::with(['patient.user', 'medecin.user', 'creneau'])->findOrFail($id);

    if ((int) $rdv->medecin_id !== (int) $medecin->id) {
        return response()->json(['message' => 'Ce n’est pas votre rendez-vous'], 403);
    }

    if ($rdv->statut === 'annule') {
        return response()->json(['message' => 'Le patient a déjà annulé'], 422);
    }

    if ($rdv->statut !== 'reserve') {
        return response()->json(['message' => 'RDV pas réservé par le patient'], 422);
    }

    $rdv->doctor_status = 'confirme';
    $rdv->save();

    try {
        $email = $rdv->patient->user->email ?? null;

        if ($email) {
            Mail::to($email)->send(new RendezVousConfirme($rdv));
        }
    } catch (\Exception $e) {
        Log::error('Erreur envoi email confirmation : ' . $e->getMessage());
    }

    return response()->json([
        'message' => 'Rendez-vous confirmé',
        'data' => $rdv
    ]);
}

//Annuler Rdv doc
public function annulerParMed(Request $request, $id)
{
    $user = $request->user();

    if ($user->role !== 'medecin') {
        return response()->json(['message' => 'Accès médecin requis'], 403);
    }

    $medecin = $user->medecin;
    if (!$medecin) {
        return response()->json(['message' => 'Profil médecin introuvable'], 403);
    }

    $rdv = RendezVous::with(['patient.user', 'medecin.user', 'creneau'])->findOrFail($id);

    if ((int) $rdv->medecin_id !== (int) $medecin->id) {
        return response()->json(['message' => 'Ce n’est pas votre rendez-vous'], 403);
    }

    if ($rdv->statut === 'annule') {
        return response()->json(['message' => 'Le patient a déjà annulé'], 422);
    }

    DB::transaction(function () use ($rdv) {
        if ($rdv->creneau) {
            $rdv->creneau->update(['disponible' => 1]);
        }

        $rdv->doctor_status = 'annulee';
        $rdv->save();
    });

    try {
        $email = $rdv->patient->user->email ?? null;

        if ($email) {
            Mail::to($email)->send(new RendezVousAnnule($rdv));
        }
    } catch (\Exception $e) {
        Log::error('Erreur envoi email annulation : ' . $e->getMessage());
    }

    return response()->json([
        'message' => 'Rendez-vous annulé par le médecin',
        'data' => $rdv
    ]);
}

}