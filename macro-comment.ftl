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
        <time class="info__time">${comment.commentDate?string("yyyy-MM-dd HH:mm")}</time>
        <a class="info__btn" href="${servePath}${comment.commentSharpURL}">${viewLabel}»</a>
      </div>
      <div class="vditor-reset">
        ${comment.commentContent}
      </div>
    </main>
  </div>
</#macro>