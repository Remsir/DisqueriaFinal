<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DiscosRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'nombre'=>'required',
            'autos'=>'required',
            'genero'=>'required'
        ];
    }
    public function messages(){
        return [
            'nombre.required' =>'Campo nombre requerido',
            'autos.required' =>'Campo autor requerido',
            'genero.required' =>'Campo genero requerido',
        ];
    }
}
