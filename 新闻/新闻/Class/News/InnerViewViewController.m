//
//  InnerViewViewController.m
//  新闻
//
//  Created by xuNick on 16/4/5.
//  Copyright © 2016年 NN. All rights reserved.
//

#import "InnerViewViewController.h"

#import "InnerModel.h"

#import "InnerCollectionViewCell.h"

@interface InnerViewViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView_img;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowlayout_layout;

@property (weak, nonatomic) IBOutlet UILabel *label_title;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl_pages;


@property (nonatomic,strong)NSArray *innerList;

@end

static int num2 = 0;

@implementation InnerViewViewController

- (void)viewDidLoad {
    num2 ++;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [InnerModel innerListwithSuccess:^(NSArray *array) {
        self.innerList = array;
        [self.collectionView_img reloadData];
        //初始化界面就滚动到第2组第一张图片
        [self.collectionView_img scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        [self scrollViewDidEndDecelerating:self.collectionView_img];
    }];
    
    _collectionView_img.delegate = self;
    _collectionView_img.dataSource = self;
    
    _collectionView_img.pagingEnabled = YES;
    
    
    
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //设置flowlayout
    _flowlayout_layout.itemSize = self.view.frame.size;
    
    _flowlayout_layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _flowlayout_layout.minimumLineSpacing = 0;
    
    

}

#pragma mark - datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  self.innerList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    InnerModel *model  = self.innerList[indexPath.row];
    
    InnerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"innerreuse" forIndexPath:indexPath];
    
    cell.model  = model;
    return cell;
}


//停止滚动的时候判定时候循环
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //计算出item的index
    NSInteger index = self.collectionView_img.contentOffset.x / self.collectionView_img.frame.size.width;
    
    index = index % self.innerList.count;
    //滚动到中间section对应item的位置
    [self.collectionView_img scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:1] atScrollPosition:0 animated:NO];
    
    
    //修改pagecontroll
    self.pageControl_pages.currentPage = index;
    
    
    InnerModel *model  = self.innerList[index];
    self.label_title.text = model.title;
}

-(void)dealloc{
    num2 --;

}


@end
