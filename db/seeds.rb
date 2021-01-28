# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Tags
tags = %w[rails ruby ruby-on-rails java javascript hackathon python html css css3 html5 php sql competetive c cpp c++ c# sql postgres postgresql oracle mongo nginx angularjs angular2 react reactjs react-native flutter django xamarin xamarin-forms fizzbuzz buzz master mobile scan qr-code metal hacklahoma hacktober event]

tags.each { |tag| Tag.create(name: tag) }
