require "rails_helper"
RSpec.describe Artist, :type => :model do
  let(:artist) {FactoryBot.create :artist}

  describe "associations" do
    it {is_expected.to have_many :songs}
    it {is_expected.to have_many :albums}
  end

  describe "validation" do
    it "has a valid factory" do
      expect(artist).to be_valid
    end
    it "has a invalid validate" do
      artist.name = nil
      expect(artist).to_not be_valid
    end

    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_length_of :name}
    it {is_expected.to validate_presence_of :description}
    it {is_expected.to validate_length_of :description}
  end

  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:name).of_type :string}
      it {is_expected.to have_db_column(:avatar).of_type :string}
      it {is_expected.to have_db_column(:description).of_type :text}
    end
  end
end
