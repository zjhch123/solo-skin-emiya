<#include "macro-head.ftl">
<#include "macro-blog_header.ftl">
<#include "macro-comment.ftl">
<#include "../../common-template/macro-comment_script.ftl">

<!DOCTYPE html>
<html>
  <@emiya_head title="${article.articleTitle} - ${blogTitle}"></@emiya_head>
  <body id="emiya_blog">
    <@blog_nav></@blog_nav>
    <div class="container-fluid">
      <main id="pjax" class="container--left">
        <#if pjax><!---- pjax {#pjax} start ----></#if>
        <@article_header></@article_header>
        <div class="article__content J_article__content vditor-reset">
          ${article.articleContent}
          <#if "" != article.articleSign.signHTML?trim>
          <div>
            ${article.articleSign.signHTML}
          </div>
          </#if>
        </div>
        <div class="share__container">
          <a class="item J_share" data-type="weibo" href="javascript:;"></a>
          <a class="item J_share" data-type="qzone" href="javascript:;"></a>
          <a 
            class="item J_share J_share_wechat"
            href="javascript:;"
            data-type="wechat"
            data-title="${article.articleTitle}"
            data-blogtitle="${blogTitle}"
            data-url="${servePath}${article.articlePermalink}"
            data-avatar="${article.authorThumbnailURL}">
            <span class="qrcode J_qrcode"></span>  
          </a>
        </div>
        <div class="comment__container" id="comments">
          <#if commentable>
            <div id="vcomment" data-name="${article.authorName}" data-postId="${article.oId}"></div>
              <#if !staticSite>
              <div id="soloComments" class="fn__none">
                <@article_comments commentList=articleComments article=article></@article_comments>
              </div>
              </#if>
          </#if>
        </div>
        <div class="recommendation__container">
          <div class="item" id="externalRelevantArticles">
          </div>
          <div class="item" id="randomArticles">
          </div>
          <div class="item" id="relevantArticles">
          </div>
        </div>
        <#if pjax><!---- pjax {#pjax} end ----></#if>
      </main>
      <div class="container--right">
        <#include "side.ftl">
      </div>
    </div>
    <#include "footer.ftl">
    <#if pjax><!---- pjax {#pjax} start ----></#if>
      <@comment_script oId=article.oId commentable=article.commentable>
        Skin.initComment = function (articleOId, articleTags) {
          page.tips.externalRelevantArticlesDisplayCount = "${externalRelevantArticlesDisplayCount}";
          page.loadExternalRelevantArticles(articleTags, "<div class='header'><span>HACPAI POSTS</span></div>");
          page.loadRandomArticles("<div class='header'><span>RECOMMEND POSTS</span></div>");
          page.loadRelevantArticles(articleOId, '<div class="header"><span>RELEVANT POSTS</span></div>');
        }
        Skin.initComment('${article.oId}', "<#list article.articleTags?split(",") as articleTag>${articleTag}<#if articleTag_has_next>,</#if></#list>")
        Skin.initArticle()
      </@comment_script>
    <#if pjax><!---- pjax {#pjax} end ----></#if>
  </body>
</html>