require 'tsort'
require 'open-uri'

class Updater
  module Js
    def update_javascript_assets
      log_status 'Updating javascripts...'
      save_to  = @save_to[:js]
      tabler_js_files = get_paths_by_type('dist/assets/js', /\.js$/)
      read_files('dist/assets/js', tabler_js_files).each do |name, content|
        save_file("#{save_to}/#{name}", remove_source_mapping_url(content))
      end
      log_processed "#{tabler_js_files * ' '}"

      tabler_plugin_files = get_paths_by_type('dist/assets/plugins', /\.js$/)
      read_files('dist/assets/plugins', tabler_plugin_files).each do |name, content|
        save_file("#{save_to}/plugins/#{name}", remove_source_mapping_url(content))
      end
      log_processed "#{tabler_plugin_files * ' '}"

      overwrite_define "#{save_to}/core.js"

      log_status 'Updating js main files'
      File.write "#{save_to}/../tabler.js", <<~eos
        // = require tabler/tabler
        // = require tabler/vendors/jquery-3.2.1.min
        // = require tabler/vendors/bootstrap.bundle.min
        // = require tabler/vendors/circle-progress.min
        // = require tabler/vendors/jquery.sparkline.min
        // = require tabler/core
      eos

      File.write "#{save_to}/../tabler.plugins.js", <<~eos
        // = require tabler/plugins/charts-c3/js/d3.v3.min
        // = require tabler/plugins/charts-c3/js/c3.min
        // = require tabler/plugins/input-mask/js/jquery.mask.min
      eos

      File.write "#{save_to}/tabler.js", File.read("#{save_to}/dashboard.js").gsub("dashboard", "tabler").gsub(/require(?:(?!window).)*(?:}|])\);/m, "").gsub(/^\n/, "")
      FileUtils.rm "#{save_to}/dashboard.js"
      FileUtils.rm "#{save_to}/require.min.js"
    end

    def remove_source_mapping_url(content)
      content.sub(%r{^//# sourceMappingURL=.*\n?\z}, '')
    end

    def overwrite_define(file)
      content = ['let require = function(modules, fn) { fn(); };']
      content.push File.readlines(file)
      File.open(file, "w") { |f| content.flatten.each { |line| f.puts line } }
    end
  end
end
