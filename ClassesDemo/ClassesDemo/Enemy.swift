
class Enemy {
    var health:Int
    var attackStrenght:Int
     
    
    init(health:Int, attackStrenght:Int ) {
        self.health = health
        self.attackStrenght = attackStrenght
    }
    
    func move(){
        print("walk forward")
    }
    func takeDamage(amount:Int) {
        health = health - amount
    }
    
    
    func attack(){
        print("lands a hit and does \(attackStrenght) damage")
    }
}
