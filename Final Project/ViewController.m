//
//  ViewController.m
//  Final Project
//
//  Created by iD Student on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#define RADIANS(degrees) ((degrees * M_PI) / 180.0)  



@interface ViewController ()

@end

@implementation ViewController
@synthesize goal;
@synthesize brick1;
@synthesize brick2;
@synthesize brick3;
@synthesize gameOver;

- (void)viewDidLoad


{
    CGAffineTransform rotation1 = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(45.0));
    //brick1.transform = rotation1;
    
    [super viewDidLoad];
    
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/audiofile.mp3", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
	
	if (audioPlayer == nil)
		NSLog([error description]);				
	else 
		[audioPlayer play];
    
    
    - (void)dealloc 
    {
        [audioPlayer release];
        [super dealloc];     
    
    }
    
    
        
	// Do any additional setup after loading the view, typically from a nib.
    x = 50;
    y = 50;
    vx = 2.0;
    vy = 3.0;
    bounce = -1.0;
    gravity = 0.3;
    
  //  
    
    
    
    
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bubble.png"]];
	ball.frame = CGRectMake(50, 50, 32, 32);

	[self.view addSubview:ball];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                             target:self
										   selector:@selector(animate)
                                           userInfo:nil
                                            repeats:YES];

goal.frame = CGRectMake(70, 330, 160, 130);
    //Add brick here
    [self.view addSubview:brick1];   
    [self.view addSubview:brick2];
    [self.view addSubview:brick3]; 

    
    
  
    

    
    
}
- (void)viewDidUnload
{
    [self setGoal:nil];
    [self setBrick1:nil];
    [self setBrick2:nil];
    [self setBrick3:nil];
    [self setGameOver:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
       
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch=[[event allTouches]anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    if (touch.view != self.view) {
        [touch view ].center=currentPoint;
    }
    
    //copy for each brick
    if(brick1.center.y<199 || brick1.center.y>201){float xHold = brick1.center.x;
      brick1.center=CGPointMake(xHold,200);
    }
    if(brick2.center.y<299 || brick2.center.y>101){float xHold = brick2.center.x;
        brick2.center=CGPointMake(xHold,150);
    }
    if(brick3.center.y<399 || brick3.center.y>301){float xHold = brick3.center.x;
        brick3.center=CGPointMake(xHold,250);
    }
    
}


-(void)animate



{
    ball.center= CGPointMake(x , y);
    /*velocity*/
    x += vx;
    y += vy;
    /*gravity*/
    vy += gravity;
    /*bounce*/
    //Hits right Side
  
    if(CGRectIntersectsRect(ball.frame, goal.frame))
    { 
        NSLog(@"win!");
        
        
    }
    
    
    if(x > 304)
    {
        x = 304;
        vx *= bounce;
        
    }
    //Hits Left Side 
    else if (x<20)
    {
        x = 20;
        vx *= bounce;
    }
    //Hits top
    if(y<20)
    {
        y=20;
        vy *= bounce;
    }
    //Reset for going out of bounds
    else if(y > 800)
    {
       // x = 160;
        //y=50;
        //vx=4.0;
        //vy=3.0;
        
        //gameOver.alpha=1;
    }
    if (y > 350 && x<200 && x >120  ) {
        //NSLog(@"huzzah!");
        x = 160;
        y = 420;
    }

if(CGRectIntersectsRect(ball.frame, brick1.frame))
{
    y= brick1.center.y;
    //vy *= bounce;
}
    
    if(CGRectIntersectsRect(ball.frame, brick2.frame))
    {
        y= brick2.center.y;
        //vy *= bounce;
    }
    
    
    if(CGRectIntersectsRect(ball.frame, brick3.frame))
    {
        y= brick3.center.y;
    //vy *= bounce;
    }
    
  //  gameOver.alpha=1;
    
    
   // gameOver.text= [NSString stringWithFormat:@"gameOver: %i", gameOver];
    
    
}

@end
