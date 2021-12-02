require 'rails_helper'

RSpec.describe Article, type: :model do
    let!(:article) {Article.new}

    context 'Fields Validations' do
        it "is not a valid title" do
            article.content = "Test body"
            article.title = nil

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_hash.keys).to include(:title)
        end 

        it 'title should be unique' do
            Article.create(title: "Sample", content: "Sample Body", author: "Rich")
            article.title = "Sample"

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_hash.keys).to include(:title)
            expect(article.errors[:title]).to include('Title Should be unique')
        end
    end
end