require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe 'instance methods' do
    before(:each) do
      test_data
    end

    describe '#average_experience' do
      it 'averages all contestants years of experience' do
        expect(@news_chic.average_experience).to eq(12.5)
        expect(@boardfit.average_experience).to eq(11.5)
      end

      it 'returns zero if no contestants are on the project' do
        expect(@lit_fit.average_experience).to eq(0)
      end
    end

    # add tests for new methods
    describe '#challenge_theme' do
      it 'returns the project challenge theme' do
        expect(@news_chic.challenge_theme).to eq('Recycled Material')
        expect(@boardfit.challenge_theme).to eq('Recycled Material')
      end
    end

    describe '#contestant_count' do
      it 'returns the number of contestants in a project' do
        expect(@news_chic.contestant_count).to eq(2)
        expect(@boardfit.contestant_count).to eq(2)
      end
    end
  end
end
