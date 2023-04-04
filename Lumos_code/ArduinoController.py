import pyfirmata

# Connect to the Arduino board
board = pyfirmata.Arduino('COM5')

# Define the pin for the LED
led1 = 13
led2 = 12
led3 = 11

# Set the mode of the LED pin to OUTPUT
board.digital[led1].mode = pyfirmata.OUTPUT

# Turn the LED on
board.digital[led1].write(1)

# Wait for 2 seconds
board.pass_time(2)

# Turn the LED off
board.digital[led1].write(0)

# Close the connection to the Arduino board
board.exit()
