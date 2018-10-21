ActiveAdmin.register Product do
  menu parent: 'Products', priority: 2

  permit_params :title, :description, :owerview, :price, :published,
                :language_id, :type_id, :admin_user_id, uploads: []

  actions :all, except: [:show]

  before_create do |product|
    product.admin_user = current_admin_user
  end

  after_create do |product|
    product.uploads = params[:product][:uploads]
  end

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

    column :language do |obj|
      obj.language.language
    end
    column :title
    column :type
    column :image do |obj|
      obj.product_images.map do |pi|
        image_tag pi.image.url(:thumb), width: 52
      end.join.html_safe
    end
    column :description
    # column :owerview
    column :price
    column :admin_user do |obj|
      obj.admin_user.full_name
    end
    column :published

    actions
  end

  filter :language, as: :select, collection: proc{ Language.collection }
  filter :title
  filter :description
  # filter :owerview
  filter :price
  filter :type
  filter :admin_user
  filter :published


  form html: { multipart: true } do |f|
    f.inputs do
      f.input :language, as: :select, collection: Language.collection, include_blank: false
      f.input :type, as: :select, collection: Type.collection, include_blank: false
      f.input :title
      f.input :description, input_html: {rows: 7}
      # f.input :owerview, input_html: {rows: 7}
      f.input :price
      f.input :uploads, as: :file, input_html: {multiple: true},
              hint: ('Multiple upload images <i>320X320</i><br>' +
                f.object.product_images.map do |pi|
                  image_tag pi.image.url(:thumb), width: 52
                end.join
              ).html_safe

      f.input :published
    end
    actions
  end
end
