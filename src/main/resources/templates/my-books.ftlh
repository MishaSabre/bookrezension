<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мои рецнзии</h1>
    <hr>
    <form action="/book/create" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="bookName">Название книги</label>
            <input type="text" required class="form-control"
                   id="bookName" name="title">
        </div>

        <div class="form-group">
            <label for="description">Описание</label>
            <textarea required class="form-control" id="description" name="description"></textarea>
        </div>

        <div class="form-group">
            <label for="author">Автор книги</label>
            <textarea required class="form-control" id="author" name="author"></textarea>
        </div>
        <div class="form-group">
            <label for="date">Дата издания</label>
            <textarea required class="form-control" id="date" name="date"></textarea>
        </div>
        <div class="form-group">
            <div class="custom-file">
                <input required type="file" name="file1" id="file1">
                <label class="custom-file-label" for="file1">Первая фотография к рецензии</label>
            </div>
        </div>
        <div class="form-group">
            <div class="custom-file">
                <input type="file" name="file2" id="file2">
                <label class="custom-file-label" for="file2">Вторая фотография к рецензии</label>
            </div>
        </div>
        <div class="form-group">
            <div class="custom-file">
                <input type="file" name="file3" id="file3">
                <label class="custom-file-label" for="file3">Третья фотография к рецензии</label>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
    </form>

    <div class="card-columns" style="width: 18rem;">
        <#list books as book>
            <a href="/book/${book.id}" class="book-link">
                <div class="card text-white bg-dark my-3 book" style="width: 18rem;">
                    <div class="card-top">
                        <form action="/book/delete/${book.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Удалить
                            </button>
                        </form>
                    </div>
                    <img src="/images/${book.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${book.title}</h>
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>