//
//  MVCView.m
//  MVCDemo
//
//  Created by 白仕云 on 2017/2/22.
//  Copyright © 2017年 BSY.com. All rights reserved.
//

#import "MVCView.h"
#import <Masonry.h>
@implementation MVCView

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {


        self.type = [[UILabel alloc]init];
        self.type.font = [UIFont systemFontOfSize:17];
        self.type.textColor = [UIColor whiteColor];
        [self addSubview:self.type];
        self.type.textAlignment = NSTextAlignmentCenter;
        self.type.backgroundColor = [UIColor orangeColor];
        self.type.layer.borderWidth = 1;
        self.type.layer.borderColor = [UIColor clearColor].CGColor;
        self.type.layer.cornerRadius  =10;
        self.type.layer.masksToBounds = YES;
        [self.type mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(20));
            make.centerY.equalTo(self);
            make.width.equalTo(@(50));
            make.height.equalTo(@(20));
        }];
        

        self.desc = [[UILabel alloc]init];
        self.desc.font = [UIFont systemFontOfSize:12];
        self.desc.textColor = [UIColor blackColor];
        [self addSubview:self.desc];
        self.desc.numberOfLines = 0;
        self.desc.lineBreakMode = 0;
        [self.desc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(5));
            make.bottom.equalTo(@(-5));
            make.left.equalTo(self.type.mas_right).equalTo(@(5));
            make.right.equalTo(@(-5));
        }];

    }
    return self;
    
}


-(void)setModel:(MVCModel *)model
{

    NSDictionary *dict = (NSDictionary *)model;
    self.type.text = dict[@"type"];
    self.desc.text = dict[@"desc"];

}

@end
