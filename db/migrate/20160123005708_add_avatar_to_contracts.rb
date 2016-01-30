class AddAvatarToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :avatar, :string
  end
end
