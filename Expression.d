interface Expression {
	// this is the common method from the classes we made
	int evaluate();
}
mixin template BinaryExpression() {
	// This is the common implementation code from the classes
	private int a, b;
	this(int left, int right) {
		this.a = left;
		this.b = right;
	}
}
// printResult can evaluate and print any expression class...
// thanks to taking the general interface
void printResult(Expression expression) {
	import std.stdio;
	writeln(expression.evaluate());
}
class AddExpression : Expression {	// inherit from the interface
	mixin BinaryExpression;		// add the shared code
	int evaluate() { 				// implement the method
		return a+b;
	}
}
class SubtractExpression : Expression {
	mixin BinaryExpression;
	int evaluate() {
		return a-b;
	}
}
class BrokenAddExpression : AddExpression {
	this(int left, int right) {
		super(left, right);
	}
	// these changes evaluate to substract instead of add!
	// note the 'override' keyword
	override int evaluate() { return a - b; }
}

int main() {
	import std.stdio;
	auto add = new AddExpression(1, 2);
	write("add: ");
	printResult(add);
	auto substract = new SubtractExpression(2, 1);
	write("subtract: ");
	printResult(substract);		// same function as above
	add = new BrokenAddExpression(1,2);
	write("brokenAdd: ");
	printResult(add);	// prints -1
	return 1;
}
