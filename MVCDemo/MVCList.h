//
//  MVCList.h
//  MVCDemo
//
//  Created by 白仕云 on 2017/2/22.
//  Copyright © 2017年 BSY.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVCListModel.h"

@interface MVCList : UITableView
@property (nonatomic ,strong)MVCListModel *listModel;
@end
