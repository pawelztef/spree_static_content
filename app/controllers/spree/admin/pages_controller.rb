module Spree
  module Admin
    class PagesController < ResourceController
      before_action :set_static_page_mobility
      helper 'spree/pages'

      def index
        @pages = Spree::Page.all
      end

      def edit
        @page = Spree::Page.find(params[:id])
      end

      def update
        @page = Spree::Page.find(params[:id])
        @page.create_slug
        if @page.update(page_params)
          flash[:success]=flash_message_for(@page, :successfully_updated)
          redirect_to admin_pages_url
        else
          render :new
        end
      end

      def create
        @page = Spree::Page.new(page_params)
        @page.create_slug
        if @page.save
          flash[:success] = flash_message_for(@page, :successfully_created)
          redirect_to admin_pages_url
        else
          flash[:error] = flash_message_for(@page, :not_created)
          render :new
        end
      end

      def mobility
        session[:static_page_mobility_locale] = params[:mobility_locale]
        redirect_to admin_pages_url
      end

      private

      def page_params
        params.require(:page).permit!
      end

      def set_static_page_mobility
        if session[:static_page_mobility_locale]
          Mobility.locale = session[:static_page_mobility_locale]
        end
      end
    end
  end
end
