//
//  MVCView.h
//  MVCDemo
//
//  Created by 白仕云 on 2017/2/22.
//  Copyright © 2017年 BSY.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVCModel.h"

@interface MVCView : UITableViewCell
@property (nonatomic ,strong)UILabel *desc;
@property (nonatomic ,strong)UILabel *type;

@property (nonatomic ,strong)MVCModel *model;
@end
