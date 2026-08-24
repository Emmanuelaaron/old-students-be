Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      post "auth/register", to: "auth#register"
      post "auth/request_otp", to: "auth#request_otp"
      post "auth/verify_otp", to: "auth#verify_otp"
      post "auth/login", to: "auth#login"
      get "auth/me", to: "auth#me"
      delete "auth/logout", to: "auth#logout"

      get "stats", to: "members#stats"
      get "dashboard", to: "dashboard#overview"

      resource :profile, only: %i[show update]
      resources :next_of_kins, only: %i[index create update destroy]

      resources :members, only: %i[index show destroy] do
        collection do
          get :pending
          get :officers
        end
        member do
          post :approve
          post :assign_role
          get :role_history
        end
      end

      resources :role_histories, only: %i[index]

      resources :annual_subscriptions, only: %i[index create] do
        collection do
          get :mine
          get :pending
          get :unpaid
        end
        member do
          post :approve
          post :reject
        end
      end

      resources :contributions, only: %i[index create] do
        collection do
          get :unpaid_fines
          get :mine
          get :pending_reports
          post :report
        end
        member do
          patch :mark_fine_paid
          post :approve_report
          post :reject_report
          get :proof
        end
      end
    end
  end
end
