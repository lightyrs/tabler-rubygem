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

      log_status 'Updating scss main files'
      FileUtils.rm "#{save_to}/bundle.scss"
      FileUtils.mv "#{save_to}/dashboard", "#{save_to}/tabler"

      path_pairs = [
        [
          "#{save_to}/_variables.scss",
          "#{save_to}/tabler/_variables.scss"
        ],
        [
          "#{save_to}/tabler/bootstrap",
          "#{save_to}/bootstrap",
        ],
        [
          "#{save_to}/bootstrap/bootstrap-grid.scss",
          "#{save_to}/_bootstrap-grid.scss"
        ],
        [
          "#{save_to}/bootstrap/bootstrap-reboot.scss",
          "#{save_to}/_bootstrap-reboot.scss"
        ],
        [
          "#{save_to}/bootstrap/bootstrap.scss",
          "#{save_to}/_bootstrap.scss"
        ],
        [
          "#{save_to}/tabler/dashboard.scss",
          "#{save_to}/_tabler.scss"
        ]
      ]

      path_pairs.each do |pair|
        FileUtils.mv pair[0], pair[1]
      end

      %w(bootstrap bootstrap-grid bootstrap-reboot).each do |name|
        file = "#{save_to}/_#{name}.scss"
        File.write file, File.read(file).gsub(/ "/, ' "bootstrap/')
      end

      adjust_manifest "#{save_to}/_tabler.scss"
    end

    def adjust_manifest(file)
      content = ['@import "tabler/variables";', '@import "bootstrap";']
      content.push File.readlines(file).reject { |line|
        line =~ /^\/\/.*$/
      }.map { |line|
        line.gsub(/ '/, " 'tabler/").gsub("'", '"')
      }
      File.open(file, "w") { |f| content.flatten.each { |line| f.puts line } }
    end
  end
end
