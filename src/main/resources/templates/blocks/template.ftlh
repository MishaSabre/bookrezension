<#macro template user>
    <!doctype html>
    <html lang="ru">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="/static/css/style.css">

        <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous">


        <title>BookRezension</title>
    </head>
        <body>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <a href="/">
                    <span class="navbar-brand mb-0 h1">BookRezension</span>
                </a>
                <#if user.email??>
                    <div class="dropdown text-end">
                        <a href="/profile">
                            <img src="/static/images/avatar.png" alt="mdo"
                                 width="32" height="32" class="rounded-circle">
                        </a>
                    </div>
                <#else>
                    <button class="btn btn-light my-2 my-sm-0" type="button"
                            onclick="window.location.href = '/login'">
                        Войти
                    </button>
                </#if>
            </div>
        </nav>
        <div class="container mt-4">
            <#nested/>
        </div>


        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous">
        </script>

    </body>
    </html>
</#macro>