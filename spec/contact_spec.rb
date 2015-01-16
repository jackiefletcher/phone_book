require('rspec')
require('contact')
require('phone')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#name') do
    it("returns the name of the contact") do
      test_contact = Contact.new("Kiel Fletcher") #, "720.470.5627") this doesn't make sense to me why these exercises are backwards
      test_contact.save()
      expect(test_contact.name()).to(eq("Kiel Fletcher"))
    end
  end

  # describe('#number') do
  #   it("returns the number of the contact") do
  #     test_contact = Contact.new("Kiel Fletcher" "720.470.5627")
  #     test_contact.save()
  #     expect(test_contact.number()).to(eq("720.470.5627"))
  #   end
  # end

  describe('#save') do
    it("adds a contact to the array of saved contacts") do
      test_contact = Contact.new("Kiel Fletcher") # , "720.470.5627")
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('.clear') do
    it("clears the class array") do
      test_contact = Contact.new("Kiel Fletcher") # , "720.470.5627")
      test_contact.save()
      expect(Contact.clear()).to(eq([]))
    end
  end

  describe('#id') do
    it("returns the id of the contact") do
      test_contact = Contact.new("Kiel Fletcher") # , "720.470.5627")
      test_contact.save()
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe('.find') do
    it("returns a vehicle by its id number") do
      test_contact1 = Contact.new("Jackie Fletcher") # , "504.999.5555")
      test_contact1.save()
      test_contact2 = Contact.new("Laura Skrivseth") # , "888.888.8888")
      test_contact2.save()
      expect(Contact.find(test_contact1.id())).to(eq(test_contact1))
    end
  end

  describe('#add_numbers') do
    it("adds new phone numbers to the contact") do
      test_contact = Contact.new("Kiel Fletcher")
      test_phone = Phone.new({:mobile_number => "555.555.5555", :work_number => "111.111.1111", :home_number => "999.999.8008"})
      test_contact.add_numbers(test_phone)
      expect(test_contact.numbers()).to(eq([test_phone]))
    end
  end
end
