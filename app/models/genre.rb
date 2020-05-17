class Genre < ApplicationRecord
  has_many :posts_genres_relationships
  has_many :posts, through: :posts_genres_relationships

end
