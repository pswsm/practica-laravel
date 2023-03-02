<?php

namespace App\Http\Controllers;

use App\Models\Player;
use App\Models\Team;
use Illuminate\Http\Request;

class TeamController extends Controller
{
	// Controls team-related routes
	public function list() {
		$teams = Team::all();
		$teamCount = count($teams);
		return view('teams.list', compact('teams', 'teamCount'));
	}

	public function find(Team $team) {
		// $playersWithoutTeam = Player::query()->where('team_id', 'null');
		return view('teams.form', compact('team'));
	}

	public function edit(Team $team, Request $request) {
		try {
			$validation = $request->validateWithBag('post', [
				'name' => ['required'],
				'coach' => ['required'],
				'budget' => ['required', 'numeric'],
				'category' => ['required'],
			]);
			$team->update($validation);
			$message = 'Team updated correctly!';
			$class = 'success';
			return view('teams.form', compact('team', 'message', 'class'));
		} catch (\Exception $error) {
			// var_dump($th);
			$class = 'danger';
			$message = 'Eror updating team: ' . $error->getMessage();
			return view('teams.form', compact('team', 'message', 'class'));
		}
	}
}
