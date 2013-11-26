AjaxOnRails::Application.routes.draw do
  root :to => 'menus#index'
  resources :menus, :only => [:index, :show, :create] do
    resources :menu_items, :only => [:index, :create]
  end
  # add orders, too
end
