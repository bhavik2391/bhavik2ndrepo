public class helloworld {
	// instance field to hold a value printed by the constructor
	private int a;

	// Public no-arg constructor delegates to the parameterized constructor
	public helloworld() {
		this(1);
	}

	// Parameterized constructor that sets the instance field and prints it
	public helloworld(int a) {
		this.a = a;
		System.out.println(a);
	}

	public void greet() {
		System.out.println("Hello, World!");
	}

	public static void main(String[] args) {
		helloworld hw = new helloworld();
		hw.greet();
	}
}
