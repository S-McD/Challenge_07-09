require "08_diary"
require "08_diary_entry"

RSpec.describe "Diary Intergration" do
    context "when we add a diary entry" do
        it "comes back in the list" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("1/1", "Today I woke up")
            diary.add(entry_1)
            expect(diary.all).to eq [entry_1]
        end
        it "add additional entries to the same list" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("1/1", "Today I woke up")
            entry_2 = DiaryEntry.new("2/1", "I was very sleepy")
            diary.add(entry_1)
            diary.add(entry_2)
            expect(diary.all).to eq [entry_1, entry_2]
        end
        describe "#count_words" do
            it "counts the number of words in all diary entries" do
                diary = Diary.new
                entry_1 = DiaryEntry.new("1/1", "Today I woke up")
                entry_2 = DiaryEntry.new("2/1", "I was very sleepy")
                diary.add(entry_1)
                diary.add(entry_2)
                expect(diary.count_words).to eq 8
            end
        end
        describe "#reading_time" do
            it "returns the reading time as an integer" do
                diary = Diary.new
                entry_1 = DiaryEntry.new("1/1", "Today I woke up")
                diary.add(entry_1)
                expect(diary.reading_time(1)).to eq 4
            end
        end
        describe "#find_best_entry_for_reading_time" do
            it "returns the diary entry that can be read in the time the user has" do
                diary = Diary.new
                entry_1 = DiaryEntry.new("1/1", "Today I woke up")
                entry_2 = DiaryEntry.new("2/1", "The quick brown fox jumps over the lazy dog")
                diary.add(entry_1)
                diary.add(entry_2)
                result = diary.find_best_entry_for_reading_time(2, 4)
                expect(result).to eq entry_1
            end
        end
    end
end