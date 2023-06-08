class RenamePrefectureColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :prefecture, :prefecture_id
  end
end
