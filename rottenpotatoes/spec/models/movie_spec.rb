require 'rails_helper'

describe Movie do
  before(:each) do
    @movie1 = FactoryBot.create(:movie, id: 1, title: "test1", rating: "G", description: "test", release_date: "test", director: "test")
    @movie2 = FactoryBot.create(:movie, id: 2, title: "test2", rating: "G", description: "test", release_date: "test", director: "test")
    @movie3 = FactoryBot.create(:movie, id: 3, title: "no director", rating: "G", description: "test", release_date: "test")
  end

  describe 'director methods test for model in before(:each)' do
    it 'should return similar movie' do
      Movie.similar_movies(@movie1[:id], {director: @movie1[:director]}).should == [@movie2]
    end

    it 'should return empty relation' do
      Movie.similar_movies(@movie3[:id], {director: @movie3[:director]}).should == []
    end
  end
end 