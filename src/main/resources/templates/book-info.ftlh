<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div style="text-align: center">
        <#list images as img>
            <img src="/images/${img.id}" height="350px"/>
        </#list>
    </div>
    <hr>
    <p><h1 style="text-align: center">${book.title} | ${book.author} ₽</h1></p>
    <p style="text-align: center">${book.description}</p>

    <hr>
    <p style="text-align: center">
        <a href="/user/${book.user.id}">
            <img src="/static/images/avatar.png" alt="mdo" width="32" height="32" class="rounded-circle"> ${book.user.name}
        </a>
    </p>

</@t.template>