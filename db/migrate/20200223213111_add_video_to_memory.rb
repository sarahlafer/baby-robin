class AddVideoToMemory < ActiveRecord::Migration[5.2]
  def change
    add_column :memories, :video, :string
  end
end
