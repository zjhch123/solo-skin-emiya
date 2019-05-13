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
var Skin = {
    _initCommon: function (i) {
        $("body").on("click", ".content-reset img", function () {
            window.open(this.src)
        });
    },
    init: function () {
        this._initCommon($(".icon-up"))
        this.initPage()
    },
    initPage: function () {
        const $body = document.body;
        const $toggle = document.querySelector(".navbar-toggle");
        const $navbar = document.querySelector("#huxblog_navbar");
        const $collapse = document.querySelector(".navbar-collapse");
        const __HuxNav__ = {
            close: function () {
                $navbar.className = " ";
                setTimeout(function () {
                    if ($navbar.className.indexOf("in") < 0) {
                        $collapse.style.height = "0px"
                    }
                }, 400)
            },
            open: function () {
                $collapse.style.height = "auto";
                $navbar.className += " in"
            }
        };
        $toggle.addEventListener("click", function (a) {
            if ($navbar.className.indexOf("in") > 0) {
                __HuxNav__.close()
            } else {
                __HuxNav__.open()
            }
        });
        document.addEventListener("click", function (a) {
            if (a.target == $toggle) {
                return
            }
            if (a.target.className == "icon-bar") {
                return
            }
            __HuxNav__.close()
        });
        jQuery(document).ready(function (c) {
            var d = 767;
            if (c(window).width() > d) {
                var b = c(".navbar-custom").height(),
                    a = c(".intro-header .container").height();
                c(window).on("scroll", {
                    previousTop: 0
                }, function () {
                    var e = c(window).scrollTop(),
                        f = c(".side-catalog");
                    if (e < this.previousTop) {
                        if (e > 0 && c(".navbar-custom").hasClass("is-fixed")) {
                            c(".navbar-custom").addClass("is-visible")
                        } else {
                            c(".navbar-custom").removeClass("is-visible is-fixed")
                        }
                    } else {
                        c(".navbar-custom").removeClass("is-visible");
                        if (e > b && !c(".navbar-custom").hasClass("is-fixed")) {
                            c(".navbar-custom").addClass("is-fixed")
                        }
                    }
                    this.previousTop = e;
                    f.show();
                    if (e > (a + 41)) {
                        f.addClass("fixed")
                    } else {
                        f.removeClass("fixed")
                    }
                })
            }
        });
    },
    initArticle: function (i, t) {
        if ($('article pre > code').length === 0) {
            return
        }

        Util.addStyle('https://cdn.jsdelivr.net/npm/highlight.js@9.15.6/styles/' +
            Label.hljsStyle + '.min.css', 'vditorHljsStyle')
      
        if (!Label.markedAvailable) {
            if (typeof hljs === 'undefined') {
                $.ajax({
                    url: 'https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.15.6/build/highlight.min.js',
                    dataType: 'script',
                    cache: true,
                    success: function () {
                    hljs.initHighlighting.called = false
                    hljs.initHighlighting()
                    },
                })
            } else {
                hljs.initHighlighting.called = false
                hljs.initHighlighting()
            }
        }
    }
  };
  Skin.init();
