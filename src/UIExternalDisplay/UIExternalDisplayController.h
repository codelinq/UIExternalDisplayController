//
//  UIExternalDisplayController.h
//  UIExternalDisplay
//
//  Created by Scott Beardsley on 8/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIExternalDisplayController : NSObject {

}

#pragma mark Class Methods
+(int) screens;
+(bool) isConnected;
@end
