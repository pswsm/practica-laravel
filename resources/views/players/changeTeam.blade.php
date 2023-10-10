@extends('layout')
@section('content')
<div class="text-center">
	<p class="h3">Changing team for: {{ $player->name }} {{ $player->surname }}</p>
</div>
@isset($message)
<p class='text-{{$class}}'>{{ $message }}</p>
@endisset
<form method="POST" action="/players/{{$player->id}}/changeTeam">
@csrf
<div class="form-group my-2">
	<label class="form-label" for="team">Team to enroll</label>
	<select name="team" class="form-select">
	<option value="null">None</option>
	@foreach ($teams as $team)
	@if ($team->id !== $player->team_id)
	<option value="{{ $team->id }}">{{ $team->name }}</option>
	@endif
	@endforeach
	</select>
</div>
<button class="btn btn-outline-primary" type="submit">Change team</button>
</form>
@endsection
