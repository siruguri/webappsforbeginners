module Cms
  class PagesController < ApplicationController
    def show

      # id = all digits, means it's a true ID, else it's an attempted slug.
      if /^\d+$/.match(params[:id].to_s)
        curr_pg = Page.find_by_id params[:id]
      else
        # If there is no page with this slug, redirect to 1
        curr_pg = Page.find_by_slug(params[:id])
      end

      if curr_pg.nil?
        redirect_to root_path
        return
      end

      page_id = curr_pg.id
      @page_content = {}

      @page_content[:mesg] = "This would be a page with ID = #{page_id}"

      title_rec = curr_pg.page_attributes.where("key = 'title'")[0]
      if title_rec.nil? # page does't have a title
        @title = "Web Apps for Beginners"
      else
        @title = title_rec.value
      end

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

