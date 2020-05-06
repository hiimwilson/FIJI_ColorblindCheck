// Color Blindness Simulator Montage

// Takes an input image, generates a montage of all the colorblindness simulators available in FIJI and presents them on one figure. 

// Wilson Adams, 5 May 2020

rename("Normal");
img = getTitle(); 


// Convert to RGB image - Automatically RGB when 
// pasted from snipping tool
run("RGB Color");

// Get list of image names and list of phenotypes (from source code)
cbsim = Array.concat("Normal", "Protanopia (no red)", "Deutanopia (no green)", "Tritanopia (no blue)",	"Protanomaly (low red)", "Deuteranomaly (low green)","Tritanomaly (low blue)","Typical Monochromacy", "Atypical Monochromacy");
	//Array.show(cbsim);
nsim = cbsim.length; // Number of CB phenotypes to simulate
	//print(nsim);

// Loop through and simulate all phenotypes
for (i = 1; i < nsim; i++) {
	sim = cbsim[i];
	selectWindow(img);
	run("Duplicate...", "&sim");
	run("Simulate Color Blindness", "mode=[&sim]");
	rename(sim);
	//print(sim+" Complete");
}

// Convert to stack and make montage
run("Images to Stack", "name=Stack title=[] use");
run("Make Montage...", "columns=3 rows=3 scale=1 border=10 font=30 label");

selectWindow("Stack");
run("Duplicate...", "use");
close("Stack");