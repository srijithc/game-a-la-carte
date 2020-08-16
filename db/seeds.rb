# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Re-run a specific seed_file only
# Eg: `rake db:seed load_only=001_target_age_group.rb`

if ENV["load_only"].present? then
  seed_file = "#{File.join(Rails.root, 'db', 'seeds', ENV["load_only"])}"
  load seed_file
  exit
end

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed_file|

  file_name = seed_file.split('/').last

  load seed_file

}