<#macro dynamic_comment comment>
  <div class="comment" id="${comment.oId}">
    <img class="comment__avatar" src="${comment.commentThumbnailURL}" />
    <main class="comment__detail">
      <div class="info">
        <#if "http://" == comment.commentURL>
          <span class="info__username">${comment.commentName}</span>
          <#else>
          <a class="info__username" href="${comment.commentURL}" target="_blank">${comment.commentName}</a>
        </#if>
        <a class="info__btn" href="${servePath}${comment.commentSharpURL}">${viewLabel}»</a>
      </div>
      <div class="vditor-reset">
        ${comment.commentContent}
      </div>
      <time class="time">${comment.commentDate?string("yyyy-MM-dd HH:mm")}</time>
    </main>
  </div>
</#macro>

<#macro article_comment comment article>
  <div class="comment" id="${comment.oId}">
    <img class="comment__avatar" src="${comment.commentThumbnailURL}" />
    <main class="comment__detail">
      <div class="info">
        <#if "http://" == comment.commentURL || "https://" == comment.commentURL>
          <span class="info__username">${comment.commentName}</span>
          <#else>
          <a class="info__username" href="${comment.commentURL}" target="_blank">${comment.commentName}</a>
        </#if>
        <#if comment.isReply>
        @<a 
          class="info__replyName" 
          href="${servePath}${article.permalink}#${comment.commentOriginalCommentId}" 
          onmouseover="page.showComment(this, '${comment.commentOriginalCommentId}', 20);" 
          onmouseout="page.hideComment('${comment.commentOriginalCommentId}')"
        >${comment.commentOriginalCommentName}</a>
        </#if>
        <#if article.commentable>
          <a class="info__btn" href="javascript:page.toggleEditor('${comment.oId}', '${comment.commentName}')">${replyLabel}</a>
        </#if>
      </div>
      <div class="vditor-reset">
        ${comment.commentContent}
      </div>
      <time class="time">${comment.commentDate2?string("yyyy-MM-dd HH:mm")}</time>
    </main>
  </div>
</#macro>

<#macro article_comments commentList article>
<#if commentList?size != 0>
  <h3>评论列表</h3>
  <ul class="article__comments" id="comments">
    <#list commentList as comment>
      <@article_comment comment=comment article=article></@article_comment>
    </#list>
  </ul>
</#if>
<#if article.commentable>
  <h3>添加新评论</h3>
  <textarea 
      rows="3" placeholder="${postCommentsLabel}"
      class="comment__textarea" id="comment"></textarea>
</#if>
</#macro>