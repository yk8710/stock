class Post < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :name, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :category_id, numericality: { other_than: 0 }

  def self.search(search)
    Post.where('name Like(?)', "%#{search}%") if search
  end
end
