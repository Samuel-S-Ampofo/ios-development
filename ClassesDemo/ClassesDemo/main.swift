// class and inheriatance

let skeleton = Enemy(health: 100, attackStrenght: 10)
let skeleton2 = Enemy(health: 100, attackStrenght: 10)
let skeleton3 = Enemy(health: 100, attackStrenght: 10)


let dragon = Dragon(health: 100, attackStrenght: 15)
dragon.wingSpan = 5
dragon.attackStrenght = 15

print(dragon.health)
dragon.attack()
dragon.move()
dragon.talk(speech: "my teeth are swords ! my claws are spear! and mmy wings are hurrican")
