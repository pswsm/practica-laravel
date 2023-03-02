@extends('layout')
@section('content')
<h1 class="display-1"></h1>
<div class="mx-auto text-center">
	<a href="/players/add"><button class="btn btn-primary" type="button">Add player</button></a>
</div>
<hr class="my-4">
<!--------- Player number ------>
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
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		@foreach($players as $player)
		<tr>
			<td>{{ $player->id }}</td>
			<td>{{ $player->name }} {{ $player->surname }}</td>
			<td>{{ $player->yearOfBirth }}</td>
			<td>{{ $player->salary }}</td>
			@if($player->team !== null)
			<td>{{ $player->team->name }}</td>
			@else
			<td>Not enrolled</td>
			@endif
			<td>
				<a href="/players/{{ $player->id }}/edit"><button class="btn btn-outline-warning">Edit</button></a>
				<a href="/players/{{ $player->id }}/delete"><button class="btn btn-outline-danger">Remove</button></a>
			</td>
		</tr>
		@endforeach
	</tbody>
</table>
@endsection
