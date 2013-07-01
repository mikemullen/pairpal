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

  has_many :relationships, foreign_key: "person_id",
                            dependent: :destroy
  has_many :teams, through: :relationships, source: :team

  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true

  def member?(team)
  	relationships.find_by_team_id(team.id)
  end

  def jointeam!(team)
  	relationships.create!(team_id: team.id)
  end

  def disjoin!(team)
  	relationships.find_by_team_id(team.id).destroy
  end
end