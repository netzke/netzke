Netzke is a framework that greatly facilitates creation of complex [Sencha Ext JS](http://www.sencha.com/products/extjs/) + [Ruby-on-Rails](http://rubyonrails.org/) applications by leveraging a modular, object-oriented approach.

[![Gem Version](https://badge.fury.io/rb/netzke.svg)](https://badge.fury.io/rb/netzke)

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
  client_class do |c|
    c.title = "Hello World component"
  end

  # Actions are used by Ext JS to share functionality and state b/w buttons and menu items
  # The handler for this action should be called netzkeOnPingServer by default
  action :ping_server

  # Self-configure with a bottom toolbar
  def configure(c)
    super
    c.bbar = [:ping_server] # embed the action into bottom toolbar as a button
  end

  # Endpoint callable from client class
  endpoint :greet_the_world
    # call client class' method showGreeting
    client.show_greeting("Hello World!")
  end
end
```

In `YOUR_APP/components/hello_world/client/hello_world.js` put the client class (JavaScript) methods:

```javascript
{
  // handler for the ping_server action
  netzkeOnPingServer: function(){
    // calling greet_the_world endpoint
    this.server.greetTheWorld();
  },

  // called by the server as the result of executing the endpoint
  showGreeting: function(greeting){
    this.update("Server says: " + greeting);
  }
}
```

To embed the component in Rails view:

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

To learn about Netzke architecture in detail, refer to the [Netzke Core README](https://github.com/netzke/netzke-core).

## Netzke gems

The `netzke` Ruby gem is a meta-gem that has the following framework parts as dependencies:

* [Netzke Core](https://github.com/netzke/netzke-core) - the "bare bones" of the framework. Its [README](https://github.com/netzke/netzke-core) is a must-read for understanding the framework.
* [Netzke Basepack](https://github.com/netzke/netzke-basepack) - a few feature-packed pre-built components.
* [Netzke Testing](https://github.com/netzke/netzke-testing) - a set of helpers that simplify development and testing of Netzke components.

## Documentation

Netzke components consist of server side (Ruby) and client side (JavaScript) code, each having an API that you will want to use in your app.
Documentation for the server-side (Ruby) classes is auto-generated (with YARD) and hosted by
[RubyDoc.info](http://www.rubydoc.info/). Documentation for client-side classes is generated manually with
[yuidoc](http://yui.github.io/yuidoc/) using scripts provided in this gem; it is hosted [here](http://api.netzke.org/client/).

### Generating documentation for client-side code

Symlink Netzke gems (such as netzke-basepack and netzke-core) into the `doc/client` directory, then run

    rake client_doc:generate

The combined docs for all symlinked gems will be generated in `doc/client/build`.

## Useful links

* [Project website](http://netzke.org) - place to start
* [Demo](http://demo.netzke.org) - demo showing off components from Basepack (browse through demo components and see their source code)
* [Twitter](https://twitter.com/netzke) - bite-sized announcements about Netzke

## FAQ

### Will I need to write JavaScript while using Netzke?

It depends. For developing new components or extending existing ones (e.g. from [Basepack](https://github.com/netzke/netzke-basepack)) you'll most probably need to apply your Sencha Ext JS knowledge (and Netzke isn't supposed to limit you here in any way). However, the idea is that you write JavaScript code only once. After the component is created, use it as if it were a part of some Ruby library. A comparison with Ruby gems that use C extensions is also appropriate here: as some Ruby gems incapsulate C code for you, the same way Netzke components incapsulate JavaScript.

### Why did you choose for Ext JS as front end?

In the current scene, Ext JS is the only library I know of that has the architecture consistent, flexible, and complete enough to allow for complex "enterprise level" web applications.

### When will there be more components available?

I'm creating new components according to my own practical needs. As soon as get something generic, I might add that to [netzke-basepack](https://github.com/netzke/netzke-basepack) or to a dedicated gem. However, the key idea of Netzke is that it facilitates creating new components which are extremely easy to share, so that anybody could contribute.

---
Copyright (c) 2009-2017 [Good Bit Labs](http://goodbitlabs.com/), released under the same license as [Ext JS](https://www.sencha.com/legal/#Sencha_Ext_JS)
