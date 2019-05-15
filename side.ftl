<div class="sidebar">
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
        <div class="item"><a href="${servePath}/dynamic.html">${statistic.statisticPublishedBlogCommentCount}<span class="text">${commentLabel}</span></a></div>
        <div class="item">${statistic.statisticBlogViewCount}<span class="text">${viewLabel}</span></div>
        <div class="item">${onlineVisitorCnt}<span class="text">${onlineVisitorLabel}</span></div>
      </div>
    </main>
  </section>

  <#if 0 != mostUsedTags?size>
  <section class="sidebar__container">
    <div class="header">
      <span>${tagsLabel}</span>
    </div>
    <div class="tags">
      <#list mostUsedTags as tag>
      <a class="tagBtn" href="${servePath}/tags/${tag.tagTitle?url('UTF-8')}">${tag.tagTitle}</a>
      </#list>
    </div>
  </section>
  </#if>

  <#if 0 != mostCommentArticles?size>
  <section class="sidebar__container">
    <div class="header">
      <span>${mostCommentLabel}</span>
    </div>
    <div class="lists">
      <#list mostCommentArticles as article>
      <a href="${servePath}${article.articlePermalink}">${article.articleTitle}</a>
      </#list>
    </div>
  </section>
  </#if>

  <#if 0 != mostViewCountArticles?size>
  <section class="sidebar__container">
    <div class="header">
      <span>${mostViewLabel}</span>
    </div>
    <div class="lists">
      <#list mostViewCountArticles as article>
      <a href="${servePath}${article.articlePermalink}">${article.articleTitle}</a>
      </#list>
    </div>
  </section>
  </#if>

  <#if article??>
    <section class="sidebar__container" id="externalRelevantArticles">
    </section>
    <section class="sidebar__container" id="randomArticles">
    </section>
    <section class="sidebar__container" id="relevantArticles">
    </section>
  </#if>
</div>