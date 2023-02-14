class PinTagRelation < ApplicationRecord
  belongs_to :pin
  belongs_to :tag
end
