require "pry"
require './contact.rb'

class CRM

  def initialize
    main_menu
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_options(user_selected)
    end
  end

  def print_main_menu
    puts
    puts "****************************************"
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts "Enter a number"
  end

  def call_options(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
    print "Enter First Name: "
    first = gets.chomp

    print "Enter Last Name: "
    last = gets.chomp

    print "Enter email: "
    email = gets.chomp

    print "Enter a note: "
    note = gets.chomp

    Contact.create(first, last, email, note)
  end

  def pick_one
    puts "Pick one:"
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] email"
    puts "[4] exit"

    anwser = gets.chomp.to_i
    case anwser
    when 1 then "first_name"
    when 2 then "last_name"
    when 3 then "email"
    when 4 then exit
    end
  end

  def search_by_attribute
    puts
    puts "Lets find you contact"
    attribute = pick_one

    puts "Type the value for #{attribute}"
    value = gets.chomp

    Contact.find_by(attribute, value)
  end

  def modify_existing_contact
    puts
    contact = search_by_attribute
    puts contact.inspect
    puts
    puts "What do you want to modify"
    attribute = pick_one

    puts "Enter new value for #{attribute}"
    new_value = gets.chomp

    contact.update(attribute, new_value)
  end

  def delete_contact
    puts
    puts "Lets delete a contact"
    contact = search_by_attribute

    if contact
      contact.delete
      puts "contact DELETED!!"
    else
      puts "nothing found"
    end
  end

  def display_all_contacts
    puts
    puts "Contact list"
    Contact.all.each do |contact|
      puts " - Full Name: #{contact.full_name}"
      puts " - email: #{contact.email}"
      puts " - Notes: #{contact.note}"
      puts
    end
  end


end

# first = CRM.new
# first.main_menu
# first.main_menu
# puts first.display_all_contacts.inspect
# puts first.search_by_attribute.inspect
# puts first.modify_existing_contact.inspect
