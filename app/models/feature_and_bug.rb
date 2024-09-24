class FeatureAndBug < ApplicationRecord
  mount_uploader :screenshot, ImageUploader     # This will tell rails that screenshot solumn of featureAndBug table will be handled by image uploader
  belongs_to :project

  validates :title, :status, :item_type, :project, presence: true
  validates :title, uniqueness: { scope: :project_id }
  validates :screenshot, format: { with: /\.(png|gif)\z/i, message: "must be a .png or .gif file" }, allow_blank: true

  enum item_type: {  feature: 0, bug: 1 }

  def formatted_deadline
    deadline.strftime("%d-%m-%y") if deadline
  end
end
