# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Person do

  before { @person = Person.new(name: "Exmaple Person", email: "person@example.com") }

  subject { @person }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @person.name = " " }
  	it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @person.email = " " }
  	it { should_not be_valid }
  end

  describe "email must be unique" do
  	before do
  	  person_with_same_email = @person.dup
  	  person_with_same_email.save
  	end

  	it { should_not be_valid }
  end
end
