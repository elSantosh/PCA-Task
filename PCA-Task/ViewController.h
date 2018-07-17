//
//  ViewController.h
//  PCA-Task
//
//  Created by Santosh Guruju | MACROKIOSK on 17/07/18.
//  Copyright © 2018 workstreak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITabBarDelegate>

@property(weak, nonatomic) IBOutlet UITableView *summaryTable;
@property(weak, nonatomic) IBOutlet UITabBar *tabBar;

@end

