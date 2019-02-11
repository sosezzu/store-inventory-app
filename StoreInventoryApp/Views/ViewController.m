//
//  ViewController.m
//  StoreInventoryApp
//
//  Created by Sophia Setsu on 2/21/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, DataEnteredDelegate >
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    //initializes and populates array with products
    self.stock = [NSMutableArray new];
    NSArray *obj = [NSArray arrayWithObjects: @"iPhone X", @"iPhone X released Fall 2017", @"969.00", @"2", @"stockpic.png", nil];
    [self.stock addObject: obj];
    obj =[NSArray arrayWithObjects: @"Galaxy Note7", @"Samsung's Exploding Phone", @"850.00", @"90", @"stockpic.png", nil];
    [self.stock addObject: obj];
    obj = [NSArray arrayWithObjects: @"40-inch TV", @"Sony's LED TV", @"298.00", @"89", @"stockpic.png", nil];
    [self.stock addObject: obj];
    obj = [NSArray arrayWithObjects: @"Kindle Reader", @"Amazon's E-Reader", @"79.99", @"100", @"stockpic.png", nil];
    [self.stock addObject: obj];
    obj = [NSArray arrayWithObjects: @"Apple Watch", @"Series 3 - Vibranium Case", @"299.00", @"0", @"stockpic.png", nil];
    [self.stock addObject: obj];
    self.numStock = 5;
    self.addedStock = 0;
    self.pageCounter = 0;
    
    //delegate setup
    self.productField.delegate = self;
    self.descriptionField.delegate = self;
    self.costField.delegate = self;
    self.numPicker.dataSource = self;
    self.numPicker.delegate = self;
    
    //setting up text fields/color pickers/pictures to display initial values
    obj = [self.stock objectAtIndex:0];
    self.productField.text = [obj objectAtIndex:0];
    self.descriptionField.text = [obj objectAtIndex:1];
    self.costField.text = [obj objectAtIndex:2];
    int currCost = [[obj objectAtIndex:3] intValue];
    [self.numPicker reloadAllComponents];
    [self.numPicker selectRow:currCost inComponent:0 animated:NO];
    UIImage *image = [UIImage imageNamed: [obj objectAtIndex:4]];
    self.stockPic.image = image;
    
    //graying out back button since view loads initial product, thus no products that can be clicked back to
   [self.backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.backButton setEnabled:false];
}

//exiting text field by pressing return
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//when back is pressed, load previous record's information
- (IBAction)backwardButtonPressed:(id)sender
{
    self.pageCounter--;
    //if page is already 0, make back unclickable
    if(self.pageCounter == 0)
    {
        [self.backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.backButton setEnabled:false];
    }
    //if page is not at the last item in stock, make forward clickable
    if(self.pageCounter < self.numStock - 1)
    {
        [self.forwardButton setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
        [self.forwardButton setEnabled:true];
    }
    
    //set the various textfields and pickers to the previous record's information
    NSArray *obj = [self.stock objectAtIndex:self.pageCounter];
    self.productField.text = [obj objectAtIndex:0];
    self.descriptionField.text = [obj objectAtIndex:1];
    self.costField.text = [obj objectAtIndex:2];
    int currNum = [[obj objectAtIndex:3] intValue];
    [self.numPicker reloadAllComponents];
    [self.numPicker selectRow:currNum inComponent:0 animated:NO];
    UIImage *image = [UIImage imageNamed: [obj objectAtIndex:4]];
    self.stockPic.image = image;
}

//if forward button is pressed, load next record's information
- (IBAction)forwardButtonPressed:(id)sender
{
    self.pageCounter++;
    //if page is at the last item in stock, make forward unclickable
    if(self.pageCounter == self.numStock - 1)
    {
        [self.forwardButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.forwardButton setEnabled:false];
    }
    //if not at the very first page, make back clickable
    if(self.pageCounter >= 1)
    {
        [self.backButton setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
        [self.backButton setEnabled:true];
    }
    //set the various textfields and pickers to the next record's information
    NSArray *obj = [self.stock objectAtIndex:self.pageCounter];
    self.productField.text = [obj objectAtIndex:0];
    self.descriptionField.text = [obj objectAtIndex:1];
    self.costField.text = [obj objectAtIndex:2];
    int currCost = [[obj objectAtIndex:3] intValue];
    [self.numPicker reloadAllComponents];
    [self.numPicker selectRow:currCost inComponent:0 animated:NO];
    UIImage *image = [UIImage imageNamed: [obj objectAtIndex:4]];
    self.stockPic.image = image;
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

//seguing to other views
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //seguing to RecordsViewController
    if([segue.identifier isEqualToString:@"mySegue"])
    {
        //need to send numstock and addedStock
        RecordsViewController *controller = (RecordsViewController *)segue.destinationViewController;
        controller.numStock = self.numStock;
        controller.addedStock = self.addedStock;
    }
    //seguing to AddRecordViewController
    if ([segue.identifier isEqualToString:@"segueToAdd"])
    {
        //sets the delegate of the new controller to itself
        AddRecordViewController *NewVC = (AddRecordViewController*)segue.destinationViewController;
        NewVC.delegate = self;
    }
}

//recieves the information sent by pressing the submit button in the AddRecordViewController
-(void)userDidEnterInformation: (NSArray *)obj
{
    //the obj array sent by AddRecordViewController is added to stock
    [self.stock addObject:obj];
    //number and added stock are incremented
    self.numStock++;
    self.addedStock++;
}

//other views unwind back to initial view so viewdidload isn't called again
- (IBAction)unwindToViewController:(UIStoryboardSegue *)unwindSegue
{
    //if record is added while user is looking at the previously last record (now the second to last), make forward button clickable so new record can be clicked to
    if(self.pageCounter < self.numStock - 1)
    {
        [self.forwardButton setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
        [self.forwardButton setEnabled:true];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
