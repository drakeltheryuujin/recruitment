require 'rubygems'
require 'RMagick'
include Magick

class FinalImagesController < ApplicationController
  def final_image
    img = ImageList.new('public/computer-cat.jpg')
    txt = Draw.new
    img.annotate(txt, 0,0,0,0, "Text over image"){
      txt.gravity = Magick::SouthGravity
      txt.pointsize = 25
      txt.stroke = '#000000'
      txt.fill = '#ffffff'
      txt.font_weight = Magick::BoldWeight
    }
    img.format = 'jpeg'
    send_data img.to_blob, :stream => 'false', :filename => 'test.jpg', :type => 'image/jpeg', :disposition => 'inline'
  end
end

