ActiveAdmin.register Social do
  # menu parent: 'Settings'

  permit_params :title, :url, :published, :position

  actions :all, except: [:show]

  index do
    selectable_column
    id_column

    column :title do |obj|
      obj.title.match(/-(\w+)-/)[1] rescue ''
    end
    column :url
    column :published
    column :position
    actions
  end

  form do |f|
    f.inputs do
      f.input :title, as: :select, include_blank: false,
              collection: Social.titles.keys.map { |key| [key.match(/-(\w+)-/)[1], key] }
      f.input :url
      f.input :published
      f.input :position, input_html: {value: (f.object.position <= 1 ? Social.maximum(:position) + 1 : f.object.position )}
    end
    f.actions
  end
 end
