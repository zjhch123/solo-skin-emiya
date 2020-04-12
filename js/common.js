/*
 * Solo - A beautiful, simple, stable, fast Java blogging system.
 * Copyright (c) 2010-2018, b3log.org & hacpai.com
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
/**
 * @fileoverview util and every page should be used.
 *
 * @author <a href="http://vanessa.b3log.org">Liyuan Li</a>
 * @version 0.1.0.0, Feb 17, 2017
 */

/**
 * @description 皮肤脚本
 * @static
 */
const scrollTo = (to) => {
  $('html ,body').animate({
    scrollTop: to,
  }, 300);
}

const $navBar = $('.J_navbar')
const $backToTop = $('.toTop')
const $contents = $('.J_article__contents')

class ScrollManager {
  constructor() {
    this.showBackToTopHeight = 100
    this.prevScrollY = $(window).scrollTop()
    this.scrollY = $(window).scrollTop()
    this.contentsStaticTop = $('.J_article__contents').prev().offset().top + $('.J_article__contents').prev().height()
    this.isContentsFixed = false
    this.listen()
    this.calculate()
  }

  checkNavbarFixed() {
    const navBarHeight = $navBar.height() + 1
    // 在顶端
    if (this.scrollY <= 0) {
      $navBar.removeClass('is-fixed').css('top', 0)
      return
    }

    $navBar.addClass('is-fixed').css('top', -1 * navBarHeight)

    if (this.scrollY < this.prevScrollY) {
      $navBar.addClass('show')
    } else {
      $navBar.removeClass('show')
    }
  }

  checkBackToTop() {
    if(this.scrollY > this.showBackToTopHeight) {
      $backToTop.fadeIn()
    } else {
      $backToTop.fadeOut()
    }
  }

  checkContents() {
    const $article = $('.J_article__content')
    if ($article.length <= 0) {
      return
    }

    const navBarHeight = $navBar.height()
    const articleBottom = $article.offset().top + $article.height()
    const contentsBottom = this.scrollY + navBarHeight + $contents.height()

    if (contentsBottom >= articleBottom && this.isContentsFixed) {
      $contents.css({
        'position': 'absolute',
        'top': articleBottom - $contents.height(),
      })
      this.isContentsFixed = false
      return
    }

    if (this.scrollY + navBarHeight <= this.contentsStaticTop) {
      $contents.css({
        'position': 'static',
        'top': 0,
      });
      this.isContentsFixed = false
      return
    }

    if (this.scrollY + navBarHeight > this.contentsStaticTop && contentsBottom < articleBottom) {
      $contents.css({
        'position': 'fixed',
        'top': navBarHeight,
      })
      this.isContentsFixed = true
      return
    }
  }

  checkContentsHighlight() {
    const offsetTop = $navBar.height() + 1
    const $contentLink = $('.J_article__contents--container a')
    let nowIndex

    for (let i = 0; i < $contentLink.length; i++) {
      const target = $contentLink.eq(i).attr('data-target')
      if (this.scrollY + offsetTop > $(target).offset().top) {
        nowIndex = i
      }
    }

    $contentLink.removeClass('active')
    $contentLink.eq(nowIndex).addClass('active')
  }

  calculate() {
    this.checkNavbarFixed()
    this.checkBackToTop()
    this.checkContents()
    this.checkContentsHighlight()
  }

  listen() {
    $(window).on('scroll', () => {
      this.prevScrollY = this.scrollY
      this.scrollY = $(window).scrollTop()
      this.calculate()
    });
  }
}

class Emiya {
  constructor() {
    this.listen()
  }

  initPageShare() {
    const $wechatShare = $('.J_share_wechat')
    const shareURL = $wechatShare.data('url')
    const avatarURL = $wechatShare.data('avatar')
    const title = encodeURIComponent(`${$wechatShare.data('title')} - ${$wechatShare.data('blogtitle')}`)
    const url = encodeURIComponent(shareURL)

    return {
      weibo: `http://v.t.sina.com.cn/share/share.php?title=${title}&url=${url}&pic=${avatarURL}`,
      qzone: `https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=${url}&sharesource=qzone&title=${title}&pics=${avatarURL}`,
      wechat: shareURL,
    }
  }

