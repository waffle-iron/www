Rails.application.routes.draw do
  comfy_route :cms_admin, :path => '/_admin_'

  resources :price_book_pages do
    member do
      get 'delete'
    end
  end

  resource :profile, except: [:new, :create, :destroy]

  get 'price_check' => 'price_check#index', as: 'price_check'
  post 'select_area' => 'price_check#set_selected_area'
  get 'select_area' => 'price_check#select_area'

  devise_for :shoppers
  resources :purchases, except: [:new, :show] do
    member do
      get 'delete'
    end
    resources :items, controller: 'purchase_items', only: [:create, :update, :destroy] do
      member do
        get 'delete'
      end
    end
  end

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false
end
