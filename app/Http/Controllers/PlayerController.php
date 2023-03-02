<?php

namespace App\Http\Controllers;

use App\Models\Player;
use App\Models\Team;
use Illuminate\Http\Request;

class PlayerController extends Controller
{
	// Controls team-related routes
	// GET routes

	// List all players
	public function list() {
		$players = Player::all();
		$playerCount = count($players);
		return view('players.list', compact('players', 'playerCount'));
	}

	// Form player
	public function find(Player $player) {
		return view('players.form', compact('player'));
	}

	public function create() {
		$teams = Team::all();
		return view('players.create', compact('teams'));
	}

	// POST routes
	public function edit(Player $player, Request $request) {
		try {
			$validation = $request->validateWithBag('post', [
				'name' => ['required'],
				'surname' => ['required'],
				'yearOfBirth' => ['required'],
				'salary' => ['required', 'numeric']
			]);
			$player->update($validation);
			$class = 'success';
			$message = 'Player updated correctly!';
			return view('players.form', compact('player', 'message', 'class'));
		} catch (\Exception $error) {
			// var_dump($th);
			$class = 'danger';
			$message = 'Eror updating player: ' . $error->getMessage();
			return view('players.form', compact('player', 'message', 'class'));
		}
	}

	public function add(Player $player, Request $request) {
		$teams = Team::all();
		try {
			$validation = $request->validateWithBag('post', [
				'name' => ['required'],
				'surname' => ['required'],
				'yearOfBirth' => ['required'],
				'salary' => ['required', 'numeric'],
				'team_id' => []
			]);
			$player->save($validation);
			$class = 'success';
			$message = 'Player updated correctly!';
			return view('players.create', compact('player', 'message', 'class', 'teams'));
		} catch (\Exception $error) {
			// var_dump($th);
			$class = 'danger';
			$message = 'Eror updating player: ' . $error->getMessage();
			return view('players.create', compact('player', 'message', 'class', 'teams'));
		}
	}
}
