class Track < ActiveRecord::Base
  validates :name, uniqueness: true

  belongs_to :album, dependent: :destroy

end
