require 'tsort'

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

      log_status 'Updating js main files'
      FileUtils.rm "#{save_to}/require.min.js"

      File.write "#{save_to}/tabler.js", File.read("#{save_to}/dashboard.js").gsub("assets/js/", "")
      FileUtils.rm "#{save_to}/dashboard.js"

      log_status 'Building tabler.js'
      system "r.js -o build.js"
    end

    def remove_source_mapping_url(content)
      content.sub(%r{^//# sourceMappingURL=.*\n?\z}, '')
    end
  end
end
