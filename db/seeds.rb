# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new({:email => 'admin@admin.com', :password => 'defaultpw', :password_confirmation => 'defaultpw', :role => 1})
admin.skip_confirmation!
admin.personal_info = PersonalInfo.new({first_name: 'Zhuo', last_name: 'Xiu', email: 'xiuzhuo@outlook.com', mobile: '+4917673223854', birthday: Time.local(1982, 6, 15), gender: 1})
admin.skills << Skill.new({name: 'Java', level: 2, catalog: 0})
admin.skills << Skill.new({name: 'Ruby On Rails', level: 2, catalog: 0})
admin.skills << Skill.new({name: 'Deutsch', level: 1, catalog: 1})
admin.skills << Skill.new({name: 'English', level: 1, catalog: 1})
admin.skills << Skill.new({name: 'Chinisch', level: 2, catalog: 1})
admin.skills << Skill.new({name: 'Driving Licence', catalog: 2, extra: 'Klass B'})
education_info = EducationInfo.new({insititude: 'FH-Kaiserslautern', subject: 'Medieninformatik', graduation: 'Bachelor',
  begin: Time.local(2004, 8), end: Time.local(2004, 8), score: '2,3'})
admin.education_infos << education_info
admin.career_infos << CareerInfo.new({employer: 'Bonofa AG', position: 'Software developer', activity: 'Android development',
  begin: Time.local(2009, 8), end: Time.local(2015, 12)})
admin.save


Agent.create({name: 'Stepstone.de', homepage: 'https://www.stepstone.de/', logo: 'https://media.stepstone.com/modules/duplo/resources/images/stepstone-logo@2x.png', country: :de})
Agent.create({name: 'Monster.de', homepage: 'http://www.monster.de/', logo: 'http://media.newjobs.com/niche/images/monster-new-lg.png', country: :de})
Agent.create({name: 'Job.de', homepage: 'http://job.de/', logo: 'http://www.isironline.org/wp-content/uploads/2014/09/Job.jpg', country: :de})

offer = Offer.new
offer.title = "This is a dummy Job"
offer.link = "http://dummy-job.de"
offer.position = "Software developer"
offer.online_at = Time.now
offer.company = Company.new
offer.company.name = "Dream company"
offer.company.homepage = "http://dreamcompany.de"
offer.contact = Contact.new
offer.contact.first_name = "Vovo"
offer.contact.last_name = "Lilly"
offer.contact.email = "vovllilly@dreamcompany.de"
offer.contact.female!
offer.save

admin.offers << offer

admin.intents << Intent.new({keywords: ["Java", "Android", "Ruby"]})

admin.save
