//
//  AppDelegate.m
//  PCA-Task
//
//  Created by Santosh Guruju | MACROKIOSK on 17/07/18.
//  Copyright © 2018 workstreak. All rights reserved.
//

#import "AppDelegate.h"
#import "summaryViewController.h"
#import "PCA_Task-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Leftbaritem with title, setup
    UIImage* menuimage = [UIImage imageNamed:@"ic_menu_black_24dp"];
    CGRect frameimg = CGRectMake(0, 0, menuimage.size.width, menuimage.size.height);
    UIButton *leftButton = [[UIButton alloc] initWithFrame:frameimg];
    [leftButton setBackgroundImage:menuimage forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(menuAction)
         forControlEvents:UIControlEventTouchUpInside];
    [leftButton setShowsTouchWhenHighlighted:YES];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(40, 2, 50, 20)];
    [title setText:@"Menu"];
    [title setTextColor:[UIColor blackColor]];
    [title setBackgroundColor:[UIColor clearColor]];
    [leftButton addSubview:title];
    UIBarButtonItem *leftButtonItem =[[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    
    //rightbaritem setup
    UIImage* lockimage = [UIImage imageNamed:@"padlock"];
    CGRect frameimg2 = CGRectMake(0, 0, lockimage.size.width, lockimage.size.height);
    UIButton *rightButton = [[UIButton alloc] initWithFrame:frameimg2];
    [rightButton setBackgroundImage:lockimage forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(lockAction)
          forControlEvents:UIControlEventTouchUpInside];
    [rightButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *rightButtonItem =[[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    //tab-1 setup with navigation controller
    summaryViewController *summaryVC = [[summaryViewController alloc] init];
    UINavigationController *summaryNavController = [[UINavigationController alloc]initWithRootViewController:summaryVC];
    summaryVC.navigationItem.title = @"Summary";
    summaryVC.navigationItem.leftBarButtonItem=leftButtonItem;
    summaryVC.navigationItem.rightBarButtonItem =rightButtonItem;
    
    //tab-2 with navigation controller
    accountsViewController *accountsVC = [[accountsViewController alloc] init];
    UINavigationController *accountsNavController = [[UINavigationController alloc]initWithRootViewController:accountsVC];
    accountsVC.navigationItem.title = @"Accounts";
    accountsVC.navigationItem.leftBarButtonItem=leftButtonItem;
    accountsVC.navigationItem.rightBarButtonItem =rightButtonItem;
    
    //tab-3 with navigation controller
    UIViewController *paymentsVC = [[UIViewController alloc] init];
    UINavigationController *paymentsNavController = [[UINavigationController alloc]initWithRootViewController:paymentsVC];
    paymentsVC.navigationItem.title = @"Payments";
    paymentsVC.navigationItem.leftBarButtonItem=leftButtonItem;
    paymentsVC.navigationItem.rightBarButtonItem =rightButtonItem;
    
    //set icons to the tabs
    summaryVC.tabBarItem.image=[UIImage imageNamed:@"list"];
    [summaryVC.tabBarItem setImageInsets:UIEdgeInsetsMake(3, 3, 3, 3)];
    summaryVC.tabBarItem.title = @"Summary";
    accountsVC.tabBarItem.image=[UIImage imageNamed:@"accounts"];
    [accountsVC.tabBarItem setImageInsets:UIEdgeInsetsMake(3, 3, 3, 3)];
    accountsVC.tabBarItem.title = @"Accounts";
    paymentsVC.tabBarItem.image=[UIImage imageNamed:@"payments"];
    [paymentsVC.tabBarItem setImageInsets:UIEdgeInsetsMake(3, 3, 3, 3)];
    paymentsVC.tabBarItem.title = @"Payments";
    
    //bottom tabbars setup
    UITabBarController *tabBars = [[UITabBarController alloc] init];
    NSMutableArray *tabsViewControllersArray = [[NSMutableArray alloc] initWithCapacity:3];
    [tabsViewControllersArray addObject:summaryNavController];
    [tabsViewControllersArray addObject:accountsNavController];
    [tabsViewControllersArray addObject:paymentsNavController];
    tabBars.viewControllers = tabsViewControllersArray;
    tabBars.view.autoresizingMask=(UIViewAutoresizingFlexibleHeight);
    
    //handle main app window
    self.window.rootViewController = tabBars;
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    
    return YES;
}

//MARK: menu action
-(void)menuAction{
    //nothing to perform
}

//MARK:lock action
-(void)lockAction
{
    //nothing to perform
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"PCA_Task"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
