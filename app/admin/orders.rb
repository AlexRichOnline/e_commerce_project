# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :user_id
end
