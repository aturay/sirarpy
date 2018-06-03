ActiveAdmin.register WeDo do
  menu parent: 'Settings'
  permit_params :title, :description, :icon, :language_id, :position, :published

  index do
    selectable_column
    id_column

    column :language do |obj|
      obj.language
    end
    column :title
    column :description
    column :icon do |obj|
      image_tag obj.icon.url(:thumb)
    end
    column :position
    column :published

    actions
  end

  filter :language, as: :select, collection: proc{ Language.languages }
  filter :title
  filter :description
  filter :position
  filter :published


  form do |f|
    f.inputs do
      f.input :language, as: :select, collection: Language.collection, include_blank: false
      f.input :title
      f.input :description
      f.input :icon, hint: '360X360'
      f.input :position, input_html: {value: (f.object.position <= 1 ? WeDo.maximum(:position) + 1 : f.object.position )}
      f.input :published
    end
    f.actions
  end
end
