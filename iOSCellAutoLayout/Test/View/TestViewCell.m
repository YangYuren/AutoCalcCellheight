//
//  TestViewCell.m
//  iOSCellAutoLayout
//
//  Created by shanbay410 on 2018/5/21.
//  Copyright © 2018年 shanbay410. All rights reserved.
//

#import "TestViewCell.h"
#import "TestModel.h"
#import "Masonry.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
//头像的高度
#define iconH  80
#define iconW 100
#define  marginW 10//间距

@interface TestViewCell ()

@property (nonatomic,weak) UIImageView *icon;  //头像
@property (nonatomic,weak) UILabel *content; //显示文本的label
@property (nonatomic,weak) UIImageView *line;  //下划线
@property (nonatomic,assign) CGFloat contentLabelH;//定义一个contentLabel文本高度的属性

@end

@implementation TestViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setupUI];
        [self setupConstranit];
    }
    return self;
}

#pragma mark 添加子控件
- (void)setupUI{
    //1.添加图片
    UIImageView *icon = [UIImageView new];
    icon.contentMode = UIViewContentModeScaleAspectFill;
    icon.clipsToBounds = YES;
    [self.contentView addSubview:icon];
    self.icon = icon;
    //2.添加label
    UILabel *content = [UILabel new];
    content.numberOfLines = 0;
    content.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:content];
    self.content = content;
    //3.底部添加一条线
    UIImageView *line = [UIImageView new];
    line.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:line];
    self.line = line;
}

- (void)setupConstranit{
    WS(weakSelf)
    //1.设置图片的大小
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(iconH);
        make.width.mas_equalTo(iconW);
        make.top.equalTo(weakSelf.mas_top).offset(marginW) ;
        make.centerX.equalTo(weakSelf.mas_centerX);
    }];
    //2.设置contentLabel
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.icon.mas_bottom).offset(marginW);
        make.left.equalTo(weakSelf.mas_left).offset(marginW);
        make.right.equalTo(weakSelf.mas_right).offset(-marginW);
        //文本高度根据模型计算
    }];
    //3.设置下划线的大小
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-marginW);
    }];
}
//传递数据模型
- (void)setTestModel:(TestModel *)testModel{
    _testModel = testModel;
    self.icon.image = [UIImage imageNamed:testModel.icon];  //头像
    self.content.text = testModel.content; //文本内容
}
//在表格cell中 计算出高度
- (CGFloat)rowHeightWithCellModel:(TestModel *)testModel{
    _testModel = testModel;
    WS(weakSelf)
    //设置标签的高度
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(weakSelf.contentLabelH);
    }];
    // 2. 更新约束
    [self layoutIfNeeded];
    //3.  视图的最大 Y 值
    CGFloat h = CGRectGetMaxY(self.content.frame);
    return h+marginW; //最大的高度+10
}

#pragma mark - lazy
-(CGFloat)contentLabelH{
    if(!_contentLabelH){
        CGFloat h = [self.testModel.content boundingRectWithSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width)-2*marginW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
        _contentLabelH=h+marginW;  //内容距离底部下划线10的距离
    }
    return _contentLabelH;
}



@end

