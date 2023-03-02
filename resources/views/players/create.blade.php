@extends('layout')
	 
@section('content')

@isset($message)
<p class='text-{{$class}}'>{{ $message }}</p>
@endisset
<form method="POST" action="/players/add">
	<fieldset>
	@csrf
	<div class="form-group my-2">
		<label class="form-label" for="name">Name</label>
		<input class="form-control" type="text" name="name"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="surname">Surname</label>
		<input class="form-control" type="text" name="surname"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="yearOfBirth">Year of Birth</label>
		<input class="form-control" type="text" name="yearOfBirth"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="salary">Salary</label>
		<input class="form-control" type="number" name="salary"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="team">Team to enroll</label>
		<select name="team" class="form-select">
		<option>None</option>
		@foreach ($teams as $team)
		<option value="{{ $team->id }}">{{ $team->name }}</option>
		@endforeach
		</select>
	</div>
	<button class="btn btn-warning" type="submit">Create player</button>
	</fieldset>
<hr/>
</form>
@endsection
