module Cms
  class PagesController < ApplicationController
    def show
    
      page_id = params[:id].to_i

      @page_content = {}

      @page_content[:mesg] = "This would be a page with ID = #{page_id}"
      curr_pg = Page.find page_id

      template = curr_pg.template
      template ||= 'template_1'
      layout = Page.find(page_id).layout
      layout ||= 'home'

      # Populate all the attributes
      curr_pg.page_attributes.map { |attr| @page_content[attr.key.to_sym] = md_render(attr.value) }

      render "cms/pages/#{template}", layout: layout
    end

    private

    def md_render(text)
      parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      parser.render text
    end
  end
end

