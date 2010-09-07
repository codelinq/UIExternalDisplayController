//
//  ExternalDisplaySampleViewController.h
//  ExternalDisplaySample
//
//  Created by Scott Beardsley on 8/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIExternalDisplayController.h"
#import "BlackViewController.h"

@interface ExternalDisplaySampleViewController : UIViewController <UIExternalDisplayDelegate> {
	UILabel* labelDisplayCount;
	UILabel* screenDimensions;
	UILabel* currentDimensions;
	UIExternalDisplayController* externalController;
	BlackViewController* backViewController;
}

@property (nonatomic, retain) IBOutlet UILabel* labelDisplayCount;
@property (nonatomic, retain) IBOutlet UILabel* screenDimensions;
@property (nonatomic, retain) IBOutlet UILabel* currentDimensions;
@property (nonatomic, retain) UIExternalDisplayController* externalController;
@property (nonatomic, retain) BlackViewController* backViewController;

-(IBAction) showDummy;
-(IBAction) hideDummy;
@end

