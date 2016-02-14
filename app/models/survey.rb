class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :completed_survey
  has_many :questions
#  has_many :answers, through: :questions
  #has_many :answers, :through => :questions, :source => :answerable, :source_type => 'through_survey'
end
