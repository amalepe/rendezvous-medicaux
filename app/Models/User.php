<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use  HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
    'name',
    'email',
    'password',
    'role'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
    public function medecin()
    {
    return $this->hasOne(\App\Models\Medecin::class, 'user_id');
    }

    public function patient()
    {
    return $this->hasOne(\App\Models\Patient::class, 'user_id');
    }
    protected static function booted()
    {
    static::created(function ($user) {

        if ($user->role === 'medecin') {
            \App\Models\Medecin::create([
                'user_id' => $user->id,
            ]);
            }

        if ($user->role === 'patient') {
            \App\Models\Patient::create([
                'user_id' => $user->id,
            ]);
            }

        });
    }
    
}
