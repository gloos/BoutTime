//
//  Events.swift
//  BoutTime
//
//  Created by Gary Luce on 24/07/2016.
//  Copyright © 2016 gloos. All rights reserved.
//

import Foundation

class Event {
    var name: String
    var year: Int
    var website: String
    init(name: String, year: Int, website: String) {
        self.name = name
        self.year = year
        self.website = website
    }
}

let lutherKing = Event(name: "Martin Luther King Jr.'s 'I have a dream' speech", year: 1963, website: "https://en.wikipedia.org/wiki/I_Have_a_Dream")
let titanic = Event(name: "The Titanic sunk", year: 1912, website: "https://en.wikipedia.org/wiki/RMS_Titanic")
let mgmLion = Event(name: "Filming the MGM Lion", year: 1929, website: "https://en.wikipedia.org/wiki/Leo_the_Lion_(MGM)")
let wright = Event(name: "Wilbur Wright flies around the Statue of Liberty", year: 1909, website: "https://en.wikipedia.org/wiki/Wright_brothers")
let ww2 = Event(name: "End of World War II", year: 1945, website: "https://en.wikipedia.org/wiki/World_War_II")
let pearlHarbor = Event(name: "Pearl Harbor bombings", year: 1941, website: "https://en.wikipedia.org/wiki/Pearl_Harbor")
let neilArmstrong = Event(name: "Neil Armstrong walked on the moon", year: 1969, website: "https://en.wikipedia.org/wiki/Neil_Armstrong")
let jfkSpeech = Event(name: "JFK gives 'Ich bin ein Berliner' speech in Berlin", year: 1963, website: "https://storify.com/RTEArchives/president-kennedy-in-ireland")
let nine11 = Event(name: "Attacks on New York", year: 2001, website: "https://en.wikipedia.org/wiki/September_11_attacks")
let christianity = Event(name: "The Birth of Christianity", year: 0, website: "google.co.uk")
let franzFerdinand = Event(name: "Assassination of Archduke Franz Ferdinand of Austria", year: 1914, website: "https://en.wikipedia.org/wiki/Archduke_Franz_Ferdinand_of_Austria")
let polandInvasion = Event(name: "Invasion of Poland by Germany", year: 1939, website: "https://en.wikipedia.org/wiki/Invasion_of_Poland")
let bostonTeaParty = Event(name: "Boston Tea Party", year: 1773, website: "https://en.wikipedia.org/wiki/Boston_Tea_Party")
let cook = Event(name: "Captain Cook Killed", year: 1779, website: "https://en.wikipedia.org/wiki/James_Cook")
let jersey = Event(name: "Battle of Jersey", year: 1781, website: "https://en.wikipedia.org/wiki/Battle_of_Jersey")
let trafalgar = Event(name: "Battle of Trafalgar", year: 1805, website: "https://en.wikipedia.org/wiki/Battle_of_Trafalgar")
let beerFlood = Event(name: "London Beer Flood", year: 1814, website: "https://en.wikipedia.org/wiki/London_Beer_Flood")
let napoleon = Event(name: "Death of Napoleon" , year: 1821, website: "https://en.wikipedia.org/wiki/Napoleon")
let londonU = Event(name: "London University is founded", year: 1826, website: "https://en.wikipedia.org/wiki/University_of_London")
let dickens = Event(name: "Dickens publishes a Christmas Carol", year: 1843, website: "https://en.wikipedia.org/wiki/Charles_Dickens")
let iPhone = Event(name: "iPhone introduced", year: 2007, website: "https://en.wikipedia.org/wiki/IPhone")
let thatcher = Event(name: "Margaret Thatcher elected", year: 1975, website: "https://en.wikipedia.org/wiki/Margaret_Thatcher")
let apple = Event(name: "Apple computers launched", year: 1976, website: "https://en.wikipedia.org/wiki/Apple_Inc.")
let football = Event(name: "World's first £1 million footballer is bought", year: 1979, website: "https://en.wikipedia.org/wiki/World_football_transfer_record")
let marathon = Event(name: "First London Marathon", year: 1981, website: "https://en.wikipedia.org/wiki/London_Marathon")


let events = [lutherKing,titanic, mgmLion, wright, ww2, pearlHarbor, neilArmstrong, jfkSpeech, nine11, christianity, franzFerdinand, polandInvasion, bostonTeaParty, cook, jersey, trafalgar, beerFlood, napoleon, londonU, dickens, iPhone, thatcher, apple, football, marathon]

