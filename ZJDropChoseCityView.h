//
//  ZJDropChoseCityView.h
//  DecentTrainUser
//
//  Created by xiekang on 2018/3/29.
//  Copyright © 2018年 zhengjing. All rights reserved.
//
//正经推拿项目侧滑中间表格视图控制器  创建者：章敏
#import <UIKit/UIKit.h>
typedef void(^ZJChooseBlock)(NSInteger index);
@interface ZJDropChoseCityView : UIView

@property(strong,nonatomic)NSMutableArray *choseArray;
@property (nonatomic, copy) ZJChooseBlock choseClickBlock;
- (instancetype)initWithDataSource:(NSArray *)array;


/**
 显示

 */
- (void)show;

/**
 消失
 */
- (void)hide;
///**
// 选择展示的城市列表
// 
// @param rect <#rect description#>
// @return <#return value description#>
// */
//-(UITableView *)chooseCityViewWithCGect:(CGRect)rect;
@end
