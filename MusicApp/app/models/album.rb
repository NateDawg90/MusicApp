class Album < ActiveRecord::Base
  validates :name, uniqueness: true

  belongs_to :band, dependent: :destroy

  has_many :tracks,
  class_name: :Track


end
