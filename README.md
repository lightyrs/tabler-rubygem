# Tabler Ruby Gem

[Tabler][tabler-home] ruby gem for Ruby on Rails.

## Installation

Please see the appropriate guide for your environment of choice:

* [Ruby on Rails 4+](#a-ruby-on-rails) or other Sprockets environment.
* [Other Ruby frameworks](#b-other-ruby-frameworks) not on Rails.

### a. Ruby on Rails

Add `tabler` to your Gemfile:

```ruby
gem 'tabler', github: 'lightyrs/tabler-rubygem'
```

Ensure that `sprockets-rails` is at least v2.3.2.

`bundle install` and restart your server to make the files available through the pipeline.

Import Tabler styles in `app/assets/stylesheets/application.scss`:

```scss
// Custom tabler variables must be set or imported *before* tabler.
@import "tabler";
```

The available variables can be found [here][tabler-variables.scss].

Make sure the file has `.scss` extension (or `.sass` for Sass syntax). If you have just generated a new Rails app,
it may come with a `.css` file instead. If this file exists, it will be served instead of Sass, so rename it:

```console
$ mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
```

Then, remove all the `*= require` and `*= require_tree` statements from the Sass file. Instead, use `@import` to import Sass files.

Do not use `*= require` in Sass or your other stylesheets will not be able to access the Tabler mixins and variables.

Tabler JavaScript depends on jQuery. **Tabler is baseated on Bootstrap and for now the [JavaScript is the same on this Gem][tabler-javascripts], but you can help in converting to the Tabler ;)**

If you're using Rails 5.1+, add the `jquery-rails` gem to your Gemfile:

```ruby
gem 'jquery-rails'
```

Tabler tooltips and popovers depend on [popper.js] for positioning.
The `tabler` gem already depends on the
[popper_js](https://github.com/glebm/popper_js-rubygem) gem.

Add Tabler dependencies and Tabler to your `application.js`:

```js
//= require jquery3
//= require popper
//= require bootstrap-sprockets
```

While `tabler-sprockets` provides individual Tabler components
for ease of debugging, you may alternatively require
the concatenated `tabler` for faster compilation:

```js
//= require jquery3
//= require popper
//= require bootstrap
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
[`_tabler.scss`](assets/stylesheets/_tabler.scss) file into your assets as `_tabler-custom.scss`.
Then comment out components you do not want from `_tabler-custom`.
In the application Sass file, replace `@import 'tabler'` with:

```scss
@import 'tabler-custom';
```

[tabler-home]: https://tabler.github.io/
[tabler-variables.scss]: https://github.com/lightyrs/tabler-rubygem/blob/master/assets/stylesheets/tabler/_variables.scss
[tabler-javascripts]: https://github.com/lightyrs/tabler-rubygem/tree/master/assets/javascripts
[autoprefixer]: https://github.com/ai/autoprefixer
[popper.js]: https://popper.js.org
