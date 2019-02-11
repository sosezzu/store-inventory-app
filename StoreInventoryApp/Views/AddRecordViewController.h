//
//  AddRecordViewController.h
//  StoreInventoryApp
//
//  Created by Sophia Setsu on 2/25/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

//delegate sends the obj array created by AddRecordViewController via ViewController's userDidEnterInformation function
@protocol DataEnteredDelegate
-(void) userDidEnterInformation: (NSArray *)obj;
@end

@interface AddRecordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *productField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UITextField *costField;
@property (weak, nonatomic) IBOutlet UIPickerView *numPicker;
@property (nonatomic, weak) id <DataEnteredDelegate> delegate;
@end

