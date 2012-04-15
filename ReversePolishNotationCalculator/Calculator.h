//
//  Calculator.h
//  ReversePolishNotationCalculator
//
//  Created by Alonso Robles on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

- (void) push:(double)operand;
- (double) perform:(NSString *)operation;

@end
