ActiveAdmin.register Excursion do
  actions :index, :new, :edit, :update, :create, :show, :destroy

  filter :title
  filter :created_at
  filter :updated_at

  permit_params :title, :description, :published, :viewed, :city_id

  index do
    id_column
    column :title
    column :description
    column :created_at
    column :updated_at
    column 'City' do |exception|
      exception.city.name
    end
  end
end
