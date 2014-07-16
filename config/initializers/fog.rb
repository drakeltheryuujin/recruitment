FOG_CONNECTION = Fog::Storage.new({
  :provider                 => 'AWS',
  :region                   => 'US-EAST-1',
  :bucket                   => 'recruitment-app',
  :aws_secret_access_key    => ENV["AWS_SECRET_ACCESS_KEY"],
  :aws_access_key_id        => ENV["AWS_ACCESS_KEY_ID"],
  :path_style               => true
})
