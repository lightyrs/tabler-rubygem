class Updater
  module Fonts
    def update_font_assets
      log_status 'Updating fonts...'
      save_to = @save_to[:fonts]
      contents = {}
      tabler_font_files = get_paths_by_type('src/assets/fonts', /\.(?:eot|svg|ttf|woff)$/)
      read_files('src/assets/fonts', tabler_font_files).each do |name, file|
        contents[name] = file
        save_file("#{save_to}/#{name}", file)
      end
      log_processed "#{tabler_font_files * ' '}"
    end
  end
end
