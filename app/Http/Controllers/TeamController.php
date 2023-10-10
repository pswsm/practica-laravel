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

	public function findDelete(Team $team) {
		return view('teams.delete', compact('team'));
	}

	public function create() {
		return view('teams.create');
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

	public function add(Request $request) {
		try {
			$validation = $request->validateWithBag('post', [
				'name' => ['required'],
				'coach' => ['required'],
				'budget' => ['required', 'numeric'],
				'category' => ['required'],
			]);
			$team = new Team();
			$team->name = $validation['name'];
			$team->coach = $validation['coach'];
			$team->budget = $validation['budget'];
			$team->category = $validation['category'];
			$team->save();
			$class = 'success';
			$message = 'Team created!';
			return view('teams.create', compact('message', 'class'));
		} catch (\Exception $error) {
			// var_dump($th);
			$class = 'danger';
			$message = 'Eror updating team: ' . $error->getMessage();
			return view('teams.create', compact('message', 'class'));
		}
	}

	public function delete(Request $request, Team $team) {
		try {
			$teams = Team::all();
			$teamCount = count($teams);
			$team->delete();
			$message = 'Team deleted!';
			return view('teams.list', compact('message', 'teamCount', 'teams'));
		} catch (\Exception $error) {
			$class = 'danger';
			$message = 'Error deleting team: ' . $error->getMessage();
			return view('teams.delete', compact('team', 'message', 'class'));
		}
	}
}
