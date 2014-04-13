ActiveAdmin.register Page do
   permit_params(:template, :layout, :slug, page_attributes_attributes: [:id, :key, :value, :_destroy])

  form do |f|
    f.inputs do
      f.has_many :page_attributes, allow_destroy: true, heading: 'Parts' do |page_part|
        page_part.input :key
        page_part.input :value
      end
      f.input :template
      f.input :layout
      f.input :slug
    end

    f.actions
  end
  
end
