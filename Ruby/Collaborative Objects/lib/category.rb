class Category

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
    if !story.categories.include?(self)
      story.add_category(self) 
    end 
  end

  def list_authors
    stories.map { |story| story.author.name}.uniq
  end

end