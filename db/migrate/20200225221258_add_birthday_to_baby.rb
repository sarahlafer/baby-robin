class AddBirthdayToBaby < ActiveRecord::Migration[5.2]
  def change
    add_column :babies, :birthday, :date
  end
end
