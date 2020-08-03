class EventSlot < ApplicationRecord
  belongs_to :event
  belongs_to :slot
end
