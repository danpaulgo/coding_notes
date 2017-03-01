class Story

  attr_reader :author
  attr_accessor :name

  def initialize
    @categories = []
  end

  def author=(author)
    if !author.is_a?(Author)
      raise TypeError, "#{author.class} received. Author expected."
    end
    @author = author
    if !author.stories.include?(self)
      author.add_story(self)
    end
  end

  def categories
    @categories.dup.freeze
  end
  
  def add_category(category)
    if !category.is_a?(Category)
      raise TypeError, "#{author.class} received. Author expected."
    end
    @categories << category
    if !category.stories.include?(self)
      category.add_story(self)
    end
  end
end





