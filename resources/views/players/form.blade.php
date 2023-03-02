@extends('layout')
	 
@section('content')
 
@if(empty($player))
	<p>No player found!</p>
@else
@isset($message)
<p class='text-{{$class}}'>{{ $message }}</p>
@endisset
<form method="POST" action="/players/{{$player->id}}/edit">
	<fieldset>
	@csrf
	<div class="form-group my-2">
		<label class="form-label" for="id">Player ID</label>
		<input class="form-control" type="text" name="id" value="{{ $player->id }}" disabled/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="name">Name</label>
		<input class="form-control" type="text" name="name" value="{{ $player->name }}"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="surname">Surname</label>
		<input class="form-control" type="text" name="surname" value="{{ $player->surname }}"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="yearOfBirth">Year of Birth</label>
		<input class="form-control" type="text" name="yearOfBirth" value="{{ $player->yearOfBirth }}"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="salary">Salary</label>
		<input class="form-control" type="number" name="salary" value="{{ $player->salary }}"/>
	</div>
	<button class="btn btn-warning" type="submit">Update player</button>
	</fieldset>
<hr/>
</form>
<div class="text-center">
	@if ($player->team_id !== null)
	<p class='h5'>{{ $player->name }} {{ $player->surname }} currently plays in <b>{{ $player->team->name }}</b></p>
	@else
	<p class='h5'>{{ $player->name }} {{ $player->surname }} currently <b>does not play in any team</b></p>
	@endif
	<a href="/players/{{$player->id}}/changeTeam"><button class="btn btn-warning" type="button">Change team</button></a>
</div>
@endif
@endsection
