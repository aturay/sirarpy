ActiveAdmin.register Contact do
  permit_params :email, :phones, :language_id, :address

  actions :all, except: [:show]

  index do
    selectable_column
    id_column

    column :language do |obj|
      obj.language.language
    end
    column :phones
    column :address
    column :email
    actions
  end

  form do |f|
    f.inputs do
      f.input :language, collection: Language.collection, include_blank: false
      f.input :phones , hint: t(:phones_input_hint)
      f.input :address
      f.input :email
    end
    f.actions
  end
end
