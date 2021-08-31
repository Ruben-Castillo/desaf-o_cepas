class AddAgeandNationalityToOenologist < ActiveRecord::Migration[5.2]
  def change
    add_column :oenologists, :age, :integer
    add_column :oenologists, :nationality, :string
  end
end
