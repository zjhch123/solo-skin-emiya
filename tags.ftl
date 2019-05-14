<#include "macro-head.ftl">
<#include "macro-blog_header.ftl">

<!DOCTYPE html>
<html>
  <@emiya_head title="${allTagsLabel} - ${blogTitle}"></@emiya_head>
  <body id="emiya_blog">
    <@common_header></@common_header>
    <div class="blog__container">
      <div class="container-fluid">
        <div class="article-list container--left">
          <h1 class="blog__title"><small>${sumLabel}</small> ${tags?size}<small>${tagLabel}</small></h1>
          <div class="tagsList">
            <#list tags as tag>
            <a rel="tag" data-count="${tag.tagPublishedRefCount}" class="tagBtn"
              href="${servePath}/tags/${tag.tagTitle?url('UTF-8')}">
                <span class="name">${tag.tagTitle}</span>
                (<b>${tag.tagPublishedRefCount}</b>)
            </a>
            </#list>
          </div>
        </div>
        <div class="aside container--right">
          <#include "side.ftl">
        </div>
      </div>
    </div>
     <#include "footer.ftl">
  </body>
</html>