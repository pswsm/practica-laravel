@extends('layout')
@section('content')
<h1 class="display-1"></h1>
<hr class="my-4">

<!--------- Team number ------>
<p class="text-center">Number of players found: {{ $playerCount }}</p>

<!--------- Table gen -------->
<p>Here's a listing of the players:</p>
<table class="table table-hover">
	<thead>
		<tr>
			<th>Player ID</th>
			<th>Name</th>
			<th>Year of Birth</th>
			<th>Salary</th>
			<th>Team ID</th>
		</tr>
	</thead>
	<tbody>
		@foreach($players as $player)
		<tr>
			<td>{{ $player->id }}</td>
			<td>{{ $player->name }} {{ $player->surname }}</td>
			<td>{{ $player->yearOfBirth }}</td>
			<td>{{ $player->salary }}</td>
			<td>{{ $player->team_id }}</td>
		</tr>
		@endforeach
	</tbody>
</table>
@endsection
