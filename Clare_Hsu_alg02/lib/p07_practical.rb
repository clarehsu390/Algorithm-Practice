require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
    store = HashMap.new()
    string.each_char do |ch|
        if store.include?(ch)
            store.set(ch, store.get(ch) + 1)
        else
            store.set(ch, 1)
        end
    end

    odd_count = 0
    store.each do |entry|
        if entry[-1] % 2 == 1
            odd_count += 1
        end

        if odd_count > 1
            return false
        end
    end
    true





end
