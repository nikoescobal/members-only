class AddUserIdToSecrets < ActiveRecord::Migration[6.1]
  def change
    add_column :secrets, :user_id, :integer
  end
end
