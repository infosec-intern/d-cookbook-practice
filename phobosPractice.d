import std.conv;

int main() {
	typeConversion();
}

void typeConversion() {
	//	auto converted = to!desired_type(variable_to_convert);
	auto i = to!int("123");
	auto s = to!string(123);
}