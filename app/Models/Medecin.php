<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Medecin extends Model
{
    protected $fillable = [
    'user_id',
    'specialite',
    'telephone'
     ];
    protected $table = 'medecins';
    public function user()
    {
        return $this->belongsTo(\App\Models\User::class);

    }

    public function creneaux()
    {
    return $this->hasMany(Creneau::class);
    }

    public function rendezVous()
    {
    return $this->hasMany(RendezVous::class);
    }
    
}
