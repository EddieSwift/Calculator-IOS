//
//  ViewController.m
//  Calculator
//
//  Created by Eduard Galchenko on 1/4/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import "ViewController.h"

typedef enum {
    
    ClearAction = 11,
    ModuleAction = 12,
    PersentAction = 13,
    DivideAction = 14,
    MultiplicationAction = 15,
    MinusAction = 16,
    AddAction = 17,
    ResultAction = 18,
    SqrtAction = 19,
    PointAction = 20,
    NonAction = 21
    
} CalculationActions;

@interface ViewController ()

@property (strong, nonatomic) NSString *firstOperand;
@property (strong, nonatomic) NSString *secondOperand;
@property (assign, nonatomic) CalculationActions firstOperation;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)actionChooser:(UIButton *)sender {
    
    if (sender.tag >= 0 && sender.tag <= 9) {
        
        [self checkingForNull:sender];
        
    } else if (sender.tag == ClearAction) {
        
        self.inputOutputLabel.text = [NSString stringWithFormat:@"0"];
        
    } else if (sender.tag == AddAction) {
        
        self.firstOperand = self.inputOutputLabel.text;
        self.firstOperation = AddAction;
        self.inputOutputLabel.text = [NSString stringWithFormat:@" "];
        
    } else if (sender.tag == ResultAction) {
        
        self.secondOperand = self.inputOutputLabel.text;
        
        switch (self.firstOperation) {
                
            case AddAction:
                self.inputOutputLabel.text = [NSString stringWithFormat:@"%1.3f", [self.firstOperand floatValue] + [self.secondOperand floatValue]];
                self.firstOperand = self.inputOutputLabel.text;
                self.firstOperation = NonAction;
                break;
                
            case MinusAction:
                self.secondOperand = self.inputOutputLabel.text;
                self.inputOutputLabel.text = [NSString stringWithFormat:@"%1.3f", [self.firstOperand floatValue] - [self.secondOperand floatValue]];
                self.firstOperation = NonAction;
                break;
                
            case MultiplicationAction:
                self.secondOperand = self.inputOutputLabel.text;
                self.inputOutputLabel.text = [NSString stringWithFormat:@"%1.3f", [self.firstOperand floatValue] * [self.secondOperand floatValue]];
                self.firstOperation = ClearAction;
                break;
                
            case DivideAction:
                self.secondOperand = self.inputOutputLabel.text;
                self.inputOutputLabel.text = [NSString stringWithFormat:@"%1.3f", [self.firstOperand floatValue] / [self.secondOperand floatValue]];
                self.firstOperation = NonAction;
                break;
                
            case NonAction:
                self.secondOperand = self.inputOutputLabel.text;
                self.inputOutputLabel.text = self.secondOperand;
                self.firstOperation = NonAction;
                break;
                
            default:
                break;
        }
    } else if (sender.tag == MinusAction) {
        
        self.firstOperand = self.inputOutputLabel.text;
        self.firstOperation = MinusAction;
        self.inputOutputLabel.text = [NSString stringWithFormat:@" "];
        
    } else if (sender.tag == MultiplicationAction) {
        
        self.firstOperand = self.inputOutputLabel.text;
        self.firstOperation = MultiplicationAction;
        self.inputOutputLabel.text = [NSString stringWithFormat:@" "];
        
    } else if (sender.tag == DivideAction) {
        
        self.firstOperand = self.inputOutputLabel.text;
        self.firstOperation = DivideAction;
        self.inputOutputLabel.text = [NSString stringWithFormat:@" "];
        
    } else if (sender.tag == PersentAction) {
        
        self.firstOperand = self.inputOutputLabel.text;
        
        if (![self.firstOperand isEqualToString:@"0"]) {
            
            self.inputOutputLabel.text = [NSString stringWithFormat:@"%1.3f", [self.firstOperand floatValue] / 100];
            self.firstOperation = PersentAction;

        } else {
            
            self.inputOutputLabel.text = [NSString stringWithFormat:@"0"];
        }

    } else if (sender.tag == SqrtAction) {
        
        self.firstOperand = self.inputOutputLabel.text;
        self.firstOperation = SqrtAction;
        self.inputOutputLabel.text = [NSString stringWithFormat:@"%1.3f", sqrtf([self.firstOperand floatValue])];
        
    } else if (sender.tag == ModuleAction) {
        
        self.firstOperand = self.inputOutputLabel.text;
        self.firstOperation = ModuleAction;
        self.inputOutputLabel.text = [NSString stringWithFormat:@"%1.3f", ([self.firstOperand floatValue]) * (- 1)];
        
    } else if (sender.tag == PointAction) {
        
        NSString *value = self.inputOutputLabel.text;
        
        if (![self.inputOutputLabel.text containsString:@"."]) {

            self.inputOutputLabel.text = [value stringByAppendingString:[NSString stringWithFormat:@"."]];
        }
    }
}

#pragma mark - Action Methods

- (void) checkingForNull:(UIButton *) sender {
    
    NSString *value = self.inputOutputLabel.text;
    
    if ([value isEqual:@"0"]) {
        
        self.inputOutputLabel.text = [NSString stringWithFormat:@"%ld", (long)sender.tag];
        
    } else {
        
        self.inputOutputLabel.text = [value stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)sender.tag]];
    }
}

@end
