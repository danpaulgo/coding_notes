# require "rspec"
# require_relative "../lib/story"

describe Story do
  let(:story){Story.new.tap{ |story| story.name = "Twilight"}}
  let(:author){Author.new.tap{ |author| author.name = "Hemingway"}}
  let(:category){Category.new.tap{ |c| c.name = "Adventure"}}
  it "has a name" do
    #SETUP
    story = Story.new
    story.name = "Twilight"
    #EXPECTATION
    expect(story.name).to eq("Twilight")
  end
  context "belongs to one author" do
    describe "#author=" do
      it "can set an author" do
        story.author = author
        expect(story.author).to eq(author)
      end
      it "only accepts author objects" do
        author_string = "Author"
        expect{story.author = author_string}.to raise_error(TypeError)
      end
      it "adds story to the 'author' object's 'stories' array" do
        story.author = author
        expect(author.stories).to include(story)
      end
    end
    context "has one or many categories" do
      describe "categories" do
        it "has empty array of categories when initialized" do
          expect(story.categories).to match_array([])
        end
        it "returns frozen duplicate of categories array" do
          story.add_category(category)
          expect(story.categories).to be_frozen
        end
      end
      describe "add_category" do
         it "adds cateogory to categories array" do
          story.add_category(category)
          expect(story.categories).to include(category)
         end
        it "makes sure only 'category' objects may be added to array" do
          category_string = "Thriller"
          expect{story.add_category(category_string)}.to raise_error(TypeError)
        end
        it "adds story to the 'author' object's stories array" do
          
        end
      end
    end
  end
end






