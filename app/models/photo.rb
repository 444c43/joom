class Photo

  def self.all
    album_photos
  end

  private

  def self.client
    client = Picasa::Client.new(user_id: "444c43@gmail.com")
  end

  def self.album
    album = client.album.show("5857510510932125697")
  end

  def self.album_photos
    album.photos.reverse.map{|p| p.content.src }
  end
  
end
