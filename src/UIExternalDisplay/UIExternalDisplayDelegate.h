//
//  UIExternalDisplayDelegate.h
//  UIExternalDisplay
//
//  Created by Scott Beardsley on 8/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol UIExternalDisplayDelegate
-(void) externalDisplayConnect:(UIScreen*) screen;
-(void) externalDisplayDisconnect:(UIScreen*) screen;
-(void) externalDisplayChanged:(UIScreen*) screen withMode:(UIScreenMode*) mode;
@end
