Rails.application.routes.draw do
  devise_for :users

root to:  "homes#top"
 get 'home/about' => 'homes#about',as: "about"
 resources :books, only:[:create,:index,:show,:edit,:update,:destroy]
 resources :users, only:[:create,:show,:edit,:update,:index]
end
