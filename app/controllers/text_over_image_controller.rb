require 'RMagick'
include Magick

class TextOverImageController < ApplicationController
  def compile_pic

    img = ImageList.new(‘public/computer-cat.jpg’)
    txt = Draw.new
    img.annotate(txt, 0,0,0,0, “In ur Railz, annotatin ur picz.”){
    txt.gravity = Magick::SouthGravity
    txt.pointsize = 25
    txt.stroke = ‘#000000′
    txt.fill = ‘#ffffff’
    txt.font_weight = Magick::BoldWeight
    }

    img.format = ‘jpeg’
    send_data img.to_blob, :stream => ‘false’, :filename => ‘test.jpg’, :type => ‘image/jpeg’, :disposition => ‘inline’

  end
end
