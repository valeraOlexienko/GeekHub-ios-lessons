//
//  HWPodcastDetailsController.m
//  HelloWorld
//
//  Created by Valery Olexienko on 22.10.13.
//  Copyright (c) 2013 Valery Olexienko. All rights reserved.
//

#import "HWPodcastDetailsController.h"

@interface HWPodcastDetailsController ()
@property (weak, nonatomic) IBOutlet UILabel *podcastLable;

@end

@implementation HWPodcastDetailsController

NSString *podcastName = nil;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithPodcastName:(NSString *)podcastNameOrNil
{
    self = [super init];
    if (self) {
        podcastName = podcastNameOrNil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_podcastLable setText:podcastName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
