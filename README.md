# FIJI_ColorblindCheck
Two scripts to let you check the colorblind-friendliness of your figures/images. 

My typical workflow with these scripts involves pasting a screen capture of my
figures/images into FIJI and running one of the following scripts. 
It works pretty quickly (~1sec), but will vary a little bit with image size. 

colorblindmontage.ijm is a FIJI macro that will make a montage of all available 
phenotypes of colorblindness available in FIJI's native colorblindness simulator. 
Rather than having to try out all the phenotypes available one at a time, this is
meant to offer a quick solution. 

CBsimActionTool.ijm is a script that you can paste into your FIJI startupmacro.ijm 
script to run the colorblindmontage.ijm script with the click of a button on your
FIJI GUI. 
