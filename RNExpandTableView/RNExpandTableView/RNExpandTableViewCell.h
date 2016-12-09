//
//  RNExpandTableViewCell.h
//  RNExpandTableView
//
//  Created by 婉卿容若 on 2016/12/9.
//  Copyright © 2016年 婉卿容若. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef  void (^expandBlock)(NSIndexPath *indexPath);

@interface demoModel : NSObject

@property (nonatomic ,strong) NSString *No;
@property (nonatomic ,strong) NSString *beginTime;
@property (nonatomic ,strong) NSString *endTime;
@property (nonatomic ,strong) NSString *investMoney;
@property (nonatomic ,strong) NSString *earnTime;
@property (nonatomic ,strong) NSString *earningRatio;
@property (nonatomic ,strong) NSString *deadline;

@end

@interface RNExpandTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *myContentView;

@property (nonatomic, strong) NSIndexPath *myIndexpath;
@property (nonatomic, copy) expandBlock callback;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myContentViewHeightConstraint;


@property (nonatomic ,strong) demoModel *currentModel;



@end



