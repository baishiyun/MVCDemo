//
//  MVCList.m
//  MVCDemo
//
//  Created by 白仕云 on 2017/2/22.
//  Copyright © 2017年 BSY.com. All rights reserved.
//

#import "MVCList.h"
#import "MVCView.h"

static NSString *const MVCViewID  = @"MVCView";
@interface MVCList ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation MVCList

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {



        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[MVCView class] forCellReuseIdentifier:MVCViewID];
        self.estimatedRowHeight = 400;
        self.rowHeight  = UITableViewAutomaticDimension;

    }

    return self;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listModel.array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MVCView *cell  =[tableView dequeueReusableCellWithIdentifier:MVCViewID];
    cell.model = self.listModel.array[indexPath.row];
    return cell;
}
-(void)setListModel:(MVCListModel *)listModel
{

    _listModel = listModel;
    [self reloadData];

}
@end
