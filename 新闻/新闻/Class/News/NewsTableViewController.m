//
//  NewsTableViewController.m
//  新闻
//
//  Created by xuNick on 16/3/30.
//  Copyright © 2016年 NN. All rights reserved.
//

#import "NewsTableViewController.h"

#import "NewsModel.h"

#import "NewsTableViewCell.h"

@interface NewsTableViewController ()

@property (nonatomic,strong)NSArray *newsList;

@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *string = [NSString stringWithFormat:@"%@/0-20.html",self.newsUrl];
    [NewsModel loadNewsListWithStirng:string withBlock:^(NSArray *array) {
        self.newsList = array;
        [self.tableView reloadData];
    }];
    //设置行高
    // 设置预估行高
    self.tableView.estimatedRowHeight = 80;
    // 设置行高-自动计算行高
    // 要求：
    // 1. cell中要有向下的约束，能够撑开整个cell
    // 2. 所有的约束不能有负值
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsModel *model = self.newsList[indexPath.row];
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[model cellStyle] forIndexPath:indexPath];
    
    cell.model = model;
    
    return cell;
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
