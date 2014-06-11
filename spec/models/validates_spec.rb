require 'spec_helper'
 
describe Movie do
  context "validates" do
    let(:movie1) {Movie.create(title: 'T', rating: 'PG', release_date: '2014-06-12', description: 'this is a very interesting movie')}
    let(:movie2) {Movie.create(title: 'A', rating: 'G', release_date: '1936-05-05', description: 'this is')}
    let(:movie3) {Movie.create(title: '', rating: '', release_date: '', description: '')}
    
    
    it 'should require a title' do
      expect(movie1).to be_valid
      expect(movie3).not_to be_valid
    end

    it 'should require a release_date' do
      expect(movie1).to be_valid
      expect(movie3).not_to be_valid
    end

    it 'should require a rating' do
      expect(movie1).to be_valid
      expect(movie3).not_to be_valid
    end

    it 'Availability and description length' do
      expect(movie1).to be_valid
      expect(movie3).not_to be_valid
      expect(movie2).not_to be_valid
    end
   
  end
end