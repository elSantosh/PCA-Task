//
//  summaryViewController.m
//  PCA-Task
//
//  Created by Santosh Guruju | MACROKIOSK on 17/07/18.
//  Copyright © 2018 workstreak. All rights reserved.
//

#import "summaryViewController.h"
#import "PCA_Task-Swift.h"

@interface summaryViewController ()

@end

@implementation summaryViewController
@synthesize tableView, resultArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //calling API
    [self getDataFrom:@"http://www.mocky.io/v2/5abb1042350000580073a7ea"];

    //tableView setup
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //add subviews to main view
    [self.view addSubview:self.tableView];
    
    //initialise result array
    self.resultArray = [[NSMutableArray alloc]init];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK:- Table View Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return resultArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //setup cell
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //selection style setup
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    //background image setup
    NSArray *randomImgArray = [[NSArray alloc]initWithObjects:@"sampleAccountImage01", @"sampleAccountImage02", @"sampleAccountImage03", @"sampleAccountImage04",@"sampleAccountImage05",nil];
    uint32_t randomIndex  = arc4random_uniform([randomImgArray count]);
    NSString  *ranImgStrg= randomImgArray[randomIndex];
    
    UIImageView *cellBackView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 150)];
    cellBackView.backgroundColor=[UIColor clearColor];
    UIImage *actualImage = [UIImage imageNamed:ranImgStrg];
    cellBackView.image = [UIImage imageWithCGImage:[actualImage CGImage]
                                             scale:[actualImage scale]
                                       orientation: UIImageOrientationDown];
    cell.backgroundView = cellBackView;
    
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
    
    UIImage *newImage = [arwImage.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIGraphicsBeginImageContextWithOptions(arwImage.image.size, NO, newImage.scale);
    [UIColor.whiteColor set];
    [newImage drawInRect:CGRectMake(0, 0, arwImage.image.size.width, newImage.size.height)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    arwImage.image = newImage;
    
    //setup separator between rows
    CGRect sepFrame = CGRectMake(0,lbl6Frame.size.height+50,UIScreen.mainScreen.bounds.size.width,5);
    UIView *sepView = [[UIView alloc]initWithFrame:sepFrame];
    sepView.backgroundColor = UIColor.whiteColor;
    
    //Assigning remote data
    
    if (resultArray.count >0) {
        accLBL1.text = [NSString stringWithFormat:@"%@",[[resultArray objectAtIndex:indexPath.row] objectForKey:@"accountLabel"]];
        accLBL2.text = [NSString stringWithFormat:@"%@",[[resultArray objectAtIndex:indexPath.row] objectForKey:@"accountNumber"]];
        accLBL3.text = [self formatToDollars:[NSString stringWithFormat:@"%@",[[resultArray objectAtIndex:indexPath.row] objectForKey:@"availableBalance"]]];
        accLBL4.text = [self formatToDollars:[NSString stringWithFormat:@"%@",[[resultArray objectAtIndex:indexPath.row] objectForKey:@"currentBalance"]]];
    }
   
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
   
    //passing data by user defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //set head data
    [defaults setValue:[[resultArray objectAtIndex:indexPath.row] objectForKey:@"accountLabel"] forKey:@"accName"];
    [defaults setValue:[[resultArray objectAtIndex:indexPath.row] objectForKey:@"accountNumber"] forKey:@"accNum"];
    [defaults setValue:[self formatToDollars:[NSString stringWithFormat:@"%@",[[resultArray objectAtIndex:indexPath.row] objectForKey:@"availableBalance"]]] forKey:@"accAmount"];
    //set body data
    [defaults setValue:[resultArray objectAtIndex:indexPath.row] forKey:@"summaryArrayData"];
    [defaults synchronize];
    
    [self.tabBarController setSelectedIndex:1];
}

- (void)getDataFrom:(NSString *)urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *data = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *erro = nil;
        if (data!=nil) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&erro ];
            if (json.count > 0) {
                for(int i = 0; i <= (json.count+1)  ; i++){
                    [self.resultArray addObject:[json[@"accounts"] objectAtIndex:i]];
                    
                    //passing data by user defaults
                    //also: data setup for accounts tab
                    
                    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                    //set head data
                    [defaults setValue:[[self.resultArray objectAtIndex:0] objectForKey:@"accountLabel"] forKey:@"accName"];
                    [defaults setValue:[[self.resultArray objectAtIndex:0] objectForKey:@"accountNumber"] forKey:@"accNum"];
                    [defaults setValue:[self formatToDollars:[NSString stringWithFormat:@"%@",[[self.resultArray objectAtIndex:0] objectForKey:@"availableBalance"]]] forKey:@"accAmount"];
                    //set body data
                    [defaults setValue:[self.resultArray objectAtIndex:0] forKey:@"summaryArrayData"];
                    [defaults synchronize];
                }
            }
        }
        dispatch_sync(dispatch_get_main_queue(),^{
            [self.tableView reloadData];
        });
    }];
    [data resume];
}
-(NSString *)formatToDollars:(NSString *)centsString{
    //formatting cent to dollars
    int cents = [centsString integerValue] % 100;
    int dollars = (int) ([centsString integerValue] - cents) / 100;
    NSString *camount;
    if (cents <=9)
    {
        camount = [NSString stringWithFormat:@"0%d",cents];
    }
    else
    {
        camount = [NSString stringWithFormat:@"%d",cents];
    }
    NSString *dollarsString = [NSString stringWithFormat:@"$%d.%@",dollars,camount];
    return dollarsString;
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
