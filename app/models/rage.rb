class Rage < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  has_many :proof_attachments
  has_many :participations
  accepts_nested_attributes_for :proof_attachments
end
