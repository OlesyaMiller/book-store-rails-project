class Book < ApplicationRecord
    has_many :purchases
    has_many :users, through: :purchases 
    belongs_to :genre 
    
    validates :title, :author, :price, :number_of_pages, :summary, :genre_id, presence: true
end
