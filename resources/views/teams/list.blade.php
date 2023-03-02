@extends('layout')
@section('content')
<h1 class="display-1"></h1>
<hr class="my-4">

<!--------- Team number ------>
<p class="text-center">Number of teams found: {{ $teamCount }}</p>

<!--------- Table gen -------->
<p>Here's a listing of the teams:</p>
<table class="table table-hover">
	<thead>
		<tr>
			<th>Teamd ID</th>
			<th>Team Name</th>
			<th>Coach</th>
			<th>Category</th>
			<th>Yearly Budget</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		@foreach($teams as $team)
		<tr>
			<td>{{ $team->id }}</td>
			<td>{{ $team->name }}</td>
			<td>{{ $team->coach }}</td>
			<td>{{ $team->category }}</td>
			<td>{{ $team->budget }}</td>
			<td>
				<a href="/teams/{{ $team->id }}/edit"><button class="btn btn-outline-warning">Edit</button></a>
				<a href="/teams/{{ $team->id }}/delete"><button class="btn btn-outline-danger">Remove</button></a>
			</td>
		</tr>
		@endforeach
	</tbody>
</table>
@endsection
