require 'autoprefixer-rails'

module Tabler
  module Rails
    class Engine < ::Rails::Engine
      initializer 'tabler.assets' do |app|
        %w(stylesheets javascripts fonts images).each do |sub|
          app.config.assets.paths << root.join('assets', sub).to_s
        end
      end
    end
  end
end
