class ProofAttachment < ActiveRecord::Base
  mount_uploader :files, FilesUploader
  belongs_to :rage
end
