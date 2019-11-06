ActiveAdmin.register Item do
  permit_params :name, :price, :description, :image, :sprit, :category_id
end
