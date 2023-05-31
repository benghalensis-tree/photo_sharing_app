class FavoritesController < ApplicationController

  before_action :set_feed, only: %i[ show edit update destroy ]

  skip_before_action :login_required, only: [:index, :show]

  def index
    @favorites = current_user.favorite_feeds
  end

  def create
    favorite = current_user.favorites.create(feed_id: params[:feed_id])
    redirect_to feeds_path, notice: "#{favorite.feed.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to feeds_path, notice: "#{favorite.feed.user.name}さんのブログをお気に入り解除しました"
  end
end
