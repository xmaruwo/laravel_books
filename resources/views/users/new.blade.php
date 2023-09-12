<html>
    <head>
        <title>@yield('title')</title>
        @section('styles')
        <link href="{{ url('css/app.css') }}" rel="stylesheet" type="text/css">
        @show
    </head>
    <body>
        {{-- サブビュー読み込み --}}
        @include('layouts.header')

        <div class="container">
            @yield('content')
        </div>
    </body>
</html>
