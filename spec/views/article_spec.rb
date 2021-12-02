require 'rails_helper'

RSpec.describe 'Articles', type: :feature do
    # capybara

    context "View all articles" do
        before {visit articles_path}

        it 'shows all articles in the body' do
            within 'body' do
                expect(page).to have_content("List of Articles")
                expect(page).to have_content("New Article")
            end
        end
    end

    context "Article Form submission" do
        before {visit new_article_path}
        it 'Successfully creates an article' do
            fill_in('Title', with: 'Yo!')
            fill_in('Content', with: 'Yo! content')
            fill_in('Author', with: 'Yo! author')
            click_button('Create Article')
            # expect(page).to have_content("List of Articles")
            expect(page).to have_current_path(articles_path)
        end
    end

end