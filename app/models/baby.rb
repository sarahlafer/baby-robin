class Baby < ApplicationRecord
  belongs_to :user
  has_many :memories

  def calculate_age(memory_date, birthday)
    if (memory_date - birthday).ceil == 1
      return "Da war Robin #{(memory_date - birthday).ceil} Tag alt"
    else
      return "Da war Robin #{(memory_date - birthday).ceil} Tage alt"
    end
  end
end
