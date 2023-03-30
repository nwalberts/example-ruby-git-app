class Article
  # .....add attr_accessors as needed
  # .....add initialize

  # The `db_connection` method is already defined in server.rb giving you access to it here without needing a require statement

  def self.all
      article_objects = []

      db_connection do |connection|
        articles_hashes = connection.exec("SELECT * FROM articles;")
      end

      article_hashes.each do |article_hash| 
        article_objects << Article.new(article_hash["title"], article_hash["description"], article_hash["url"])

      end

      return article_objects
  end

  def self.create(title, url, description)
    # - utility class method AND alternate constructor: creates a new article record in our database
    # - accepts the parameters needed for a new Article record (this should come in from your form)
    # - uses an INSERT statement to create a new article record
    # - should return the newly persisted article object
  end

  # Non-Core
  # def self.find(id)
    # - this is an alternative constructor class method
    # - accepts an id as an argument
    # - uses a SELECT statement with a WHERE clause
    # - should returns a single article object whose id matches the given id
  # end
end
