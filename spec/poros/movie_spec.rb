require 'rails_helper'

RSpec.describe Movie do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = { id: 550,
               title: 'Fight Club',
               vote_average: 8.433 }
      movie = Movie.new(data)

      expect(movie).to be_a(Movie)
      expect(movie.id).to eq(550)
      expect(movie.title).to eq('Fight Club')
      expect(movie.vote_average).to eq(8.433)
    end

    it 'can create another object' do
      data = { id: 1,
               title: 'Gone with the Wind',
               vote_average: 2.333 }
      movie = Movie.new(data)

      expect(movie).to be_a(Movie)
      expect(movie.id).to eq(1)
      expect(movie.title).to eq('Gone with the Wind')
      expect(movie.vote_average).to eq(2.333)
    end
  end
end
