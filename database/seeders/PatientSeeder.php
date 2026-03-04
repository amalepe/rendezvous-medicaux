<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Patient;

class PatientSeeder extends Seeder
{
    public function run(): void
    {
        $patients = [
            [
                'name' => 'Hassane',
                'email' => 'Hassane@test.com',
                'telephone' => '0600000000',
            ],
            [
                'name' => 'Ali',
                'email' => 'ali@test.com',
                'telephone' => '0611111111',
            ],
             [
                'name' => 'Nadia',
                'email' => 'Nadia@test.com',
                'telephone' => '0622222222',
            ],
            [
                'name' => 'Areej',
                'email' => 'areej@test.com',
                'telephone' => '0633333333',
            ],
        ];

        foreach ($patients as $data) {

            // 1️⃣ Créer le user
            $user = User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => Hash::make('12345678'),
                'role' => 'patient',
            ]);

            // 2️⃣ Créer le profil patient
            Patient::create([
                'user_id' => $user->id,
                'telephone' => $data['telephone'],
            ]);
        }
    }
}