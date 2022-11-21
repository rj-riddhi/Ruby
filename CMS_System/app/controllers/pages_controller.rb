class PagesController < ApplicationController
    

    def home
        @cms_page = Page.find_by_slug(params[:slug])
        return @cms_page
        if @cms_page.blank?
             render :file => "#{Rails.root}/public/404.html", status: :not_found
        end
    end
end
