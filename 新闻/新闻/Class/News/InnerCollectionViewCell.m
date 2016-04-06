//
//  InnerCollectionViewCell.m
//  新闻
//
//  Created by xuNick on 16/4/5.
//  Copyright © 2016年 NN. All rights reserved.
//

#import "InnerCollectionViewCell.h"

#import <UIImageView+AFNetworking.h>

@interface InnerCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView_img;


@end

@implementation InnerCollectionViewCell

-(void)setModel:(InnerModel *)model{
    _model = model;
    
    [_imageView_img setImageWithURL:[NSURL URLWithString:model.imgsrc]];
}


@end
