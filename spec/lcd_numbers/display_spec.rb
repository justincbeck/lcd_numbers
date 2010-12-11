require 'spec_helper'

module LcdNumbers
  describe Display do
    describe "#print_num" do
      let(:output) { double('output').as_null_object }
      let(:display) { Display.new(output) }

      it "should output the number 0 in a 7 segment read out with a size of 1" do
        output.should_receive(:puts).with(" _ \n| |\n|_|")
        display.print_num(1, 0)
      end

      it "should output the number 1 in a 7 segment read out with a size of 1" do
        output.should_receive(:puts).with("   \n  |\n  |")
        display.print_num(1, 1)
      end

      it "should output the number 2 in a 7 segment read out with a size of 1" do
        output.should_receive(:puts).with(" _ \n _|\n|_ ")
        display.print_num(1, 2)
      end

      it "should output the number 3 in a 7 segment read out with a size of 1" do
        output.should_receive(:puts).with(" _ \n _|\n _|")
        display.print_num(1, 3)
      end

      it "should output the number 4 in a 7 segment read out with a size of 1" do
        output.should_receive(:puts).with("   \n|_|\n  |")
        display.print_num(1, 4)
      end

      it "should output the number 5 in a 7 segment read out with a size of 1" do
        output.should_receive(:puts).with(" _ \n|_ \n _|")
        display.print_num(1, 5)
      end

      it "should output the number 6 in a 7 segment read out with a size of 1" do
        output.should_receive(:puts).with(" _ \n|_ \n|_|")
        display.print_num(1, 6)
      end

      it "should output the number 7 in a 7 segment read out with a size of 1" do
        output.should_receive(:puts).with(" _ \n  |\n  |")
        display.print_num(1, 7)
      end

      it "should output the number 8 in a 7 segment read out with a size of 1" do
        output.should_receive(:puts).with(" _ \n|_|\n|_|")
        display.print_num(1, 8)
      end

      it "should output the number 9 in a 7 segment read out with a size of 1" do
        output.should_receive(:puts).with(" _ \n|_|\n _|")
        display.print_num(1, 9)
      end
    end
  end
end