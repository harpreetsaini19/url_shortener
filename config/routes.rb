UrlShortner::Application.routes.draw do
  resources :shorties
  get '/:link' => 'shorties#redirect'
  get 'shorties/:id/toggle_bookmark' => 'shorties#toggle_bookmark', as: 'toggle_bookmark'
  root "shorties#index"
end
