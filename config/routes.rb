# frozen_string_literal: true

BlacklightDynamicSitemap::Engine.routes.draw do
  resources :sitemap, controller: 'sitemap', only: %i[index show], defaults: { format: :xml }
end
