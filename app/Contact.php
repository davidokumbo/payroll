<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    //fillables
    protected $fillable = [
        'business_id', 
        'type',
        'name',
        'created_by',
        'is_default',
        'contact_id',
        'credit_limit'
    ];
    
}