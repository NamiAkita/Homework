class Diary < ApplicationRecord
    
    belongs_to :user
    
    mount_uploaders :images, ImageUploader
    serialize :images, JSON
    
    mount_uploader :videos, ImageUploader
end
