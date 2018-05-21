# AutoCalcCellheight
iOS中配合Masonry自动计算Cell高度

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
