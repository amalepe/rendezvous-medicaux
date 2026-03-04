<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Creneau;
use Illuminate\Http\Request;

class CreneauController extends Controller
{
    public function parMedecin(Request $request, $id)
    {
        $from = $request->query('from'); // YYYY-MM-DD
        $to   = $request->query('to');

        $q = Creneau::where('medecin_id', $id)
            ->where('disponible', true);

        if ($from) $q->where('date', '>=', $from);
        if ($to)   $q->where('date', '<=', $to);

        return Creneau::where('medecin_id', $id)
        ->orderBy('date')
        ->orderBy('heure_debut')
        ->get();
        }
}