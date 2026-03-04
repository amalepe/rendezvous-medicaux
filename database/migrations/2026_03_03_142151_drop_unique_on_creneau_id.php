<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::table('rendez_vous', function (Blueprint $table) {

        // supprimer la foreign key
        $table->dropForeign(['creneau_id']);

        
        $table->dropUnique('rendez_vous_creneau_id_unique');

        
        $table->foreign('creneau_id')
              ->references('id')
              ->on('creneaux')
              ->onDelete('cascade');
    });
}

public function down()
{
    Schema::table('rendez_vous', function (Blueprint $table) {
        $table->unique('creneau_id');
    });
}
};
