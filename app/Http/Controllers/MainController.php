<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MainController extends Controller
{
	// Controls general routes like '/home' or '/'

	public function index() {
		return view('index');
	}
}
