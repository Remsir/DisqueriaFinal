<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DiscosController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
//Route::get('/discos',[DiscosController::class,'index']);

Route::get('/discos/{discos}',[DiscosController::class,'show']);
Route::put('/discos/{discos}',[DiscosController::class,'update']);
Route::delete('/discos/{discos}',[DiscosController::class,'destroy']);
Route::apiResource('/discos',DiscosController::class); 

