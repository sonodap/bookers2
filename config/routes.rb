Rails.application.routes.draw do
  devise_for :users

root to:  "homes#top"
 get 'homes/about' => 'homes#about',as: "about"
 resources :books, onry:[:new,:create,:index,:show,:destroy]
 resources :users, onry:[:show,:edit,:update]
end
