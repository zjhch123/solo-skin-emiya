<#macro items>
  <#list pageNavigations as page>
  <li><a href="${page.pagePermalink}" target="${page.pageOpenTarget}">${page.pageTitle}</a></li>
  </#list>
  <li><a href="${servePath}/tags.html">${allTagsLabel}</a></li>
  <li><a href="${servePath}/archives.html">${archiveLabel}</a></li>
  <li><a rel="archive" href="${servePath}/links.html">${linkLabel}</a></li>
  <#if isLoggedIn>
  <li><a href="${servePath}/admin-index.do#main">${adminLabel}</a></li>
  <li><a href="${logoutURL}">${logoutLabel}</a></li>
  <#else>
  <li><a href="${servePath}/start">${startToUseLabel}</a></li>
  </#if>
  <#nested>
</#macro>

<nav class="navbar">
  <div class="navbar__container navbar__container--mobile">
    <a class="brand" href="/">${blogTitle}</a>
    <button type="button" class="toggle J_navbar_toggle" data-for="toggle-items">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <div class="toggle-items">
      <ul><@items></@items></ul>
    </div>
  </div>

  <div class="navbar__container navbar__container--web">
    <a class="brand" href="/">${blogTitle}</a>
    <div class="items">
      <ul><@items></@items></ul>
    </div>
  </div>
</nav>

<header class="header" style="background-image: url('/skins/${skinDirName}/images/header.jpg')">
  <div class="header__container">
    <p class="subtitle">${blogSubtitle}</p>
  </div>
</header>
