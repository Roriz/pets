# frozen_string_literal: true

seed_folder = 'db/seeds'
seed_files = Dir["#{seed_folder}/*"]

seed_files.sort.each do |file_path|
  next if File.directory?(file_path)

  queries = File.read(file_path)

  queries.split(';').map(&:strip).each do |query|
    ActiveRecord::Base.connection.execute(query)
  end

  puts "File - #{file_path.sub("#{seed_folder}/", '')} has been processed"
rescue # rubocop:disable HandleExceptions, RescueStandardError
end
