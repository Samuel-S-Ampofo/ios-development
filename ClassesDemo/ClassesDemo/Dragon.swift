class Dragon: Enemy {
    
    var wingSpan = 2
    func talk(speech:String){
    print("Says:\(speech)")
    }
    
    override func move() {
        print("flies  Fowards !!!")
    }
    
    override func attack() {
        super.attack()
        print("spit fire and does 10 damges")
    }
    
    
}
