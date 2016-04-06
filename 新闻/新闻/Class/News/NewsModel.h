//
//  NewsModel.h
//  新闻
//
//  Created by xuNick on 16/3/31.
//  Copyright © 2016年 NN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

/**
 *  新闻标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  新闻摘要
 */
@property (nonatomic, copy) NSString *digest;
/**
 *  跟贴数量
 */
@property (nonatomic, assign) NSNumber *replyCount;
/**
 *  配图地址
 */
@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic,strong)NSArray *imgextra;

@property (nonatomic,assign,getter=isBig)BOOL imgType;


+ (instancetype)newsWithDict:(NSDictionary *)dict;

+ (void)loadNewsListWithStirng:(NSString *)string withBlock:(void(^)(NSArray *array)) finshed;

- (NSString *)cellStyle;

@end
