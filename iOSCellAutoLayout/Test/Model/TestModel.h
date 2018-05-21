//
//  TestModel.h
//  iOSCellAutoLayout
//
//  Created by shanbay410 on 2018/5/21.
//  Copyright © 2018年 shanbay410. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TestModel : NSObject

@property (nonatomic, copy) NSString * icon;

@property (nonatomic, copy) NSString * content;

//cell高度
@property (nonatomic, assign) CGFloat cellHeight;


@end
