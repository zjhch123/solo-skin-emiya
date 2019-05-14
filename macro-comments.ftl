<#macro comments commentList article>
<h3>评论列表</h3>
<ul class="comments" id="comments">
    <#list commentList as comment>
        <#include 'common-comment.ftl'/>
    </#list>
</ul>
<#if article.commentable>
    <h3>添加新评论</h3>
    <textarea 
        rows="3" placeholder="${postCommentsLabel}"
        class="comment__textarea"  id="comment"></textarea>
</#if>
</#macro>