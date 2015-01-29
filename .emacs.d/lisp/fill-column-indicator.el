<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: fill-column-indicator.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=fill-column-indicator.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: fill-column-indicator.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=fill-column-indicator.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for fill-column-indicator.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=fill-column-indicator.el" /><meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script src="http://emacswiki.org/emacs/emacs-bootstrap.js"></script>
<!--[if !(lt IE 8)]><!-->
   <script type="text/javascript">
     (function(){var e=document.createElement("script");e.type="text/javascript";e.async=true;e.src=document.location.protocol+"//d1agz031tafz8n.cloudfront.net/thedaywefightback.js/widget.min.js";var t=document.getElementsByTagName("script")[0];t.parentNode.insertBefore(e,t)})()
   </script>
<!--<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.emacswiki.org/emacs?search=%22fill-column-indicator%5c.el%22">fill-column-indicator.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/fill-column-indicator.el">Download</a></p><pre><span class="comment">;;; fill-column-indicator.el --- Graphically indicate the fill column</span>

<span class="comment">;; Copyright (c) 2011-2014 Alp Aker</span>

<span class="comment">;; Author: Alp Aker &lt;alp.tekin.aker@gmail.com&gt;</span>
<span class="comment">;; Version: 1.86</span>
<span class="comment">;; Keywords: convenience</span>

<span class="comment">;; This program is free software; you can redistribute it and/or</span>
<span class="comment">;; modify it under the terms of the GNU General Public License as</span>
<span class="comment">;; published by the Free Software Foundation; either version 2 of the</span>
<span class="comment">;; License, or (at your option) any later version.</span>

<span class="comment">;; This program is distributed in the hope that it will be useful,</span>
<span class="comment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="comment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU</span>
<span class="comment">;; General Public License for more details.</span>

<span class="comment">;; A copy of the GNU General Public License can be obtained from the</span>
<span class="comment">;; Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,</span>
<span class="comment">;; MA 02111-1307 USA</span>

<span class="comment">;;; Commentary:</span>

