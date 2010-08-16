//
//  ExternalDisplaySampleViewController.h
//  ExternalDisplaySample
//
//  Created by Scott Beardsley on 8/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExternalDisplaySampleViewController : UIViewController {
	UILabel* labelDisplayCount;
}

@property (nonatomic, retain) IBOutlet UILabel* labelDisplayCount;
@end

