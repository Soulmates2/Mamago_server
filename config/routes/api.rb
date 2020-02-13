# frozen_string_literal: true

namespace :api, defaults: { format: :json } do
  resource :user
  resource :dialog
end