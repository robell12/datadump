class Job < ApplicationRecord
  belongs_to :user
  has_many :pictures

  def save_images!(images)
    images.each do |image|
      self.pictures.create(title: "Untitled", description: "Add your description here!", image: image)
    end
  end
end
