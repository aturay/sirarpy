ActiveAdmin.register Slider do
  menu parent: 'Settings'
  permit_params :title, :sub_title, :description, :image, :position, :published, :language_id

  index do
    selectable_column
    id_column

    column :image do |obj|
      image_tag obj.image.url(:thumb)
    end
    column :title
    column :sub_title
    column :description
    column :position
    column :published
    column :language do |obj|
      obj.language.language
    end

    actions
  end

  filter :language, as: :select, collection: proc{ Language.collection }
  filter :title
  filter :sub_title
  filter :description
  filter :position
  filter :published


  form do |f|
    f.inputs do
      f.input :language, as: :select, collection: Language.collection, include_blank: false
      f.input :title
      f.input :sub_title
      f.input :description
      f.input :image, hint: '320X320'
      f.input :position, input_html: {value: (f.object.position <= 1 ? Slider.maximum(:position) + 1 : f.object.position )}
      f.input :published
    end
    actions
  end
end
