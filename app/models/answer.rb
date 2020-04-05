class Answer < ApplicationRecord
    validates :reply,  length: { maximum: 20 } 
end
