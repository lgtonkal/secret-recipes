class Food < ApplicationRecord
    has_many :recipes, dependent: :destroy
    has_and_belongs_to_many :categories
end
