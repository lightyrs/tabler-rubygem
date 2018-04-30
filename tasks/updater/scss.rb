class Updater
  module Scss
    def update_scss_assets
      log_status 'Updating scss...'
      save_to = @save_to[:scss]
      contents = {}
      tabler_scss_files = get_paths_by_type('src/assets/scss', /\.scss$/)
      read_files('src/assets/scss', tabler_scss_files).each do |name, file|
        contents[name] = file
        save_file("#{save_to}/#{name}", file)
      end
      log_processed "#{tabler_scss_files * ' '}"

      tabler_plugin_files = get_paths_by_type('dist/assets/plugins', /\.css$/)
      read_files('dist/assets/plugins', tabler_plugin_files).each do |name, content|
        save_file("#{save_to}/dashboard/plugins/#{name}", remove_source_mapping_url(content))
      end
      log_processed "#{tabler_plugin_files * ' '}"

      log_status 'Updating scss main files'
      FileUtils.rm "#{save_to}/bundle.scss"
      FileUtils.mv "#{save_to}/dashboard", "#{save_to}/tabler"

      path_pairs = [
        [
          "#{save_to}/_variables.scss",
          "#{save_to}/tabler/_variables.scss"
        ],
        [
          "#{save_to}/tabler/dashboard.scss",
          "#{save_to}/_tabler.scss"
        ]
      ]

      path_pairs.each do |pair|
        FileUtils.mv pair[0], pair[1]
      end

      font_file = "#{save_to}/tabler/fonts/_feather.scss"
      File.write font_file, File.read(font_file).gsub("url('../fonts/", "font-url('")

      %w(_browser _flag _payments).each do |name|
        file = "#{save_to}/tabler/#{name}.scss"
        File.write file, File.read(file).gsub("url('../images/", "image-url('")
      end

      adjust_manifest "#{save_to}/_tabler.scss"

      plugins_file = File.new("#{save_to}/_tabler.plugins.scss", "w")
      write_plugins_file(plugins_file, tabler_plugin_files)
    end

    def adjust_manifest(file)
      content = []
      content.push File.readlines(file).reject { |line|
        line =~ /^\/\/.*$/
      }.map { |line|
        line.gsub(/ '/, " 'tabler/").gsub("'", '"')
      }
      File.open(file, "w") { |f| content.flatten.each { |line| f.puts line } }
    end

    def write_plugins_file(plugins_file, tabler_plugin_files)
      tabler_plugin_files.each do |line|
        plugins_file.puts "@import \"tabler/plugins/#{line}\";"
      end
    end
  end
end
