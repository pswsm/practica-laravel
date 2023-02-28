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
		Schema::create('players', function (Blueprint $table) {
			$table->engine = 'InnoDB';
            $table->id();
			$table->string('name');
			$table->string('surname');
			$table->integer('yearOfBirth');
			$table->double('salary');
			$table->bigInteger('team_id')->unsigned()->index()->nullable();
			$table->foreign('team_id')->references('id')->on('teams')->onUpdate('cascade')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('players');
    }
};
