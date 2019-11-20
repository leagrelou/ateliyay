class AddPhotoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :photo, :string, default: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV55GSSmPPQFGQwp-W7w6rspH3dtTcQU05mFpCTOyib8eHGNgCLQ&s"
  end
end
