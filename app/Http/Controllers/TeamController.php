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
				'name' => ['required', 'unique:App\Models\Team,name'],
				'coach' => ['required'],
				'budget' => ['required', 'numeric'],
				'category' => ['required'],
			]);
			$team->update($validation);
			$message = 'Team updated correctly!';
			return view('teams.form', compact('team', 'message'));
		} catch (\Exception $error) {
			// var_dump($th);
			$message = 'Eror updating team: ' . $error->getMessage();
			return view('teams.form', compact('team', 'message'));
		}
	}
}
