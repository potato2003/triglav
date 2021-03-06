Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get    '/apidocs' => 'apidocs#index'

      post   '/auth/token' => 'auth#create'
      delete '/auth/token' => 'auth#destroy'
      get    '/auth/me'    => 'auth#me'

      resources :users

      get    '/clusters' => 'clusters#index'
      post   '/clusters' => 'clusters#create'
      get    '/clusters/:id_or_name' => 'clusters#show', constraints: {id_or_name: /.+/}
      put    '/clusters/:id_or_name' => 'clusters#update', constraints: {id_or_name: /.+/}
      patch  '/clusters/:id_or_name' => 'clusters#update', constraints: {id_or_name: /.+/}
      delete '/clusters/:id_or_name' => 'clusters#destroy', constraints: {id_or_name: /.+/}

      get    '/resources' => 'resources#index'
      post   '/resources' => 'resources#create'
      get    '/aggregated_resources' => 'resources#aggregated_resources'
      get    '/resources/:id_or_uri' => 'resources#show', constraints: {id_or_uri: /.+/}
      put    '/resources/:id_or_uri' => 'resources#update', constraints: {id_or_uri: /.+/}
      patch  '/resources/:id_or_uri' => 'resources#update', constraints: {id_or_uri: /.+/}
      delete '/resources/:id_or_uri' => 'resources#destroy', constraints: {id_or_uri: /.+/}

      post   '/jobs' => 'jobs#create'
      put    '/jobs' => 'jobs#update'
      patch  '/jobs' => 'jobs#update'
      get    '/jobs/:id_or_uri' => 'jobs#show', constraints: {id_or_uri: /.+/}
      put    '/jobs/:id_or_uri' => 'jobs#update', constraints: {id_or_uri: /.+/}
      patch  '/jobs/:id_or_uri' => 'jobs#update', constraints: {id_or_uri: /.+/}
      delete '/jobs/:id_or_uri' => 'jobs#destroy', constraints: {id_or_uri: /.+/}

      get    '/messages' => 'messages#index'
      post   '/messages' => 'messages#create'
      get    '/messages/last_id' => 'messages#last_id'

      get    '/job_messages' => 'job_messages#index'
      get    '/job_messages/last_id' => 'job_messages#last_id'
    end
  end
  get '/apidocs' => redirect('/swagger/dist/index.html?url=/api/v1/apidocs.json')

  # Not Found
  match '*anything' => 'application#routing_error', via: :all
  get '*anything' => 'application#routing_error' # Need this for HEAD request
end
