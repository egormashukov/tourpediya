ActiveAdmin.register_page 'Description' do

  menu priority: 1, label: proc{ I18n.t('active_admin.description') }

  content title: proc{ I18n.t('active_admin.description') } do
    excursion = Excursion.empty_description.first
    if excursion.present?
      h3 "Edit Description for: #{excursion.title}"
      form_for excursion do |f|
        f.text_area :description
        f.submit
      end
    else
      I18n.t('active_admin.no_excursions')
    end
  end
end
