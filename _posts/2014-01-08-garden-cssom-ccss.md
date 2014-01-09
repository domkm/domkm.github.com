---
category: 100-days-of-hacking
layout: post
title: Garden, CSS Object Model, & Constraint CSS
description: "Some exciting CSS concepts."
tags: [garden, css, cssom, ccss]
comments: true
share: true
---

## Garden


[Garden](https://github.com/noprompt/garden) is a Clojure[Script] library for authoring CSS.  It represents CSS as Clojure data structures.  It is not just a preprocessor like [SASS/SCSS](http://sass-lang.com/), [LESS](http://lesscss.org/), or [Stylus](http://learnboost.github.io/stylus/), but a library with the full facilities of the programming language available.  In other words, Garden's features are a superset of a preprocessor's features.  This presents some interesting possibilities due to the additional power provided by a full-fledged programming language. 

For example, Clojure has real namespaces that can be used in whole or in part and referenced with arbitrary aliases.  Using SASS/SCSS, if you `@import` a partial, you merge the names (variables, mixins, etc.) from the partial into the global namespace; polluting the namespace and potentially overwriting existing names.  This is not a problem in Garden because it is just a library for a very powerful programming language.

## CSS Object Model

I saw a reference to the CSSOM in an [issue in the Garden repo](https://github.com/noprompt/garden/issues/24).  I searched for CSSOM but found very little information.  There is the [W3C draft of the CSSOM spec](http://dev.w3.org/csswg/cssom/), a [Google Closure Library module](http://docs.closure-library.googlecode.com/git/namespace_goog_cssom.html), an [incomplete JavaScript implementation](https://github.com/NV/CSSOM), and [this presentation](http://www.youtube.com/watch?v=HrRBOQn5VcM) (which basically just informs people of the existence of the CSSOM).

Imagine being able to add, remove, replace, enable, and disable rules and stylesheets instead of adding and removing classes to and from elements.  You can do all that and more with the CSSOM.  How cool is that? 

Try this in your browser's console:
{% highlight javascript %}
document.styleSheets;
//=> StyleSheetList {0: CSSStyleSheet, 1: CSSStyleSheet, 2: CSSStyleSheet,...

// Disable all style sheets
for (var i = 0; i < document.styleSheets.length; i += 1) {
  document.styleSheets[0].disabled = true;
};
{% endhighlight %}


## Constraint CSS

CSS is decent for styling but is lacking when it comes to layout creation and modification.  I stumbled across a paper from 1999 about [Constraint CSS (CCSS)](http://citeseer.ist.psu.edu/viewdoc/summary?doi=10.1.1.101.4819).  This paper presents a [constraint-based](http://en.wikipedia.org/wiki/Logic_programming#Constraint_logic_programming) backwards-compatible CSS extension that allows declarative layout specification.

Imagine specifying layout by stating constraints:
{% highlight css %}
/* button1 and button2 have the same width */
#button1[width] = #button2[width];
/* button3's width is greater than twice the width of button2 */
#button3[width] > #button2[width] * 2;
{% endhighlight %}
A finite-domain constraint solver then finds a solution that satisfies the system of constraints. This also means that you could specify partial layouts and predictably combine them into a complete layout. 

I also found [Grid Style Sheets](http://gridstylesheets.org/), a modern JavaScript implementation of CCSS. It doesn't look ready for primetime yet and seems to require [web workers](https://developer.mozilla.org/en-US/docs/Web/Guide/Performance/Using_web_workers), which means that it probably won't be feasible to rely on for several years.  [Flexbox](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Flexible_boxes) will probably be a more pragmatic solution for layouts by that point.

I know little about the history of CSS, but CCSS seems like a significant improvement which also manages to be backwards-compatible. I wonder why it didn't catch on. Who wouldn't want [logic programming](http://en.wikipedia.org/wiki/Logic_programming#Constraint_logic_programming) in their CSS?