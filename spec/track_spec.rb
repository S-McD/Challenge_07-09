require "track"

RSpec.describe Track do
    it "constructs" do
        track = Track.new("Carte Blanche", "Veracocha")
        expect(track.title).to eq "Carte Blanche"
        expect(track.format).to eq "Carte Blanche by Veracocha"
    end
    
end