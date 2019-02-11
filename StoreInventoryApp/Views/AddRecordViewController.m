//
//  AddRecordViewController.m
//  StoreInventoryApp
//
//  Created by Sophia Setsu on 2/25/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "AddRecordViewController.h"
#import "ViewController.h"

@interface AddRecordViewController() <UITextFieldDelegate>
{
}
@end

@implementation AddRecordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //setting up text field delegates
    self.productField.delegate = self;
    self.descriptionField.delegate = self;
    self.costField.delegate = self;
}

//exiting text field by pressing return
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//picker has 1 column
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

//picker has 101 rows
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component
{
    return 101;
}

//labels each row in picker numbers 0-100
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%li",row];
}

//if submit button is pressed, send data back to first viewcontroller via delegate
- (IBAction)buttonPressed:(id)sender
{
    //makes new product info array to be inserted into the stock nsmutablearray
    NSString *product = self.productField.text;
    NSString *description = self.descriptionField.text;
    NSString *cost = self.costField.text;
    NSInteger onhand1 = [self.numPicker selectedRowInComponent:0];
    NSString *onhand2 = [@(onhand1) stringValue];
    NSString *onhand = onhand2;
    NSString *image = @"blankstockpic.png";
    NSArray *obj = [NSArray arrayWithObjects: product, description, cost, onhand, image, nil];
    //sends obj array back to first viewcontroller via delegate
    [self.delegate userDidEnterInformation: obj];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
