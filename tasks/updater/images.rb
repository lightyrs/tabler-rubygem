class Updater
  module Images
    def update_image_assets
      log_status 'Updating images...'
      save_to = @save_to[:images]
      contents = {}
      tabler_image_files = get_paths_by_type('src/assets/images', /\.(?:svg|png|gif|jpg|jpeg)$/)
      read_files('src/assets/images', tabler_image_files).each do |name, file|
        contents[name] = file
        save_file("#{save_to}/#{name}", file)
      end
      log_processed "#{tabler_image_files * ' '}"
    end
  end
end