<span class="comment">;; Many modern editors and IDEs can graphically indicate the location of the</span>
<span class="comment">;; fill column by drawing a thin line (in design parlance, a `<span class="constant important">rule</span>') down the</span>
<span class="comment">;; length of the editing window.  Fill-column-indicator implements this</span>
<span class="comment">;; facility in Emacs.</span>

<span class="comment">;; PLEASE NOTE: There is a small incompatibility between this package and the</span>
<span class="comment">;; current stable Emacs relase (v24.3).  A bug in Emacs's internal display</span>
<span class="comment">;; routine that was introduced shortly before that release can cause vertical</span>
<span class="comment">;; motion commands to skip blank lines when fci-mode is active.  This has</span>
<span class="comment">;; been fixed in Emacs trunk.  See github.com/alpaker/Fill-Column-Indicator/issues/31</span>
<span class="comment">;; for further discussion.</span>

<span class="comment">;; Installation and Usage</span>
<span class="comment">;; ======================</span>

<span class="comment">;; Put this file in your load path and put:</span>
<span class="comment">;;</span>
<span class="comment">;;   (<span class="keyword">require</span> '<span class="constant">fill-column-indicator</span>)</span>
<span class="comment">;;</span>
<span class="comment">;; in your init file.</span>

<span class="comment">;; To toggle graphical indication of the fill column in a buffer, use the</span>
<span class="comment">;; command `<span class="constant important">fci-mode</span>'.</span>
 
<span class="comment">;; Configuration</span>
<span class="comment">;; =============</span>

<span class="comment">;; By default, fci-mode draws its vertical indicator at the fill column.  If</span>
<span class="comment">;; you'd like it to be drawn at another column, set `<span class="constant important">fci-rule-column</span>' to the</span>
<span class="comment">;; column number.  (A case in which this might be useful is when you want to</span>
<span class="comment">;; fill comments at, for example, column 70, but want a vertical rule at</span>
<span class="comment">;; column 80 or 100 to indicate the maximum line length for code.)  The</span>
<span class="comment">;; default behavior (showing the indicator at the fill column) is specified</span>
<span class="comment">;; by setting fci-rule-column to nil.</span>

<span class="comment">;; On graphical displays the fill-column rule is drawn using a bitmap</span>
<span class="comment">;; image.  Its color is controlled by the variable `<span class="constant important">fci-rule-color</span>', whose</span>
<span class="comment">;; value can be any valid color name.  The rule's width in pixels is</span>
<span class="comment">;; determined by the variable `<span class="constant important">fci-rule-width</span>'; the default value is 1.</span>

<span class="comment">;; The rule can be drawn as a solid or dashed line, controlled by the</span>
<span class="comment">;; variable `<span class="constant important">fci-rule-use-dashes</span>'; the default is nil.  The dash appearance is</span>
<span class="comment">;; controlled by `<span class="constant important">fci-dash-pattern</span>', which is the ratio of dash length to</span>
<span class="comment">;; line height; the default is 0.75. (The value should be a number between 0</span>
<span class="comment">;; and 1; values outside that interval are coerced to the nearest endpoint.)</span>

<span class="comment">;; The image formats fci-mode can use are XPM and PBM.  If Emacs has been</span>
<span class="comment">;; compiled with the appropriate library it uses XPM images by default; if</span>
<span class="comment">;; not it uses PBM images, which are natively supported.  You can specify a</span>
<span class="comment">;; particular choice of format by setting `<span class="constant important">fci-rule-image-format</span>' explicitly</span>
<span class="comment">;; to xpm or pbm.</span>

<span class="comment">;; On character terminals the rule is drawn using the character specified by</span>
<span class="comment">;; `<span class="constant important">fci-rule-character</span>'; the default is `|' (ascii 124).  If</span>
<span class="comment">;; `<span class="constant important">fci-rule-character-color</span>' is nil, then it is drawn using fci-rule-color</span>
<span class="comment">;; (or the closest approximation thereto that the terminal is capable of); if</span>
<span class="comment">;; it is a color name, then that color is used instead.</span>

<span class="comment">;; If you'd like the rule to be drawn using fci-rule-character even on</span>
<span class="comment">;; graphical displays, set `<span class="constant important">fci-always-use-textual-rule</span>' to a non-nil value.</span>

<span class="comment">;; These variables (as well as those described in the next section) can be</span>
<span class="comment">;; given buffer-local bindings.</span>

<span class="comment">;; Other Options</span>
<span class="comment">;; =============</span>

<span class="comment">;; When `<span class="constant important">truncate-lines</span>' is nil, the effect of drawing a fill-column rule is</span>
<span class="comment">;; very odd looking. Indeed, it makes little sense to use a rule to indicate</span>
<span class="comment">;; the position of the fill column in that case (<span class="keyword cl">the</span> positions at which the</span>
<span class="comment">;; fill column falls in the visual display space won't, in general, be</span>
<span class="comment">;; collinear).  For this reason, fci-mode sets truncate-lines to t in buffers</span>
<span class="comment">;; in which it is enabled and restores it to its previous value when</span>
<span class="comment">;; disabled.  You can turn this feature off by setting</span>
<span class="comment">;; `<span class="constant important">fci-handle-truncate-lines</span>' to nil.</span>

<span class="comment">;; If `<span class="constant important">line-move-visual</span>' is t, then vertical navigation can behave oddly in</span>
<span class="comment">;; several edge cases while fci-mode is enabled (this is due to a bug in</span>
<span class="comment">;; Emacs's C code).  Accordingly, fci-mode sets line-move-visual to nil in</span>
<span class="comment">;; buffers in which it is enabled and restores it to its previous value when</span>
<span class="comment">;; disabled.  This can be suppressed by setting `<span class="constant important">fci-handle-line-move-visual</span>'</span>
<span class="comment">;; to nil.  (But you shouldn't want to do this.  There's no reason to use</span>
<span class="comment">;; line-move-visual if truncate-lines is t, and it doesn't make sense to use</span>
<span class="comment">;; something like fci-mode when truncate-lines is nil.)</span>

<span class="comment">;; Fci-mode needs free use of two characters (specifically, it needs the use</span>
<span class="comment">;; of two characters whose display table entries it can change</span>
<span class="comment">;; arbitrarily).  Its defualt is to use the first two characters of the</span>
<span class="comment">;; Private Use Area of the Unicode BMP, viz. U+E000 and U+E001.  If you need</span>
<span class="comment">;; to use those characters for some other purpose, set `<span class="constant important">fci-eol-char</span>' and</span>
<span class="comment">;; `<span class="constant important">fci-blank-char</span>' to different values.</span>

<span class="comment">;; Troubleshooting</span>
<span class="comment">;; ===============</span>

<span class="comment">;; o Fci-mode is intended to be used with monospaced fonts.  If you're using</span>
<span class="comment">;;   a monospaced font and the fill-column rule is missing or misaligned on a</span>
<span class="comment">;;   few lines but otherwise appears normal, then most likely (a) there are</span>
<span class="comment">;;   non-ascii characters on those lines that are being displayed using a</span>
<span class="comment">;;   non-monospaced font, or (b) your font-lock settings use bold or italics</span>
<span class="comment">;;   and those font variants aren't monospaced.</span>

<span class="comment">;; o Fci-mode in not currently compatible with Emacs's</span>
<span class="comment">;;   `<span class="constant important">show-trailing-whitespace</span>' feature (given the way the latter is</span>
<span class="comment">;;   implemented, such compatibility is going to be hard to achieve).  A</span>
<span class="comment">;;   workaround is to configure `<span class="constant important">whitespace-mode</span>' to replicate the</span>
<span class="comment">;;   functionality of show-trailing-whitespace.  This can be done with the</span>
<span class="comment">;;   following setting:</span>
<span class="comment">;;</span>
<span class="comment">;;     (setq whitespace-style '(face trailing))</span>
<span class="comment">;;</span>
<span class="comment">;;  With this, whitespace-mode produces the same basic effect as a non-nil</span>
<span class="comment">;;  value of show-trailing-whitespace, and compatibility with fci-mode is not</span>
<span class="comment">;;  a problem.</span>

<span class="comment">;; Known Issues</span>
<span class="comment">;; ============</span>

<span class="comment">;; o The indicator extends only to end of the buffer contents (as opposed to</span>
<span class="comment">;;   running the full length of the editing window).</span>

<span class="comment">;; o When portions of a buffer are invisible, such as when outline-mode is</span>
<span class="comment">;;   used to hide certain lines, the fill-column rule is hidden as well.</span>

<span class="comment">;; o Fci-mode should work smoothly when simultaneously displaying the same</span>
<span class="comment">;;   buffer on both a graphical display and on a character terminal.  It does</span>
<span class="comment">;;   not currently support simultaneous display of the same buffer on window</span>
<span class="comment">;;   frames with different default font sizes. (It would be feasible to</span>
<span class="comment">;;   support this use case, but thus far there seems to be no demand for</span>
<span class="comment">;;   it.)</span>

<span class="comment">;; o An issue specific to the Mac OS X (NextStep) port, versions 23.0-23.2:</span>
<span class="comment">;;   Emacs won't, in these particular versions, draw a cursor on top of an</span>
<span class="comment">;;   image.  Thus on graphical displays the cursor will disappear when</span>
<span class="comment">;;   positioned directly on top of the fill-column rule.  The best way to</span>
<span class="comment">;;   deal with this is to upgrade to v23.3 or v24 (or downgrade to v22).  If</span>
<span class="comment">;;   that isn't practical, a fix is available via the mini-package</span>
<span class="comment">;;   fci-osx-23-fix.el, which can be downloaded from:</span>
<span class="comment">;;</span>
<span class="comment">;;     github.com/alpaker/Fill-Column-Indicator</span>
<span class="comment">;;</span>
<span class="comment">;;  Directions for its use are given in the file header.</span>

<span class="comment">;; Todo</span>
<span class="comment">;; ====</span>

<span class="comment">;; o Accommodate non-nil values of `<span class="constant important">hl-line-sticky-flag</span>' and similar cases.</span>

<span class="comment">;; o Accommodate linum-mode more robustly.</span>

<span class="comment">;; o Compatibility with non-nil `show-trailing-whitespace.'</span>

<span class="comment">;; Acknowledgements</span>
<span class="comment">;; ================</span>

<span class="comment">;; Thanks to Ami Fischman, Christopher Genovese, Michael Hoffman, José</span>
<span class="comment">;; Alfredo Romero L., R. Lange, Joe Lisee, José Lombera, Frank Meffert,</span>
<span class="comment">;; Mitchell Peabody, sheijk, and an anonymous BT subscriber for bug reports</span>
<span class="comment">;; and suggestions.  Special thanks to lomew, David Röthlisberger, and Pär</span>
<span class="comment">;; Wieslander for code contributions.</span>

<span class="comment">;;; Code:</span>

(<span class="keyword cl">unless</span> (version&lt;= <span class="string">"22"</span> emacs-version)
  (<span class="warning">error</span> <span class="string">"Fill-column-indicator requires version 22 or later"</span>))

<span class="comment">;;; ---------------------------------------------------------------------</span>
<span class="comment">;;; User Options</span>
<span class="comment">;;; ---------------------------------------------------------------------</span>

(<span class="keyword">defgroup</span> <span class="type">fill-column-indicator</span> nil
  <span class="string">"Graphically indicate the fill-column."</span>
  <span class="builtin">:tag</span> <span class="string">"Fill-Column Indicator"</span>
  <span class="builtin">:group</span> 'convenience
  <span class="builtin">:group</span> 'fill)

<span class="comment">;; We should be using <span class="builtin">:validate</span> instead of <span class="builtin">:match</span>, but that seems not to</span>
<span class="comment">;; work with defcustom widgets.</span>
(<span class="keyword">defcustom</span> <span class="variable">fci-rule-column</span> nil
  <span class="string">"Controls where fci-mode displays a vertical line (rule).

If nil, the rule is drawn at the fill column.  Otherwise, it is
drawn at the column given by this variable.

Changes to this variable do not take effect until the mode
function `<span class="constant important">fci-mode</span>' is run."</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:tag</span> <span class="string">"Fill-Column rule column"</span>
  <span class="builtin">:type</span> '(choice (const <span class="builtin">:tag</span> <span class="string">"Use the fill column"</span> nil)
                 (integer <span class="builtin">:tag</span> <span class="string">"Use a custom column"</span>
                          <span class="builtin">:match</span> (<span class="keyword elisp">lambda</span> (w val) (fci-posint-p val)))))

(<span class="keyword">defcustom</span> <span class="variable">fci-rule-color</span> <span class="string">"#cccccc"</span>
  <span class="string">"Color used to draw the fill-column rule.

Changes to this variable do not take effect until the mode
function `<span class="constant important">fci-mode</span>' is run."</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:tag</span> <span class="string">"Fill-column rule color"</span>
  <span class="builtin">:type</span> 'color)

(<span class="keyword">defcustom</span> <span class="variable">fci-rule-width</span> 1
  <span class="string">"Width in pixels of the fill-column rule on graphical displays.
Note that a value greater than the default character width is
treated as equivalent to the default character width.

Changes to this variable do not take effect until the mode
function `<span class="constant important">fci-mode</span>' is run."</span>
  <span class="builtin">:tag</span> <span class="string">"Fill-Column Rule Width"</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:type</span>  '(integer <span class="builtin">:match</span> (<span class="keyword elisp">lambda</span> (w val) (fci-posint-p val))))

(<span class="keyword">defcustom</span> <span class="variable">fci-rule-image-format</span>
  (<span class="keyword elisp">if</span> (image-type-available-p 'xpm) 'xpm 'pbm)
  <span class="string">"Image format used for the fill-column rule on graphical displays.

Changes to this variable do not take effect until the mode
function `<span class="constant important">fci-mode</span>' is run."</span>
  <span class="builtin">:tag</span> <span class="string">"Fill-Column Rule Image Format"</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:type</span> '(choice (symbol <span class="builtin">:tag</span> <span class="string">"XPM"</span> 'xpm)
                 (symbol <span class="builtin">:tag</span> <span class="string">"PBM"</span> 'pbm)))

(<span class="keyword">defcustom</span> <span class="variable">fci-rule-use-dashes</span> nil
  <span class="string">"Whether to show the fill-column rule as dashes or as a solid line.
This has no effect on non-graphical displays.

Changes to this variable do not take effect until the mode
function `<span class="constant important">fci-mode</span>' is run."</span>
  <span class="builtin">:tag</span> <span class="string">"Fill-Column Rule Use Dashes"</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">fci-dash-pattern</span> 0.75
  <span class="string">"When using a dashed rule, ratio of dash length to line height.
Values less than 0 or greather than 1 are coerced to the nearest
endpoint of that interval.

Changes to this variable do not take effect until the mode
function `<span class="constant important">fci-mode</span>' is run."</span>
  <span class="builtin">:tag</span> <span class="string">"Fill-Column Rule Use Dashes"</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:type</span> 'float)

(<span class="keyword">defcustom</span> <span class="variable">fci-rule-character</span> ?|
  <span class="string">"Character used to draw the fill-column rule on character terminals.

Changes to this variable do not take effect until the mode
function `<span class="constant important">fci-mode</span>' is run."</span>
  <span class="builtin">:tag</span> <span class="string">"Fill-Column Rule Character"</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:type</span> 'character)

(<span class="keyword">defcustom</span> <span class="variable">fci-rule-character-color</span> nil
  <span class="string">"Color used to draw the fill-column rule on character terminals.
If nil, the same color is used as for the graphical rule.

Changes to this variable do not take effect until the mode
function `<span class="constant important">fci-mode</span>' is run."</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:tag</span> <span class="string">"Fill-column rule color"</span>
  <span class="builtin">:type</span> '(choice (const <span class="builtin">:tag</span> <span class="string">"Use same color as graphical rule"</span> nil)
                 (color <span class="builtin">:tag</span> <span class="string">"Specify a color"</span>)))

(<span class="keyword">defcustom</span> <span class="variable">fci-always-use-textual-rule</span> nil
  <span class="string">"When non-nil, the rule is always drawn using textual characters.
Specifically, fci-mode will use `<span class="constant important">fci-rule-character</span>' intead of
bitmap images to draw the rule on graphical displays.

Changes to this variable do not take effect until the mode
function `<span class="constant important">fci-mode</span>' is run."</span>
  <span class="builtin">:tag</span> <span class="string">"Don't Use Image for Fill-Column Rule"</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">fci-handle-truncate-lines</span> t
  <span class="string">"Whether fci-mode should set truncate-lines to t while enabled.
If non-nil, fci-mode will set truncate-lines to t in buffers in
which it is enabled, and restore it to its previous value when
disabled.

Leaving this option set to the default value is recommended."</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:tag</span> <span class="string">"Locally set truncate-lines to t during fci-mode"</span>
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">fci-handle-line-move-visual</span> (version&lt;= <span class="string">"23"</span> emacs-version)
  <span class="string">"Whether fci-mode should set line-move-visual to nil while enabled.
If non-nil, fci-mode will set line-move-visual to nil in buffers
in which it is enabled, and restore t to its previous value when
disabled.

Leaving this option set to the default value is recommended."</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:tag</span> <span class="string">"Locally set line-move-visual to nil during fci-mode"</span>
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">fci-eol-char</span> ?\uE000
  <span class="string">"Character used for internal purposes by fci-mode.
If you need to use this character, set this variable's value to a
character you do not care about (a good choice is a character
from the Private Use Area of the Unicode BMP, i.e., the range
U+E000-U+F8FF, inclusive)."</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:type</span> 'character)

(<span class="keyword">defcustom</span> <span class="variable">fci-blank-char</span> ?\uE001
  <span class="string">"Character used for internal purposes by fci-mode.
If you need to use this character, set this variable's value to a
character you do not care about (a good choice is a character
from the Private Use Area of the Unicode BMP, i.e., the the range
U+E000-U+F8FF, inclusive)."</span>
  <span class="builtin">:group</span> 'fill-column-indicator
  <span class="builtin">:type</span> 'character)

<span class="comment">;;; ---------------------------------------------------------------------</span>
<span class="comment">;;; Internal Variables and Constants</span>
<span class="comment">;;; ---------------------------------------------------------------------</span>

<span class="comment">;; Record prior state of buffer.</span>
(<span class="keyword">defvar</span> <span class="variable">fci-saved-line-move-visual</span>)
(<span class="keyword">defvar</span> <span class="variable">fci-line-move-visual-was-buffer-local</span>)
(<span class="keyword">defvar</span> <span class="variable">fci-saved-truncate-lines</span>)
(<span class="keyword">defvar</span> <span class="variable">fci-saved-eol</span>)
(<span class="keyword">defvar</span> <span class="variable">fci-made-display-table</span>)

<span class="comment">;; Record state of fci initialization in this buffer.</span>
(<span class="keyword">defvar</span> <span class="variable">fci-display-table-processed</span>)
(<span class="keyword">defvar</span> <span class="variable">fci-local-vars-set</span>)

<span class="comment">;; Record current state of some quantities, so we can detect changes to them.</span>
(<span class="keyword">defvar</span> <span class="variable">fci-column</span>)
(<span class="keyword">defvar</span> <span class="variable">fci-newline</span>)
(<span class="keyword">defvar</span> <span class="variable">fci-tab-width</span>)
(<span class="keyword">defvar</span> <span class="variable">fci-char-width</span>)
(<span class="keyword">defvar</span> <span class="variable">fci-char-height</span>)

<span class="comment">;; Data used in setting the fill-column rule that only need to be</span>
<span class="comment">;; occasionally updated in a given buffer.</span>
(<span class="keyword">defvar</span> <span class="variable">fci-limit</span>)
(<span class="keyword">defvar</span> <span class="variable">fci-pre-limit-string</span>)
(<span class="keyword">defvar</span> <span class="variable">fci-at-limit-string</span>)
(<span class="keyword">defvar</span> <span class="variable">fci-post-limit-string</span>)

<span class="comment">;; The preceding internal variables need to be buffer local and reset when</span>
<span class="comment">;; the mode is disabled.</span>
(<span class="keyword">defconst</span> <span class="variable">fci-internal-vars</span> '(fci-saved-line-move-visual
                              fci-line-move-visual-was-buffer-local
                              fci-saved-truncate-lines
                              fci-saved-eol
                              fci-made-display-table
                              fci-display-table-processed
                              fci-local-vars-set
                              fci-column
                              fci-newline
                              fci-tab-width
                              fci-char-width
                              fci-char-height
                              fci-limit
                              fci-pre-limit-string
                              fci-at-limit-string
                              fci-post-limit-string))

(<span class="keyword cl">dolist</span> (var fci-internal-vars)
  (make-variable-buffer-local var))

<span class="comment">;; Hooks we use.</span>
(<span class="keyword">defconst</span> <span class="variable">fci-hook-assignments</span>
  '((after-change-functions fci-redraw-region t)
    (before-change-functions fci-extend-rule-for-deletion t)
    (window-scroll-functions fci-update-window-for-scroll t)
    (window-configuration-change-hook  fci-redraw-frame)
    (post-command-hook  fci-post-command-check t)
    (change-major-mode-hook turn-off-fci-mode t)
    (longlines-mode-hook  fci-update-all-windows t)))

<span class="comment">;;; ---------------------------------------------------------------------</span>
<span class="comment">;;; Miscellany</span>
<span class="comment">;;; ---------------------------------------------------------------------</span>

(<span class="keyword">defun</span> <span class="function">fci-get-buffer-windows</span> (<span class="type">&amp;optional</span> all-frames)
  <span class="string">"Return a list of windows displaying the current buffer."</span>
  (get-buffer-window-list (current-buffer) 'no-minibuf all-frames))

(<span class="keyword">defun</span> <span class="function">fci-posint-p</span> (x)
  <span class="string">"Return true if X is an integer greater than zero."</span>
  (and (wholenump x)
       (/= 0 x)))

(<span class="keyword elisp">if</span> (fboundp 'characterp)
    (<span class="keyword">defalias</span> '<span class="function">fci-character-p</span> 'characterp)
  <span class="comment">;; For v22.</span>
  (<span class="keyword">defun</span> <span class="function">fci-character-p</span> (c)
    <span class="string">"Return true if C is a character."</span>
    (and (fci-posint-p c)
         <span class="comment">;; MAX_CHAR in v22 is (0x1f &lt;&lt; 14).  We don't worry about</span>
         <span class="comment">;; generic chars.</span>
         (&lt; c 507904))))

<span class="comment">;;; ---------------------------------------------------------------------</span>
<span class="comment">;;; Mode Definition</span>
<span class="comment">;;; ---------------------------------------------------------------------</span>

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">define-minor-mode</span> <span class="function">fci-mode</span>
  <span class="string">"Toggle fci-mode on and off.
Fci-mode indicates the location of the fill column by drawing a
thin line (a `<span class="constant important">rule</span>') at the fill column.

With prefix ARG, turn fci-mode on if and only if ARG is positive.

The following options control the appearance of the fill-column
rule: `<span class="constant important">fci-rule-column</span>', `<span class="constant important">fci-rule-width</span>', `<span class="constant important">fci-rule-color</span>',
`<span class="constant important">fci-rule-use-dashes</span>', `<span class="constant important">fci-dash-pattern</span>', `<span class="constant important">fci-rule-character</span>',
and `<span class="constant important">fci-rule-character-color</span>'.  For further options, see the
Customization menu or the package file.  (See the latter for tips
on troubleshooting.)"</span>

  nil nil nil

  (<span class="keyword elisp">if</span> fci-mode
      <span class="comment">;; Enabling.</span>
      (<span class="keyword elisp">condition-case</span> error
          (<span class="keyword elisp">progn</span>
            (fci-check-user-options)
            (fci-process-display-table)
            (fci-set-local-vars)
            (fci-get-frame-dimens)
            (<span class="keyword cl">dolist</span> (hook fci-hook-assignments)
              (add-hook (car hook) (nth 1 hook) nil (nth 2 hook)))
            (setq fci-column (or fci-rule-column fill-column)
                  fci-tab-width tab-width
                  fci-limit (<span class="keyword elisp">if</span> fci-newline
                                (1+ (- fci-column (length fci-saved-eol)))
                              fci-column))
            (fci-make-overlay-strings)
            (fci-update-all-windows t))
        (<span class="warning">error</span>
         (fci-mode 0)
         (<span class="warning">signal</span> (car error) (cdr error))))

    <span class="comment">;; Disabling.</span>
    (fci-restore-display-table)
    (fci-restore-local-vars)
    (<span class="keyword cl">dolist</span> (hook fci-hook-assignments)
      (remove-hook (car hook) (nth 1 hook) (nth 2 hook)))
    (fci-delete-overlays-buffer)
    (<span class="keyword cl">dolist</span> (var fci-internal-vars)
      (set var nil))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">turn-on-fci-mode</span> ()
  <span class="string">"Turn on fci-mode unconditionally."</span>
  (interactive)
  (fci-mode 1))

(<span class="keyword">defun</span> <span class="function">turn-off-fci-mode</span> ()
  <span class="string">"Turn off fci-mode unconditionally."</span>
  (interactive)
  (fci-mode 0))

<span class="comment">;;; ---------------------------------------------------------------------</span>
<span class="comment">;;; Display Property Specs</span>
<span class="comment">;;; ---------------------------------------------------------------------</span>

(<span class="keyword">defun</span> <span class="function">fci-overlay-fills-background-p</span> (olay)
  <span class="string">"Return true if OLAY specifies a background color."</span>
  (and (overlay-get olay 'face)
       (not (eq (face-attribute (overlay-get olay 'face) <span class="builtin">:background</span> nil t)
                'unspecified))))

(<span class="keyword">defun</span> <span class="function">fci-competing-overlay-p</span> (posn)
  <span class="string">"Return true if there is an overlay at POSN that fills the background."</span>
  (memq t (mapcar #'fci-overlay-fills-background-p (overlays-at posn))))

<span class="comment">;; The display spec used in overlay before strings to pad out the rule to the</span>
<span class="comment">;; fill-column. </span>
(<span class="keyword">defconst</span> <span class="variable">fci-padding-display</span>
  '((<span class="keyword cl">when</span> (not (fci-competing-overlay-p buffer-position))
      . (space <span class="builtin">:align-to</span> fci-column))
    (space <span class="builtin">:width</span> 0)))

<span class="comment">;; Generate the display spec for the rule.  Basic idea is to use a <span class="string">"cascading</span>
<span class="comment">;; display property"</span> to display the textual rule if the display doesn't</span>
<span class="comment">;; support images and the graphical rule if it does, but in either case only</span>
<span class="comment">;; display a rule if no other overlay wants to fill the background at the</span>
<span class="comment">;; relevant buffer position.</span>
(<span class="keyword">defun</span> <span class="function">fci-rule-display</span> (blank rule-img rule-str for-pre-string)
  <span class="string">"Generate a display specification for a fill-column rule overlay string."</span>
  (<span class="keyword elisp">let</span>* ((cursor-prop (<span class="keyword elisp">if</span> (and (not for-pre-string) (not fci-newline)) t))
         (propertized-rule-str (propertize rule-str 'cursor cursor-prop))
         (display-prop (<span class="keyword elisp">if</span> rule-img
                           `((<span class="keyword cl">when</span> (not (or (display-images-p)
                                            (fci-competing-overlay-p buffer-position)))
                               . ,propertized-rule-str)
                             (<span class="keyword cl">when</span> (not (fci-competing-overlay-p buffer-position))
                               . ,rule-img)
                             (space <span class="builtin">:width</span> 0))
                         `((<span class="keyword cl">when</span> (not (fci-competing-overlay-p buffer-position))
                             . ,propertized-rule-str)
                           (space <span class="builtin">:width</span> 0)))))
    (propertize blank 'cursor cursor-prop 'display display-prop)))

<span class="comment">;;; ---------------------------------------------------------------------</span>
<span class="comment">;;; Enabling</span>
<span class="comment">;;; ---------------------------------------------------------------------</span>

(<span class="keyword">defun</span> <span class="function">fci-check-user-options</span> ()
  <span class="string">"Check that all user options for fci-mode have valid values."</span>
  (<span class="keyword cl">unless</span> (memq fci-rule-image-format '(xpm pbm))
    (<span class="warning">error</span> <span class="string">"Unrecognized value of `<span class="constant important">fci-rule-image-format</span>'"</span>))
  <span class="comment">;; If the third element of a binding form is t, then nil is an acceptable</span>
  <span class="comment">;; value for the variable; otherwise, the variable value must satisfy the</span>
  <span class="comment">;; given predicate.</span>
  (<span class="keyword elisp">let</span> ((checks '((fci-rule-color color-defined-p)
                  (fci-rule-column fci-posint-p t)
                  (fci-rule-width fci-posint-p t)
                  (fci-rule-character-color color-defined-p t)
                  (fci-rule-character fci-character-p)
                  (fci-blank-char fci-character-p)
                  (fci-dash-pattern floatp)
                  (fci-eol-char fci-character-p))))
    (<span class="keyword cl">dolist</span> (check checks)
      (<span class="keyword elisp">let</span> ((value (symbol-value (nth 0 check)))
            (pred (nth 1 check))
            (nil-is-ok (nth 2 check)))
        (<span class="keyword cl">unless</span> (or (and nil-is-ok (null value))
                    (funcall pred value))
          (<span class="warning">signal</span> 'wrong-type-argument (list pred value)))))))

(<span class="keyword">defun</span> <span class="function">fci-process-display-table</span> ()
  <span class="string">"Set up a buffer-local display table for fci-mode."</span>
  (<span class="keyword cl">unless</span> fci-display-table-processed
    (<span class="keyword cl">unless</span> buffer-display-table
      (setq buffer-display-table (make-display-table)
            fci-made-display-table t))
    (aset buffer-display-table fci-blank-char [32])
    (setq fci-saved-eol (aref buffer-display-table 10))
    <span class="comment">;; Assumption: the display-table entry for character 10 is either nil or</span>
    <span class="comment">;; a vector whose last element is the newline glyph.</span>
    (<span class="keyword elisp">let</span> ((glyphs (butlast (append fci-saved-eol nil)))
          eol)
      (<span class="keyword elisp">if</span> glyphs
          (setq fci-newline [10]
                eol (vconcat glyphs))
        (setq fci-newline nil
              eol [32]))
      (aset buffer-display-table 10 fci-newline)
      (aset buffer-display-table fci-eol-char eol))
    (setq fci-display-table-processed t)))

(<span class="keyword">defun</span> <span class="function">fci-set-local-vars</span> ()
  <span class="string">"Set miscellaneous local variables when fci-mode is enabled."</span>
  (<span class="keyword cl">unless</span> fci-local-vars-set
    (<span class="keyword cl">when</span> (and fci-handle-line-move-visual
               (boundp 'line-move-visual))
      (<span class="keyword elisp">if</span> (local-variable-p 'line-move-visual)
          (setq fci-line-move-visual-was-buffer-local t
                fci-saved-line-move-visual line-move-visual
                line-move-visual nil)
        (set (make-local-variable 'line-move-visual) nil)))
    (<span class="keyword cl">when</span> fci-handle-truncate-lines
      (setq fci-saved-truncate-lines truncate-lines
            truncate-lines t))
    (setq fci-local-vars-set t)))

(<span class="keyword">defun</span> <span class="function">fci-make-rule-string</span> ()
  <span class="string">"Return a string for drawing the fill-column rule."</span>
  (<span class="keyword elisp">let</span> ((color (or fci-rule-character-color
                   fci-rule-color)))
    <span class="comment">;; Make sure we don't inherit weight or slant from font-lock.</span>
    (propertize (char-to-string fci-rule-character)
                'face `(<span class="builtin">:foreground</span> ,color <span class="builtin">:weight</span> normal <span class="builtin">:slant</span> normal))))

(<span class="keyword">defun</span> <span class="function">fci-make-img-descriptor</span> ()
  <span class="string">"Make an image descriptor for the fill-column rule."</span>
  (<span class="keyword cl">unless</span> (or (= 0 fci-char-width)
              fci-always-use-textual-rule)
    <span class="comment">;; No point passing width, height, color etc. directly to the image</span>
    <span class="comment">;; functions: those variables have either global or buffer-local</span>
    <span class="comment">;; scope, so the image-generating functions can access them directly.</span>
    (<span class="keyword elisp">if</span> (eq fci-rule-image-format 'xpm)
        (fci-make-xpm-img)
      (fci-make-pbm-img))))

(<span class="keyword">defun</span> <span class="function">fci-get-frame-dimens</span> ()
  <span class="string">"Determine the frame character height and width.

If the selected frame cannot display images, use the character
height and width of the first graphic frame in the frame list
displaying the current buffer.  (This fallback behavior is just a
rough heuristic.)"</span>
  (<span class="keyword elisp">let</span> ((frame (<span class="keyword">catch</span> '<span class="constant">found-graphic</span>
                 (<span class="keyword elisp">if</span> (display-images-p)
                     (selected-frame)
                   (<span class="keyword cl">dolist</span> (win (fci-get-buffer-windows t))
                     (<span class="keyword cl">when</span> (display-images-p (window-frame win))
                       (<span class="keyword">throw</span> '<span class="constant">found-graphic</span> (window-frame win))))))))
    (setq fci-char-width (frame-char-width frame)
          fci-char-height (frame-char-height frame))))

(<span class="keyword">defmacro</span> <span class="function">fci-with-rule-parameters</span> (<span class="type">&amp;rest</span> body)
  <span class="string">"Define various quantites used in generating rule image descriptors."</span>
  (<span class="keyword cl">declare</span> (indent defun))
  `(<span class="keyword elisp">let</span>* ((height-str (number-to-string fci-char-height))
          (width-str (number-to-string fci-char-width))
          (rule-width (min fci-rule-width fci-char-width))
          (hmargin (/ (- fci-char-width rule-width) 2.0))
          (left-margin (floor hmargin))
          (right-margin (ceiling hmargin))
          (segment-ratio (<span class="keyword elisp">if</span> fci-rule-use-dashes fci-dash-pattern 1))
          (segment-ratio-coerced (min 1 (max 0 segment-ratio)))
          (segment-length (round (* segment-ratio-coerced fci-char-height)))
          (vmargin (/ (- fci-char-height segment-length) 2.0))
          (top-margin (floor vmargin))
          (bottom-margin (ceiling vmargin)))
     ,@body))

(<span class="keyword">defun</span> <span class="function">fci-mapconcat</span> (sep <span class="type">&amp;rest</span> lists)
  <span class="string">"Concatenate the strings in LISTS, using SEP as separator."</span>
  (mapconcat #'identity (apply 'nconc lists) sep))

(<span class="keyword">defun</span> <span class="function">fci-make-pbm-img</span> ()
  <span class="string">"Return an image descriptor for the fill-column rule in PBM format."</span>
  (fci-with-rule-parameters
    (<span class="keyword elisp">let</span>* ((magic-number <span class="string">"P1\n"</span>)
           (dimens (concat width-str <span class="string">" "</span> height-str <span class="string">"\n"</span>))
           (on-pixels (fci-mapconcat <span class="string">" "</span>
                                     (make-list left-margin <span class="string">"0"</span>)
                                     (make-list rule-width <span class="string">"1"</span>)
                                     (make-list right-margin <span class="string">"0"</span>)))
           (off-pixels (fci-mapconcat <span class="string">" "</span> (make-list fci-char-width <span class="string">"0"</span>)))
           (raster (fci-mapconcat <span class="string">"\n"</span>
                                  (make-list top-margin off-pixels)
                                  (make-list segment-length on-pixels)
                                  (make-list bottom-margin off-pixels)))
           (data (concat magic-number dimens raster)))
      `(image <span class="builtin">:type</span> pbm
              <span class="builtin">:data</span> ,data
              <span class="builtin">:mask</span> heuristic
              <span class="builtin">:foreground</span> ,fci-rule-color
              <span class="builtin">:ascent</span> center))))

(<span class="keyword">defun</span> <span class="function">fci-make-xpm-img</span> ()
  <span class="string">"Return an image descriptor for the fill-column rule in XPM format."</span>
  (fci-with-rule-parameters
    (<span class="keyword elisp">let</span>* ((identifier <span class="string">"/* XPM */\nstatic char *rule[] = {"</span>)
           (dimens (concat <span class="string">"\""</span> width-str <span class="string">" "</span> height-str <span class="string">" 2 1\","</span>))
           (color-spec (concat <span class="string">"\"1 c "</span> fci-rule-color <span class="string">"\",\"0 c None\","</span>))
           (on-pixels (concat <span class="string">"\""</span>
                              (make-string left-margin ?0)
                              (make-string rule-width ?1)
                              (make-string right-margin ?0)
                              <span class="string">"\","</span>))
           (off-pixels (concat <span class="string">"\""</span> (make-string fci-char-width ?0) <span class="string">"\","</span>))
           (raster (fci-mapconcat <span class="string">""</span>
                                  (make-list top-margin off-pixels)
                                  (make-list segment-length on-pixels)
                                  (make-list bottom-margin off-pixels)))
           (end <span class="string">"}<span class="comment">;"</span>)</span>
           (data (concat identifier dimens color-spec raster end)))
      `(image <span class="builtin">:type</span> xpm
              <span class="builtin">:data</span> ,data
              <span class="builtin">:mask</span> heuristic
              <span class="builtin">:ascent</span> center))))

(<span class="keyword">defun</span> <span class="function">fci-make-overlay-strings</span> ()
  <span class="string">"Generate the overlay strings used to display the fill-column rule."</span>
  (<span class="keyword elisp">let</span>* ((str (fci-make-rule-string))
         (img (fci-make-img-descriptor))
         (blank-str (char-to-string fci-blank-char))
         (eol-str (char-to-string fci-eol-char))
         (end-cap (propertize blank-str 'display '(space <span class="builtin">:width</span> 0)))
         (pre-or-post-eol (propertize eol-str
                                      'cursor t
                                      'display (propertize eol-str 'cursor t)))
         (pre-padding (propertize blank-str 'display fci-padding-display))
         (pre-rule (fci-rule-display blank-str img str t))
         (at-rule (fci-rule-display blank-str img str fci-newline))
         (at-eol (<span class="keyword elisp">if</span> fci-newline pre-or-post-eol <span class="string">""</span>)))
    (setq fci-pre-limit-string (concat pre-or-post-eol pre-padding pre-rule)
          fci-at-limit-string (concat at-eol at-rule)
          fci-post-limit-string (concat pre-or-post-eol end-cap))))

<span class="comment">;;; ---------------------------------------------------------------------</span>
<span class="comment">;;; Disabling</span>
<span class="comment">;;; ---------------------------------------------------------------------</span>

(<span class="keyword">defun</span> <span class="function">fci-restore-local-vars</span> ()
  <span class="string">"Restore miscellaneous local variables when fci-mode is disabled."</span>
  (<span class="keyword cl">when</span> fci-local-vars-set
    (<span class="keyword cl">when</span> (and fci-handle-line-move-visual
               (boundp 'line-move-visual))
      (<span class="keyword elisp">if</span> fci-line-move-visual-was-buffer-local
          (setq line-move-visual fci-saved-line-move-visual)
        (kill-local-variable 'line-move-visual)))
    (<span class="keyword cl">when</span> fci-handle-truncate-lines
      (setq truncate-lines fci-saved-truncate-lines))))

(<span class="keyword">defun</span> <span class="function">fci-restore-display-table</span> ()
  <span class="string">"Restore the buffer display table when fci-mode is disabled."</span>
  (<span class="keyword cl">when</span> (and buffer-display-table
             fci-display-table-processed)
    (aset buffer-display-table 10 fci-saved-eol)
    <span class="comment">;; Don't set buffer-display-table to nil even if we created the display</span>
    <span class="comment">;; table; only do so if nothing else has changed it.</span>
    (<span class="keyword cl">when</span> (and fci-made-display-table
               (equal buffer-display-table (make-display-table)))
      (setq buffer-display-table nil))))

<span class="comment">;;; ---------------------------------------------------------------------</span>
<span class="comment">;;; Drawing and Erasing</span>
<span class="comment">;;; ---------------------------------------------------------------------</span>

(<span class="keyword">defun</span> <span class="function">fci-get-overlays-region</span> (start end)
  <span class="string">"Return all overlays between START and END displaying the fill-column rule."</span>
  (delq nil (mapcar #'(<span class="keyword elisp">lambda</span> (o) (<span class="keyword elisp">if</span> (overlay-get o 'fci) o))
                    (overlays-in start end))))

(<span class="keyword">defun</span> <span class="function">fci-delete-overlays-region</span> (start end)
  <span class="string">"Delete overlays displaying the fill-column rule between START and END."</span>
  (mapc #'(<span class="keyword elisp">lambda</span> (o) (<span class="keyword elisp">if</span> (overlay-get o 'fci) (delete-overlay o)))
        (overlays-in start end)))

(<span class="keyword">defun</span> <span class="function">fci-delete-overlays-buffer</span> ()
  <span class="string">"Delete all overlays displaying the fill-column rule in the current buffer."</span>
  (<span class="keyword elisp">save-restriction</span>
    (widen)
    (fci-delete-overlays-region (point-min) (point-max))))

(<span class="keyword">defsubst</span> <span class="function">fci-posn-visible-p</span> (posn ranges)
  <span class="string">"Return true if POSN falls within an interval in RANGES."</span>
  (memq t (mapcar #'(<span class="keyword elisp">lambda</span> (range) (and (&lt;= (car range) posn)
                                         (&lt; posn (cdr range))))
                  ranges)))

(<span class="keyword">defsubst</span> <span class="function">fci-get-visible-ranges</span> ()
  <span class="string">"Return the window start and end for each window on the current buffer."</span>
  (mapcar #'(<span class="keyword elisp">lambda</span> (w) (cons (window-start w) (window-end w 'updated)))
          (fci-get-buffer-windows t)))

(<span class="keyword">defun</span> <span class="function">fci-delete-unneeded</span> ()
  <span class="string">"Erase the fill-column rule at buffer positions not visible in any window."</span>
  (<span class="keyword elisp">let</span> ((olays (fci-get-overlays-region (point-min) (point-max)))
        (ranges (fci-get-visible-ranges)))
    (<span class="keyword cl">dolist</span> (o olays)
      (<span class="keyword cl">unless</span> (fci-posn-visible-p (overlay-start o) ranges)
        (delete-overlay o)))))

<span class="comment">;; It would be slightly faster to run this backwards from END to START, but</span>
<span class="comment">;; only if we maintained the overlay center at an early position in the</span>
<span class="comment">;; buffer.  Since other packages that use overlays typically place them while</span>
<span class="comment">;; traversing the buffer in a forward direction, that would be a bad idea.</span>
(<span class="keyword">defun</span> <span class="function">fci-put-overlays-region</span> (start end)
  <span class="string">"Place overlays displaying the fill-column rule between START and END."</span>
  (goto-char start)
  (<span class="keyword elisp">let</span> (o cc)
    (<span class="keyword elisp">while</span> (search-forward <span class="string">"\n"</span> end t)
      (goto-char (match-beginning 0))
      (setq cc (current-column)
            o (make-overlay (match-beginning 0) (match-beginning 0)))
      (overlay-put o 'fci t)
      (<span class="keyword elisp">cond</span>
       ((&lt; cc fci-limit)
        (overlay-put o 'after-string fci-pre-limit-string))
       ((&gt; cc fci-limit)
        (overlay-put o 'after-string fci-post-limit-string))
       (t
        (overlay-put o 'after-string fci-at-limit-string)))
      (goto-char (match-end 0)))))

(<span class="keyword">defun</span> <span class="function">fci-redraw-region</span> (start end _ignored)
  <span class="string">"Erase and redraw the fill-column rule between START and END."</span>
  (<span class="keyword elisp">save-match-data</span>
    (<span class="keyword elisp">save-excursion</span>
      (<span class="keyword elisp">let</span> ((inhibit-point-motion-hooks t))
        (goto-char end)
        (setq end (line-beginning-position 2))
        (fci-delete-overlays-region start end)
        (<span class="keyword cl">when</span> (&gt; (+ (window-width) (window-hscroll))
                 fci-limit)
          (fci-put-overlays-region start end))))))

(<span class="keyword">defun</span> <span class="function">fci-redraw-window</span> (win <span class="type">&amp;optional</span> start)
  <span class="string">"Redraw the fill-column rule in WIN starting from START."</span>
  (fci-redraw-region (or start (window-start win)) (window-end win t) 'ignored))

<span class="comment">;; This doesn't determine the strictly minimum amount by which the rule needs</span>
<span class="comment">;; to be extended, but the amount used is always sufficient, and determininga</span>
<span class="comment">;; the genuine minimum is more expensive than doing the extra drawing.</span>
(<span class="keyword">defun</span> <span class="function">fci-extend-rule-for-deletion</span> (start end)
  <span class="string">"Extend the fill-column rule after a deletion that spans newlines."</span>
  (<span class="keyword cl">unless</span> (= start end)
    (<span class="keyword elisp">let</span> ((delenda (fci-get-overlays-region start end)))
      (<span class="keyword cl">when</span> delenda
        (<span class="keyword elisp">let</span> ((lossage (1+ (length delenda)))
              (max-end 0)
              win-end)
          (mapc #'delete-overlay delenda)
          (<span class="keyword cl">dolist</span> (win (fci-get-buffer-windows t))
            <span class="comment">;; Do not ask for an updated value of window-end.</span>
            (setq win-end (window-end win))
            (<span class="keyword cl">when</span> (and (&lt; 0 (- (min win-end end)
                               (max (window-start win) start)))
                       (&lt; max-end win-end))
              (setq max-end win-end)))
          (<span class="keyword cl">unless</span> (= max-end (point-max))
            (fci-redraw-region max-end
                               (<span class="keyword elisp">save-excursion</span>
                                 (goto-char max-end)
                                 (line-beginning-position lossage))
                               nil)))))))

(<span class="keyword">defun</span> <span class="function">fci-update-window-for-scroll</span> (win start)
  <span class="string">"Redraw the fill-column rule in WIN after it has been been scrolled."</span>
   (fci-delete-unneeded)
   (fci-redraw-window win start))

(<span class="keyword">defun</span> <span class="function">fci-update-all-windows</span> (<span class="type">&amp;optional</span> all-frames)
  <span class="string">"Redraw the fill-column rule in all windows showing the current buffer."</span>
  (<span class="keyword cl">dolist</span> (win (fci-get-buffer-windows all-frames))
    (fci-redraw-window win)))

(<span class="keyword">defun</span> <span class="function">fci-redraw-frame</span> ()
  <span class="string">"Redraw the fill-column rule in all windows on the selected frame."</span>
  (<span class="keyword elisp">let</span>* ((wins (window-list (selected-frame) 'no-minibuf))
         (bufs (delete-dups (mapcar #'window-buffer wins))))
    (<span class="keyword cl">dolist</span> (buf bufs)
      (<span class="keyword elisp">with-current-buffer</span> buf
        (<span class="keyword cl">when</span> fci-mode
          (fci-delete-unneeded)
          (fci-update-all-windows))))))

<span class="comment">;;; ---------------------------------------------------------------------</span>
<span class="comment">;;; Workarounds</span>
<span class="comment">;;; ---------------------------------------------------------------------</span>

<span class="comment">;; This in placed in post-command-hook and does four things:</span>
<span class="comment">;; 1. If the display table has been deleted or something has changed the</span>
<span class="comment">;;    display table for newline chars, we regenerate overlay strings after</span>
<span class="comment">;;    reprocessing the display table.</span>
<span class="comment">;; 2. If the default char width or height has changed, we regenerate the rule</span>
<span class="comment">;;    image.  (This handles both font changes and also cases where we</span>
<span class="comment">;;    activate the mode while displaying on a char terminal then subsequently</span>
<span class="comment">;;    display the buffer on a window frame.)</span>
<span class="comment">;; 3. If the value of `<span class="constant important">tab-width</span>' or `<span class="constant important">fill-column</span>' has changed, we reset the</span>
<span class="comment">;;    rule.  (We could set things up so that the rule adjusted automatically</span>
<span class="comment">;;    to such changes, but it wouldn't work on v22 or v23.)</span>
<span class="comment">;; 4. Cursor properties are ignored when they're out of sight because of</span>
<span class="comment">;;    horizontal scrolling.  We detect such situations and force a return</span>
<span class="comment">;;    from hscrolling to bring our requested cursor position back into view.</span>
<span class="comment">;; These are all fast tests, so despite the large remit this function</span>
<span class="comment">;; shouldn't noticeably affect editing speed.</span>
(<span class="keyword">defun</span> <span class="function">fci-post-command-check</span> ()
  <span class="string">"This function is a gross hack."</span>
  (<span class="keyword elisp">cond</span>
   ((not (and buffer-display-table
              (equal (aref buffer-display-table 10) fci-newline)))
    (setq fci-display-table-processed nil)
    (fci-mode 1))
   ((and (&lt; 1 (frame-char-width))
         (not fci-always-use-textual-rule)
         (not (and (= (frame-char-width) fci-char-width)
                   (= (frame-char-height) fci-char-height))))
    (fci-mode 1))
   ((not (and (= (or fci-rule-column fill-column) fci-column)
              (= tab-width fci-tab-width)))
    (fci-mode 1))
   ((and (&lt; 0 (window-hscroll))
         auto-hscroll-mode
         (&lt;= (current-column) (window-hscroll)))
    <span class="comment">;; Fix me:  Rather than setting hscroll to 0, this should reproduce the</span>
    <span class="comment">;; relevant part of the auto-hscrolling algorithm.  Most people won't</span>
    <span class="comment">;; notice the difference in behavior, though.</span>
    (set-window-hscroll (selected-window) 0))))

(<span class="keyword">provide</span> '<span class="constant">fill-column-indicator</span>)

<span class="comment">;;; fill-column-indicator.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=fill-column-indicator.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local edit" accesskey="c" href="http://www.emacswiki.org/emacs/Comments_on_fill-column-indicator.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=fill-column-indicator.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=fill-column-indicator.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=fill-column-indicator.el">Administration</a></span><span class="time"><br /> Last edited 2014-03-04 06:35 UTC by <a class="author" title="cpe-68-173-149-29.nyc.res.rr.com" href="http://www.emacswiki.org/emacs/AlpAker">AlpAker</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=fill-column-indicator.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search">
<p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
