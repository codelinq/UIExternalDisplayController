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

-(id) init{
	return self;
}

#pragma mark -
#pragma mark Class Methods
+(int) screens {
	return [[UIScreen screens] count];
}

+(bool) isConnected {
	return [UIExternalDisplayController screens] > 1;
}


@end
