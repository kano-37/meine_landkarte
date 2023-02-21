class Pin < ApplicationRecord

    mount_uploader :image, ImageUploader
    has_many :pin_tag_relations, dependent: :destroy
    has_many :tags, through: :pin_tag_relations, dependent: :destroy
end
