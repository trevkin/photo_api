<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet" type="text/css">

        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 12px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
    <form name="form1" id="form1" enctype="application/x-www-form-urlencoded" action="" method="post">
    <input type="file" id="file" name="file">
    <button name="go" onClick="upload()">
    </form>
        <div class="flex-center position-ref full-height">
            @if (Route::has('login'))
                <div class="top-right links">
                    @auth
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ route('login') }}">Login</a>
                        <a href="{{ route('register') }}">Register</a>
                    @endauth
                </div>
            @endif

            <div class="content">
                <div class="title m-b-md">
                    Laravel
                </div>

                <div class="links">
                    <a href="https://laravel.com/docs">Documentation</a>
                    <a href="https://laracasts.com">Laracasts</a>
                    <a href="https://laravel-news.com">News</a>
                    <a href="https://nova.laravel.com">Nova</a>
                    <a href="https://forge.laravel.com">Forge</a>
                    <a href="https://github.com/laravel/laravel">GitHub</a>
                </div>
            </div>
        </div>
    </body>
    <script>
	upload(file) {  
     let content = {  
          "authorship": "author",  
          "type": "file",  
          "visibility": "place",  
          "parent": "/api/core/v3/places/" + this.id,  
          "subject": file.name,  
          "categories": [],  
          "content": {  
            "type": "text/html",  
            "text": file.name,  
            "name": file.name,  
            "size": file.size  
          }  
     };  
     this.uploads.http({  
          method: 'POST',  
          url: "/api/core/v3/contents",  
          headers: {  
            'Content-Type': undefined  
          },  
          transformRequest: function(data) {  
            var formData = new FormData();  
            formData.append('model', new Blob([JSON.stringify(content)], {  
              type: "application/json"  
            }));  
            formData.append("file", file);  
            return formData;  
          },  
          data: {  
            model: content,  
            files: file  
          }  
     }).success(function(data, status, headers, config) {  
        // ...  
     }).error(function(data, status, headers, config) {  
        // ...          
     });  
} 
	
	</script>
</html>
