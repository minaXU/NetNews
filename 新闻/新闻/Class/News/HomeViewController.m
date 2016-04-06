//
//  HomeViewController.m
//  新闻
//
//  Created by xuNick on 16/4/5.
//  Copyright © 2016年 NN. All rights reserved.
//

#import "HomeViewController.h"

#import "NewsTableViewController.h"
@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *collectionView_colle;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView_chaneel;

@property (nonatomic,strong)NewsTableViewController *NewsController;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    self.NewsController = [sb instantiateInitialViewController];

    
    [self.view addSubview:self.NewsController.view];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.NewsController.view.frame = self.collectionView_colle.frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
