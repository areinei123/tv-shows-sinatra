require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario 'successfully add a new show' do
    visit '/television_shows/new'
    fill_in 'title', with:'Walking Dead'
    fill_in 'network', with:'AMC'
    fill_in 'starting_year', with:'2013'
    click_on 'Add TV Show'

    expect(page).to have_content('Walking Dead (AMC)')
  end

  scenario 'fail to add a show with blank title' do
    visit '/television_shows/new'
    fill_in 'title', with:''
    fill_in 'network', with:'Fox'
    fill_in 'starting_year', with:'1990'
    click_on 'Add TV Show'

    expect(page).to have_content('Title can\'t be blank')
  end

  scenario 'fail to add a show with invalid starting date' do
    visit '/television_shows/new'
    fill_in 'title', with:'Friends'
    fill_in 'network', with:'Fox'
    fill_in 'starting_year', with:'1890'
    click_on 'Add TV Show'

    expect(page).to have_content('Starting year must be greater than 1900')
  end


end
