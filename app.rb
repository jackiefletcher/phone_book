require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/phone')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/contacts') do
  name = params.fetch('name')
  Contact.new(name).save()
  @contacts = Contact.all()
  erb(:index)
end

post('/phone_numbers') do
  mobile_number = params.fetch('mobile_number')
  work_number = params.fetch('work_number')
  home_number = params.fetch('home_number')
  @numbers = Phone.new({:mobile_number => mobile_number, :work_number => work_number, :home_number => home_number})
  @numbers.save()
  @contact = Contact.find(params.fetch('contact_id').to_i())
  @contact.add_numbers(@numbers)
  erb(:contact)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch("id"))
  erb(:contact)
end
