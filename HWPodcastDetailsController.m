//
//  HWPodcastDetailsController.m
//  HelloWorld
//
//  Created by Valery Olexienko on 22.10.13.
//  Copyright (c) 2013 Valery Olexienko. All rights reserved.
//

#import "HWPodcastDetailsController.h"

@interface HWPodcastDetailsController ()

@end

@implementation HWPodcastDetailsController {
    
    __weak IBOutlet UILabel *podcastTitle;
    __weak IBOutlet UITextView *descriptionTextView;
}

HWPodcastModel *podcast = nil;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithPodcast:(HWPodcastModel *)podcastOrNil
{
    self = [super init];
    if (self) {
        podcast = podcastOrNil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [podcastTitle setText:podcast.title];
    [descriptionTextView setText:podcast.description];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
