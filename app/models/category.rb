class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '日用品・雑貨'},
    { id: 2, name: '調味料'},
    { id: 3, name: '肉'},
    { id: 4, name: '魚'},
    { id: 5, name: '野菜'},
    { id: 6, name: '常温の保存食'},
    { id: 7, name: '飲料'},
    { id: 8, name: '酒類'},
    { id: 9, name: '乳製品'},
    { id: 10, name: '冷凍食品'}
  ]

  include ActiveHash::Associations
  has_many :posts

end

  