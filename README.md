# Tabler Ruby Gem

[Tabler][tabler-home] ruby gem for Ruby on Rails.

## Installation

Please see the appropriate guide for your environment of choice:

* [Ruby on Rails 4+](#a-ruby-on-rails) or other Sprockets environment.
* [Other Ruby frameworks](#b-other-ruby-frameworks) not on Rails.

### a. Ruby on Rails

Add `tabler-rubygem` to your Gemfile:

```ruby
gem 'tabler-rubygem'
```

Ensure that `sprockets-rails` is at least v2.3.2.

`bundle install` and restart your server to make the files available through the pipeline.

Import Tabler styles and optionally Tabler Plugin styles in `app/assets/stylesheets/application.scss`:

```scss
// Custom tabler variables must be set or imported *before* tabler.
@import "tabler";
@import "tabler.plugins"
```

The available variables can be found [here][tabler-variables.scss].  
Tabler plugins includes the css files for the javascripts found [here][tabler-plugins].

You can also choose to include plugin css on a per-plugin basis, for example:

```scss
// Custom tabler variables must be set or imported *before* tabler.
@import "tabler";
@import "tabler/plugins/charts-c3/plugin.css";
```

Make sure the file has `.scss` extension (or `.sass` for Sass syntax). If you have just generated a new Rails app,
it may come with a `.css` file instead. If this file exists, it will be served instead of Sass, so rename it:

```console
$ mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
```

Then, remove all the `*= require` and `*= require_tree` statements from the Sass file. Instead, use `@import` to import Sass files.

Do not use `*= require` in Sass or your other stylesheets will not be able to access the Tabler mixins and variables.

Add Tabler and optionally Tabler Plugins to your `application.js`:

```js
//= require tabler
//= require tabler.plugins
```

Tabler already includes jQuery and Bootstrap javascript.  
Tabler plugins includes the javascripts found [here][tabler-plugins].

You can also choose to include plugin js on a per-plugin basis, for example:

```js
//= require tabler
//= require tabler/plugins/charts-c3/js/d3.v3.min
//= require tabler/plugins/charts-c3/js/c3.min
```

### b. Other Ruby frameworks

If your framework uses Sprockets or Hanami,
the assets will be registered with Sprockets when the gem is required,
and you can use them as per the Rails section of the guide.

Otherwise you may need to register the assets manually.
Refer to your framework's documentation on the subject.

## Configuration

### Sass: Autoprefixer

Tabler requires the use of [Autoprefixer][autoprefixer].
[Autoprefixer][autoprefixer] adds vendor prefixes to CSS rules using values from [Can I Use](http://caniuse.com/).

If you are using tabler with Rails, autoprefixer is set up for you automatically.
Otherwise, please consult the [Autoprefixer documentation][autoprefixer].

### Sass: Individual components

By default all of Tabler is imported.

You can also import components explicitly. To start with a full list of modules copy
[`_tabler.scss`](https://github.com/lightyrs/tabler-rubygem/blob/master/assets/stylesheets/_tabler.scss) file into your assets as `_tabler-custom.scss`.
Then comment out components you do not want from `_tabler-custom`.
In the application Sass file, replace `@import 'tabler'` with:

```scss
@import 'tabler-custom';
```

[tabler-home]: https://tabler.github.io/
[tabler-variables.scss]: https://github.com/lightyrs/tabler-rubygem/blob/master/assets/stylesheets/tabler/_variables.scss
[tabler-javascripts]: https://github.com/lightyrs/tabler-rubygem/tree/master/assets/javascripts
[tabler-plugins]:
https://github.com/tabler/tabler/tree/master/dist/assets/plugins
[autoprefixer]: https://github.com/ai/autoprefixer
[popper.js]: https://popper.js.org
