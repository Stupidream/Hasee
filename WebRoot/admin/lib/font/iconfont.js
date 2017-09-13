;(function(window) {

  var svgSprite = '<svg>' +
    '' +
    '<symbol id="icon-wodedingdan" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M883.2 60.8l-89.6 0c-12.8 0-25.6 9.6-25.6 25.6s9.6 25.6 25.6 25.6l89.6 0c25.6 0 48 22.4 48 48l0 713.6c0 25.6-22.4 48-48 48l-736 0c-25.6 0-48-22.4-48-48l0-713.6c0-25.6 22.4-48 48-48l99.2 0c12.8 0 25.6-9.6 25.6-25.6s-9.6-25.6-25.6-25.6l-99.2 0c-54.4 0-96 41.6-96 96l0 713.6c0 54.4 41.6 96 96 96l736 0c54.4 0 96-41.6 96-96l0-713.6C979.2 102.4 934.4 60.8 883.2 60.8z"  ></path>' +
    '' +
    '<path d="M393.6 108.8l240 0c12.8 0 25.6-9.6 25.6-25.6s-9.6-25.6-25.6-25.6l-240 0c-12.8 0-25.6 9.6-25.6 25.6S380.8 108.8 393.6 108.8z"  ></path>' +
    '' +
    '<path d="M294.4 345.6l464 0c12.8 0 25.6-9.6 25.6-25.6s-9.6-25.6-25.6-25.6l-464 0c-12.8 0-25.6 9.6-25.6 25.6S278.4 345.6 294.4 345.6z"  ></path>' +
    '' +
    '<path d="M294.4 540.8l464 0c12.8 0 25.6-9.6 25.6-25.6s-9.6-25.6-25.6-25.6l-464 0c-12.8 0-25.6 9.6-25.6 25.6S278.4 540.8 294.4 540.8z"  ></path>' +
    '' +
    '<path d="M294.4 736l464 0c12.8 0 25.6-9.6 25.6-25.6s-9.6-25.6-25.6-25.6l-464 0c-12.8 0-25.6 9.6-25.6 25.6S278.4 736 294.4 736z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-baoguofahuo" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M128 864c0 17.6 14.4 32 32 32h704c17.6 0 32-14.4 32-32V320H128v544z m447.2-288H768v64H575.2v-64z m-64 128H768v64H511.2v-64z m-16-416h-368l76.8-135.2c12-16 30.4-24.8 50.4-24.8h240.8v160z m401.6 0h-368V128h240.8c20 0 38.4 9.6 50.4 24.8l76.8 135.2z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '<symbol id="icon-caiwu" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M512 64C264.8 64 64 264.8 64 512s200.8 448 448 448 448-200.8 448-448S759.2 64 512 64z m36 384H704v64H544.8v64H704v64H544.8v193.6h-64V640H320v-64h160.8v-64H320v-64h157.6L332 302.4l45.6-45.6 136 136 136-136 45.6 45.6L548 448z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '</svg>'
  var script = function() {
    var scripts = document.getElementsByTagName('script')
    return scripts[scripts.length - 1]
  }()
  var shouldInjectCss = script.getAttribute("data-injectcss")

  /**
   * document ready
   */
  var ready = function(fn) {
    if (document.addEventListener) {
      if (~["complete", "loaded", "interactive"].indexOf(document.readyState)) {
        setTimeout(fn, 0)
      } else {
        var loadFn = function() {
          document.removeEventListener("DOMContentLoaded", loadFn, false)
          fn()
        }
        document.addEventListener("DOMContentLoaded", loadFn, false)
      }
    } else if (document.attachEvent) {
      IEContentLoaded(window, fn)
    }

    function IEContentLoaded(w, fn) {
      var d = w.document,
        done = false,
        // only fire once
        init = function() {
          if (!done) {
            done = true
            fn()
          }
        }
        // polling for no errors
      var polling = function() {
        try {
          // throws errors until after ondocumentready
          d.documentElement.doScroll('left')
        } catch (e) {
          setTimeout(polling, 50)
          return
        }
        // no errors, fire

        init()
      };

      polling()
        // trying to always fire before onload
      d.onreadystatechange = function() {
        if (d.readyState == 'complete') {
          d.onreadystatechange = null
          init()
        }
      }
    }
  }

  /**
   * Insert el before target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var before = function(el, target) {
    target.parentNode.insertBefore(el, target)
  }

  /**
   * Prepend el to target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var prepend = function(el, target) {
    if (target.firstChild) {
      before(el, target.firstChild)
    } else {
      target.appendChild(el)
    }
  }

  function appendSvg() {
    var div, svg

    div = document.createElement('div')
    div.innerHTML = svgSprite
    svgSprite = null
    svg = div.getElementsByTagName('svg')[0]
    if (svg) {
      svg.setAttribute('aria-hidden', 'true')
      svg.style.position = 'absolute'
      svg.style.width = 0
      svg.style.height = 0
      svg.style.overflow = 'hidden'
      prepend(svg, document.body)
    }
  }

  if (shouldInjectCss && !window.__iconfont__svg__cssinject__) {
    window.__iconfont__svg__cssinject__ = true
    try {
      document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>");
    } catch (e) {
      console && console.log(e)
    }
  }

  ready(appendSvg)


})(window)