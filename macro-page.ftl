<#include "macro-head.ftl">
<#include "macro-blog_header.ftl">

<#macro sidePage htmlTitle pageTitle="">
<!DOCTYPE html>
<html>
  <@emiya_head title="${htmlTitle}"></@emiya_head>
  <body id="emiya_blog">
    <@blog_nav></@blog_nav>
    <div class="container-fluid">
      <main id="pjax" class="container--left">
        <#if pjax><!---- pjax {#pjax} start ----></#if>
        <@common_header></@common_header>
        <#if pageTitle != "">
          <h1 class="blog__title">${pageTitle}</h1>
        </#if>
        <#nested>
        <#if pjax><!---- pjax {#pjax} end ----></#if>
      </main>
      <div class="aside container--right">
        <#include "side.ftl">
      </div>
    </div>
    <#include "footer.ftl">
  </body>
</html>
</#macro>

<#macro articlesPage htmlTitle pageTitle="">
  <@sidePage htmlTitle="${htmlTitle}" pageTitle="${pageTitle}">
    <#nested>
    <#include "article-list.ftl">
  </@sidePage>
</#macro>
