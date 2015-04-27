//
//  MaisOuiDictionary.h
//  MaisOui
//
//  Created by Robert Irwin on 1/28/14.
//  Modified by Bharath Darapu on 09/15/14
//  Copyright (c) 2014 Robert Irwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MaisOuiDictionary : NSObject

- (id) init; //initializer
- (id) initWithFrom: (NSString*) from withTo:(NSString*) to; //initializer with the languages as arguments

- (NSString *) lookup: (NSString *) in; //the lookup method

@end
