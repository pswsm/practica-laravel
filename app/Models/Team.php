<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
	use HasFactory;

	public $timestamps = false;
	protected $fillable = ['name', 'coach', 'budget', 'category'];

	public function players() {
		return $this->hasMany(Player::class);
	}

	public function addPlayer(Player $player) {
		return $this->players()->save($player);
	}
}
