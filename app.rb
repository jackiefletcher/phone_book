require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/contact') do
  name = params.fetch("name")
  number = params.fetch("number")
  contact = Contact.new(name, number)
  contact.save()
  @contacts = Contact.all()
  erb(:index)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch("id"))
  erb(:contact)
end
