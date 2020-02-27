<div class="sidebar">
  <#if noticeBoard?? && (noticeBoard?length > 0)>
  <section class="sidebar__container">
    <div class="header">
      <span>${boardLabel}</span>
    </div>
    <div class="board" id="board">
      ${noticeBoard}    
    </div>
  </section>
  </#if>
  <section class="sidebar__container">
    <div class="header">
      <span>${searchLabel}</span>
    </div>
    <div class="search">
      <form class="search__form" action="${servePath}/search">
        <div class="input">
          <input type="text" name="keyword" placeholder="输入关键字搜索">
          <button type="submit"></button>
        <div>
      </form>
    </div>
  </section>

  <section class="sidebar__container">
    <div class="header">
      <span>${aboutLabel}</span>
    </div>
    <main class="user">
      <img class="user__avatar" src="${adminUser.userAvatar}" alt="${adminUser.userName}"/>
      <div class="user__info">
        <div class="item"><a href="${servePath}/archives.html">${statistic.statisticPublishedBlogArticleCount}<span class="text">${articleLabel}</span></a></div>
        <div class="item"><span data-uvstaturl="${servePath}">${statistic.statisticBlogViewCount}</span><span class="text">${viewLabel}</span></div>
        <div class="item">${onlineVisitorCnt}<span class="text">${onlineVisitorLabel}</span></div>
      </div>
    </main>
  </section>

  <#if 0 != mostUsedTags?size>
  <section class="sidebar__container">
    <div class="header">
      <span>${tagsLabel}</span>
    </div>
    <div class="tags rowSmallItemLayout">
      <#list mostUsedTags as tag>
      <a class="item" href="${servePath}/tags/${tag.tagTitle?url('UTF-8')}">${tag.tagTitle}</a>
      </#list>
    </div>
  </section>
  </#if>

  <#if 0 != archiveDates?size>
  <section class="sidebar__container">
    <div class="header">
      <span>${archiveLabel}</span>
    </div>
    <div class="lists">
      <#list archiveDates as archiveDate>
        <#if archiveDate.archiveDatePublishedArticleCount != 0>
          <#if archiveDate_index < 10>
            <#if "en" == localeString?substring(0, 2)>
              <a href="${servePath}/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}"
                  title="${archiveDate.monthName} ${archiveDate.archiveDateYear}(${archiveDate.archiveDatePublishedArticleCount})">
                  ${archiveDate.monthName} ${archiveDate.archiveDateYear}(${archiveDate.archiveDatePublishedArticleCount})
              </a>
            <#else>
              <a href="${servePath}/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}"
                  title="${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}(${archiveDate.archiveDatePublishedArticleCount})">
                  ${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}(${archiveDate.archiveDatePublishedArticleCount})
              </a>
            </#if>
          </#if>
        </#if>
      </#list>
      <#if archiveDates?size &gt; 10>
        <a href="${servePath}/archives.html">...</a>
      </#if>
    </div>
  </section>
  </#if>

  <section class="sidebar__container article__contents J_article__contents fn__none">
    <div class="header">
      <span>${articleContent}</span>
    </div>
    <div class="contents J_article__contents--container">
    </div>
  </section>

  <div class="toTop J_backToTop">
    <img src="${staticServePath}/skins/${skinDirName}/images/top.png" />
  </div>
</div>
