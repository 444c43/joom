class Photo
  def self.all
    client = Picasa::Client.new(user_id: "mrmicahcooper@gmail.com")
    album = client.album.show("5797040163555140801")
    album.photos.reverse.map{|p| p.content.src }
  end
end
