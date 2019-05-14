<#include "macro-head.ftl">
<#include "macro-blog_header.ftl">

<!DOCTYPE html>
<html>
  <@emiya_head title="${allTagsLabel} - ${blogTitle}"></@emiya_head>
  <body id="emiya_blog">
    <@common_header></@common_header>
    <div class="blog__container">
      <div class="container-fluid">
        <div class="container--left">
          <h3 class="blog__title">${archiveLabel} - ${sumLabel} ${statistic.statisticPublishedBlogArticleCount} ${articleLabel}</h3>
          <div class="archiveList">
            <#list archiveDates as archiveDate>
            <#if "en" == localeString?substring(0, 2)>
              <a class="archiveItem" href="${servePath}/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}">
                ${archiveDate.monthName} ${archiveDate.archiveDateYear}(${archiveDate.archiveDatePublishedArticleCount})
              </a> 
            <#else>
              <a class="archiveItem" href="${servePath}/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}">
                ${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}(${archiveDate.archiveDatePublishedArticleCount})
              </a> 
            </#if>
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