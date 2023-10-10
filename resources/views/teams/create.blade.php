@extends('layout')
	 
@section('content')

@isset($message)
<p class='text-{{$class}}'>{{ $message }}</p>
@endisset
<form method="POST" action="/teams/add">
	<fieldset>
	@csrf
	<div class="form-group my-2">
		<label class="form-label" for="name">Team name</label>
		<input class="form-control" type="text" name="name"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="category">Category</label>
		<input class="form-control" type="text" name="category"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="budget">Budget</label>
		<input class="form-control" type="number" name="budget"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="coach">Coach</label>
		<input class="form-control" name="coach"/>
	</div>
	<button class="btn btn-warning" type="submit">Create team</button>
	</fieldset>
<hr/>
</form>
@endsection
