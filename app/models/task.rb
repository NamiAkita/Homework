class Task < ApplicationRecord
    
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  
  mount_uploader :pdf, PdfUploader
  mount_uploader :audio, AudioUploader
  
end
