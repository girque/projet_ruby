class Dysfunction < ActiveRecord::Base
  belongs_to :user
  mount_uploaders :files, FilesUploader
end
