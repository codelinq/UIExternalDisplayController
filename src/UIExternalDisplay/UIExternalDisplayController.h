//
//  UIExternalDisplayController.h
//  UIExternalDisplay
//
//  Created by Scott Beardsley on 8/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIExternalDisplayDelegate.h"

@interface UIExternalDisplayController : UIViewController {
	id<UIExternalDisplayDelegate> delegate;
	UIScreenMode* maxScreenMode;
}

#pragma mark -
#pragma mark Instance Properties

@property (nonatomic, retain) id<UIExternalDisplayDelegate> delegate;
@property (nonatomic, retain) UIScreenMode *maxScreenMode;

#pragma mark -
#pragma mark Instance Methods

-(NSArray*) screenModes;
-(void) setCurrentMode:(UIScreenMode *) mode;
-(void) pushViewController:(UIViewController*) viewController;
#pragma mark -
#pragma mark Class Methods
+(int) screens;
+(bool) isConnected;
@end
