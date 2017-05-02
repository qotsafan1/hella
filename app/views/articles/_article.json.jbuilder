json.extract! article, :id, :label_is, :label_en, :body_is, :body_en, :image, :youtube, :created_at, :updated_at
json.url article_url(article, format: :json)