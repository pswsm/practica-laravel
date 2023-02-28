<?php

use App\Http\Controllers\MainController;
use App\Http\Controllers\PlayerController;
use App\Http\Controllers\TeamController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [MainController::class, 'index']);
Route::get('/home', [MainController::class, 'index']);

Route::get('/teams', [TeamController::class, 'list']);
Route::get('/teams/{team}', [TeamController::class, 'find']);
Route::post('/teams/{team}/edit', [TeamController::class, 'edit']);

Route::get('/players', [PlayerController::class, 'list']);