  initContents() {
    const priorities = {
      h1: 5,
      h2: 4,
      h3: 3,
      h4: 2,
      h5: 1,
    };

    const $titles = this.getArticleTitles();
  
    if ($titles.length === 0) {
      $('.J_article__contents').hide();
      return;
    }
  
    let tpl = '<ul class="article__contents">';
    let prevPriority;
    let firstPriority;
  
    $titles.each(function(index, dom) {
      const priority = priorities[dom.tagName.toLowerCase()];
      const title = $titles.eq(index).text();
      const $item = $('<i><li><a href="javascript:void(0);" data-target="#' + $titles.eq(index).attr('id') + '"></a></li></i>');
      $item.find('a').text(title);
  
      const item = $item.html();
  
      if (!priority) {
        return;
      }
  
      if (!firstPriority) {
        tpl += item;
        firstPriority = priority;
      } else {
        if (priority === prevPriority) {
          tpl += item;
        } else if (priority < prevPriority) {
          tpl += Array(prevPriority - priority).fill('<ul>').join('') + item;
        } else if (priority > prevPriority) {
          tpl += Array(priority - prevPriority).fill('</ul>').join('') + item;
        }
      }
  
      prevPriority = priority;
    });
  
    tpl += Array(firstPriority - prevPriority + 1).fill('</ul>').join('');

    $('.J_article__contents--container').append(tpl);
  }

  getArticleTitles() {
    return $('.J_article__content').find('h1,h2,h3,h4,h5,h6');
  }

  initArticle() {
    $('.J_article__contents').removeClass('fn__none')
    try {
      this.initContents();
    } catch (e) {
      $('.J_article__contents').addClass('fn__none')
      console.error(e);
    }
  }

  listen() {
    const self = this
    $('body').on('touchstart', function() { })
    $('body').on("click", '.J_navbar_toggle', function() {
      const targetClass = '.' + $(this).attr('data-for')
      if ($(targetClass).hasClass('show')) {
          $(targetClass).removeClass('show')
      } else {
          $(targetClass).addClass('show')
      }
    })
    $('body').on('click', '.J_replyName', function() {
      const replyName = $(this).attr('data-originalId');
      $('#' + replyName)[0].scrollIntoViewIfNeeded(true);
      $('#' + replyName).addClass('blink');
      setTimeout(function() {
        $('#' + replyName).removeClass('blink');
      }, 3000);
    })
    $('body').on('click', '.J_backToTop', function(e) {
      scrollTo(0);
      e.preventDefault();
    })
    $('body').on('click', '.J_article__contents--container a', function() {
      const target = $(this).attr('data-target');
      const scrollTarget = $(target).offset().top - $('.J_navbar').height() + 1;
      scrollTo(scrollTarget);
    })
    $('body').on('click', '.J_share', function() {
      const shareURLs = self.initPageShare()
      const $qrCode = $('.J_qrcode')
      const $wechatShare = $('.J_share_wechat')

      const key = $(this).data('type')
      if (!key) {
        return
      }

      if (key === 'wechat') {
        if (typeof QRious === 'undefined') {
          Util.addScript(Label.staticServePath + '/js/lib/qrious.min.js', 'qriousScript')
        }
        if ($qrCode.css('background-image') === 'none') {
          const width = 120
          const qr = new QRious({
            element: $qrCode[0],
            value: shareURLs['wechat'],
            value: shareURLs['wechat'],
            size: width,
          })
          $qrCode.css('background-image', `url(${qr.toDataURL('image/jpeg')})`)
            .css('height', width)
            .css('width', width)
            .css('bottom', $wechatShare.height())
            .css('background-size', `${width}px ${width}px`)
          $qrCode.slideToggle()
        } else {
          $qrCode.slideToggle()
        }
        return
      }
  
      window.open(shareURLs[key], '_blank', 'top=100,left=200,width=648,height=618')
    })
  }
}

window.scrollManager = new ScrollManager();
window.Skin = new Emiya();
Util.initPjax(() => {
  $('.J_article__contents').addClass('fn__none');
  $('.J_article__contents--container').empty();
});
