require "rails_helper"
RSpec.describe Artist, :type => :model do
  describe "associations" do
    it {is_expected.to have_many :songs}
    it {is_expected.to have_many :albums}
  end

  describe "validation" do
    it "has a valid factory" do
      artist = create :artist
      expect(artist).to be_valid
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
