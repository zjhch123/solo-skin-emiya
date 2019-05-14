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

function Emiya() {
  this.listen()
}

function checkScroll(_now) {
  var nowScroll = _now
  var $nav = $('.J_navbar')

  function checkFixed(nowScroll) {
    var offsetTop = $nav.height()

    if (nowScroll > offsetTop) {
      $nav.addClass('is-fixed').css('top', -1 * offsetTop);
    }
    if (nowScroll == 0) {
      $nav.removeClass('is-fixed').css('top', 0);
    }
  }

  checkFixed(nowScroll)

  return function(_nowScroll) {
    checkFixed(_nowScroll)

    if (!$nav.hasClass('is-fixed')) {
      return
    }

    if (_nowScroll > nowScroll) {
      $nav.removeClass('show')
    } else {
      $nav.addClass('show')
    }
    nowScroll = _nowScroll
  }
}

var scrollManager = checkScroll($(window).scrollTop())

Emiya.prototype.listen = function() {
  $(".J_navbar_toggle").on("click", function() {
    var targetClass = '.' + $(this).attr('data-for')
    if ($(targetClass).hasClass('show')) {
        $(targetClass).removeClass('show')
    } else {
        $(targetClass).addClass('show')
    }
  });
  $(window).on('scroll', function() {
    var nowScrollTop = $(window).scrollTop()
    scrollManager(nowScrollTop)
  })
}

window.Skin = new Emiya();
