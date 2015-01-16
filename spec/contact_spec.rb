require('rspec')
require('contact')

describe(Contact) do
  describe('#name') do
    it("returns the name of the contact")
      test_contact = Contact.new("Kiel Fletcher", "720.470.5627") do
      test_contact.save()
      expect(test_contact.name()).to(eq("Kiel Fletcher"))
    end
  end

  describe('#number') do
    it("returns the number of the contact")
      test_contact = Contact.new("Kiel Fletcher", "720.470.5627") do
      test_contact.save()
      expect(test_contact.name()).to(eq("720.470.5627"))
    end
  end

  describe('#save') do
    it("adds a contact to the array of saved contacts")
      test_contact = Contact.new("Kiel Fletcher", "720.470.5627") do
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end


end
