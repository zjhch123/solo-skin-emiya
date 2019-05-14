<#include "macro-head.ftl">
<#include "macro-blog_header.ftl">
<#include "macro-comment.ftl">
<#include "../../common-template/macro-comment_script.ftl">

<!DOCTYPE html>
<html>
  <@emiya_head title="${article.articleTitle} - ${blogTitle}"></@emiya_head>
  <body id="emiya_blog">
    <@article_header></@article_header>
    <div class="blog">
      <div class="blog__container">
        <div class="container-fluid">
          <div class="container--left">
            <div class="article__content vditor-reset">
              ${article.articleContent}
              <#if "" != article.articleSign.signHTML?trim>
              <div>
                ${article.articleSign.signHTML}
              </div>
              </#if>
            </div>
            <div class="comment__container">
              <@article_comments commentList=articleComments article=article></@article_comments>
            </div>
          </div>
          <div class="aside container--right">
            <#include "side.ftl">
          </div>
        </div>
        <div class="article__recommend">
          <div id="externalRelevantArticles"></div>
          <div id="randomArticles"></div>
          <div id="relevantArticles"></div>
        </div>
      </div>
    </div>
    <#include "footer.ftl">
    <@comment_script oId=article.oId commentable=article.commentable>
      Skin.initComment = function (articleOId, articleTags) {
        page.tips.externalRelevantArticlesDisplayCount = "${externalRelevantArticlesDisplayCount}";
        page.loadExternalRelevantArticles(articleTags, "<div class='recommend__title'>HACPAI POSTS</div>");
        page.loadRandomArticles("<div class='recommend__title'>RECOMMEND POSTS</div>");
        page.loadRelevantArticles(articleOId, '<div class="recommend__title">RELEVANT POSTS</div>');
      }
      Skin.initComment('${article.oId}', "<#list article.articleTags?split(",") as articleTag>${articleTag}<#if articleTag_has_next>,</#if></#list>")
      Util.parseMarkdown()
    </@comment_script>
  </body>
</html>