//
//  summaryViewController.m
//  PCA-Task
//
//  Created by Santosh Guruju | MACROKIOSK on 17/07/18.
//  Copyright © 2018 workstreak. All rights reserved.
//

#import "summaryViewController.h"

@interface summaryViewController ()

@end

@implementation summaryViewController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //navigationbar setup
    self.navigationItem.title = @"Summary";
    
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
    self.navigationItem.leftBarButtonItem=leftButtonItem;

   
    //right bar item setup
    UIImage* lockimage = [UIImage imageNamed:@"padlock"];
    CGRect frameimg2 = CGRectMake(0, 0, lockimage.size.width, lockimage.size.height);
    UIButton *rightButton = [[UIButton alloc] initWithFrame:frameimg2];
    [rightButton setBackgroundImage:lockimage forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(lockAction)
         forControlEvents:UIControlEventTouchUpInside];
    [rightButton setShowsTouchWhenHighlighted:YES];
    UIBarButtonItem *rightButtonItem =[[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem =rightButtonItem;
  
    //tableView setup
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //add subviews to main view
    [self.view addSubview:self.tableView];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Mark:- Table View Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //setup cell
    static NSString *cellIdentifier = @"cellIdentifier";
    summaryTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[summaryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //background image & selection style setup
    UIImageView *cellBackView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 150)];
    cellBackView.backgroundColor=[UIColor clearColor];
    cellBackView.image = [UIImage imageNamed:@"sampleAccountImage01"];
    cell.backgroundView = cellBackView;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;

    //overlay setup
    CGRect overlayFrame = CGRectMake(0, 50, UIScreen.mainScreen.bounds.size.width,100.00);
    UIView *overlay = [[UIView alloc]initWithFrame:overlayFrame];
    overlay.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    //labels setup
    CGRect lbl1Frame = CGRectMake(15, 20, 350.00, 100);
    UILabel *accLBL1 = [[UILabel alloc]initWithFrame:lbl1Frame];
    [accLBL1 setFont:[UIFont systemFontOfSize:18]];
    accLBL1.textColor = UIColor.whiteColor;
    accLBL1.text = @"On Call Savings";
    
    CGRect lbl2Frame = CGRectMake(15, 40, 350.00, 100.00);
    UILabel *accLBL2 = [[UILabel alloc]initWithFrame:lbl2Frame];
    [accLBL2 setFont:[UIFont systemFontOfSize:14]];
    accLBL2.textColor = UIColor.whiteColor;
    accLBL2.text = @"30755S1";
    
    CGRect lbl3Frame = CGRectMake(15, 60, 100.00, 100.00);
    UILabel *accLBL3 = [[UILabel alloc]initWithFrame:lbl3Frame];
    [accLBL3 setFont:[UIFont systemFontOfSize:18]];
    accLBL3.textColor = UIColor.whiteColor;
    accLBL3.text = @"$541.12";
    
    CGRect lbl4Frame = CGRectMake(15, 80, 100.00, 100.00);
    UILabel *accLBL4 = [[UILabel alloc]initWithFrame:lbl4Frame];
    [accLBL4 setFont:[UIFont systemFontOfSize:18]];
    accLBL4.textColor = UIColor.whiteColor;
    accLBL4.text = @"$541.12";
    
    
    CGRect lbl5Frame = CGRectMake(accLBL3.frame.size.width+10, 60, 100, 100.00);
    UILabel *accLBL5 = [[UILabel alloc]initWithFrame:lbl5Frame];
    [accLBL5 setFont:[UIFont systemFontOfSize:14]];
    accLBL5.textColor = UIColor.whiteColor;
    accLBL5.text = @"Available";
    
    CGRect lbl6Frame = CGRectMake(accLBL4.frame.size.width+10, 80, 100, 100.00);
    UILabel *accLBL6 = [[UILabel alloc]initWithFrame:lbl6Frame];
    [accLBL6 setFont:[UIFont systemFontOfSize:14]];
    accLBL6.textColor = UIColor.whiteColor;
    accLBL6.text = @"Current";
    
    //setup arrow image
    CGRect arwFrame = CGRectMake(UIScreen.mainScreen.bounds.size.width-30,80,30,40);
    UIImageView *arwImage = [[UIImageView alloc]initWithFrame:arwFrame];
    [arwImage setImage:[UIImage imageNamed:@"TopRot_arrowRight"]];
    arwImage.tintColor = UIColor.whiteColor;
    
    //setup separator between rows
    CGRect sepFrame = CGRectMake(0,lbl6Frame.size.height+50,UIScreen.mainScreen.bounds.size.width,5);
    UIView *sepView = [[UIView alloc]initWithFrame:sepFrame];
    sepView.backgroundColor = UIColor.whiteColor;
    
    
    //adding subviews to the cell
    [cell addSubview:overlay];
    [cell addSubview:accLBL1];
    [cell addSubview:accLBL2];
    [cell addSubview:accLBL3];
    [cell addSubview:accLBL4];
    [cell addSubview:accLBL5];
    [cell addSubview:accLBL6];
    [cell addSubview:arwImage];
    [cell addSubview:sepView];

    
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
