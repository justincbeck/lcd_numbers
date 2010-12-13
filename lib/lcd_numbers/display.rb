# This module prints a number as an LCD segment display
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
      @numbers = number.to_s.split(%r{\s*}).collect { |s| s.to_i }
      
      @row_count = (2 * @size) + 1
      @digit_col_count = @size + 2
      @median = ((@row_count - 1) / 2)
      
      generate_ascii_rows
    end
    
    private
    
    def generate_ascii_rows
      rows = String.new
      
      @row_count.times do |r|
        rows += process_row(r)
        rows += "\n" unless r == (@row_count - 1)
      end
      
      @output.puts rows
    end
    
    def process_row(r)
      @row = String.new
      
      @numbers.each do |number|
        @number = number
        
        if r == 0
          construct_row([nil, 1, nil])
        elsif r < @median
          construct_row([2, nil, 4])
        elsif r == @median
          construct_row([2, 3, 4])
        elsif r < (@row_count - 1)
          construct_row([5, nil, 7])
        else
          construct_row([5, 6, 7])
        end
      end
      
      @row
    end
    
    def construct_row(segments)
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