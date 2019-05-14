<#include "macro-head.ftl">
<#include "macro-blog_header.ftl">

<!DOCTYPE html>
<html>
  <@emiya_head title="${linkLabel} - ${blogTitle}"></@emiya_head>
  <body id="emiya_blog">
    <@common_header></@common_header>
    <div class="blog__container">
      <div class="container-fluid">
        <div class="container--left">
          <h1 class="blog__title">${linkLabel}</h1>
          <div class="linkList">
          <#list links as link>
            <a class="link" rel="friend" href="${link.linkAddress}" title="${link.linkDescription}" target="_blank">
              <span class="link__title">${link.linkTitle}</span>
              <span class="link__desc">${link.linkDescription}</span>
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