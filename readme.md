This is the repository for the implementation of the electrically tunable lens 
EL-10-30, from Optotune.

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


a couple of notes while using the driver provided by optotune:
It is a bit hard to get the lens to heat up under the conditions we are planning
to use. 
I ran the lens for several minutes using a sinusoidal waveform @500Hz and with 
small and big amplitudes (from 40mA to 280mA and 180mA to 280mA). The system heated
up to 37°C. According to the user's manual the lens is capable of supporting
much higher temps. In any case, one needs to compensate for the change in temp,
as it affects the focal length of the lens, given a certain current. Read the lens
manual for a better description.

Running the lens @ constant DC current (280mA) also affects the temperature mildly,
again ~37°C were reached.

I'm guessing that if we are able to put some heatsinks around the lens, we should be 
able to keep the temp. from rising and avoid having to deal with changes in focal
length all together.




