//
//  HomeCollectionViewCell.m
//  新闻
//
//  Created by xuNick on 16/4/6.
//  Copyright © 2016年 NN. All rights reserved.
//

#import "HomeCollectionViewCell.h"

#import "NewsTableViewController.h"

@interface HomeCollectionViewCell ()

@property (nonatomic,strong)NewsTableViewController *NewsController;

@end

@implementation HomeCollectionViewCell

-(void)setModel:(ChannelModel *)model{
    _model  = model;
    //初始化控制器
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
        self.NewsController = [sb instantiateInitialViewController];
    
    self.NewsController.newsUrl = model.tid;
    self.NewsController.view.frame  = self.contentView.frame;
    
        [self.contentView addSubview:self.NewsController.view];
    
    

}



@end
