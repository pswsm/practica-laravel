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
Route::get('/teams/{team}/edit', [TeamController::class, 'find']);
Route::get('/teams/{team}/delete', [TeamController::class, 'findDelete']);
Route::post('/teams/{team}/edit', [TeamController::class, 'edit']);
Route::post('/teams/{team}/delete', [TeamController::class, 'delete']);

Route::get('/players', [PlayerController::class, 'list']);
Route::get('/players/{player}/edit', [PlayerController::class, 'find']);
Route::get('/players/add', [PlayerController::class, 'create']);
Route::get('/players/{player}/delete', [PlayerController::class, 'findDelete']);
Route::post('/players/add', [PlayerController::class, 'add']);
Route::post('/players/{player}/delete', [PlayerController::class, 'delete']);
Route::post('/players/{player}/edit', [PlayerController::class, 'edit']);
