class GalleryItem < ActiveRecord::Base
  validates :caption, :final_image, presence: true

  scope :popular, -> { where('upvotes >= ?', 4)}
  scope :recent, -> { where('created_at >= ?', Date.today)}

  belongs_to :user
  mount_uploader :avatar, ImageUploaderUploader

  def create_final_image
    img = ImageList.new('public/computer-cat.jpg')
    txt = Draw.new
    img.annotate(txt, 0,0,0,0, caption){
      txt.gravity = Magick::SouthGravity
      txt.pointsize = 25
      txt.stroke = '#000000'
      txt.fill = '#ffffff'
      txt.font_weight = Magick::BoldWeight
    }
    img.format = 'jpeg'
    ::FOG_CONNECTION.put_object("recruitment-app", "generated-image-#{id}", img.to_blob, public: true)
    file = FOG_CONNECTION.directories.get("recruitment-app").
    final_image = file.public_url
    self.save
  end

  def self.search_for(query)
    where('email LIKE :query OR caption LIKE :query', query: "%#{query}%")
  end
end

