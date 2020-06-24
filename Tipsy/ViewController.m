//
//  ViewController.m
//  Tipsy
//
//  Created by Caroline Reiser on 6/23/20.
//  Copyright © 2020 Caroline Reiser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipTotalLabel;
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel2;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel3;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel4;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel5;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *billTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dollarSign;
@property (weak, nonatomic) IBOutlet UIView *bottomHalf;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //make everything except bill total invisible
    self.tipLabel.alpha = 0;
    self.totalLabel.alpha = 0;
    self. tipControl.alpha = 0;
    self.tipAmountLabel.alpha = 0;
    self.bottomHalf.alpha = 0;
    self.totalNameLabel.alpha = 0;
    self.dollarSign.alpha = 0;
    self.tipTotalLabel.alpha = 0;
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello!");
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
       
    NSArray *percentages = @[@(0.15), @(0.18), @(0.20), @(0.22), @(.25)];
        
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex]doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    //find tip total and net total divided by # of people paying
    self.tipTotalLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    self.totalLabel2.text = [NSString stringWithFormat:@"$%.2f", total/2.0];
    self.totalLabel3.text = [NSString stringWithFormat:@"$%.2f", total/3.0];
    self.totalLabel4.text = [NSString stringWithFormat:@"$%.2f", total/4.0];
    self.totalLabel5.text = [NSString stringWithFormat:@"$%.2f", total/5.0];

    
}
- (IBAction)onEditingBegin:(id)sender{
    //if there is an amount in the bill amount field
    if([self.billField.text length] != 0)
    {
        //make everything disappear except bill total, center bill total
        CGRect newBillLabelFrame = self.billTotalLabel.frame;
        newBillLabelFrame.origin.y += 150;

        CGRect newBillFieldFrame = self.billField.frame;
        newBillFieldFrame.origin.y += 150;


        [UIView animateWithDuration:0.5 animations:^{
            self.billTotalLabel.frame = newBillLabelFrame;
            self.billField.frame = newBillFieldFrame;
            self.tipLabel.alpha = 0;
            self.totalLabel.alpha = 0;
            self. tipControl.alpha = 0;
            self.tipAmountLabel.alpha = 0;
            self.bottomHalf.alpha = 0;
            self.totalNameLabel.alpha = 0;
            self.dollarSign.alpha = 0;
            self.tipTotalLabel.alpha = 0;

            
        }];
    }
}

- (IBAction)onEditingEnd:(id)sender {
    //if there is an amount in the bill amount field
    if([self.billField.text length] != 0)
    {
        //display everything on screen
        CGRect newBillLabelFrame = self.billTotalLabel.frame;
        newBillLabelFrame.origin.y -= 150;

        CGRect newBillFieldFrame = self.billField.frame;
        newBillFieldFrame.origin.y -= 150;


        [UIView animateWithDuration:0.5 animations:^{
            self.billTotalLabel.frame = newBillLabelFrame;
            self.billField.frame = newBillFieldFrame;
            self.tipLabel.alpha = 1;
            self.totalLabel.alpha = 1;
            self. tipControl.alpha = 1;
            self.tipAmountLabel.alpha = 1;
            self.bottomHalf.alpha = 1;
            self.totalNameLabel.alpha = 1;
            self.dollarSign.alpha =1;
            self.tipTotalLabel.alpha = 1;
        }];
    }
}

@end
