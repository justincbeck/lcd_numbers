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

      it "should output the number 0 in a 7 segment read out with a size of 2" do
        output.should_receive(:puts).with(" __ \n|  |\n|  |\n|  |\n|__|")
        display.print_num(2, 0)
      end

      it "should output the number 1 in a 7 segment read out with a size of 2" do
        output.should_receive(:puts).with("    \n   |\n   |\n   |\n   |")
        display.print_num(2, 1)
      end

      it "should output the number 2 in a 7 segment read out with a size of 2" do
        output.should_receive(:puts).with(" __ \n   |\n __|\n|   \n|__ ")
        display.print_num(2, 2)
      end

      it "should output the number 3 in a 7 segment read out with a size of 2" do
        output.should_receive(:puts).with(" __ \n   |\n __|\n   |\n __|")
        display.print_num(2, 3)
      end

      it "should output the number 4 in a 7 segment read out with a size of 2" do
        output.should_receive(:puts).with("    \n|  |\n|__|\n   |\n   |")
        display.print_num(2, 4)
      end

      it "should output the number 5 in a 7 segment read out with a size of 2" do
        output.should_receive(:puts).with(" __ \n|   \n|__ \n   |\n __|")
        display.print_num(2, 5)
      end

      it "should output the number 6 in a 7 segment read out with a size of 2" do
        output.should_receive(:puts).with(" __ \n|   \n|__ \n|  |\n|__|")
        display.print_num(2, 6)
      end

      it "should output the number 7 in a 7 segment read out with a size of 2" do
        output.should_receive(:puts).with(" __ \n   |\n   |\n   |\n   |")
        display.print_num(2, 7)
      end

      it "should output the number 8 in a 7 segment read out with a size of 2" do
        output.should_receive(:puts).with(" __ \n|  |\n|__|\n|  |\n|__|")
        display.print_num(2, 8)
      end

      it "should output the number 9 in a 7 segment read out with a size of 2" do
        output.should_receive(:puts).with(" __ \n|  |\n|__|\n   |\n __|")
        display.print_num(2, 9)
      end

      it "should output the number 0 in a 7 segment read out with a size of 3" do
        output.should_receive(:puts).with(" ___ \n|   |\n|   |\n|   |\n|   |\n|   |\n|___|")
        display.print_num(3, 0)
      end

      it "should output the number 1 in a 7 segment read out with a size of 3" do
        output.should_receive(:puts).with("     \n    |\n    |\n    |\n    |\n    |\n    |")
        display.print_num(3, 1)
      end

      it "should output the number 2 in a 7 segment read out with a size of 3" do
        output.should_receive(:puts).with(" ___ \n    |\n    |\n ___|\n|    \n|    \n|___ ")
        display.print_num(3, 2)
      end

      it "should output the number 3 in a 7 segment read out with a size of 3" do
        output.should_receive(:puts).with(" ___ \n    |\n    |\n ___|\n    |\n    |\n ___|")
        display.print_num(3, 3)
      end

      it "should output the number 4 in a 7 segment read out with a size of 3" do
        output.should_receive(:puts).with("     \n|   |\n|   |\n|___|\n    |\n    |\n    |")
        display.print_num(3, 4)
      end

      it "should output the number 5 in a 7 segment read out with a size of 3" do
        output.should_receive(:puts).with(" ___ \n|    \n|    \n|___ \n    |\n    |\n ___|")
        display.print_num(3, 5)
      end

      it "should output the number 6 in a 7 segment read out with a size of 3" do
        output.should_receive(:puts).with(" ___ \n|    \n|    \n|___ \n|   |\n|   |\n|___|")
        display.print_num(3, 6)
      end

      it "should output the number 7 in a 7 segment read out with a size of 3" do
        output.should_receive(:puts).with(" ___ \n    |\n    |\n    |\n    |\n    |\n    |")
        display.print_num(3, 7)
      end

      it "should output the number 8 in a 7 segment read out with a size of 3" do
        output.should_receive(:puts).with(" ___ \n|   |\n|   |\n|___|\n|   |\n|   |\n|___|")
        display.print_num(3, 8)
      end

      it "should output the number 9 in a 7 segment read out with a size of 3" do
        output.should_receive(:puts).with(" ___ \n|   |\n|   |\n|___|\n    |\n    |\n ___|")
        display.print_num(3, 9)
      end
      
      it "should output the number 11 in a 7 segment read out with a size of 1" do
        output.should_receive(:puts).with("       \n  |   |\n  |   |")
        display.print_num(1, 11)
      end

      it "should output the number 1972 in a 7 segment read out with a size of 2" do
        output.should_receive(:puts).with("      __   __   __ \n   | |  |    |    |\n   | |__|    |  __|\n   |    |    | |   \n   |  __|    | |__ ")
        display.print_num(2, 1972)
      end

      it "should output the number 42 in a 7 segment read out with a size of 5" do
        output.should_receive(:puts).with("         _____ \n|     |       |\n|     |       |\n|     |       |\n|     |       |\n|_____|  _____|\n      | |      \n      | |      \n      | |      \n      | |      \n      | |_____ ")
        display.print_num(5, 42)
      end
    end
  end
end