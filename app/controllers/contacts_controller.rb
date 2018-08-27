class ContactsController < ApplicationController
 
 # GET /contact-us
 # Show contact form
  def new
    @contact = Contact.new
  end
  
  # POST /contacts
  def create 
    # Mass assignment of form fields into Contact object
    @contact = Contact.new(contact_params)
    # Save the Contact object to the database
    if @contact.save
      # Store form fields via parameters
      flash[:success] = "Message sent"
      redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end


end