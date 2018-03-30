//
//  ZJDropChoseCityView.m
//  DecentTrainUser
//
//  Created by xiekang on 2018/3/29.
//  Copyright © 2018年 zhengjing. All rights reserved.
//
//正经推拿项目侧滑中间选择时间视图控制器  创建者：章敏
#import "ZJDropChoseCityView.h"
#import "ZJChooseCityCell.h"
#import "ZJCityModel.h"
@interface ZJDropChoseCityView ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)UIView *cityView;

/**
 选择城市列表
 */
@property(strong,nonatomic)UITableView *choseCityTabV;

@end

@implementation ZJDropChoseCityView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UITableView *)choseCityTabV{
    
    if (!_choseCityTabV) {
        _choseCityTabV = [[UITableView alloc]init];
        _choseCityTabV.delegate = self;
        _choseCityTabV.dataSource = self;
        _choseCityTabV.showsVerticalScrollIndicator = NO;
        _choseCityTabV.showsHorizontalScrollIndicator = NO;
        _choseCityTabV.separatorColor = [UIColor clearColor];
//        _choseCityTabV.backgroundColor = [UIColor redColor];
    }
    return _choseCityTabV;
    
}
#pragma mark  UITableViewCellDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.choseArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellid = @"ZJChooseCityCell";
    ZJChooseCityCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.choseArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.choseClickBlock) {
        self.choseClickBlock(indexPath.row);
    }
    
//      ZJChooseCityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZJChooseCityCell" forIndexPath:indexPath];
//    cell.selected =
    [self hide];
}

-(void)setChoseArray:(NSMutableArray *)choseArray{
    _choseArray = choseArray;
    
    [self.choseCityTabV reloadData];
    
    NSIndexPath *indexpath=[NSIndexPath indexPathForRow:0 inSection:0];
    
    
    [self.choseCityTabV  selectRowAtIndexPath:indexpath animated:YES scrollPosition:UITableViewScrollPositionNone];
    
}

- (instancetype)initWithDataSource:(NSArray *)array
                         ;
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if(self){
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.8];
        self.cityView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
        self.choseCityTabV.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    
        [self.choseCityTabV registerNib:[UINib nibWithNibName:@"ZJChooseCityCell" bundle:nil] forCellReuseIdentifier:@"ZJChooseCityCell"];
    
//        [self.cityView addSubview:self.choseCityTabV];
        [self addSubview:self.choseCityTabV];
        self.choseArray = [NSMutableArray arrayWithCapacity:0];
        self.choseArray = (NSMutableArray *)array;
    }
    return self;
}


- (void)show{
    
    self.hidden = NO;
    
    self.choseCityTabV.frame = CGRectMake(0, 0, SystemScreenWidth, 0);
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
         self.choseCityTabV.frame = CGRectMake(0,0, SystemScreenWidth, 44 * self.choseArray.count);
 
    }completion:^(BOOL finished) {
        
        
    }];
    
}

- (void)hide{
    
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.choseCityTabV.frame = CGRectMake(0, 0, SystemScreenWidth, 0);
//        self.closeButton.transform = CGAffineTransformMakeRotation(-3.14/4);
    }completion:^(BOOL finished) {
        self.hidden = YES;
    }];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self hide];
}

@end
