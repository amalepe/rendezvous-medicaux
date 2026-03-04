<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Creneau extends Model
{
    protected $table = 'creneaux';
    protected $fillable = [
    'medecin_id',
    'date',
    'heure_debut',
    'heure_fin',
    'disponible'
    ];
    protected $casts = [
        'disponible' => 'boolean',
        'date' => 'date:Y-m-d',
    ];

    public function medecin()
    {
        return $this->belongsTo(Medecin::class, 'medecin_id');
    }

    public function rendezVous()
    {
        return $this->hasOne(RendezVous::class, 'creneau_id');
    }
}
