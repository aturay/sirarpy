# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'AdminUsers created!'
%i[seller staff manager admin].each do |role|
  %i[gorcim.com sirarpy.com].each do |host|
    AdminUser.find_or_create_by!(email: "#{role}@#{host}") do |admin_user|
      admin_user.role = role
      admin_user.password = 'password'
      admin_user.password_confirmation = 'password'
    end
  end
end

p 'Language [en, de, ru, am] created!'
en = Language.create!([{language: 'en', position: 1, published: true}]).first
de = Language.create!([{language: 'de', position: 2, published: true}]).first
ru = Language.create!([{language: 'ru', position: 3, published: true}]).first
am = Language.create!([{language: 'am', position: 4, published: true}]).first

p 'Slider EN created!'
Slider.create!([
  {
    language: en,
    title: 'Welcome to pluton theme',
    sub_title: 'Clean & responsive',
    description: 'When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.',
    image: open( "#{Rails.root}/app/assets/images/Slider01.png" ),
    position: 1,
    published: true
  }, {
    language: en,
    title: 'Easy management',
    sub_title: 'Easy to use',
    description: 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.',
    image: open( "#{Rails.root}/app/assets/images/Slider02.png" ),
    position: 2,
    published: true
  }, {
    language: en,
    title: 'Revolution',
    sub_title: 'Customizable',
    description: 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.',
    image: open( "#{Rails.root}/app/assets/images/Slider03.png" ),
    position: 3,
    published: true
  } ])

p 'WeDo EN created!'
WeDo.create!([
  {
    language: en,
    title: 'Modern Design',
    description: 'We Create Modern And Clean Theme For Your Business Company.',
    icon: open( "#{Rails.root}/app/assets/images/Service1.png" ),
    position: 1,
    published: true
  }, {
    language: en,
    title: 'Powerfull Theme',
    description: 'We Create Modern And Powerful Theme With Lots Animation And Features',
    icon: open( "#{Rails.root}/app/assets/images/Service2.png" ),
    position: 2,
    published: true
  }, {
    language: en,
    title: 'Clean Code',
    description: 'We Create Modern And Powerful Html5 And CSS3 Code Easy For Read And Customize.',
    icon: open( "#{Rails.root}/app/assets/images/Service3.png" ),
    position: 3,
    published: true
  }
])





