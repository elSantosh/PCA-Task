//
//  summaryViewController.h
//  PCA-Task
//
//  Created by Santosh Guruju | MACROKIOSK on 17/07/18.
//  Copyright © 2018 workstreak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "summaryTableViewCell.h"

@interface summaryViewController : UIViewController < UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *resultArray;

//API method
-(void) getDataFrom:(NSString *)url;

//currency format method
-(NSString *)formatToDollars:(NSString *)centsString;

@end
