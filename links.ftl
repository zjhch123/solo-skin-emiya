<#include "macro-page.ftl">

<@sidePage htmlTitle="${linkLabel} - ${blogTitle}" pageTitle="${linkLabel}">
  <div class="friendLinkList">
  <#list links as link>
    <a class="friendLink" rel="friend" href="${link.linkAddress}" title="${link.linkDescription}" target="_blank">
      <span class="friendLink__title">${link.linkTitle}</span>
      <span class="friendLink__desc">${link.linkDescription}</span>
    </a>
  </#list>
  </div>
</@sidePage>
