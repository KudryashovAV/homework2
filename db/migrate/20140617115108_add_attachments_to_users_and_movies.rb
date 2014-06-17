class AddAttachmentsToUsersAndMovies < ActiveRecord::Migration
  def self.up
    add_attachment :movies, :avatar
  end

  def self.down
    remove_attachment :movies, :avatar
  end
end
