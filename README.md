Netzke is a framework that greatly facilitates creation of complex [Sencha Ext JS](http://www.sencha.com/products/extjs/) + [Ruby-on-Rails](http://rubyonrails.org/) applications by leveraging a modular, object-oriented approach.

The `netzke` Ruby gem is a meta-gem that has the following framework parts as dependencies:

* [Netzke Core](https://github.com/netzke/netzke-core) - the "bare bones" of the framework. Its README is a must-read for understanding the framework.
* [Netzke Basepack](https://github.com/netzke/netzke-basepack) - a few feature-packed pre-built components.
* [Netzke Testing](https://github.com/netzke/netzke-testing) - a set of helpers that simplify development and testing of Netzke components.

Current version is [![Gem Version](https://badge.fury.io/rb/netzke.svg)](http://badge.fury.io/rb/netzke)

## Useful links

* [Project website](http://netzke.org) - a place to start
* [Demo](http://demo.netzke.org) - a demo showing off components from Basepack.
* [Yanit](http://yanit.netzke.org) - Yet Another (Netzke) Issue Tracker, a pretty complex demo app that could be easily written in just a few hours.
* [Twitter](https://twitter.com/netzke) - news about Netzke.

## FAQ

### Will I need to write JavaScript while using Netzke?

Yes and no. For developing new components or extending existing ones (e.g. from [Basepack](https://github.com/netzke/netzke-basepack)) you'll most probably need to apply your Sencha Ext JS knowledge (and Netzke isn't supposed to limit you here in any way). However, the idea is that you write JavaScript code only once. After the component is created, use it as if it was a part of some Ruby library. A comparison with Ruby gems that use C extensions is also appropriate here: as some Ruby gems incapsulate C code for you, the same way Netzke components incapsulate JavaScript.

### Why did you choose for Ext JS as front end?

In the current scene, Ext JS is the only library I know of with the architecture consistent, flexible, and complete enough to allow for complex desktop-like web applications.

### When will there be more components available?

I’m creating new components according to my own practical needs. As I’ll be getting something generic, I’ll be adding it to netzke-basepack (or to dedicated gems). However, the key idea of Netzke is that it facilitates creating new components which are extremely easy to share, so, anyone can create his own repository of components to share.

---
© 2015 [Max Gorin](https://twitter.com/mxgrn), released under the MIT license (see LICENSE).

**Note** that Ext JS is licensed [differently](http://www.sencha.com/products/extjs/license/), and you may need to purchase a commercial license in order to use it in your projects!

