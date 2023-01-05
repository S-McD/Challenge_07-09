UNIT & INTERGRATION TESTS

Diary Entry unit tests
# 1 - initialize
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
title = "1/1"
contents = "Today I woke up"

# 2 - title
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
entry_1.title = "1/1"

# 3 - contents
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
entry_1.contents = "Today I woke up"

# 4 - counts number of words in contents
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
entry_1.count_words = 4

# 5 - estimates reading time based on wpm given
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
entry_1.reading_time(4) = 1

# 6 - returns a chunk of the contents that can be read given the wpm and minutes user is free to read
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
entry_1.reading_chunk(1, 2) = "Today I"

# 7 - when called again, reading chunk should return next chunk able to be read until contents is fully read
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
entry_1.reading_chunk(1, 2)
entry_1.reading_chunk(1, 2) = "woke up"

# 8 - when called again, reading should begin from the start
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
entry_1.reading_chunk(1, 2)
entry_1.reading_chunk(1, 2)
entry_1.reading_chunk(1, 1) = "Today"

Diary unit tests
# 1 - initialize creates an empty list of diary entries
diary = Diary.new
@diary_entry = []


Intergrated unit tests

# 1 - adds an entry to the diary list
diary = Diary.new
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
diary.add(entry_1) = entry_1

# 2 - shows a list of all diary entries
diary = Diary.new
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
entry_2 = DiaryEntry.new("2/1", "I was very sleepy")
diary.add(entry_1) = [entry_1, entry_2]