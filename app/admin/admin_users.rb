ActiveAdmin.register AdminUser do
  role_changeable
  permit_params :email, :password, :password_confirmation,
                :full_name, :firstname, :lastname, :email,
                :phone, :addres, :social_url, :picture, :published,
                :staff

  index do
    selectable_column
    id_column
    column :full_name
    column :picture do |obj|
      image_tag obj.picture.url(:thumb)
    end
    column :staff
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :staff
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :phone
      f.input :firstname
      f.input :lastname
      f.input :addres, input_html: {rows: 7}
      f.input :social_url
      f.input :picture
      f.input :staff
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
