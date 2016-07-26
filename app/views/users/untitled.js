function Pet(name,age) {
	this.name = name
	this.age = age
	this.position = 0
}

Pet.prototype.move = function(x) {
	this.position = x
};

function Turtle(name,age) {
	Pet.call(this,name,age)
}

Turtle.prototype = Object.create(Pet.prototype)
Turtle.prototype.constructor = Turtle