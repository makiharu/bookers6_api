class RemoveContentFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :content, :text
  end
end
