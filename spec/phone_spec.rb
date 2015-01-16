require('rspec')
require('phone')
require('contact')

describe(Phone) do
  before() do
    Phone.clear()
  end

  describe('#mobile_number') do
    it("returns the contact's mobile number") do
      test_numbers = Phone.new({:mobile_number => "555.555.5555", :work_number =>"111.111.1111", :home_number => "999.999.8008"})
      test_numbers.save()
      expect(test_numbers.mobile_number()).to(eq("555.555.5555"))
    end
  end

  describe('#work_number') do
    it("returns the contact's work number") do
      test_numbers = Phone.new({:mobile_number => "555.555.5555", :work_number => "111.111.1111", :home_number => "999.999.8008"})
      test_numbers.save()
      expect(test_numbers.work_number()).to(eq("111.111.1111"))
    end
  end

  describe('#home_number') do
    it("returns the contact's home number") do
      test_numbers = Phone.new({:mobile_number => "555.555.5555", :work_number =>"111.111.1111", :home_number => "999.999.8008"})
      test_numbers.save()
      expect(test_numbers.home_number()).to(eq("999.999.8008"))
    end
  end

  describe('#save') do
    it("adds phone numbers to the array of saved phone numbers") do
      test_numbers = Phone.new({:mobile_number => "555.555.5555", :work_number =>"111.111.1111", :home_number => "999.999.8008"})
      test_numbers.save()
      expect(Phone.all()).to(eq([test_numbers]))
    end
  end

  describe('.all') do
    it("is returns the phone array") do
      test_numbers = Phone.new({:mobile_number => "555.555.5555", :work_number =>"111.111.1111", :home_number => "999.999.8008"})
      test_numbers.save()
      test_numbers2 = Phone.new({:mobile_number => "000.555.5555", :work_number =>"000.111.1111", :home_number => "000.999.8008"})
      test_numbers2.save()
      expect(Phone.all()).to(eq([test_numbers, test_numbers2]))
    end
  end

  describe('.clear') do
    it("empties all the saved phone numbers") do
      Phone.new({:mobile_number => "555.555.5555", :work_number => "111.111.1111", :home_number => "999.999.8008"}).save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end
end
