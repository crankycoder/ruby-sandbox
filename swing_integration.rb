# This is a demo of the java integration with JRuby
#

# This is the 'magical Java require line'.
require 'java'

# With the 'require' above, we can now refer to things that are part
# of the
# standard Java platform via their full paths.
frame = javax.swing.JFrame.new("Window") # Creating a Java JFrame
label = javax.swing.JLabel.new("Hello")

# We can transparently call Java methods  Java objects, just as if they were defined in Ruby.
frame.getContentPane.add(label)  # Invoking the Java method 'getCtentPane'.
frame.setDefaultCloseOperation(javax.swing.JFrame::EXIT_ON_CLOSE)
frame.pack
frame.setVisible(true)

