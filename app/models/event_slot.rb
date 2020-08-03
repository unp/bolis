class EventSlot < ApplicationRecord
  belongs_to :event
  belongs_to :slot
  has_one :donation
end
