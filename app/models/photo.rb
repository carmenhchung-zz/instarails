class Photo < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
end
