//
//  SoundViewController.h
//  Exercise9-Tab
//
//  Created by Vlad Toader on 6/18/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>


@interface SoundViewController : UIViewController {
    SystemSoundID mShakeSoundId;
}

- (IBAction) playShake;
- (IBAction) vibrate;

@end
