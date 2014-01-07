class PhotosController < ApplicationController
  expose(:photos) { Photo.all }
end
