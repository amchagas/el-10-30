"This is the repository for the implementation of the electrically tunable lens 
EL-10-30, from Optotune."

Each should be controlled as follows:

 -A National instruments card is used to send voltage commands to 
   a laser diode constant current driver from Thorlabs - LD1255.
 --The driver them modulates the current going through the lens and sends
   a voltage trace (that can be transformed into current values) that can
   be read by the NI card using an analog input.

 -Other than that, the lens has a built in temperature sensor, that sends temp.
readings via I2C protocol. Because the current NI card in the lab is not able to
read such protocol, we are using a microcontroller to do that job (a Wattuino
from watterot in this case). The microcontroller communicates with the PC via 
custom serial libraries present here: https://github.com/eulerlab/SREEB, 
but in principle standard I2C libraries can be used.






