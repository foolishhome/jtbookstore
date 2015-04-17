class ModifyImagesColumns < ActiveRecord::Migration
  def up
    rename_column :images, :name, :image_file_name
    add_column :images, :image_content_type, :string
    rename_column :images, :size, :upload_file_size
    add_column :images, :upload_updated_at, :datetime
  end

  def down
  end
end
