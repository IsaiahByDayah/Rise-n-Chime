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
    //self.backgroundColor = [SKColor colorWithRed:55 green:91 blue:128 alpha:1];
    
    self.skyNode = [SKSpriteNode spriteNodeWithImageNamed:@"sky.png"];
    self.skyNode.position = CGPointMake(view.frame.size.width/2, view.frame.size.height*0);
    SKAction *resizeSky = [SKAction resizeToWidth:1200 height:1200 duration:1];
    SKAction *rotateSky = [SKAction rotateByAngle:-1080 duration:86400];
    [self.skyNode runAction: resizeSky];
    [self.skyNode runAction: rotateSky];
    [self addChild:self.skyNode];
    
    
    
    self.snowMaker = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"snowParticle" ofType:@"sks"]]];
    self.snowMaker.position = CGPointMake(view.frame.size.width/2, view.frame.size.height);
    [self addChild:self.snowMaker];
    
    
    self.worldNode = [SKSpriteNode spriteNodeWithImageNamed:@"world.png"];
    self.worldNode.position = CGPointMake(view.frame.size.width/2, view.frame.size.height/9);
    SKAction *resizeWorld = [SKAction resizeToWidth:500 height:500 duration:1];
    SKAction *rotateWorld = [SKAction rotateByAngle:1080 duration:86400];
    [self.worldNode runAction: resizeWorld];
    [self.worldNode runAction: rotateWorld];
    [self addChild:self.worldNode];
    
}

@end
