<#include "macro-head.ftl">
<#include "macro-blog_header.ftl">
<#include "macro-comment.ftl">

<!DOCTYPE html>
<html>
  <@emiya_head title="${blogTitle}"></@emiya_head>
  <body id="emiya_blog">
    <@common_header></@common_header>
    <div class="blog__container">
      <div class="container-fluid">
        <div class="container--left">
          <h1 class="blog__title">${dynamicLabel}</h1>
          <div class="commentList">
            <#list recentComments as comment>
              <@dynamic_comment comment=comment></@dynamic_comment>
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