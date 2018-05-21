//
//  TestModel.m
//  iOSCellAutoLayout
//
//  Created by shanbay410 on 2018/5/21.
//  Copyright © 2018年 shanbay410. All rights reserved.
//

#import "TestModel.h"
#import "TestViewCell.h"

@implementation TestModel

- (CGFloat)cellHeight{
    if (!_cellHeight){
        TestViewCell * cell = [[TestViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:testIndentifier];
        _cellHeight = [cell rowHeightWithCellModel:self];
    }
    return _cellHeight;
}
@end
