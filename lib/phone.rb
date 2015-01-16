class Phone
  @@phones = []

  attr_reader(:mobile_number, :work_number, :home_number)

  define_method(:initialize) do |attributes|
    @mobile_number = attributes.fetch(:mobile_number)
    @work_number = attributes.fetch(:work_number)
    @home_number = attributes.fetch(:home_number)
  end

  define_singleton_method(:all) do
    @@phones
  end

  define_method(:save) do
    @@phones.push(self)
  end

  define_singleton_method(:clear) do
    @@phones = []
  end
  

end
