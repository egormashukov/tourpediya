ActiveAdmin.register ExcursionEvent do
  actions :index

  index do
    id_column
    column 'Excursion' do |event|
      event.excursion.title
    end
    column 'User' do |event|
      event.user.email
    end
    column :event
    column :created_at
    column :updated_at
  end
end
