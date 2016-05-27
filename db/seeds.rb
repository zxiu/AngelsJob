# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new({:email => 'admin@admin.com', :password => 'defaultpw', :password_confirmation => 'defaultpw', :role => 1})
admin.skip_confirmation!
admin.save

Agent.create({name: 'Stepstone.de', homepage: 'https://www.stepstone.de/', logo: 'https://media.stepstone.com/modules/duplo/resources/images/stepstone-logo@2x.png', country: :de})
Agent.create({name: 'Monster.de', homepage: 'http://www.monster.de/', logo: 'http://media.newjobs.com/niche/images/monster-new-lg.png', country: :de})
Agent.create({name: 'Job.de', homepage: 'http://job.de/', logo: 'http://www.isironline.org/wp-content/uploads/2014/09/Job.jpg', country: :de})
