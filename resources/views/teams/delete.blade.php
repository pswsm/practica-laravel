@extends('layout')
	 
@section('content')
 
@if(empty($team))
	<p>No team found!</p>
@else
@isset($message)
<p class='text-{{$class}}'>{{ $message }}</p>
@endisset
<form method="POST" action="/teams/{{$team->id}}/delete">
	<fieldset>
	@csrf
	@if (count($team->players) > 0)
	<button class="btn btn-danger" type="submit" disabled>Remove team</button>
	<p class='sub text-danger'>Cannot remove team: Still has players</p>
	@else
	<button class="btn btn-danger" type="submit">Remove team</button>
	@endif
	</fieldset>
<hr/>
</form>
@endif
@endsection
