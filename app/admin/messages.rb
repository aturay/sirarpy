ActiveAdmin.register Message do
  permit_params :customer_id, :message, :created_at, :updated_at, :published

  actions :all, except: [:show]

  index do
    selectable_column
    id_column

    column :customer
    column :message
    column :published
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :customer, as: :select
      f.input :message
      f.input :published
    end
    f.actions
  end
end
