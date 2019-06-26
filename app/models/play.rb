class Play < ApplicationRecord
  validates_presence_of :timer, :url
end
