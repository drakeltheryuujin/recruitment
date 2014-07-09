class GalleryItem < ActiveRecord::Base
  validates :email, :caption, :final_image, :upvotes, presence: true

  scope :popular, -> { where('upvotes >= ?', 4)}
  scope :recent, -> { where('created_at >= ?', Date.today)}

  belongs_to :user

  def self.search_for(query)
    where('email LIKE :query OR caption LIKE :query', query: "%#{query}%")
  end
end

