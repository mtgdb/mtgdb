class MTGDB::Downloaders::Downloader
  class << self
    def create_directory(directory)
      FileUtils.mkdir_p(directory)
    end

    def delete_files(directory)
      Dir.glob(directory).each do |fname|
        File.delete(fname)
      end
    end

    def delete_file(location)
      if File.exists?(location)
        File.delete(location)
      end
    end
  end
end
