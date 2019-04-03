//
//  ViewController.m
//  ButtonTextImagePositionDemo
//
//  Created by yanjiuyuan on 2019/4/3.
//  Copyright © 2019 yanjiuyuan. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Utils.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonCollection;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSegementedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *textSegmentedControl;

- (IBAction)onModeChanged:(UISegmentedControl *)control;
- (IBAction)onTextLengthChanged:(UISegmentedControl *)control;
- (IBAction)onImageSizeChanged:(UISegmentedControl *)control;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (UIButton *button in self.buttonCollection) {
        button.titleLabel.backgroundColor = UIColor.grayColor;
        button.imageView.backgroundColor = UIColor.darkGrayColor;
    }
}

- (IBAction)onModeChanged:(UISegmentedControl *)control {
    for (UIButton *button in self.buttonCollection) {
        switch (control.selectedSegmentIndex) {
            case 0:
                button.titleEdgeInsets = UIEdgeInsetsZero;
                button.imageEdgeInsets = UIEdgeInsetsZero;
                break;
            case 1:
                [button setupImageTopTitleBottom];
                break;
            case 2:
                [button setupImageRightTitleLeft];
                break;
        }
    }
}

- (IBAction)onTextLengthChanged:(UISegmentedControl *)control {
    for (UIButton *button in self.buttonCollection) {
        NSString *text = control.selectedSegmentIndex == 0 ? @"A" : @"Long";
        [button setTitle:text forState:UIControlStateNormal];
    }
    [self onModeChanged:self.modeSegementedControl];
}

- (IBAction)onImageSizeChanged:(UISegmentedControl *)control {
    for (UIButton *button in self.buttonCollection) {
        NSString *imageName = control.selectedSegmentIndex == 0 ? @"finger_normal" : @"task_waring_icon";
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    [self onModeChanged:self.modeSegementedControl];
}

@end
