ActiveAdmin.register Type do
  menu parent: 'Products', priority: 1 if proc{ current_user.can_edit_posts? }

  permit_params :title, :description, :image, :position, :published, :language_id,
                :progress

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

    column :language do |obj|
      obj.language.language
    end
    column :title
    column :description
    column :image
    column :published
    column :position
    column :progress

    actions
  end

  filter :language, as: :select, collection: proc{ Language.collection }
  filter :title
  filter :description
  filter :position
  filter :published
  filter :progress


  form do |f|
    f.inputs do
      f.input :language, as: :select, collection: Language.collection, include_blank: false
      f.input :title
      f.input :description
      f.input :image, hint: '320X320'
      f.input :published
      f.input :position, input_html: {value: (f.object.position <= 1 ? Type.maximum(:position) + 1 : f.object.position )}
      f.input :progress, input_html: {step: 10, min: 0, max: 100}
    end
    actions
  end
end
