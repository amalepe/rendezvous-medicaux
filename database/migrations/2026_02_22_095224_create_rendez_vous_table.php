<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('rendez_vous', function (Blueprint $table) {
             $table->id();
             $table->foreignId('medecin_id')->constrained('medecins')->cascadeOnDelete();
             $table->foreignId('patient_id')->constrained('patients')->cascadeOnDelete();
             $table->foreignId('creneau_id')->unique()->constrained('creneaux')->cascadeOnDelete();
             $table->string('statut')->default('reserve');
             $table->string('doctor_status')->default('en attente');
             $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rendez_vous');
    }
};
