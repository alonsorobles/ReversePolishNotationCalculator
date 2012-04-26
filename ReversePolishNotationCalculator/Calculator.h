//
//  Calculator.h
//  ReversePolishNotationCalculator
//
//  Created by Alonso Robles on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

- (void) pushOperand:(double)operand;
- (double) performOperation:(NSString *)operation;

@property (readonly) id program;

+ (double)runProgram:(id)program;
+ (NSString *)descriptionOfProgram:(id)program;

@end
