module LcdNumbers
  class Display
    def initialize(output)
      @output = output
    end
    
    def print_num(size, number)
      @row_count = (2 * size) + 1
      @digit_col_count = size + 2
      @total_col_count = ((number.to_s.length + 1) * @digit_col_count) - 1
      @median = ((@row_count - 1) / 2)

      @segments = SEGMENTS_MAP[number]

      print(size)
    end
    
    private

    def print(size)
      rows = String.new
      
      @row_count.times do |r|
        rows += build_row(r)
        rows += "\n" unless r == (@row_count - 1)
      end
      
      @output.puts rows
    end
    
    def build_row(r)
      @row = String.new
      
      if r == 0
        # We're dealing with segment 1
        @digit_col_count.times do |c|
          if c == 0
            # It's the first col of @row 1 which is always blank
            @row += " "
          elsif @segments.include?(1) and c != (@digit_col_count - 1)
            # We have a segment 1 and it's not the last col
            @row += "_"
          else
            # It's the last col of @row 1 which is always blank
            @row += " "
          end
        end
      elsif r < @median
        # We're not to segment 3 yet but we're building segments 2 and 4
        do_some_shit([2, nil, 4])
      elsif r == @median
        # We're building segment 3 (and the bottom of segments 2 and 4)
        do_some_other_shit([2, 3, 4])
      elsif r > @median and r < (@row_count - 1)
        # We're not to segment 6 yet but we're building segments 5 and 7
        do_some_shit([5, nil, 7])
      else
        # We're building segment 6 (and the bottom of segments 5 and 7)
        do_some_other_shit([5, 6, 7])
      end
      
      @row
    end
    
    def do_some_shit(segments)
      @digit_col_count.times do |c|
        if @segments.include?(segments[0]) and c == 0
          # We have a vertical segment and it's the first col of the @row
          @row += "|"
        elsif c < (@digit_col_count - 1)
          # We don't have a vertical segment or a horizontal segment
          @row += " "
        else
          # It's the last col of the @row
          if @segments.include?(segments[2])
            # We have a vertical segment
            @row += "|"
          else
            # We don't have a vertical
            @row += " "
          end
        end
      end
    end
    
    def do_some_other_shit(segments)
      @digit_col_count.times do |c|
        if c == 0
          if @segments.include?(segments[0])
            # We have a segment 5 and it's the first col of the @row
            @row += "|"
          elsif c < (@digit_col_count - 1)
            # We're between segments 5 and 7 which is always blank
            @row += " "
          end
        elsif c != (@digit_col_count - 1)
          if @segments.include?(segments[1])
            @row += "_"
          else
            @row += " "
          end
        else
          # It's the last col of the @row
          if @segments.include?(segments[2])
            # We have a vertical segment
            @row += "|"
          else
            # We don't have a vertical
            @row += " "
          end
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