class Article < ActiveRecord::Base
  #dependent: :destroy is to delete comments when delete article
  has_many :comments, dependent: :destroy  
  validates :title,presence: true,
                   length: { minimum: 5 }
end
