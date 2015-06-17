class ProofAttachment < ActiveRecord::Base
  mount_uploader :path, FileUploader
  belongs_to :rage
end
