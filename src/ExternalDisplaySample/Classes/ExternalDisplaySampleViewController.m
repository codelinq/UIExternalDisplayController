//
//  ExternalDisplaySampleViewController.m
//  ExternalDisplaySample
//
//  Created by Scott Beardsley on 8/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ExternalDisplaySampleViewController.h"
#import "UIExternalDisplayController.h"
#import "DummyViewController.h"
@implementation ExternalDisplaySampleViewController
@synthesize labelDisplayCount;
@synthesize externalController;
@synthesize screenDimensions;
@synthesize currentDimensions;
@synthesize backViewController;

#pragma mark -
#pragma mark UIExternalDisplayDelegate
-(void) externalDisplayConnect:(UIScreen*) screen {
	[self updateScreenInfo:screen];
}
-(void) externalDisplayDisconnect:(UIScreen*) screen{
	[self updateScreenInfo:screen];
}
-(void) externalDisplayChanged:(UIScreen*) screen withMode:(UIScreenMode*) mode {
	[self updateScreenInfo:screen];
}
-(void) updateScreenInfo:(UIScreen*)screen{
	self.labelDisplayCount.text = [NSString stringWithFormat:@"%d", [UIExternalDisplayController screens]];
	if ([UIExternalDisplayController screens] == 1){
		self.screenDimensions.text = @"N/A";
		self.currentDimensions.text = @"N/A";
		return;
	}
	self.currentDimensions.text = [NSString stringWithFormat:@"%.0f x %.0f", screen.currentMode.size.width, screen.currentMode.size.height];
	self.screenDimensions.text = [NSString stringWithFormat:@"%.0f x %.0f",externalController.maxScreenMode.size.width, externalController.maxScreenMode.size.height];
	[externalController pushViewController:backViewController withAutoScale:YES];
}

#pragma mark -
#pragma mark Do Stuff with the external Display
-(IBAction) showDummy {
	DummyViewController* c = [[DummyViewController alloc] initWithNibName:@"DummyViewController" bundle:[NSBundle mainBundle]];
	[externalController pushViewController:c withAutoScale:YES];
}
-(IBAction) hideDummy {
	[externalController popViewController];
}

#pragma mark -

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.backViewController = [[BlackViewController alloc] initWithNibName:@"BlackViewController" bundle:[NSBundle mainBundle]];
    self.externalController.delegate = self;
	if ([[UIScreen screens] count] > 1){
		[self updateScreenInfo:[[UIScreen screens] objectAtIndex:1]];
	}
	else {
		self.labelDisplayCount.text = @"1";
		self.screenDimensions.text = @"N/A";
		self.currentDimensions.text = @"N/A";
	}

	[super viewDidLoad];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
