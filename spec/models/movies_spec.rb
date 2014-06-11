require 'spec_helper'
 
describe Movie do
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
end