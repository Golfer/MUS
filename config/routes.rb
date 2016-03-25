Rails.application.routes.draw do

  root to: 'dashboards#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users

  resource :dashboards
  resource :areas

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get :export_all_area_patients, to: 'buildings#export_all_area_patients', as: 'export_all_area_patients'
  resources :buildings do
    get :export_patients
    member do
      get :new_patient, to: 'patients#new_patient_for_building', as: 'new_patient_for'
      get :import_patients, to: 'patients#import_patients', as: 'import_patients_to'
      get :patients
    end

    collection do
    end
  end

  resources :patients do
    member do
      post 'update_gender/:gender', to: 'patients#update_gender', as: 'update_gender'
      post 'hide_patient/:status', to: 'patients#hide_patient', as: 'hide_patient'
    end

    collection do
      # get 'export/:id', to: 'patients#export', as: 'export'
      post 'import/:building_id', to: 'patients#import', as: 'import'
    end
  end
end
