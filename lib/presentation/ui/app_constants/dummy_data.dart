/*
TODO: Dummy Data can be replaced by API data
*/

import 'package:flutter/material.dart';

class DummyData {
  static const restaurantImages = [
    'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_700,h_400/http://assets.designhill.com/design-blog/wp-content/uploads/2021/11/34.png',
    'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_700,h_400/http://assets.designhill.com/design-blog/wp-content/uploads/2021/11/15.png',
    'https://marketplace.canva.com/EAFpeiTrl4c/1/0/1600w/canva-abstract-chef-cooking-restaurant-free-logo-9Gfim1S8fHg.jpg',
    'https://bcassetcdn.com/public/blog/wp-content/uploads/2022/04/26113733/Chipotle-Mexican-Grill.png',
    'https://images.saymedia-content.com/.image/t_share/MTc2MjcyOTIxMTM5MjkxMzA5/fast-food-restaurant-logos-and-their-hidden-meanings.jpg',
  ];

  // 
  static const menuItems = [
  {
    'id': 1,
    'name': "Ham Burger",
    'price': 13.5,
    'description': "A delicious hamburger with melted cheese and fresh veggies.",
    'restaurantName': "Burger Delight",
    'ratings': 4.5,
    'imageLink':
        'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg',
  },
  {
    'id': 2,
    'name': "Biriyani",
    'price': 49.5,
    'description': "Authentic Indian biriyani cooked with fragrant spices.",
    'restaurantName': "Spice Villa",
    'ratings': 4.8,
    'imageLink':
        'https://healux.in/wp-content/uploads/2020/11/ChickenBiryani.jpg',
  },
  {
    'id': 3,
    'name': "Noodles",
    'price': 15.00,
    'description': "Stir-fried noodles with veggies and choice of protein.",
    'restaurantName': "Asian Wok",
    'ratings': 4.3,
    'imageLink':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRj4fbDzlSwNqWoBrAIR5tG2DH7S2u4I9qTg&s',
  },
  {
    'id': 4,
    'name': "Mutton",
    'price': 26.00,
    'description': "Tender mutton curry with aromatic spices.",
    'restaurantName': "Royal Feast",
    'ratings': 4.6,
    'imageLink':
        'https://eastindianrecipes.net/wp-content/uploads/2022/11/Mutton-Curry-Country-Captain1.jpg',
  },
  {
    'id': 5,
    'name': "Pasta",
    'price': 9.99,
    'description': "Creamy pasta served with a side of garlic bread.",
    'restaurantName': "Italiano Bistro",
    'ratings': 4.2,
    'imageLink':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs2paowiODEqEOJ082fLEWgrlBjvBlGd2GrQ&s',
  },
];


  static const messages = [
    {
      'name': "Iron Man",
      'message': "Donut Was good",
      'image':
          "https://cdn.britannica.com/49/182849-050-4C7FE34F/scene-Iron-Man.jpg"
    },
    {
      'name': "Batman",
      'message': "Rotten Pizza",
      'image':
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH3RSvuAcclnPc4412V8kNkKDZdPvWjvUmyg&s"
    },
    {
      'name': "Spider Man",
      'message': "Pasta was not bad at all",
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-2tuLGjtex92lAjBwmG2i8P8Zxa_8Dz1MEg&s'
    },
  ];
  static List favouriteItems = [
    {
      'name': "Ham Burger",
      'price': 13.5,
      'imageLink':
          'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg',
    },
    {
      'name': "Biriyani",
      'price': 49.5,
      'imageLink':
          'https://healux.in/wp-content/uploads/2020/11/ChickenBiryani.jpg',
    },
    {
      'name': "Noodles",
      'price': 15.00,
      'imageLink':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRj4fbDzlSwNqWoBrAIR5tG2DH7S2u4I9qTg&s',
    },
    {
      'name': "Mutton",
      'price': 26.00,
      'imageLink':
          'https://eastindianrecipes.net/wp-content/uploads/2022/11/Mutton-Curry-Country-Captain1.jpg',
    },
    {
      'name': "Pasta",
      'price': 9.99,
      'imageLink':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs2paowiODEqEOJ082fLEWgrlBjvBlGd2GrQ&s',
    },
  ];

  static const List<Map<String, dynamic>> notifications = [
    {
      'title' : "Your Order Has been Taken By Driver",
      'time' : 'recentrly',
      'icon' : Icons.car_crash,
      'iconColor' : Colors.green
    },
    {
      'title' : "Your Order Has been Cancelled",
      'time' : '10.00 am',
      'icon' : Icons.cancel,
      'iconColor' : Colors.red,
    },
    {
      'title' : "Congrats! You are a Gold Member Now",
      'time' : 'recentrly',
      'icon' : Icons.celebration,
      'iconColor' : Colors.amber
    },

  ];
}
