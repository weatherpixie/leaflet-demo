# frozen_string_literal: true

# load the countries

require 'metar'

namespace :data_import_uk do
  desc 'Import the contries and station data'
  task import: :environment do
    puts 'Importing UK Data ...'

    uk_stations = Metar::Station.find_all_by_country('United Kingdom')

    uk_stations.each do |uk|
      begin
        puts uk.code
        ms = Metar::Station.find_by_cccc(uk.code)
        puts ms.parser.metar
      # rescue Net:FTP
      rescue StandardError => e
        puts e
        next
      end
      Report.find_or_create_by(
        code: uk.code,
        metar: ms.parser.metar
      )
    end
  end
end
