# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Relationship < ActiveRecord::Base
  attr_accessible :person_id, :team_id

  belongs_to :team
  belongs_to :person

  validates :person_id, presence: true
  validates :team_id,   presence: true

  
end
