class Admin::Articles::PublishesController < ApplicationController
  layout 'admin'

  before_action :set_article

  def update
    @article.published_at = Time.current unless @article.published_at?

    if @article.published_at <= Time.current
      @article.state = :published
    else
      @article.state = :pending
    end

    if @article.valid?
      Article.transaction do
        @article.body = @article.build_body(self)
        @article.save!
      end

    else
      flash.now[:alert] = 'エラーがあります。確認してください。'

      @article.state = @article.state_was if @article.state_changed?
      render 'admin/articles/edit'
    end

    if @article.published?
      flash[:notice] = '記事を公開しました'
    else
      flash[:notice] = '記事を公開待ちにしました'
    end

    redirect_to edit_admin_article_path(@article.uuid)

  end

  private

  def set_article
    @article = Article.find_by!(uuid: params[:article_uuid])
  end
end
