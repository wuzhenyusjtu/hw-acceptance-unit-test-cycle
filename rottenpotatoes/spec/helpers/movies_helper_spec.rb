require 'rails_helper'

describe MoviesHelper do
  describe ".data_load" do
    let!(:movie1) { FactoryBot.create(:movie, title: "test1", rating: "G", description: "test", release_date: "test", director: "test")}
    let!(:movie2) { FactoryBot.create(:movie, title: "test2", rating: "G", description: "test", release_date: "test", director: "test")}
  end

  describe 'helper methods' do
    it 'should return odd' do
      response = oddness 1

      expect(response).to eq("odd")
    end
  end

  describe 'helper methods' do
    it 'should return even' do
      response = oddness 12
      expect(response).to eq("even")
    end
  end

end 