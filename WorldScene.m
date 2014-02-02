//
//  WorldScene.m
//  Rise-n-Chime
//
//  Created by Isaiah Smith on 2/2/14.
//  Copyright (c) 2014 RIT. All rights reserved.
//

#import "WorldScene.h"

@implementation WorldScene

-(void)didMoveToView:(SKView *)view{
    self.worldNode = [SKSpriteNode spriteNodeWithImageNamed:@"rock.jpg"];
    self.worldNode.position = CGPointMake(view.frame.size.width/2, view.frame.size.height + 200);
    [self addChild:self.worldNode];
}

@end
