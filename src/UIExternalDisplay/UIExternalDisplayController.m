//
//  UIExternalDisplayController.m
//  UIExternalDisplay
//
//  Created by Scott Beardsley on 8/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UIExternalDisplayController.h"
#import <UIKit/UIKit.h>

@implementation UIExternalDisplayController
@synthesize delegate;
@synthesize maxScreenMode;
@synthesize queue;
@synthesize window;
@synthesize baseView;

-(id) init{
	maxScreenMode = nil;
	self.queue = [[NSMutableArray alloc] init];
	self.window = [[UIWindow alloc] init];
	window.hidden = NO;

	[self setMaxMode];
	[self setWindowSize];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(externalDisplayConnect:) name:@"UIScreenDidConnectNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(externalDisplayDisconnect:) name:@"UIScreenDidDisconnectNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(externalDisplayChanged:) name:@"UIScreenModeDidChangeNotification" object:nil];
	
	baseView = [[UIView alloc] init];
	baseView.backgroundColor = [UIColor blueColor];
	[self resizeView:baseView];
	[window addSubview:baseView];
	return self;
}

#pragma mark -
#pragma mark UIExternalDisplayDelegate
-(void) externalDisplayConnect:(NSNotification*) notification{
	if (self.delegate == nil){
		return;
	}
	[self setMaxMode];
	[self setWindowSize];
	[self.delegate externalDisplayConnect:notification.object];
}

-(void) externalDisplayDisconnect:(NSNotification*) notification{
	if (self.delegate == nil) {
		return;
	}
	[self setMaxMode];
	[self.delegate externalDisplayDisconnect:notification.object];
}
-(void) externalDisplayChanged:(NSNotification*) notification{
	if (self.delegate == nil) {
		return;
	}
	[self setMaxMode];
	[self setWindowSize];
	[self.delegate externalDisplayChanged:notification.object withMode:[(UIScreen*)notification.object currentMode]];
}

-(void) setMaxMode {
	CGSize maxSize = CGSizeMake(0, 0);
    if([[UIScreen screens]count] > 1) {
		
        for(int i = 0; i < [[[[UIScreen screens] objectAtIndex:1] availableModes]count]; i++)
		{
            UIScreenMode *current = [[[[UIScreen screens]objectAtIndex:1]availableModes]objectAtIndex:i];
            if(current.size.width > maxSize.width);
			{
                maxSize = current.size;
                maxScreenMode = current;
			}
		} 
	}
	else {
		maxScreenMode = nil;
	}

}

#pragma mark -
#pragma mark Instance Methods
-(NSArray*) screenModes{
	if ([UIExternalDisplayController isConnected]){
		return [[[UIScreen screens] objectAtIndex:1] availableModes];
	}
	return nil;
}
-(void) setCurrentMode:(UIScreenMode *) mode {
	if ([UIExternalDisplayController isConnected]) {
		UIScreen* current = [[UIScreen screens] objectAtIndex:1];
		current.currentMode = mode;
	}
}
-(void) resizeView:(UIView *) view {
	CGPoint point = CGPointMake(0.0f, 0.0f);
	CGSize size = maxScreenMode.size;
	CGRect frame = view.frame;
	frame.origin = point;
	frame.size.width = size.width;
	frame.size.height = size.height;
	[view setFrame:frame];
}

-(void) pushViewController:(UIViewController*) viewController withAutoScale:(bool) scale{
	
	if (scale == YES){
		[self resizeView:viewController.view];
	}
	
	[self pushViewController:viewController];
}
-(void) pushViewController:(UIViewController*) viewController {
	
	[self.queue push:viewController];
    [window addSubview:viewController.view];
}



-(void) setWindowSize {
	UIScreen *external = [[UIScreen screens] objectAtIndex:1];
	external.currentMode = maxScreenMode;
	self.window.screen = external;
}

-(void) popViewController {
	UIViewController *controller = [self.queue pop];
	[controller.view removeFromSuperview];
}

#pragma mark -
#pragma mark Class Methods
+(int) screens {
	return [[UIScreen screens] count];
}

+(bool) isConnected {
	return [UIExternalDisplayController screens] > 1;
}

- (void)dealloc {
	//[[NSNotificationCenter defaultCenter] removeObserver:UIScreen forKeyPath:
    [super dealloc];
}

@end
