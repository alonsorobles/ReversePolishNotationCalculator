//
//  Calculator.m
//  ReversePolishNotationCalculator
//
//  Created by Alonso Robles on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Calculator.h"

@interface Calculator()

@property (nonatomic, strong) NSMutableArray *operandStack;

@end

@implementation Calculator

@synthesize operandStack = _operandStack;

- (NSMutableArray *) operandStack {
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (void) push:(double)operand {
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double) popOperand {
    NSNumber *operand = [self.operandStack lastObject];
    if (operand) [self.operandStack removeLastObject];
    return [operand doubleValue];
}

- (double) perform:(NSString *)operation {
    double result = 0;
    
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if ([operation isEqualToString:@"-"]) {
        result = - [self popOperand] + [self popOperand];
    } else if ([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    } else if ([operation isEqualToString:@"/"]) {
        double divisor = [self popOperand];
        double dividend = [self popOperand];
        result = dividend / divisor;
    }
    
    [self push:result];
    
    return result;
}


@end
