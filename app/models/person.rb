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

class Person < ActiveRecord::Base
  attr_accessible :email, :name

  before_save { |person| person.email = email.downcase }

  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true
end