//
//  TestViewCell.h
//  iOSCellAutoLayout
//
//  Created by shanbay410 on 2018/5/21.
//  Copyright © 2018年 shanbay410. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TestModel;

static  NSString *testIndentifier=@"TestViewCell";

@interface TestViewCell : UITableViewCell

//数据模型
@property (nonatomic,strong) TestModel *testModel;

//我们最后得到cell的高度的方法
-(CGFloat)rowHeightWithCellModel:(TestModel *)testModel;

@end
