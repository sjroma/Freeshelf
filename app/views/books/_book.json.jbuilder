json.extract! book, :id, :title, :author, :description, :url, :created_at, :updated_at
json.url book_url(book, format: :json)
