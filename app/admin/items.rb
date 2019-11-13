# frozen_string_literal: true

ActiveAdmin.register Item do
  permit_params :name, :price, :description, :image, :sprit, :category_id, :upload

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :upload, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    column :name
    column :price
    column :description
    column :image do |item|
      image_tag item.image, alt: "#{item.name}_image"
    end
    column :sprit do |item|
      image_tag item.sprit, alt: "#{item.name}_sprit"
    end
    column :category_id
    column :upload do |item|
      image_tag item.thumbnail, alt: "#{item.name}_upload" if item.upload.present?
    end
  end
end
