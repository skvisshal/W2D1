# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.inject(0) {|acc, el| acc + el} / self.length.to_f
    end

    def median
        return nil if self.empty?
        sortedArray = bubble_sort(self)
        if sortedArray.length.even?
            i = sortedArray.length / 2
            return [sortedArray[i-1],sortedArray[i]].average
        else
            return sortedArray[sortedArray.length/2]
        end
    end

    def bubble_sort(array)
        sorted = false
        while !sorted
            sorted = true
            (0...array.length - 1).each do |i|
                if array[i] > array[i + 1]
                    array[i], array[i + 1] = array[i + 1], array[i]
                    sorted = false
                end
            end
        end
        array
    end

    def counts
        result = {}
        self.each do |ele|
            result.include?(ele) ? result[ele] += 1 : result[ele] = 1
        end
        result
    end

    def my_count(search)
        self.inject(0) do |acc, el|
            if el == search
                acc += 1
            else
                acc
            end
        end
    end

    def my_index(search)
        self.each.with_index do |ele, i|
            if ele == search
                return i
            end
        end
        nil
    end

    def my_uniq
        result = {}
        array = []
        self.each do |ele|
            result.include?(ele) ? result[ele] += 1 : result[ele] = 1
        end
        result.each {|key, value| array.push(key)}
        array
    end

    def my_transpose
        result = Array.new(self[0].length) {Array.new(self.length)}
        (0...self.length).each do |i|
            (0...self[i].length).each do |j|
                result[j][i] = self[i][j]
            end
        end
        result
    end
end