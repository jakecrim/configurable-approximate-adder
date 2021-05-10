# Accuracy Configurable Approximate Adder
This VHDL project aims to create an accuracy configurable approximate adder (ACA) in six different configurations. 

In some operations it is more desirable to have a faster and more power efficient algorithm, rather than a perfectly accurate algorithm. One way to speed up the addition process is to predict the values of the carry within the additions. This allows for the higher order bits of the addition to start being calculated before lower order bits have calculated. This project implements one design of an Accuracy Configurable Approximate with a Carry Select Unit (ACA-CSU).

**Instructions to Simulate in ModelSim:**

In modelsim, go to file->open and find the CAA.mpf. (ex: in ACA8-2 open CAA.mpf), ( Note: you may have to make sure your file explorer is set to look for "All Files (*.*)"), then remove all files from project because they have the absolute path rather than the relative path, and then right click -> add to project, and the browse and all the files from that current project directory (ex: all the .vhd files inside of ACA8-2). Then hit the OK button. Then compile all, then go to library, open work, and double click on the testBench entity file to start simulation. Select all items in the object panel, right click, select add wave. Then go to change the run length to 40 ms. Then hit run and get the results.

### Inputs to Carry Select Unit (CSU)
-> Control
-> CPredict
-> Cout
-> G
-> BP
### Inputs to Carry Predict
-> A_i
-> B_i


### Outputs
When running the test bench, outputs of note are the error, and the count ( C ). Error rate is calculated as:  --> (error / C )
-> error
-> C

For normal adder operations, outputs are Sum (S) and Cout (Co):
-> Co
-> S


## Folders

* **ACA8-2**: Configuration for: 8 bits, with prediction every 2 bits
FILE BREAKDOWN:
--> ApproxAdder.vhd      // Includes 4 sections, each with a 2 bit full adder, to give us the full 8 bits. Also includes the Carry Predict and Carry Select Units to form the 4 sections. Maps their interactions with one another.

--> CarryPredict.vhd       // predicts a carry

--> CarrySelectUnit.vhd    // selects whether to use the predicted carry, or the actual carry from the full adder

--> FullAdder.vhd   // full adder

--> adder-2.vhd    // creates the 2 full adders to make a 2-bit full adder

* **ACA8-4**:  Configuration for: 8 bits, with prediction every 4 bits 
(Same file structure)
* **ACA16-2**:  Configuration for: 16 bits, with prediction every 2 bits
(Same file structure)
* **ACA16-4**:  Configuration for: 16 bits, with prediction every 4 bits
(Same file structure)
* **ACA16-8**:  Configuration for: 16 bits, with prediction every 8 bits
(Same file structure)
