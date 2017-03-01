# require "rspec"
# require_relative "../lib/author"
# let(:author){Author.new}

describe Author do
  let(:author){Author.new.tap{ |story| story.name = "Hemingway"}}
  let(:story1){Story.new.tap{ |story| story.name = "Twilight"}}
  let(:story2){Story.new.tap{ |story| story.name = "Goodebumps"}}
  let(:category){Category.new.tap{ |c| c.name = "Adventure"}}
  it "has a name" do
    #SETUP
    # author = Author.new
    author.name = "Hemingway"
    #EXPECTATION
    # expect(author.name).to eq("Hemingway")
  end

  context "with stories" do
    describe "#stories" do
      it "has empty array of stories when initialized" do
        #SETUP
        # author = Author.new
        #EXPECTATION
        expect(author.stories).to match_array([])
      end
      it "returns frozen list of stories" do
        # author = Author.new
        # story1 = Story.new
        # story1.name = "Goodebumps"
        author.add_story(story1)
        # story2 = Story.new
        # story2.name = "Twilight"
        author.add_story(story2)

        expect(author.stories).to be_frozen
      end

    end
    describe "add_story" do
      it "adds story instance to #stories array" do
        # author = Author.new
        # story1 = Story.new
        author.add_story(story1)
        expect(author.stories).to include(story1)
      end
      it "only allows story objects to be added" do
        # author = Author.new
        story = "String"
        expect{author.add_story(story)}.to raise_error(TypeError)
      end
      it "assigns author as story's author " do
        author.add_story(story1)
        expect(story1.author).to eq(author)
      end
    end
    describe "list_stories" do
      it "returns array of all stories by author" do
        # author = Author.new
        # story1 = Story.new
        # story1.name = "Goodebumps"
        author.add_story(story1)
        # story2 = Story.new
        # story2.name = "Twilight"
        author.add_story(story2)

        expect(author.list_stories).to match_array(["Goodebumps", "Twilight"])
      end
    end
  end
  context "has many categories through stories" do
    describe "list_categories" do
      it "returns array of unique category names associated through stories" do
        story1.add_category(category)
        story2.add_category(category)
        author.add_story(story1)
        author.add_story(story2)
        expect(author.list_categories).to match_array(["Adventure"])
      end
    end
  end
end



