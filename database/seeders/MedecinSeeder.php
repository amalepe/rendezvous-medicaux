<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Medecin;
use App\Models\Creneau;

class MedecinSeeder extends Seeder
{
    public function run(): void
    {
        $doctors = [
            [
                'name' => 'Dr Ahmed',
                'email' => 'ahmed@doc.com',
                'specialite' => 'Cardiologue',
                'telephone' => '0661456713',
            ],
            [
                'name' => 'Dr Fatima',
                'email' => 'fatima@doc.com',
                'specialite' => 'Dermatologue',
                'telephone' => '0661225913',
            ],
            [
                'name' => 'Dr Karim',
                'email' => 'karim@doc.com',
                'specialite' => 'Pédiatre',
                'telephone' => '0661931856',
            ],
            [
                'name' => 'Dr Yahya',
                'email' => 'yahya@doc.com',
                'specialite' => 'Endocrinologue',
                'telephone' => '0661225599',
            ],
            [
                'name' => 'Dr Hidaya',
                'email' => 'hidaya@doc.com',
                'specialite' => 'Génécologue',
                'telephone' => '0661334455',
            ],
             [
                'name' => 'Dr Taha',
                'email' => 'taha@doc.com',
                'specialite' => 'Généraliste',
                'telephone' => '0661002233',
            ],

        ];

        foreach ($doctors as $doc) {

            // 1) Créer le compte user du médecin
            $user = User::create([
                'name' => $doc['name'],
                'email' => $doc['email'],
                'password' => Hash::make('12345678'),
                'role' => 'medecin',
            ]);

            // 2) Créer le profil médecin
            $medecin = Medecin::create([
                'user_id' => $user->id,
                'specialite' => $doc['specialite'],
                'telephone' => $doc['telephone'],
            ]);

            // 3) Créer des créneaux (ex: 5 jours, 2 créneaux par jour)
            for ($d = 1; $d <= 5; $d++) {
                $date = now()->addDays($d)->toDateString();

                Creneau::create([
                    'medecin_id' => $medecin->id,
                    'date' => $date,
                    'heure_debut' => '09:00:00',
                    'heure_fin' => '09:30:00',
                    'disponible' => true,
                ]);

                Creneau::create([
                    'medecin_id' => $medecin->id,
                    'date' => $date,
                    'heure_debut' => '10:00:00',
                    'heure_fin' => '10:30:00',
                    'disponible' => true,
                ]);
            }
        }
    }
}