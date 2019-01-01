ActiveAdmin.register AdminUser do
  role_changeable
  permit_params :email, :password, :password_confirmation,
                :full_name, :firstname, :lastname, :email,
                :phone, :addres, :social_url, :picture, :published,
                :staff

  actions :all, except: [:show]

  controller do
    def create
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end

    def update
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
  end

  index do
    selectable_column
    id_column
    column :full_name
    column :picture do |obj|
      image_tag obj.picture(:thumb), width: 52
    end
    column :role
    column :staff
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :staff
  filter :role, as: :select
  filter :created_at

  form do |f|
    f.inputs do
      f.input :firstname
      f.input :lastname
      f.input :addres, input_html: {rows: 7}
      f.input :email
      f.input :phone
      f.input :social_url
      f.input :staff
      f.input :role
      f.input :picture, hint: image_tag(f.object.picture(:thumb), width: 52).html_safe
      f.input :password, input_html: {required: true}
      f.input :password_confirmation, input_html: {required: true}
    end
    f.actions
  end

end
