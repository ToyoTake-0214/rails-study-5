class SearchArticlesForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :category_id, :integer
  attribute :title, :string

  def search
    articles = Article.all

    articles.where!(category_id: category_id) if category_id.present?
    title_words.each do |word|
      articles.where!('title LIKE ?', "%#{word}%")
    end
    articles
  end

  private

  def title_words
    title.present? ? title.split(nil) : []
  end
end
