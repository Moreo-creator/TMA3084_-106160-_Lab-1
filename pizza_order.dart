import 'dart:io';

void main() {
  bool keepOrdering = true;
   //Loop and keep asking for orders until the user decides to exit
   
  while (keepOrdering) {
    print('--- Welcome to the Pizza Shop ---');
    print('Menu:');
    print('1. Small  : \$5');
    print('2. Medium : \$7');
    print('3. Large  : \$10');
    print('---------------------------------');


    
    // Prompt user for pizza size 

    stdout.write('Choose pizza size (Small, Medium, Large): ');
    String? sizeInput = stdin.readLineSync();
    String size = sizeInput?.trim().toLowerCase() ?? '';
    
    int pricePerPizza = 0;
    String formattedSize = '';

    
    // Switch case to determine price based on size the user entered

    switch (size) {
      case 'small':
        pricePerPizza = 5;
        formattedSize = 'Small';
        break;
      case 'medium':
        pricePerPizza = 7;
        formattedSize = 'Medium';
        break;
      case 'large':
        pricePerPizza = 10;
        formattedSize = 'Large';
        break;
      default:
        print('Invalid size entered.\n');
        continue; 
    }

    stdout.write('Enter quantity: ');
    String? qtyInput = stdin.readLineSync();
    int? quantity = int.tryParse(qtyInput ?? '');

    if (quantity == null || quantity <= 0) {
      print('Invalid quantity. Must be a positive integer.\n');
      continue;
    }

    // Calculate and print payment

    int total = pricePerPizza * quantity;
    print('\nOrder Summary:');
    print('Size: $formattedSize');
    print('Quantity: $quantity');
    print('Total Payment: \$$total USD\n');

    // Prompt user to continue or exit
    
    stdout.write('Would you like to place another order? (y/n): ');
    String? answer = stdin.readLineSync()?.trim().toLowerCase();
    if (answer != 'y' && answer != 'yes') {
      keepOrdering = false;
      print('Thank you for your order!');
    }
    print('');
  }
}