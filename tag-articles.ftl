<#include "macro-head.ftl">
<#include "macro-blog_header.ftl">

<!DOCTYPE html>
<html>
  <@emiya_head title="${tag.tagTitle} - ${blogTitle}"></@emiya_head>
  <body id="emiya_blog">
    <@common_header></@common_header>
    <div class="blog__container">
      <div class="container-fluid">
        <div class="article-list container--left">
          <h1 class="blog__title">${tag.tagTitle}<small>${tagLabel}</small></h1>
          <#include "article-list.ftl">
        </div>
        <div class="aside container--right">
          <#include "side.ftl">
        </div>
      </div>
    </div>
    <#include "footer.ftl">
  </body>
</html>