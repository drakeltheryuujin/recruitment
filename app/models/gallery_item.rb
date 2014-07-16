require 'RMagick'
require 'rmagick_text_util.rb'

class GalleryItem < ActiveRecord::Base
  validates :caption, presence: true

  scope :popular, -> { where('upvotes >= ?', 4)}
  scope :recent, -> { where('created_at >= ?', Date.today)}

  belongs_to :user

  def create_final_image
    img = ImageList.new('public/computer-cat.jpg')
    txt = Draw.new
    img.annotate(txt, 0,0,0,0, "#{caption}"){
      txt.gravity = Magick::NorthGravity
      txt.fill = '#ffffff'
      txt.pointsize = 36
      txt.font_family = 'Impact'
      txt.font_weight = Magick::BoldWeight
    }
    
    img.format = 'jpeg'
    self.save
    ::FOG_CONNECTION.put_object("recruitment-app", "generated-image-#{id}", img.to_blob, public: "true")
    directory = FOG_CONNECTION.directories.get("recruitment-app")
    filename = "generated-image-#{id}"
    file = directory.files.create(:key => filename, :body => img.to_blob, :public => true )
    self.final_image = file.public_url
    self.save
    binding.pry
  end

  def self.search_for(query)
    where('email LIKE :query OR caption LIKE :query', query: "%#{query}%")
  end
end

