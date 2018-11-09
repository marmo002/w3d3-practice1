class Contact

  @@contacts = []
  @@id = 1

  # CLASS METHOS

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    all.find do |contact|
      contact.id == id
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    case attribute
    when "first_name"
      all.find do |contact|
        contact.first_name == value
      end
    when "last_name"
      all.find do |contact|
        contact.last_name == value
      end
    when "email"
      all.find do |contact|
        contact.email == value
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create( first_name, last_name, email, note="N/A" )
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should initialize the contact's attributes
  def initialize( first_name, last_name, email, note="N/A" )
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1
  end

  # GETTERS (SETTERS)
  def id
    @id
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  # WRITTERS (SETTERS)
  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def note=(note)
    @note = note
  end

  # INSTANCE METHOS

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)
    case attribute
    when "first_name"
      @first_name = new_value
    when "last_name"
      @last_name = new_value
    when "email"
      @email = new_value
    end
    return self
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.


end


# martin1 = Contact.create("Martin", "Maco", "martin@mail.com", "my notes")
# martin2 = Contact.create("Martin", "Maco", "martin2@mail.com", "my notes")
# meliza = Contact.create("Meliza", "Pineda", "meliza@mail.com")
# john = Contact.create("John", "Due", "due@mail.com")
# marley = Contact.create("Marley", "Spelunky", "spelunky@mail.com")
