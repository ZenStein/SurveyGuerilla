class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :answerable, polymorphic: true


end
