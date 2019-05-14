<#include "macro-page.ftl">

<@sidePage htmlTitle="${allTagsLabel} - ${blogTitle}" pageTitle="${archiveLabel} - ${sumLabel} ${statistic.statisticPublishedBlogArticleCount} ${articleLabel}">
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
</@sidePage>