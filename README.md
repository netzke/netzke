Netzke is a framework that greatly facilitates creation of complex [Sencha Ext JS](http://www.sencha.com/products/extjs/) + [Ruby-on-Rails](http://rubyonrails.org/) applications by leveraging a modular, object-oriented approach.

## Rationale

[Sencha Ext JS]("http://www.sencha.com/products/extjs") is a powerful front-end framework, which is used for crafting web-apps that give the end user experience similar to that of a desktop application. It has an extensive set of widgets ('components'), and leverages a modular approach to its fullest: a developer can extend components (using Ext JS's own class system), nest components with the help of many powerful layouts, dynamically create and destroy them, etc. The architecture of Ext JS is well thought out and complete.

However, with Ext JS being server-agnostic, it is not always a trivial task for a developer to bind Ext JS components to the server-side data *and* application business logic, especially in complex applications. Netzke as the solution that allows you to extend the modular approach to the server side.

Netzke Core takes the burden of implementing the following key aspects of the framework:

* Client-side (JavaScript) class generation
* Client-server communication
* Extendibility of components (with the help of inheritance and mixins)
* Unlimited nesting (composition)
* Dynamic component loading
* Client-side class caching

...and more.

All this extremely facilitates building fast, low-traffic, robust, and highly maintainable applications. As a result, your code scales much better in the sense of complexity, compared to using conventional MVC, where developers are pretty much limited with the programming techniques that they can apply.

## HelloWorld component

Here's a mini-tutorial on building a simple Netzke component that illustrates client-server communication in Netzke.

Ext JS files are not distributed with Netzke, so, make sure that they are located in (or sym-linked as) `YOUR_APP/public/extjs`.

In `YOUR_APP/components/hello_world.rb`:

```ruby
class HelloWorld < Netzke::Base
  # Configure client class
  js_configure do |c|
    c.title = "Hello World component"
    c.mixin # mix in methods from hello_world/javascripts/hello_world.js
  end

  # Actions are used by Ext JS to share functionality and state b/w buttons and menu items
  # The handler for this action should be called onPingServer by default
  action :ping_server

  # Self-configure with a bottom toolbar
  def configure(c)
    super
    c.bbar = [:ping_server] # embed the action into bottom toolbar as a button
  end

  # Endpoint callable from client class
  endpoint :greet_the_world do |params,this|
    # call client class' method showGreeting
    this.show_greeting("Hello World!")
  end
end
```

In `YOUR_APP/components/hello_world/javascripts/hello_world.js` put the client class (JavaScript) methods:

```javascript
{
  // handler for the ping_server action
  onPingServer: function(){
    // calling greet_the_world endpoint
    this.greetTheWorld();
  },

  // called by the server as the result of executing the endpoint
  showGreeting: function(greeting){
    this.update("Server says: " + greeting);
  }
}
```

To embed the component in Rails view:

Add `netzke` routes:

```ruby
# in routes.rb
RailsApp::Application.routes.draw do
  netzke
  ...
end
```

Use `load_netzke` in the layout to include Ext JS and Netzke scripts and stylesheets:

```erb
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8">
  <%= csrf_meta_tag %>
  <%= load_netzke %>
</head>
<body>
  <%= yield %>
</body>
</html>
```

Embed the component in the Rails view:

```erb
<%= netzke :hello_world %>
```

To further familiarize yourself with Netzke architecture, refer to the [Netzke Core README](https://github.com/netzke/netzke-core).

## Netzke gems

The `netzke` Ruby gem is a meta-gem that has the following framework parts as dependencies:

* [Netzke Core](https://github.com/netzke/netzke-core) - the "bare bones" of the framework. Its [README](https://github.com/netzke/netzke-core) is a must-read for understanding the framework.
* [Netzke Basepack](https://github.com/netzke/netzke-basepack) - a few feature-packed pre-built components.
* [Netzke Testing](https://github.com/netzke/netzke-testing) - a set of helpers that simplify development and testing of Netzke components.

Current version is [![Gem Version](https://badge.fury.io/rb/netzke.svg)](http://badge.fury.io/rb/netzke)

The master branch is where the 1.0 version is currently being developed. See the roadmap [here](https://gist.github.com/mxgrn/b5b4a6cb92c1b7d0c958).

## Useful links

* [Project website](http://netzke.org) - a place to start
* [Demo](http://demo.netzke.org) - a demo showing off components from Basepack.
* [Yanit](http://yanit.netzke.org) - Yet Another (Netzke) Issue Tracker, a pretty complex demo app that could be easily written in just a few hours.
* [Twitter](https://twitter.com/netzke) - news about Netzke.

## FAQ

### Will I need to write JavaScript while using Netzke?

Yes and no. For developing new components or extending existing ones (e.g. from [Basepack](https://github.com/netzke/netzke-basepack)) you'll most probably need to apply your Sencha Ext JS knowledge (and Netzke isn't supposed to limit you here in any way). However, the idea is that you write JavaScript code only once. After the component is created, use it as if it were a part of some Ruby library. A comparison with Ruby gems that use C extensions is also appropriate here: as some Ruby gems incapsulate C code for you, the same way Netzke components incapsulate JavaScript.

### Why did you choose for Ext JS as front end?

In the current scene, Ext JS is the only library I know of that has the architecture consistent, flexible, and complete enough to allow for complex desktop-like web applications.

### When will there be more components available?

I'm creating new components according to my own practical needs. As soon as get something generic, I might add that to [netzke-basepack](https://github.com/netzke/netzke-basepack) or to a dedicated gem. However, the key idea of Netzke is that it facilitates creating new components which are extremely easy to share, so that anybody could contribute.

---
© 2015 [Max Gorin](https://twitter.com/mxgrn), released under the MIT license (see LICENSE).

**Note** that Ext JS is licensed [differently](http://www.sencha.com/products/extjs/license/), and you may need to purchase a commercial license in order to use it in your projects!
