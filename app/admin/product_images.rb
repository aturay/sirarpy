ActiveAdmin.register ProductImage do
  menu parent: 'Products', priority: 3
  actions :index, :show, :destroy

  index do
    selectable_column
    id_column

    column :image do |obj|
      image_tag obj.image.url :thumb
    end
    column :image_file_name
    column :product

    actions
  end

end
