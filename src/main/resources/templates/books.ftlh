<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Поиск рецензий</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск по рецензиям</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <hr>
    <div class="card-columns" style="width: 18rem;">
        <#list books as book>
            <a href="/book/${book.id}" class="book-link" >
                <div class="card text-white bg-dark my-3 ms-3 product" style="width: 18rem;">
                    <img src="/images/${book.previewImageId}" width="285px" height="350px">
                    <div class="card-body">
                        <h5 class="card-title">${book.title}</h5>
                        <p class="card-text">${book.author} </p>
                    </div>
                    <div class="card-footer">
                        ${book.date}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>