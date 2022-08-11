class Post < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :name, :quantity, presence:true
  validates :category_id, numericality: { other_than: 0} 
end
