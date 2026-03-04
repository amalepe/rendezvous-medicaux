<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\MedecinController;
use App\Http\Controllers\Api\CreneauController;
use App\Http\Controllers\Api\RendezVousController;

Route::post('post-test', fn() => response()->json(['post' => true]));

// Public
Route::get('medecins', [MedecinController::class, 'index']);
Route::get('medecins/{id}', [MedecinController::class, 'show']);
Route::get('medecins/{id}/creneaux', [CreneauController::class, 'parMedecin']);

Route::prefix('auth')->group(function () {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('register', [AuthController::class, 'register']);
});

Route::middleware('auth:sanctum')->group(function () {
    Route::get('auth/me', [AuthController::class, 'me']);
    Route::post('auth/logout', [AuthController::class, 'logout']);
    //Route::get('mes-patients', [MedecinController::class, 'MesPatients']);
    Route::get('medecin/rendezvous', [RendezVousController::class, 'rendezvousMedecin']);
    Route:: patch('medecin/rendezvous/{id}/confirmer', [RendezVousController::class, 'confirmParMed']);
     Route::patch('medecin/rendezvous/{id}/annuler', [RendezVousController::class, 'annulerParMed']);
    Route::post('rendezvous/reserver', [RendezVousController::class, 'reserver']);
    Route::post('rendezvous/{id}/annuler', [RendezVousController::class, 'annuler']);
    Route::get('rendezvous/mine', [RendezVousController::class, 'mesRendezVous']);
});