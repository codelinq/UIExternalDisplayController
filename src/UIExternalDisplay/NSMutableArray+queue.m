//
//  NSMutableArray+queue.m
//  UIExternalDisplay
//
//  Created by Scott Beardsley on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSMutableArray+queue.h"

@implementation NSMutableArray (QueueAdditions)

-(void) push:(id) anObject {
	[self addObject:anObject];
}
-(id) pop {
	id object = [self objectAtIndex:0];
	[self removeObjectAtIndex:0];
	return object;
}
-(id) peek {
	return [self objectAtIndex:0];
}
@end
