//
//  ZJChooseCityCell.m
//  DecentTrainUser
//
//  Created by xiekang on 2018/3/28.
//  Copyright © 2018年 zhengjing. All rights reserved.
//
//正经推拿项目侧滑中间选择门店视图控制器城市选择  创建者：章敏
#import "ZJChooseCityCell.h"

@interface ZJChooseCityCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *chooseImgV;

@end

@implementation ZJChooseCityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(ZJCityModel *)model
{
    _model = model;
    
    self.titleLab.text = model.cityName;

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        self.titleLab.textColor = NAVICOLOR;
        self.chooseImgV.hidden = NO;
    }else{
        self.titleLab.textColor = [UIColor colorWithRed:34/255 green:24/255 blue:20/255 alpha:1];;
        self.chooseImgV.hidden = YES;
    }
    
}
@end
