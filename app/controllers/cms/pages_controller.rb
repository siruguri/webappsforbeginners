module Cms
  class PagesController < ApplicationController
    def show
    
      @mesg = "This would be a page with ID = #{params[:id]}"

      params[:template] ||= 'template_1'

      render "cms/#{params[:template]}"
    end
  end
end

