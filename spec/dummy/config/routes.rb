Rails.application.routes.draw do
  mount Datashot::Engine => "/datashot"
  root "datashot/snapshots#index"
end
