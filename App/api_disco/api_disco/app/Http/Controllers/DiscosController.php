<?php

namespace App\Http\Controllers;

use App\Models\Discos;
use Illuminate\Http\Request;
use App\Http\Requests\DiscosRequest;

class DiscosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Discos::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(DiscosRequest $request)
    {
        $discos = new Discos();
        $discos->nombre = $request->nombre;
        $discos->autos = $request->autos;
        $discos->genero = $request->genero;
        $discos->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Discos  $discos
     * @return \Illuminate\Http\Response
     */
    public function show(Discos $discos)
    {
        return $discos;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Discos  $discos
     * @return \Illuminate\Http\Response
     */
    public function update(DiscosRequest $request, Discos $discos)
    {
        $discos->nombre = $request->nombre;
        $discos->autos = $request->autos;
        $discos->genero = $request->genero;
        $discos->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Discos  $discos
     * @return \Illuminate\Http\Response
     */
    public function destroy(Discos $discos)
    {
        $discos->delete();
    }
}
