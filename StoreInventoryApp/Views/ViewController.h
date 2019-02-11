//
//  ViewController.h
//  StoreInventoryApp
//
//  Created by Sophia Setsu on 2/21/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordsViewController.h"
#import "AddRecordViewController.h"

@interface ViewController : UIViewController
@property (strong, nonatomic)NSMutableArray *stock;
@property int numStock;
@property int addedStock;
@property int pageCounter;
@property (weak, nonatomic) IBOutlet UIImageView *stockPic;
@property (weak, nonatomic) IBOutlet UITextField *productField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UITextField *costField;
@property (weak, nonatomic) IBOutlet UIPickerView *numPicker;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
- (IBAction)unwindToViewController:(UIStoryboardSegue *)unwindSegue;
@end

