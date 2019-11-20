class AddAddressToStudios < ActiveRecord::Migration[5.2]
  def change
    add_column :studios, :address, :string, default: "5333 Casgrain Ave, Montreal, QC"
  end
end
