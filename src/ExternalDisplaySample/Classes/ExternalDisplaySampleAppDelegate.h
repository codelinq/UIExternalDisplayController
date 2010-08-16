//
//  ExternalDisplaySampleAppDelegate.h
//  ExternalDisplaySample
//
//  Created by Scott Beardsley on 8/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExternalDisplaySampleViewController;

@interface ExternalDisplaySampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ExternalDisplaySampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ExternalDisplaySampleViewController *viewController;

@end

