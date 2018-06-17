ActiveAdmin.register Setting do
  menu label: 'logo'
  permit_params :logo
  actions :index, :show, :edit, :update
  config.filters = false

  index do
    column :logo do |obj|
      image_tag obj.logo.url(:thumb)
    end
    actions
  end

  show do
    attributes_table do
      row :logo do |ad|
        image_tag ad.logo.url
      end
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :logo, hint: ('<i>240X80<i><br>' +
        (object.id ? image_tag(object.logo.url(:thumb)) : '')
      ).html_safe
    end

    actions
  end
end
