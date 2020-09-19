<#macro nav_items>
  <#list pageNavigations as page>
  <li><a href="${page.pagePermalink}" target="${page.pageOpenTarget}">${page.pageTitle}</a></li>
  </#list>
  <#if isLoggedIn>
  <li><a href="${servePath}/admin-index.do#main">${adminLabel}</a></li>
  <li><a href="${logoutURL}">${logoutLabel}</a></li>
  <#else>
  <li><a href="${servePath}/start">${startToUseLabel}</a></li>
  </#if>
  <#nested>
</#macro>

<#macro blog_nav>
  <nav class="navbar J_navbar">
    <div class="navbar__container navbar__container--mobile">
      <a class="brand" href="/">${blogTitle}</a>
      <button type="button" class="toggle J_navbar_toggle" data-for="toggle-items">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div class="toggle-items">
        <ul><@nav_items></@nav_items></ul>
      </div>
    </div>

    <div class="navbar__container navbar__container--web">
      <a class="brand" href="/">${blogTitle}</a>
      <div class="items">
        <ul><@nav_items></@nav_items></ul>
      </div>
    </div>
  </nav>
  <#if customVars['headerBgImage']?? >
    <div class="custom_header" style="background-image: url('${customVars['headerBgImage']}')"></div>
  </#if>
  <#if !customVars['headerBgImage']?? >
    <div class="custom_header" style="background-image: url('/skins/${skinDirName}/images/header.jpg')"></div>
  </#if>
</#macro>

<#macro common_header>
  <header class="custom_header">
    <div class="custom_header__container">
      <p class="subtitle">${blogSubtitle}</p>
    </div>
  </header>
</#macro>

<#macro article_header>
  <header class="custom_header">
    <div class="custom_header__container">
      <div class="custom_header__articleMeta">
        <h1 class="articleMeta__title">${article.articleTitle}</h1>
        <div class="articleMeta__info">
          <span class="author">@${article.authorName} &nbsp;${article.articleCreateDate?string("yyyy-MM-dd")}</span>
          <span class="comments">
            <span data-uvstatcmt="${article.oId}">0</span> 
            ${commentLabel}
          </span>
          <span class="views">
            <span data-uvstaturl="${servePath}${article.articlePermalink}">0</span> ${viewLabel}
          </span>
        </div>
        <div class="articleMeta__tags">
          <#list article.articleTags?split(",") as articleTag>
          <a class="tagBtn" rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">${articleTag}</a>&nbsp;
          </#list>
        </div>
      </div>
    </div>
  </header>
</#macro>