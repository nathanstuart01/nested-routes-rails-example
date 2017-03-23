Rails.application.routes.draw do
  root 'schools#index'

# a nested route showing where a school has many courses and courses belongs to a school
  resources :schools do
    resources :courses
  end

end
