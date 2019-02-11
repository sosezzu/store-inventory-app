//
//  RecordsViewController.m
//  StoreInventoryApp
//
//  Created by Sophia Setsu on 2/26/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "RecordsViewController.h"
@interface RecordsViewController() <UITextFieldDelegate>
{}
@end

@implementation RecordsViewController
//sets the text in the current number of records field to numStock and the text in number of new items to addedStock
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.numField.text = [NSString stringWithFormat: @"%i", self.numStock];
    self.addedField.text =  [NSString stringWithFormat: @"%i", self.addedStock];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
