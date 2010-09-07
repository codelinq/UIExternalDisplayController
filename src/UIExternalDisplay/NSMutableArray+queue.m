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
	id object = [self objectAtIndex:self.count-1];
	[self removeObjectAtIndex:self.count-1];
	return object;
}
-(id) peek {
	return [self objectAtIndex:self.count-1];
}
@end
