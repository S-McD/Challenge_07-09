class Diary
    def initialize
        @diary_entry = []
    end
  
    def add(entry) 
        @diary_entry << entry
    end
  
    def all
      return @diary_entry
    end
  
    def count_words
        return @diary_entry.map do |entry| 
            entry.count_words
        end.sum
        # refactored as @diary_entry.sum(&:count_words)
    end
  
    def reading_time(wpm) 
        return count_words / wpm
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
        words_can_read = wpm * minutes
        list_of_readable_entries = @diary_entry.select do |entry| 
            entry.count_words <= words_can_read
        end
        return our_readable_entry = list_of_readable_entries[-1]
    end
end