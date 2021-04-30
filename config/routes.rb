Rails.application.routes.draw do
  resources :members
  get '/birthday' => 'members#birthday', to: proc { [200, {}, ['']] }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
