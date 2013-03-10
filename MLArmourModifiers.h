//
//  MLArmourModifiers.h
//  Melee
//
//  Created by Geof Gibson on 11/9/09.
//  Copyright 2009 Variable Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLArmourModifiers : NSObject {
	int hits, armourMovement, dxAdj;
	NSString * name;
}

@property(readwrite) int hits, armourMovement, dxAdj;
@property(readwrite, retain) NSString * name;

@end
