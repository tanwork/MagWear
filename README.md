# MagWear：Vital Sign Monitoring based on Biomagnetism Sensing

- Author: Xiuzhen Guo, Long Tan
- Contact: {guoxiuzhen94, tanlongwork}@gmail.com, 
- Description: This repo hosts the hardware and software for the implementation of MagWear. MagWear is  a novel biomagnetism-based system that can accurately and inclusively monitor the heart rate, respiration rate, and blood pressure of users with diverse skin tones.

## License

The hardware and software source code of the MagWear platform is distributed under academic license to ensure the reproducibility of our results. The hardware and software can NOT be used for commercial purpose.



## Hardware and Software

* Hardware includes the files needed for fabricating the MagWear PCB board.  PCB.PcbDoc is the file of PCB layout.

  * Gerber_GMR_Driver_Sensor : the driver circuit for GMR sensor AA004.
  * Gerber_GMR_Core_Circuit: the core circuit including voltage amplifier, band-pass filter,  voltage converter, MCU connector, and Oled connector. 

* Software includes the files needed for the  signal processing of biomagnetism sensing.

  * calculatiePPT.m : the MATLAB file of PTT calculation.
  
  * getPeak.m: the MATLAB file of peak detection.
  
  * sequence_matching.m: the MATLAB file of peaksmatching.
  
  * GMR_output1.mat and GMR_output2.mat: the sampling data from dual GMR sensors with sampling rate of 100Hz.
  
  * DNN model refers to "https://github.com/gasper321/bp-estimation-mimic3".
  
    


## References

1. Guo X, Tan L, Chen T, et al. Exploring Biomagnetism for Inclusive Vital Sign Monitoring: Modeling and Implementation[C].  Mobicom 2024.
1. Slapničar G, Mlakar N, Luštrek M. Blood pressure estimation from photoplethysmogram using a spectro-temporal deep neural network[J]. Sensors, 2019, 19(15): 3420.
