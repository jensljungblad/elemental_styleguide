# Styleguide

Simple style guide for Rails 5.1+, designed to go well with [components](https://github.com/jensljungblad/components). The two together are inspired by the works of [Brad Frost](http://bradfrost.com) and by the [thoughts behind](http://engineering.lonelyplanet.com/2014/05/18/a-maintainable-styleguide.html) Lonely Planet's style guide [Rizzo](http://rizzo.lonelyplanet.com).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "styleguide", git: "https://github.com/jensljungblad/styleguide.git"
```

And then execute:

```sh
$ bundle
```

Run the install generator:

```sh
$ bin/rails g styleguide:install
```

This will create the following files and directories:

```
app/
  layouts/
    styleguide/
      example.html.erb
  views/
    styleguide/
      01_home.md
```

The style guide can be mounted in your routes file with:

```ruby
mount Styleguide::Engine => "/styleguide"
```

You can now access the style guide at `http://localhost:3000/styleguide`.

## Pages

You can create style guide pages simply by adding markdown files to the `app/views/styleguide` directory. These can be structured by putting them in subdirectories, and sorted by prefixing the file names with a digit.

Check out Brad Frost's [Style Guide Guide](https://github.com/bradfrost/style-guide-guide) for style guide inspiration.

## Examples

A special markdown syntax, inspired by [Catalog](https://www.catalog.style), can be used to render examples of any `erb` code on the style guide page, in the context of your own application:

````markdown
# Example

```example
<%= "Hello world" %>
```
````

It is possible to pass options to the example, in order to control the width and height of the wrapping element:


````markdown
```example
width: 500
height: 200
---
<%= "Hello world" %>
```
````

Examples need your application's CSS and JS in order to function properly. There is an `app/layouts/styleguide/example.html.erb` layout file that examples are rendered within. This file can be modified in order to add additional tags to the header, like the `javascript_pack_tag` when using the webpacker gem, or classes and styles to the body tag.

## Acknowledgements

This library, together with [components](https://github.com/jensljungblad/components), was inspired by the writings of [Brad Frost](http://bradfrost.com) on atomic design and living style guides, and [Rizzo](http://rizzo.lonelyplanet.com), the Lonely Planet style guide. Other inspirations were:

- [Catalog](https://www.catalog.style) - style guide for React
- [Storybook](https://storybook.js.org) - style guide for React
- [React Styleguidist](https://react-styleguidist.js.org) - style guide for React
- [Cells](https://github.com/trailblazer/cells) - view components for Ruby
- [Komponent](https://github.com/komposable/komponent) - view components for Ruby

For a list of real world style guides, check out http://styleguides.io.
