FacilityReview::Application.routes.draw do
  root "facilities#location"
  # post "facilities" => "facilities#index"
  get "facilities" => "facilities#index"
  get "facilities/:id" => "facilities#show", as: "facility"

  resources :facilities do
    resources :reviews
  end
end
