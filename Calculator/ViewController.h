//
//  ViewController.h
//  Calculator
//
//  Created by Eduard Galchenko on 1/4/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *inputOutputLabel;
@property (strong, nonatomic) NSString *tagValue;

- (IBAction)actionChooser:(UIButton *)sender;



@end

