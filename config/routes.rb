TodoApiRails::Application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ボード
  # POST   /boards(.:format)          boards#create ボード作成
  # DELETE /boards/:id(.:format)      boards#destroy ボード削除
  resources :boards

  # タスク
  resources :tasks
end
