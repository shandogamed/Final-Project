//
//  ViewController.h
//  Final Project
//
//  Created by iD Student on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>




@interface ViewController : UIViewController {
   AVAudioPlayer *audioPlayer;    
    UIImageView *ball;
	NSTimer *timer;
	float x, y, vx, vy, bounce,gravity;
}
@property (weak, nonatomic) IBOutlet UIImageView *goal;
@property (weak, nonatomic) IBOutlet UIView *brick1;
@property (weak, nonatomic) IBOutlet UIView *brick2;
@property (weak, nonatomic) IBOutlet UIView *brick3;
@property (weak, nonatomic) IBOutlet UITextField *gameOver;



@end






