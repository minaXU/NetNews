//
//  HomeViewController.m
//  新闻
//
//  Created by xuNick on 16/4/5.
//  Copyright © 2016年 NN. All rights reserved.
//

#import "HomeViewController.h"

#import "ChannelModel.h"

#import "HomeCollectionViewCell.h"

@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView_colle;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowlayout_folw;



@property (weak, nonatomic) IBOutlet UIScrollView *scrollView_chaneel;


@property (nonatomic,strong)NSArray *channelList;


@end

@implementation HomeViewController

- (NSArray *)channelList{
    if (!_channelList) {
        _channelList = [ChannelModel channelList];
    }
    return _channelList;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
//    self.NewsController = [sb instantiateInitialViewController];
//
//    
//    [self.view addSubview:self.NewsController.view];
    
    self.collectionView_colle.dataSource = self;
    self.collectionView_colle.delegate = self;
    
    self.collectionView_colle.pagingEnabled = YES;
    
    [self showChannel];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView_chaneel.showsHorizontalScrollIndicator = NO;
    
    
    
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //设置flowLayout
    self.flowlayout_folw.itemSize = self.collectionView_colle.frame.size;
    
    self.flowlayout_folw.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowlayout_folw.minimumLineSpacing = 0;
    
   
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - datasource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.channelList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ChannelModel *model = self.channelList[indexPath.row];
    
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"channel" forIndexPath:indexPath];
    cell.model = model;
    return cell;
}

#pragma mark - collection delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSArray *array = self.collectionView_colle.indexPathsForVisibleItems;
    
    
    for (NSIndexPath *index in array) {
        UILabel *label = [self.scrollView_chaneel viewWithTag:index.row + 1];
        
        
            
            //计算比例
            CGFloat scale = ABS(self.collectionView_colle.contentOffset.x/self.collectionView_colle.frame.size.width - label.tag + 1) ;
        if (scale>1) {
            scale = 1;
        }
            label.transform = CGAffineTransformMakeScale(1.3 - scale*0.3, 1.3 - scale*0.3);
        label.textColor = [UIColor colorWithRed:1-scale green:0 blue:0 alpha:1];
        
    }
//        if (scale < 0) {
//            label.transform = CGAffineTransformMakeScale(1 - scale*0.25, 1 - scale*0.25);
//        }else{
//            label.transform = CGAffineTransformMakeScale(1 - scale*0.2, 1 - scale*0.2);
//        }
        
//    }

}

//- (void)scrollViewDidDecelerating:(UIScrollView *)scrollView{
////    NSArray *array = self.collectionView_colle.indexPathsForVisibleItems;
////    for (NSIndexPath *index in array) {
////       UILabel *label = [self.scrollView_chaneel viewWithTag:index.row];
////        label.textColor = [UIColor redColor];
////    }
//}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //拿到当前新闻页
     NSIndexPath *path = [self.collectionView_colle.indexPathsForVisibleItems firstObject];
    //计算偏移量
    UILabel *label = [self.scrollView_chaneel viewWithTag:path.row + 1];
    CGFloat offx = label.frame.origin.x - self.view.frame.size.width/2 + label.frame.size.width/2;
    if (offx > 0 && offx < self.scrollView_chaneel.contentSize.width -self.scrollView_chaneel.frame.size.width) {
       
       
        [self.scrollView_chaneel setContentOffset:CGPointMake(offx, 0) animated:YES];
        
    }
    
}

- (void)showChannel{
    CGFloat x = 0;
    
    for (int i = 0;  i < self.channelList.count; i ++) {
        
        ChannelModel *model = self.channelList[i];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(x, 0, 0, 0)];
        label.text = model.tname;
        label.font = [UIFont systemFontOfSize:20];
      
        [label sizeToFit];
        x += label.frame.size.width;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        label.tag = i + 1;
        if (i == 0) {
            label.transform = CGAffineTransformMakeScale(1.3, 1.3);
            label.textColor = [UIColor redColor];
        }
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapLabel:)];
        [label addGestureRecognizer:tap];
        label.userInteractionEnabled = YES;
        
        [self.scrollView_chaneel addSubview:label];
    }
    self.scrollView_chaneel.contentSize = CGSizeMake(x, 0);
    
    
    [self scrollViewDidScroll:self.scrollView_chaneel];
}


-(void)tapLabel:(UITapGestureRecognizer *)tap{
    UILabel *label = (UILabel *)tap.view;
    [self.collectionView_colle scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:label.tag - 1 inSection:0] atScrollPosition:0 animated:NO];
    label.transform = CGAffineTransformMakeScale(1.3, 1.3);
    label.textColor = [UIColor redColor];

    
    CGFloat offx = label.frame.origin.x - self.view.frame.size.width/2 + label.frame.size.width/2;
    if (offx > 0 && offx < self.scrollView_chaneel.contentSize.width -self.scrollView_chaneel.frame.size.width) {
        
        
        [self.scrollView_chaneel setContentOffset:CGPointMake(offx, 0) animated:YES];
        
    }

//    self.scrollView_chaneel setContentOffset:CGPointMake(<#CGFloat x#>, <#CGFloat y#>)
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
