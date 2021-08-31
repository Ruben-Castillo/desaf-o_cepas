class RemoveNationalityFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :nationality, :string
  end
end
