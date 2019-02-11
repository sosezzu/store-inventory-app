//
//  RecordsViewController.h
//  StoreInventoryApp
//
//  Created by Sophia Setsu on 2/26/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *numField;
@property (weak, nonatomic) IBOutlet UITextField *addedField;
@property int numStock;
@property int addedStock;

@end
