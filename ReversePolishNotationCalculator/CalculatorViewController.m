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

@property (nonatomic) BOOL userIsEnteringANumber;
@property (nonatomic, strong) Calculator *calculator;

@end

@implementation CalculatorViewController
@synthesize display = _display;
@synthesize userIsEnteringANumber = _userIsEnteringANumber;
@synthesize calculator = _calculator;

- (Calculator *) calculator {
    if (!_calculator) _calculator = [[Calculator alloc] init];
    return _calculator;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDisplay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    if (self.userIsEnteringANumber) 
        self.display.text = [self.display.text stringByAppendingString:digit];
    else if (digit != @"0") {
        self.display.text = digit;
        self.userIsEnteringANumber = YES;
    }
}

- (IBAction)operandPressed:(UIButton *)sender {
    if (self.userIsEnteringANumber) [self enterPressed];
    double result = [self.calculator perform:sender.currentTitle];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)enterPressed {
    [self.calculator push:[self.display.text doubleValue]];
    self.userIsEnteringANumber = NO;
}

@end
