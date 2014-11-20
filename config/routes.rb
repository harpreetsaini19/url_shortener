UrlShortner::Application.routes.draw do
  resources :shorties
  get '/:link' => 'shorties#redirect'
  root "shorties#index"
end
