Rails.application.routes.draw do
  get '/health_check', to: 'health_check#main'
  root to: 'health_check#main'
end
