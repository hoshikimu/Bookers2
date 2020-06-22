class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :name, presence: true,
  			length: {minimum: 2}
end
