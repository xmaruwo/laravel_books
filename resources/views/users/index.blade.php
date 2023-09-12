@extends('common.layout')

@section('index')
    <p>{{ $hello }} [users/index]</p>
    @foreach ($hello_array as $hello_word)
        {{ $hello_word }}<br>
    @endforeach
@endsection
