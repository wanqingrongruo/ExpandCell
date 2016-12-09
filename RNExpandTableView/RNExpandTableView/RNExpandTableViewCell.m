//
//  RNExpandTableViewCell.m
//  RNExpandTableView
//
//  Created by 婉卿容若 on 2016/12/9.
//  Copyright © 2016年 婉卿容若. All rights reserved.
//

#import "RNExpandTableViewCell.h"


@implementation demoModel

@end

@implementation RNExpandTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (IBAction)expandAction:(id)sender {
    
    if (self.callback) {

      //  self.myContentView.hidden = false;
        [_myContentView removeConstraint:self.myContentViewHeightConstraint];
        NSLayoutConstraint *hConstriant = [NSLayoutConstraint constraintWithItem:_myContentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_myContentView attribute:NSLayoutAttributeHeight multiplier:1 constant:230];
        [_myContentView addConstraint:hConstriant];
        
        [self updateConstraints];
//        [self layoutIfNeeded];
//        [self setNeedsLayout];
        
        self.callback(self.myIndexpath);

       
    }
  }

- (void)setCurrentModel:(demoModel *)currentModel{
    
    
}

@end


