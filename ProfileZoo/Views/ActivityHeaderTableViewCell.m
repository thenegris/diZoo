//
//  ActivityHeaderTableViewCell.m
//  ProfileZoo
//
//  Created by Diana Granados on 16/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "ActivityHeaderTableViewCell.h"
#import "Formatter.h"

@implementation ActivityHeaderTableViewCell

NSInteger const kDays = 30; 

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Date picker methods

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    self.activityDateTextField = textField;
    UIDatePicker *datePick =  [[UIDatePicker alloc]init];
    datePick.datePickerMode = UIDatePickerModeDate;
    datePick.minimumDate = [NSDate dateWithTimeIntervalSinceNow:-kDays*24*60*60];
    [datePick setDate:[NSDate date]];
    [datePick addTarget:self action:@selector(updateActivityDateTextField:) forControlEvents:UIControlEventValueChanged];
    self.activityDateTextField.inputView = datePick;
    self.activityDateTextField.text = [Formatter formatDate:datePick.date];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
}

// Called when the date picker changes.
- (void)updateActivityDateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.activityDateTextField.inputView;
    self.activityDateTextField.text = [Formatter formatDate:picker.date];
}



@end
