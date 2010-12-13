# This module prints a single digit as an LCD segment display
# The segments are numbered as follows:
#   1
# 2   4
#   3
# 5   7
#   6

module LcdNumbers
  class Display
    def initialize(output)
      @output = output
    end
    
    def print_num(segment_size, number)
      @size = segment_size
      @numbers = digit_array(number)
      
      calculate_digit_size
      print
    end
    
    private
    
    def print
      rows = String.new
      
      @row_count.times do |r|
        rows += build_row(r)
        rows += "\n" unless r == (@row_count - 1)
      end
      
      @output.puts rows
    end
    
    def build_row(r)
      @row = String.new
      
      @numbers.each do |number|
        @number = number
        
        if r == 0
          process_row([nil, 1, nil])
        elsif r < @median
          process_row([2, nil, 4])
        elsif r == @median
          process_row([2, 3, 4])
        elsif r > @median and r < (@row_count - 1)
          process_row([5, nil, 7])
        else
          process_row([5, 6, 7])
        end
      end
      
      @row
    end
    
    def process_row(segments)
      @digit_col_count.times do |c|
        if c == 0
          @row += SEGMENTS_MAP[@number].include?(segments[0]) ? "|" : " "
        elsif c < (@digit_col_count - 1)
          @row += SEGMENTS_MAP[@number].include?(segments[1]) ? "_" : " "
        else
          @row += SEGMENTS_MAP[@number].include?(segments[2]) ? "|" : " "
        end
      end
    end
    
    def calculate_digit_size
      @row_count = (2 * @size) + 1
      @digit_col_count = @size + 2
      @total_col_count = @number.to_s.length == 1 ? @digit_col_count : ((@number.to_s.length + 1) * @digit_col_count) - 1
      @median = ((@row_count - 1) / 2)
    end
    
    def digit_array(number)
      number.to_s.split(%r{\s*}).collect { |s| s.to_i }
    end

    SEGMENTS_MAP = {
      1 => [ 4, 7 ],
      2 => [ 1, 3, 4, 5, 6 ],
      3 => [ 1, 3, 4, 6, 7 ],
      4 => [ 2, 3, 4, 7 ],
      5 => [ 1, 2, 3, 6, 7 ],
      6 => [ 1, 2, 3, 5, 6, 7 ],
      7 => [ 1, 4, 7 ],
      8 => [ 1, 2, 3, 4, 5, 6, 7 ],
      9 => [ 1, 2, 3, 4, 6, 7 ],
      0 => [ 1, 2, 4, 5, 6, 7 ]
    }
  end
end