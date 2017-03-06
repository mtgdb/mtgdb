require 'zip'

class MTGDB::Downloaders::MtgJsonDownloader < MTGDB::Downloaders::Downloader
  def self.run
    create_directory('tmp/importer')
    delete_files('tmp/importer/*.json')
    delete_files('tmp/importer/*.zip')

    uri = URI("https://mtgjson.com/json/AllSets-x.json.zip")
    zipped_folder = Net::HTTP.get(uri)

    File.open("tmp/importer/AllSets-x.json.zip", 'wb') do |file|
      file.write(zipped_folder)
    end

    zip_file = Zip::File.open("tmp/importer/AllSets-x.json.zip")
    zip_file.each do |file|
      file.extract("tmp/importer/AllSets-x.json")
    end

    delete_file('tmp/importer/AllSets-x.json.zip')

    file = File.read("tmp/importer/AllSets-x.json")
    data = JSON.parse(file)

    data.each do |set_name, values|
      MTGDB::Importers::JSONImporter.run(values)
    end

    delete_file('tmp/importer/AllSets-x.json')
  end
end
