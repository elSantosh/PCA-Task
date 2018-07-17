//
//  ViewController.m
//  PCA-Task
//
//  Created by Santosh Guruju | MACROKIOSK on 17/07/18.
//  Copyright © 2018 workstreak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //select first tab bar item
    [self tabBar:self.tabBar didSelectItem:[self.tabBar.items firstObject]];
    self.tabBar.selectedItem = [self.tabBar.items firstObject];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    switch (item.tag) {
        case 0:
            NSLog(@"first item selected!");
            break;
        
        case 1:
            break;
        
        case 2:
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
