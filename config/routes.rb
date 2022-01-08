Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # list all tasks
  get 'tasks', to: "tasks#index"

  # add a task
  get 'tasks/new', to: "tasks#new", as: "new_task"
  post 'tasks', to: "tasks#create"
  # view a task
  get 'tasks/:id', to: "tasks#show", as: "task"
  # edit a task
  get 'tasks/:id/edit', to: "tasks#edit", as: "edit_task"
  patch 'tasks/:id', to: "tasks#update"
  # destroy all task
  delete 'tasks/:id', to: "tasks#destroy"
end
