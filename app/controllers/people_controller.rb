class PeopleController < ApplicationController
  def new
    @person = Person.new
    #need to add two empty addresses to fill out 
    @person.addresses.build(address_type: 'work')
    @person.addresses.build(address_type: 'home')
  end

  def create    
    Person.create(person_params)
    redirect_to people_path
  end

  def index
    @people = Person.all
  end

  private

  #we added new params keys, which means we need to modify the person params to accept them
  def person_params
    params.require(:person).permit(:name, addresses_attributes: [
      :street_address_1,
      :street_address_2.
      :city,
      :state,
      :zipcode,
      :address_type]
    )
  end
end
