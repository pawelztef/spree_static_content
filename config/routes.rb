Spree::Core::Engine.add_routes do
  namespace :admin, path: Spree.admin_path do
    resources :pages do
      collection do
        post 'mobility'
      end
    end
  end
  namespace :my_page do
      get '/:slug', to: 'static_content#show', as: 'static'
  end
end
