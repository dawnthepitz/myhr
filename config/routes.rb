Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "test#hello_world"
  get 'app', to:'test#hello_world'
  post 'test/mock_sms_request'
  get 'hello_world', to:'test#hello_world'
  get 'random_gift', to: 'gift#get_random_gift'
  post 'gifts/update'
  post 'gifts/create'
  get 'gifts/delete'
  post 'departments/update'
  post 'departments/create'
  get 'departments/delete'
  post 'employees/update'
  post 'employees/create'
  get 'employees/delete'
  resources :gifts
  resources :departments
  resources :employees
end
