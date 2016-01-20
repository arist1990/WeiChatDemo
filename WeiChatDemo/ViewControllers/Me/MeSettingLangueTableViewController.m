//
//  MeSettingLangueTableViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/16.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "MeSettingLangueTableViewController.h"

@interface MeSettingLangueTableViewController ()

@end

@implementation MeSettingLangueTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = kColorNavigationBar;
    self.navigationController.navigationBar.tintColor = kColorStyle;       // 返回按钮那里的颜色
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];     // 改变标题字体
    
    _data = [NSMutableArray new];
    
    NSString *str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"country_code" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *array = [str componentsSeparatedByString:@"\n"];
    for (NSString *s in array) {
        NSArray *temp = [s componentsSeparatedByString:@" "];
        NSDictionary *dic = @{@"name":temp[0], @"code":temp[1]};
        [_data addObject:dic];
    }
    
    id code = [[NSUserDefaults standardUserDefaults] valueForKey:@"selectedCode"];
    self.selectedCode = [[NSString stringWithFormat:@"%@", code] integerValue];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    
    cell.textLabel.text = [_data[indexPath.row] objectForKey:@"name"];
    NSInteger currentCode = [[NSString stringWithFormat:@"%@", [_data[indexPath.row] objectForKey:@"code"]] integerValue];
    cell.accessoryType = currentCode == self.selectedCode ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger currentCode = [[NSString stringWithFormat:@"%@", [_data[indexPath.row] objectForKey:@"code"]] integerValue];
    
    self.navigationItem.rightBarButtonItem.enabled = self.selectedCode != currentCode;
    
    self.selectedCode = currentCode;
    
    [self.tableView reloadData];
}

- (IBAction)leftEvent:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)rightEvent:(id)sender {
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%@", @(self.selectedCode)] forKey:@"selectedCode"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
