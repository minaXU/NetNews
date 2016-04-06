//
//  NewsTableViewCell.m
//  新闻
//
//  Created by xuNick on 16/3/31.
//  Copyright © 2016年 NN. All rights reserved.
//

#import "NewsTableViewCell.h"

#import "NewsModel.h"

#import <UIImageView+AFNetworking.h>

@interface NewsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *Img_icon;
@property (weak, nonatomic) IBOutlet UILabel *label_title;
@property (weak, nonatomic) IBOutlet UILabel *label_detail;

@property (weak, nonatomic) IBOutlet UILabel *label_reply;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgVeiws_extra;

@end

@implementation NewsTableViewCell


- (void)setModel:(NewsModel *)model{
    _model = model;
    _label_title.text = model.title;
    _label_detail.text = model.digest;
    _label_reply.text = [NSString stringWithFormat:@"回复%d",model.replyCount.intValue];
    
    //加载图片
    _Img_icon.image =  nil;
    [_Img_icon setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    
    //加载额外的图片
    if (model.imgextra.count == 2) {
        //遍历加载图片
        int index = 0;
        for (UIImageView * imgView  in _imgVeiws_extra) {
            NSLog(@"%@",model.imgextra[index][@"imgsrc"]);
            [imgView setImageWithURL:[NSURL URLWithString:model.imgextra[index][@"imgsrc"]] ];
            index ++;
        }
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.label_detail.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - self.Img_icon.frame.size.width - 20;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
