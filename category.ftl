<#include "macro-page.ftl">

<@sidePage htmlTitle="${categoryLabel} - ${blogTitle}" pageTitle="${categoryLabel}">
  <div class="categoryList">
  <#list categories as category>
    <a class="categoryLink" rel="friend" href="${servePath}/category/${category.categoryURI}" title="${category.categoryTitle}" target="_blank">
      <p class="categoryLink__title">
        ${category.categoryTitle} - 
        <b>${category.categoryTagCnt}</b> ${tagsLabel}
      </p>
      <p class="categoryLink__desc">${category.categoryDescription}</p>
    </a>
  </#list>
  </div>
</@sidePage>
