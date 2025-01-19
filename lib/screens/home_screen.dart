import 'package:flutter/material.dart';
import 'package:flutter_food_couriers_ui/screens/food_detail_screen.dart';
import 'package:flutter_food_couriers_ui/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;
  final PageController _bannerController = PageController();
  int _currentBannerIndex = 0;
  int _selectedNavIndex = 0;

  final List<Map<String, String>> _banners = [
    {
      'title': 'Special Offer\nfor March',
      'subtitle': 'We are here with the best\ndeserts intown',
      'buttonText': 'Buy Now',
      'image': 'assets/images/fast_burgers.png',
    },
    {
      'title': 'Super Deals\nThis Week',
      'subtitle': 'Get amazing discounts\non all meals',
      'buttonText': 'Order Now',
      'image': 'assets/images/chicken_cheese.png',
    },
    {
      'title': 'Super Deals\nThis Week',
      'subtitle': 'Try our new special\nrecipes today',
      'buttonText': 'See Menu',
      'image': 'assets/images/pizza.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Icon(Icons.location_on, color: Color(0xFFE31837), size: 20),
            const SizedBox(width: 8),
            const Text(
              'Hi, Hussnain Waheed',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/food_rider.png',
                    // Correct path to your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search food',
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Banner Slider
              SizedBox(
                height: 140,
                child: PageView.builder(
                  controller: _bannerController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentBannerIndex = index;
                    });
                  },
                  itemCount: _banners.length,
                  itemBuilder: (context, index) {
                    final banner = _banners[index];
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFFE31837),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 16,
                            top: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  banner['title']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: const Color(0xFFE31837),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(banner['buttonText']!),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: -20,
                            bottom: -20,
                            child: Image.asset(
                              banner['image']!,
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),

              // Banner Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _banners.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentBannerIndex == index
                          ? const Color(0xFFE31837)
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryItem(
                      index: 0,
                      label: 'Burger',
                    ),
                    const SizedBox(width: 12),
                    _buildCategoryItem(
                      index: 1,
                      label: 'Pizza',
                    ),
                    const SizedBox(width: 12),
                    _buildCategoryItem(
                      index: 2,
                      label: 'Sandwich',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Food Cards
              Row(
                children: [
                  Expanded(
                    child: _buildFoodCard(
                      title: 'Chicken Burger',
                      rating: '4.5',
                      price: '20.00',
                      image: 'assets/images/single_burger.png',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildFoodCard(
                      title: 'Cheese Burger',
                      rating: '4.3',
                      price: '15.00',
                      image: 'assets/images/chicken_cheese.png',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Popular Menu Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Meal Menu',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xFFE31837),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Popular Menu Items
              _buildPopularMenuItem(
                image: 'assets/images/pepper_pizza.png',
                title: 'Pepper Pizza',
                description: '5kg box of Pizza',
                price: '15.00',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) async {
          // Make onTap async
          if (index == 1) {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
            if (result != null) {
              setState(() {
                _selectedNavIndex = result;
              });
            }
          } else {
            setState(() {
              _selectedNavIndex = index;
            });
          }
        },
        selectedItemColor: const Color(0xFFE31837),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem({
    required int index,
    required String label,
  }) {
    bool isSelected = _selectedCategoryIndex == index;

    IconData getIcon() {
      switch (label) {
        case 'Burger':
          return Icons.lunch_dining;
        case 'Pizza':
          return Icons.local_pizza;
        case 'Sandwich':
          return Icons.breakfast_dining;
        default:
          return Icons.fastfood;
      }
    }

    return GestureDetector(
      onTap: () => setState(() => _selectedCategoryIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE31837) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? const Color(0xFFE31837) : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                getIcon(),
                size: 16,
                color: isSelected ? const Color(0xFFE31837) : Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Rest of the methods (_buildFoodCard and _buildPopularMenuItem) remain the same
  Widget _buildFoodCard({
    required String title,
    required String rating,
    required String price,
    required String image,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsScreen(
              title: title,
              price: price,
              image: image,
              rating: rating,
              description: title == 'Chicken Burger'
                  ? 'Delicious chicken burger made with premium chicken fillet, fresh lettuce, tomatoes, and our special sauce.'
                  : 'Classic cheese burger with juicy beef patty, melted cheddar cheese, fresh vegetables, and house special sauce.',
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                Text(
                  rating,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$price',
                  style: const TextStyle(
                    color: Color(0xFFE31837),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE31837),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularMenuItem({
    required String image,
    required String title,
    required String description,
    required String price,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsScreen(
              title: title,
              price: price,
              image: image,
              description: description,
              rating: '4.6',
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      color: Color(0xFFE31837),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFE31837),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
