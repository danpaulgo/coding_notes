class Author

  attr_accessor :name

  def initialize
    @stories = []
  end

  def stories
    @stories.dup.freeze
  end

  def add_story(story)
    if !story.is_a?(Story)
      raise TypeError
    end
    @stories << story
    if story.author.nil?
      story.author = self 
    end 
  end

  def list_stories
    stories.map do |story|
      story.name
    end
  end

  def list_categories
    category_names = []
    stories.each do | story |
      story.categories.each do | cat |
        category_names << cat.name
      end
    end
    category_names.uniq
  end

end