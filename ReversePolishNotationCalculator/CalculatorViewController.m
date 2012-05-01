//
//  CalculatorViewController.m
//  ReversePolishNotationCalculator
//
//  Created by Alonso Robles on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Calculator.h"

@interface CalculatorViewController ()

@property (nonatomic) BOOL userIsCurrentlyEnteringAnOperand;
@property (nonatomic, strong) Calculator *calculator;

@end

@implementation CalculatorViewController
@synthesize display = _display;
@synthesize historyDisplay = _historyDisplay;
@synthesize userIsCurrentlyEnteringAnOperand = _userIsCurrentlyEnteringAnOperand;
@synthesize calculator = _calculator;

- (Calculator *) calculator {
    if (!_calculator) _calculator = [[Calculator alloc] init];
    return _calculator;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    if (self.userIsCurrentlyEnteringAnOperand) 
        self.display.text = [self.display.text stringByAppendingString:digit];
    else if (digit != @"0") {
        self.display.text = digit;
        self.userIsCurrentlyEnteringAnOperand = YES;
    }
}

- (IBAction)operationPressed:(UIButton *)sender {
    NSString *operation = sender.currentTitle;
    if (self.userIsCurrentlyEnteringAnOperand) [self enterPressed];
    [self recordHistory:operation];
    double result = [self.calculator performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)enterPressed {
    [self recordHistory:self.display.text];
    [self.calculator pushOperand:[self.display.text doubleValue]];
    self.userIsCurrentlyEnteringAnOperand = NO;
}

- (IBAction)decimalPressed {
    NSString *decimal = @".";
    if([self.display.text rangeOfString:decimal].location == NSNotFound) {
        self.display.text = [self.display.text stringByAppendingString:decimal];
        self.userIsCurrentlyEnteringAnOperand = YES;
    };
}

- (void)recordHistory:(NSString *)text {
    if ([text length] > 0) {
        self.historyDisplay.text = [self.historyDisplay.text stringByAppendingFormat:@" %@", text];
    }
}

@end
