@extends('layout')
	 
@section('content')
 
@if(empty($team))
	<p>No team found!</p>
@else
@isset($message)
<p class='message'>{{ $message }}</p>
@endisset
<form method="POST" action="/teams/{{$team->id}}/edit">
	<fieldset>
	@csrf
	<div class="form-group my-2">
		<label class="form-label" for="id">Team ID:</label>
		<input class="form-control" type="text" name="id" value="{{ $team->id }}" disabled/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="name">Name</label>
		<input class="form-control" type="text" name="name" value="{{ $team->name }}"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="coach">Coach</label>
		<input class="form-control" type="text" name="coach" value="{{ $team->coach }}"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="category">Category</label>
		<input class="form-control" type="text" name="category" value="{{ $team->category }}"/>
	</div>
	<div class="form-group my-2">
		<label class="form-label" for="budget">Budget</label>
		<input class="form-control" type="text" name="budget" value="{{ $team->budget }}"/>
	</div>
	<button class="btn btn-warning" type="submit">Update team</button>
	</fieldset>
<hr class="my-4">
<div>
	<b>Players:</b>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Player Name</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			@foreach($team->players as $player)
				<tr>
					<td>
						<p>{{ $player->name }} {{ $player->lastName }}</p>
					</td>
					<td>
						<a href="/players/{{ $player->id }}/edit"><button type="button" class="btn btn-outline-warning mx-1">Edit</button></a>
						<a href="/players/{{ $player->id }}/delete"><button type="button" class="btn btn-outline-danger mx-1">Delete</button></a>
					</td>
				</tr>
			@endforeach
		</tbody>
	</table>
</div>
<hr/>
</form>
@endif

@endsection
