//
//  UIExternalDisplayController.h
//  UIExternalDisplay
//
//  Created by Scott Beardsley on 8/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIExternalDisplayDelegate.h"
#import "NSMutableArray+queue.h"
#import "UIBaseViewController.h"
@interface UIExternalDisplayController : NSObject {
	id<UIExternalDisplayDelegate> delegate;
	UIScreenMode *maxScreenMode;
	NSMutableArray *queue;
	UIBaseViewController *baseViewController;
}

#pragma mark -
#pragma mark Instance Properties

@property (nonatomic, retain) id<UIExternalDisplayDelegate> delegate;
@property (nonatomic, retain) UIScreenMode *maxScreenMode;
@property (nonatomic, retain) NSMutableArray *queue;
@property (nonatomic, retain) UIBaseViewController *baseViewController;

#pragma mark -
#pragma mark Instance Methods

-(NSArray*) screenModes;
-(void) setCurrentMode:(UIScreenMode *) mode;
-(void) pushViewController:(UIViewController*) viewController;
-(void) popViewController;
#pragma mark -
#pragma mark Class Methods
+(int) screens;
+(bool) isConnected;
@end
