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
		return view('players.create');
	}

	public function change(Player $player) {
		$teams = Team::all();
		return view('players.changeTeam', compact('teams', 'player'));
	}

	public function findDelete(Player $player) {
		return view('players.delete', compact('player'));
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

	// POST routes
	public function changeTeam(Player $player, Request $request) {
		$teams = Team::all();
		try {
			$validation = $request->validateWithBag('post', [
				'team' => ['required', 'numeric']
			]);
			if ($validation['team'] === 'null') {
				$player->team_id = $request->dismiss;
			} else {
				$player->team_id = $validation['team'];
			}
			$player->update();
			$class = 'success';
			$message = 'Team changed correctly!';
			return view('players.changeTeam', compact('player', 'message', 'class', 'teams'));
		} catch (\Exception $error) {
			// var_dump($th);
			$class = 'danger';
			$message = 'Error changing team: ' . $error->getMessage();
			return view('players.changeTeam', compact('player', 'message', 'class', 'teams'));
		}
	}

	public function add(Request $request) {
		try {
			$validation = $request->validateWithBag('post', [
				'name' => ['required'],
				'surname' => ['required'],
				'yearOfBirth' => ['required'],
				'salary' => ['required', 'numeric'],
			]);
			$player = new Player();
			$player->name = $validation['name'];
			$player->surname = $validation['surname'];
			$player->salary = $validation['salary'];
			$player->yearOfBirth = $validation['yearOfBirth'];
			$player->save();
			$class = 'success';
			$message = 'Player created!';
			return view('players.create', compact('player', 'message', 'class'));
		} catch (\Exception $error) {
			// var_dump($th);
			$class = 'danger';
			$message = 'Eror updating player: ' . $error->getMessage();
			return view('players.create', compact('player', 'message', 'class'));
		}
	}

	public function delete(Request $request, Player $player) {
		try {
			$players = Player::all();
			$playerCount = count($players);
			$player->delete();
			$message = 'Player deleted!';
			return view('players.list', compact('message', 'playerCount', 'players'));
		} catch (\Exception $error) {
			$class = 'danger';
			$message = 'Error deleting player: ' . $error->getMessage();
			return view('players.delete', compact('player', 'message', 'class'));
		}
	}
}
