Rails.application.routes.draw do
  get 'questions/edit'
  root 'histories#index'
  
  resources :histories do
    collection do
      get 'search'
    end
    resources :questions
  end
  
end
