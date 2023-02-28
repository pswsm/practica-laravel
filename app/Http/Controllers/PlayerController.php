<?php

namespace App\Http\Controllers;

use App\Models\Player;
use Illuminate\Http\Request;

class PlayerController extends Controller
{
	// Controls team-related routes
	public function list() {
		$players = Player::all();
		$playerCount = count($players);
		return view('players.list', compact('players', 'playerCount'));
	}

	public function find(Player $player) {
		return view('players.form', compact('player'));
	}
}
