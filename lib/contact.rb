class Contact
  @@contacts = []

  attr_reader(:name, :numbers)

  define_method(:initialize) do |name| #removed number?
    @name = name
    @numbers = []
    @id = @@contacts.length().+(1)
  end

  define_method(:id) do
    @id
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |identification|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(identification.to_i())
        found_contact = contact
      end
    end
    found_contact
  end

  define_method(:add_numbers) do |number|
    @numbers.push(number)
  end
end
