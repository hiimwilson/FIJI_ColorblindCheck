// Color Blindness Simulator Montage Action Tool

// Makes the CBsimulator into a click button thing for your FIJI GUI
// Just copy and paste the code below into the end of your 
// startup macro script and you should be good to go. 

// Wilson Adams, 5 May 2020

// ========================================================

macro "Colorblind Simulator Action Tool - Cff0D63D64D65D71D72D73D74D75D81D82D83D84D85D93D94D95C0f0D90D91D92Da0Da1Da2Da3Da4Da5Da6Db0Db1Db2Db3Db4Db5Db6Dc0Dc1Dc2Dc3Dc4Dc5Dc6Dc7Dc8Dd1Dd2Dd3Dd4Dd5Dd6Dd7Dd8De1De2De3De4De5De6De7De8Df3Df4Df5Df6Cf0fD39D47D48D49D57D58D59D67D68D69Cf00D03D04D05D06D11D12D13D14D15D16D17D18D21D22D23D24D25D26D27D28D30D31D32D33D34D35D36D37D38D40D41D42D43D44D45D46D50D51D52D53D54D55D56D60D61D62C00fD3aD3bD3cD4aD4bD4cD4dD4eD5aD5bD5cD5dD5eD6aD6bD6cD6dD6eD6fD79D7aD7bD7cD7dD7eD7fD89D8aD8bD8cD8dD8eD8fD9aD9bD9cD9dD9eD9fDaaDabDacDadDaeDbaDbbDbcDbdDbeDcaDcbDccCfffD66D76D77D78D86D87D88D96C0ffD97D98D99Da7Da8Da9Db7Db8Db9Dc9" {
	
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
}
