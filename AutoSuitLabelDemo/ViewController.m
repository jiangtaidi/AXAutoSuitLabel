//
//  ViewController.m
//  AutoSuitLabelDemo
//
//  Created by jiangtd on 16/2/17.
//  Copyright © 2016年 jiangtd. All rights reserved.
//

#import "ViewController.h"
#import "AXAutoSuitLabel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet AXAutoSuitLabel *suitLabel;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:@"UITextFieldTextDidChangeNotification" object:nil];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UITextFieldTextDidChangeNotification" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:NO];
}

#pragma mark ============Notice================

-(void)textChanged:(NSNotification*)notice
{
    _suitLabel.text = _textField.text;
}

@end
