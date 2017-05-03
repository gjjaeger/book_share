Rails.application.routes.draw do
  resources :votes
  root 'stories#index'
  devise_for :users
  resources :users do
    resources :stories, :controller=>"user_stories"
    resources :sentences, :controller=>"user_contributions"
  end
  resources :stories do
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
    resources :sentences do
      post '/up-vote' => 'votes#up_vote', as: :up_vote
      post '/down-vote' => 'votes#down_vote', as: :down_vote
    end
  end
  resources :sentences
end
