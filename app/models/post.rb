class Post < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :name, :quantity, presence:true
  validates :category_id, numericality: { other_than: 0} 

  def self.search(search)
    if search 
      Post.where('name Like(?)', "%#{search}%")
    end
  end
end
