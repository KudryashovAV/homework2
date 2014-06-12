require 'spec_helper'
 
describe Movie do
  context ".all_ratings" do
    it 'No movies - no ratings' do
      expect(Movie.all_ratings).to eq([])
    end
 
    it 'One movie - one rating' do
      Movie.create(title: 'aaa', rating: 'R', release_date: Date.today, description: 'this is a very interesting movie')
      expect(Movie.all_ratings).to eq(['R'])
    end
 
    it 'Another movie - another rating' do
      Movie.create(title: 'aaa', rating: 'PG', release_date: Date.today, description: 'this is a very interesting movie')
      expect(Movie.all_ratings).to eq(['PG'])
    end
 
    it 'Two movies - two ratings' do
      Movie.create(title: 'aaa', rating: 'PG', release_date: Date.today, description: 'this is a very interesting movie')
      Movie.create(title: 'aaa', rating: 'R', release_date: Date.today, description: 'this is a very interesting movie')
      expect(Movie.all_ratings).to eq(['PG', 'R'])
    end
 
    it 'No duplicates' do
      Movie.create(title: 'aaa', rating: 'PG', release_date: Date.today, description: 'this is a very interesting movie')
      Movie.create(title: 'aaa', rating: 'PG', release_date: Date.today, description: 'this is a very interesting movie')
      expect(Movie.all_ratings).to eq(['PG'])
    end
    
  end

  context ".list" do
    let(:movie1) {Movie.create(title: 'T', rating: 'PG', release_date: '2014-06-12', description: 'this is a very interesting new movie')}
    let(:movie2) {Movie.create(title: 'A', rating: 'G', release_date: '1936-05-05', description: 'this is a very interesting old movie')}
      
      it "Empty rating" do
        Movie.list(:rating => []).should eq([])
      end

      it "check sorting title ASC" do
        Movie.list(:order => 'title').should eq([movie2, movie1])
      end
   
      it "Check sorting title DESC" do
        Movie.list(:order => 'title DESC').should eq([movie1, movie2])
      end
   
      it "Check sorting release date ASC" do
        Movie.list(:order => 'release_date').should eq([movie2, movie1])
      end
   
      it "Check sorting release date DESC" do
        Movie.list(:order => 'release_date DESC').should eq([movie1, movie2])
      end
   
      it "One rating is select" do
        Movie.list(:rating => ['G']).should eq([movie2])
      end
   
      it "All ratings is selected" do
        Movie.list(:rating => ['PG', 'G']).should eq([movie1, movie2])
      end      
    
  end

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
