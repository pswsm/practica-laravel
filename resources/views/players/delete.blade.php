@extends('layout')
	 
@section('content')
 
@if(empty($player))
	<p>No player found!</p>
@else
@isset($message)
<p class='text-{{$class}}'>{{ $message }}</p>
@endisset
<form method="POST" action="/players/{{$player->id}}/delete">
	<fieldset>
	@csrf
	@if ($player->team === null)
	<button class="btn btn-danger" type="submit">Remove player</button>
	@else
	<button class="btn btn-danger" type="submit" disabled>Remove player</button>
	<p class='sub text-danger'>Cannot remove player: Still enrolled in a team</p>
	@endif
	</fieldset>
<hr/>
</form>
<div class="text-center">
	@if ($player->team !== null)
	<p class='h5'>{{ $player->name }} {{ $player->surname }} currently plays in <b>{{ $player->team->name }}</b></p>
	@else
	<p class='h5'>{{ $player->name }} {{ $player->surname }} currently <b>does not play in any team</b></p>
	@endif
	<a href="/players/{{$player->id}}/changeTeam"><button class="btn btn-warning" type="button">Change team</button></a>
</div>
@endif
@endsection
