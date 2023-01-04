require "music_library"
require "track"

RSpec.describe "Music Library intergration" do
    context "when we add a track to the library" do
        it "comes back in the list" do
            music_library = MusicLibrary.new
            track = Track.new("my_title", "my_artist")
            music_library.add(track)
            expect(music_library.all).to eq [track]
        end
        it "adds all the tracks" do
            library = MusicLibrary.new
            track_1 = Track.new("Carte Blanche", "Veracocha")
            track_2 = Track.new("Synaesthesia", "The Thrillseekers")
            library.add(track_1)
            library.add(track_2)
            expect(library.all).to eq [track_1, track_2]
        end
    end
    context "searches by keyword" do
        it "returns list of tracks with title" do
            library = MusicLibrary.new
            track_1 = Track.new("Carte Blanche", "Veracocha")
            track_2 = Track.new("Synaesthesia", "The Thrillseekers")
            library.add(track_1)
            library.add(track_2)
            expect(library.search_by_title("Carte Blanche")).to eq [track_1]
        end
        it "returns list of tracks with keyword" do
            library = MusicLibrary.new
            track_1 = Track.new("Carte Blanche", "Veracocha")
            track_2 = Track.new("Synaesthesia", "The Thrillseekers")
            library.add(track_1)
            library.add(track_2)
            expect(library.search_by_title("Carte")).to eq [track_1]
        end
        it "returns list of tracks with substring" do
            library = MusicLibrary.new
            track_1 = Track.new("Carte Blanche", "Veracocha")
            track_2 = Track.new("Synaesthesia", "The Thrillseekers")
            library.add(track_1)
            library.add(track_2)
            expect(library.search_by_title("aes")).to eq [track_2]
        end
        it "returns empty list if no results" do
            library = MusicLibrary.new
            track_1 = Track.new("Carte Blanche", "Veracocha")
            track_2 = Track.new("Synaesthesia", "The Thrillseekers")
            library.add(track_1)
            library.add(track_2)
            expect(library.search_by_title("zzz")).to eq []
        end
    end
end