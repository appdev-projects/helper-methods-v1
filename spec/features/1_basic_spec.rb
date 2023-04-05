require "rails_helper"

describe "The /movies page" do
  before do
    visit "/movies"
  end

  it "can be visited", points: 1 do
    expect(page.status_code).to be(200),
      "Expected to visit /movies successfully."
  end

  it "has a link to add a movie", points: 1 do
    expect(page).to have_link('Add a new movie', href: "/movies/new"),
      "Expected /movies to have an 'Add a new movie' link to '/movies/new'."
  end
end

describe "The /movies/new page" do
  before do
    visit "/movies/new"
  end

  it "can be visited", points: 1 do
    expect(page.status_code).to be(200),
      "Expected to visit /movies/new successfully."
  end

  it "has a form", points: 1 do
    expect(page).to have_selector("form[action='/movies']"),
      "Expected /movies/new to have a form with action='/movies'."
  end

  it "has a hidden authenticity token input", points: 2 do
    expect(page).to have_selector("input[name='authenticity_token']", visible: false),
      "Expected the new movie form to have an input field of type='hidden' and name='authenticity_token'."
  end

  it "creates a movie successfully", point: 1 do
    fill_in "Title", with: "My test movie"
    fill_in "Description", with: "description"
    click_button "Create Movie"
    expect(page).to have_content("Movie created successfully."),
      "Expected to fill in the new movie form, click 'Create Movie', and be redirected to the movie index with a success notice"
  end
end

describe "The movie details page" do
  before do
    @movie = Movie.create(
      title: "My title",
      description: "My description"
    )
    visit "/movies/#{@movie.id}"
  end

  it "can be visited", points: 1 do
    expect(page.status_code).to be(200),
      "Expected to visit /movies/ID successfully."
  end

  it "has a link to delete the movie with a DELETE request", points: 2 do
    expect(page).to have_selector("a[href='/movies/#{ @movie.id }'][data-method='delete']", text: 'Delete Movie'),
      "Expected /movies/ID to have 'Delete Movie' link with the proper data-method='delete'."
  end
end

describe "The movie edit page" do
  before do
    @movie = Movie.create(
      title: "My title",
      description: "My description"
    )
    visit "/movies/#{@movie.id}/edit"
  end

  it "can be visited", points: 1 do
    expect(page.status_code).to be(200),
      "Expected to visit /movies/ID/edit successfully."
  end

  it "has a form", points: 1 do
    expect(page).to have_selector("form[action='/movies/#{@movie.id}'][method='post']"),
      "Expected /movies/ID/edit to have a form with action='/movies/ID' and method='post'."
  end

  it "has a hidden patch input", points: 2 do
    expect(page).to have_selector("input[name='_method'][value='patch']", visible: false),
      "Expected the edit movie form to have an input field of type='hidden' with name='_method' and value='patch'."
  end
end
