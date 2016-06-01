FacilityReview::Application.routes.draw do
  root "facilities#location"
  # post "facilities" => "facilities#index"
  get "facilities" => "facilities#index"
  get "facilities/:id" => "facilities#show", as: "facility"

  resources :facilities do
    member do
      post 'create_scrivito_obj'
    end
    resources :reviews
  end

  # Default Scrivito routes. Adapt them to change the routing of CMS objects.
  # See the documentation of 'scrivito_route' for a detailed description.
  scrivito_route '/', using: 'homepage'
  scrivito_route '(/)(*slug-):id', using: 'slug_id'
  scrivito_route '/*permalink', using: 'permalink', format: false
end
