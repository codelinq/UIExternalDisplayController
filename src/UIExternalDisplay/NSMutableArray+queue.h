//
//  NSMutableArray+queue.h
//  UIExternalDisplay
//
//  Created by Scott Beardsley on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (QueueAdditions)

-(void) push:(id) anObject;
-(id) pop;
-(id) peek;

@end
