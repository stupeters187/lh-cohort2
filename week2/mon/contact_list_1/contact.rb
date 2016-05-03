require 'csv'
require 'pry'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact

  attr_accessor :name, :email, :id
  
  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address
  def initialize(name, email)
    @name = name
    @email = email
  end

  # Provides functionality for managing contacts in the csv file.
  class << self

    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    def all
      CSV.foreach('contacts.csv') do |row|
        puts "#{row[0]}: #{row[1]} #{(row[2])}"
      end
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
    end

    # Creates a new contact, adding it to the csv file, returning the new contact.
    # @param name [String] the new contact's name
    # @param email [String] the contact's email
    def create(name, email)
      contact = Contact.new(name, email)
      number_of_contacts = CSV.read('contacts.csv').length
      CSV.open('contacts.csv', 'a') do |contacts_csv|
      contacts_csv << [number_of_contacts + 1, contact.name, contact.email]
      end
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
    end
    
    # Find the Contact in the 'contacts.csv' file with the matching id.
    # @param id [Integer] the contact id
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      CSV.foreach('contacts.csv') do |contact|
        if id == contact[0].to_i
          puts contact
        else
          "Not found"
        end
      end
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
    end
    
    # Search for contacts by either name or email.
    # @param term [String] the name fragment or email fragment to search for
    # @return [Array<Contact>] Array of Contact objects.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      count = 0
      r_term = /\b#{term}.*/
      CSV.foreach('contacts.csv') do |contact|

        if contact.to_s.match(r_term)

          puts "#{contact[0]}: #{contact[1]} #{(contact[2])}"
          count += 1
        end
      end
      puts "#{count} Record total"
    end

  end

end