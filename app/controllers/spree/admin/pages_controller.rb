module Spree
  module Admin
    class PagesController < ResourceController

      private
      def page_params
        params.require(:page).premit!
      end
    end
  end
end
