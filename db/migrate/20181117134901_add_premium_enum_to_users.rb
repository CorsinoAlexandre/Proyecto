class AddPremiumEnumToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :isPremium, :integer
  end
end
