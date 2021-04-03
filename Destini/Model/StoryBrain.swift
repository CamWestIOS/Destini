//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Scene {
    var desc = String() // short for description
    var choice1 = String()
    var choice2 = String()
    var choice1Destination = 0
    var choice2Destination = 0
    
    init(d: String, c1: String, c1d: Int, c2: String, c2d: Int) {
        desc = d //"d" is short for desc
        choice1 = c1
        choice1Destination = c1d
        choice2 = c2 // c1 and c2 are shorthand for choice
        choice2Destination = c2d // c1d and c2d are shorthand for choice(x)Destination
    }
}

struct StoryBrain {
    var sceneSelector = 0
    
    let scenes = [
        Scene(
            d: "You’re an adventurer, and you just came back from a treasure-hunting quest which turned sour when you got invaded by a pack of goblins.  You and your party defeated the goblin mob, but you had to leave empty-handed.  Now you’re sitting by yourself at a table in the local tavern.",
            c1: "Order a drink", c1d: 1, c2: "Look around", c2d: 2
        ),
        Scene(
            d: "You wave to the bartender and order some of the local ale, and sit back with the foamy beverage.  As you take a look around the room, you notice a hooded figure sitting silently in the corner.  He doesn’t look like someone you’d want to mess with.",
            c1: "Mess with him anyway", c1d: 3, c2: "Ignore him", c2d: 21
        ),
        Scene(
            d: "You decide not to order a drink.  After all, you didn’t get the treasure from that last quest, and money’s a bit tight.  As you take a look around the room, you notice a hooded figure sitting silently in the corner.  He doesn’t look like someone you’d want to mess with.",
            c1: "Mess with him anyway", c1d: 4, c2: "Ignore him", c2d: 5
        ),
        Scene(
            d: """
You set down your drink and push your chair away from the table.  As you start walking across the room, the hooded man looks up, but not at you.  He’s looking at another patron, stumbling over to his table.
    “Hey man,” the drunken adventurer says to the hooded figure, “Aren’t you Erlathan Elkis, the ranger?”
""",
            c1: "Erlathan Elkis?! He’s a legend!", c1d: 7, c2: "Stay silent", c2d: 5
        ),
        Scene(
            d: """
You set down your drink and push your chair away from the table.  As you start walking across the room, the hooded man looks up, but not at you.  He’s looking at another patron, stumbling over to his table.
    “Hey man,” the drunken adventurer says to the hooded figure, “Aren’t you Erlathan Elkis, the ranger?”
""",
            c1: "Erlathan Elkis?! He’s a legend!", c1d: 13, c2: "Stay silent", c2d: 6
        ),
        Scene(
            d: """
            You decide to watch and see how things play out.  You take a few steps back and grab your drink again, sipping and watching the scene unfold.
            “Depends, who’s asking?” Elkis removes his hood, revealing a scarred, elven face underneath.  He reaches toward his left side, turning slightly to hide what he’s reaching for.
            """,
            c1: "It’s a weapon! (Draw sword)", c1d: 8, c2: "Wait and see", c2d: 9
        ),
        Scene(
            d: """
            You decide to watch and see how things play out.  You take a few steps back and lean against a wall, watching the scene unfold.
            “Depends, who’s asking?” Elkis removes his hood, revealing a scarred, elven face underneath.  He reaches toward his left side, turning slightly to hide what he’s reaching for.
            """,
            c1: "It’s a weapon! (Draw sword)", c1d: 8, c2: "Wait and see", c2d: 9
        ),
        Scene(
            d: """
“Whoa, are you really him?!” You walk over to the table.  Elkis was your idol as a child, a master of archery and magic, protecting the people of the forest.  He’s known for doing magic tricks to gamblers for a chance to win massive amounts of money, or lose it all.
""",
            c1: "Ask for a magic trick", c1d: 16, c2: "Stay silent", c2d: 9
        ),
        Scene(
            d: """
You draw your sword on the ranger, who’s eyes widen as he pulls a coin out of his pocket.  “Guards!” he yells.  The bartender screams and drops a glass as the guards kick down the door and cart you off to prison.
""",
            c1: "Try Again", c1d: 0, c2: "Try Again", c2d: 0
        ),
        Scene(
            d: "The ranger whips around faster than you’ve even seen a mortal move, knocking the drunk patron’s legs out from underneath him and emerging with a narrow black wand.  The tip is on fire, and it flares up as he points it directly at you.",
            c1: "Dodge", c1d: 10, c2: "Put your hands up", c2d: 11
        ),
        Scene(
            d: "You dive to the right as the ranger fires off his spell, unleashing a cone of fire that envelops the entire tavern.  The spell wasn’t really that parryable.",
            c1: "Die", c1d: 12, c2: "Die", c2d: 12
        ),
        Scene(
            d: "You put your hands straight up in the air and freeze!  The ranger looks very confused before releasing a fireball directly at your face.  Oops.",
            c1: "Die", c1d: 12, c2: "Die", c2d: 12
        ),
        Scene(
            d: "YOU ARE DEAD.",
            c1: "Try Again", c1d: 0, c2: "Try Again", c2d: 0
        ),
        Scene(
            d: """
            “Whoa, are you really him?!” You walk over to the table.  Elkis was your idol as a child, a master of archery and magic, protecting the people of the forest.  He’s known for doing magic tricks to gamblers for a chance to win massive amounts of money, or lose it all.
            """,
            c1: "Ask for a magic trick", c1d: 14, c2: "Stay silent", c2d: 9
        ),
        Scene(
            d: """
            Elkis smiles at the mention of a magic trick, and his eyes twinkle as he does it.  “Hand me a gold piece, I’ll turn it into a platinum.”
            """,
            c1: "Hand over 1 GP", c1d: 17, c2: "You can’t have my money!", c2d: 15
        ),
        Scene(
            d: """
Elkis laughs.  “Sorry pal, I don’t do tricks with my own coin.  It’s a lose-lose for me either way.  No risk, no reward for you.”  Elkis turns back to the other patron, who eagerly hands him a coin.  As you walk back to your table, you see the patron win a platinum piece from the ranger and jump around in excitement.  Guess you should’ve taken the risk.
""",
            c1: "Try Again", c1d: 0, c2: "Try again", c2d: 0
        ),
        Scene(
            d: """
Elkis smiles at the mention of a magic trick, and his eyes twinkle as he does it.  “Hand me a gold piece, I’ll turn it into a platinum.”
""",
            c1: "Hand over 1 GP", c1d: 18, c2: "You can’t have my money!", c2d: 15
        ),
        Scene(
            d: """
You hand your only gold coin over to Elkis, and he winks at you before sliding it into one of his palms and putting his hands behind his back.  He brings his hands back in front of you, fists closed.  “Go on, pick a hand!”
""",
            c1: "Right hand", c1d: 19, c2: "Left hand", c2d: 20
        ),
        Scene(
            d: "You reach into your pocket for a gold piece, but find only silver and a few bits of copper.  Then you remember, you only came here with one gold piece to your name.  If you’d gotten that treasure, you might’ve been a little richer.  Guess you shouldn’t have blown your money on that drink.",
            c1: "Try Again", c1d: 0, c2: "Try Again", c2d: 0
        ),
        Scene(
            d: """
            Everyone in the tavern is silent, watching your choice intently.  You point to the ranger’s right hand, and he grins.  The fist turns over and opens to reveal...nothing.  An “aww” sounds around the tavern, and everyone turns back to their drink.  Elkis looks back.  “Sorry, pal, you win some, you lose some.  Come back another day if you want to try again.”  THE END
            """,
            c1: "Start Over", c1d: 0, c2: "Start Over", c2d: 0
        ),
        Scene(
            d: "Everyone in the tavern is silent, watching your choice intently.  You point to the ranger’s left hand, and he grins.  The fist turns over and opens to reveal a shining platinum piece, glittering in the dim light of the tavern.  People cheer, and the drunken man who approached the ranger first gives you a few slaps on the back, congratulating you on your victory.  You may have missed the treasure in your adventure, but you found a bigger treasure right under your nose.  THE END",
            c1: "Play Again!", c1d: 0, c2: "Play again!", c2d: 0
        ),
        Scene(
            d: """
You take another sip of your drink and watch as the hooded man looks up, but not at you.  He’s looking at a different patron, stumbling over to his table.
    “Hey man,” the drunken adventurer says to the hooded figure, “Aren’t you Erlathan Elkis, the ranger?”
""",
            c1: "(approach) Erlathan Elkis?! He’s a legend!", c1d: 7, c2: "Stay silent", c2d: 5
        )
    ]
    
    mutating func nextStory(userChoice: String) {
        if userChoice == getC1() {
            sceneSelector = getc1d()
        } else {
            sceneSelector = getc2d()
        }
    }
    
    func getDesc() -> String {
        return scenes[sceneSelector].desc
    }
    
    func getC1() -> String {
        return scenes[sceneSelector].choice1
    }
    
    func getC2() -> String {
        return scenes[sceneSelector].choice2
    }
    func getc1d() -> Int {
        return scenes[sceneSelector].choice1Destination
    }
    func getc2d() -> Int {
        return scenes[sceneSelector].choice2Destination
    }
}
