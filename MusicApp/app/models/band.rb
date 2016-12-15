class Band < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :albums,
  class_name: :Album

  has_many :tracks,
  through: :albums,
  source: :Track
end
