require "08_diary"

RSpec.describe Diary do
    context "initally" do
        it "has an empty list of entries" do
            diary = Diary.new
            expect(diary.all).to eq []
        end
    end
end