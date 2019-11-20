class AddPhotoToStudio < ActiveRecord::Migration[5.2]
  def change
    add_column :studios, :photo, :string, default: "https://images.unsplash.com/photo-1564940265879-ad8e8f6f3606?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
  end
end
