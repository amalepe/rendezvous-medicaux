<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RendezVous extends Model
{
    protected $table = 'rendez_vous';
    protected $fillable = [
        'medecin_id',
        'patient_id',
        'creneau_id',
        'statut',
        'doctor_status',
        ];
    public function medecin()
    {
        return $this->belongsTo(Medecin::class, 'medecin_id');
    }

    public function patient()
    {
        return $this->belongsTo(Patient::class, 'patient_id');
    }

    public function creneau()
    {
        return $this->belongsTo(Creneau::class, 'creneau_id');
    }
}
