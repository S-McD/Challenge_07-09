require "08_diary_entry"

RSpec.describe DiaryEntry do
    it "initialises" do
        DiaryEntry.new("1/1", "Today I woke up")
        @title = "1/1"
        @contents = "Today I woke up"
    end
    it "returns the title as a string" do
        entry_1 = DiaryEntry.new("1/1", "Today I woke up")
        expect(entry_1.title).to eq "1/1"
    end
    it "returns the context as a string" do
        entry_1 = DiaryEntry.new("1/1", "Today I woke up")
        expect(entry_1.contents).to eq "Today I woke up"
    end
    it "counts the number of words in contents" do
        entry_1 = DiaryEntry.new("1/1", "Today I woke up")
        expect(entry_1.count_words).to eq 4
    end
    it "estimates reading time based on wpm given" do
        entry_1 = DiaryEntry.new("1/1", "Today I woke up")
        expect(entry_1.reading_time(4)).to eq 1
    end
    context "#reading_chunk" do
        it "returns a chunk of the contents that can be read given the wpm and minutes user is free to read" do
        entry_1 = DiaryEntry.new("1/1", "Today I woke up")
        expect(entry_1.reading_chunk(1, 2)).to eq "Today I"
        end
        it "when called again, reading chunk should return next chunk able to be read until contents is fully read" do
        entry_1 = DiaryEntry.new("1/1", "Today I woke up")
        entry_1.reading_chunk(1, 2)
        expect(entry_1.reading_chunk(1, 2)).to eq "woke up"
        end
        it "when called again, reading should begin from the start" do
        entry_1 = DiaryEntry.new("1/1", "Today I woke up")
        entry_1.reading_chunk(1, 2)
        entry_1.reading_chunk(1, 2)
        expect(entry_1.reading_chunk(1, 1)).to eq "Today"
        end
    end
end