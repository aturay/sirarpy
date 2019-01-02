ActiveAdmin.register Customer do
  actions :all, except: [:show]

  permit_params :fullname, :email, :phone, :addres, :ip, :photo, :published

  index do
    column :fullname
    column :email
    column :phone
    column :addres
    column :ip
    column :photo do |obj|
      image_tag obj.photo(:thumb), width: 52
    end
    column :published
    actions
  end

  form do |f|
    f.inputs do
      f.input :fullname
      f.input :email
      f.input :phone
      f.input :addres
      f.input :photo, hint: image_tag(object.photo(:thumb), width: 52)
      f.input :published
    end
    f.actions
  end
end
