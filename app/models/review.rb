class Review < ActiveRecord::Base
  belongs_to :facility
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :content, length: { minimum: 11}
end
