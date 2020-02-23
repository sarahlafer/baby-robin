class AddPhotoToMemory < ActiveRecord::Migration[5.2]
  def change
    add_column :memories, :photo, :string
  end
end
