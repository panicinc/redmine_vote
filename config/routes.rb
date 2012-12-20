# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

RedmineApp::Application.routes.draw do
  post '/vote/up',   :to => 'vote#up'
  post '/vote/down', :to => 'vote#down'
end
