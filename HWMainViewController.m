//
//  HWMainViewController.m
//  HelloWorld
//
//  Created by Valery Olexienko on 10.10.13.
//  Copyright (c) 2013 Valery Olexienko. All rights reserved.
//

#import "HWMainViewController.h"

@interface HWMainViewController ()

@end

@implementation HWMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, 300, 30)];
        [label setText:@"Hello World (Programatically)"];
        [self.view addSubview:label];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
