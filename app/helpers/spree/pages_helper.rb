module Spree
  module PagesHelper
    def render_snippet(slug)
      page = Spree::Page.find_by(slug: slug)
      raw page.body if page
    end

    def set_locales_array
      begin
        loc = SpreeI18n::Config.available_locales  
      rescue  
        loc = ['en']
      end 
    end 

    def show_visibility entry 
      if entry.visible
       content_tag(:i, '', :class => 'glyphicon glyphicon-check')
      else
       content_tag(:i, '', :class => 'glyphicon glyphicon-unchecked')
      end
    end
  end
end
