require 'rails_helper'

describe MoviesController do
  before(:each) do
    @movie1 = FactoryBot.create(:movie, id: '1', title: "test1", rating: "G", description: "test", release_date: "test", director: "test")
    @movie2 = FactoryBot.create(:movie, id: '2', title: "test2", rating: "G", description: "test", release_date: "test", director: "test")
    @movie3 = FactoryBot.create(:movie, id: '3', title: "no director", rating: "G", description: "test", release_date: "test")
  end

  describe 'preexisting method test in before(:each)' do
    it 'should call find model method' do
      Movie.should_receive(:find).with('1')
      get :show, :id => '1'
    end

    it 'should render page correctoy' do
      get :index                        # method
      response.should render_template :index
    end

    it 'should redirect to appropriate url' do
      get :index,                       # method
          {},                           # url params
          {ratings: {G: 'G', PG: 'PG'}} # session
      response.should redirect_to :ratings => {G: 'G', PG: 'PG'}
    end

    it 'should redirect to appropriate sort title url' do
      get :index,                       # method
          {},                           # url params
          {sort: 'title'}               # session
      response.should redirect_to :sort => 'title'
    end

    it 'should redirect to appropriate sort release_date url' do
      get :index,                       # method
          {},                           # url params
          {sort: 'release_date'}               # session
      response.should redirect_to :sort => 'release_date'
    end

    it 'should create movie and redirect' do
      post :create,
           {:movie => { :title => "title", :description => "description", :director => "director", :rating => "R", :release_date =>"09/09/2010"}}
      response.should redirect_to movies_path
      expect(flash[:notice]).to be_present

    end
  end

  it 'should render two movies' do
    get :index
    response.should render_template :index
  end

  it 'should update render edit view' do
    Movie.should_receive(:find).with('1')
    get :edit,
        {id: '1'}
  end

  it 'should update data correctly' do
    Movie.stub(:find).and_return(@movie1)
    put :update,
        :id => @movie1[:id],
        :movie => {title: "new_title", rating: "G", description: "test", release_date: "test", director: "test"}
    expect(flash[:notice]).to be_present
  end

  it 'should delete data correctly' do
    Movie.stub(:find).and_return(@movie1)
    delete :destroy,
        :id => @movie1[:id]
    expect(flash[:notice]).to be_present

  end	    
end