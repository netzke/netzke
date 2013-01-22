Netzke is a framework that greatly facilitates creation of complex [Sencha Ext JS](http://www.sencha.com/products/extjs/) + [Ruby-on-Rails](http://rubyonrails.org/) applications by leveraging a true modular approach.

* [Project website](http://netzke.org) - a place to start
* [Netzke Core](https://github.com/netzke/netzke-core) - the "bare bones" of the framework. The README is a must-read for understanding the framework.
* [Netzke Basepack](https://github.com/netzke/netzke-basepack) - a few feature-packed pre-built components.
* [Netzke Community-pack](https://github.com/netzke/netzke-communitypack) - community-contributed (and generally less supported) components.
* [Demo](http://netzke-demo.herokuapp.com) - a demo showing off components from Basepack and Community-pack.
* [Yanit](http://yanit.heroku.com) - Yet Another (Netzke) Issue Tracker, a pretty complex demo application that could be easily written in just a few hours.
* [Twitter](https://twitter.com/netzke) - news about Netzke.

## FAQ

### Will I need to write JavaScript while using Netzke?

If you're using [pre-built components](https://github.com/nomadcoder/netzke-basepack) and don't need to extend their (client-side) functionality, then you won't.

For creating new components or extending existing components you'll most probably need to apply your Sencha Ext JS / Touch knowledge (and Netzke does not limit you here in any way). However, the idea is that you do it only once. After the component is created, use it as if it was a part of some Ruby library. A comparison with those Ruby gems that use C extensions is also very appropriate here: as some Ruby gems incapsulate C code for you, the same way Netzke components incapsulate JavaScript.

### Why did you choose for Ext JS as front end?

In the current scene, Ext JS is the only library I know of with the architecture consistent, flexible, and complete enough to allow for complex desktop-like web applications. For example, Ext JS has a great supports for composition (nesting of widgets), which is actively used by Netzke.

### When will there be more components available?

I’m creating new components according to my own practical needs. As I’ll be getting something generic, I’ll be adding it to netzke-basepack (or to dedicated gems). However, the key idea of Netzke is that it facilitates creating new components which are extremely easy to share, so, anyone can create his own repository of components to share.

You may also want to keep an eye on (and contribute to) the [netzke-communitypack](https://github.com/nomadcoder/netzke-communitypack) project.

---
Copyright (c) 2008-2012 [nomadcoder](https://twitter.com/nomadcoder), released under the MIT license (see LICENSE).

**Note** that Ext JS is licensed [differently](http://www.sencha.com/products/extjs/license/), and you may need to purchase a commercial license in order to use it in your projects!

