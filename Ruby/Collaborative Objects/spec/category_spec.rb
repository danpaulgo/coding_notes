# require "rspec"
# require_relative "../lib/Category"

describe Category do
  let(:category){Category.new.tap{ |c| c.name = "Adventure"}}
  let(:story1){Story.new.tap{ |story| story.name = "Twilight"}}
  let(:story2){Story.new.tap{ |story| story.name = "Goodebumps"}}
  let(:author){Author.new.tap{ |author| author.name = "Hemingway"}}
  it "has a name" do
    #SETUP
    author = Category.new
    author.name = "Adventure"
    #EXPECTATION
    expect(author.name).to eq("Adventure")
  end
  context "has many stories" do
    describe "add_story" do
      it "pushes story to stories array" do
        category.add_story(story1)
        expect(category.stories).to include(story1)
      end
      it "makes sure only story objects may be added" do 
        story_string = "Goosebumps"
        expect{category.add_story(story_string)}.to raise_error(TypeError)
      end
      it "adds self to categories array of story object being added" do
        category.add_story(story1)
        expect(story1.categories).to include(category)
      end
    end
  end
  context "has many authors through stories" do
    describe "list_authors" do
      it "returns array of unique author names associated through stories" do
        story1.author = author
        story2.author = author
        category.add_story(story1)
        category.add_story(story2)
        expect(category.list_authors).to match_array(["Hemingway"])
      end
    end
  end
end



