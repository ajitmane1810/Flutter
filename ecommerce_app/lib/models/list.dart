//  List of Account Settings
import 'package:flutter/material.dart';

List<Map<String, dynamic>> accountSettings = [
  {
    "icon": Icons.location_on_outlined, // Icon for "My Cart"
    "title": "My Addresses",
    "subtitle": "Set your shipping address",
    "onTap": () {
      // Handle navigation to Cart Page
      debugPrint('Navigate to My Address');
    },
  },
  {
    "icon": Icons.shopping_cart_outlined, // Icon for "My Cart"
    "title": "My Cart",
    "subtitle": "Add, remove products and move to checkout",
    "onTap": () {
      // Handle navigation to Cart Page
      debugPrint('Navigate to My Cart');
    },
  },
  {
    "icon": Icons.shopping_bag_outlined, // Icon for "My Orders"
    "title": "My Orders",
    "subtitle": "In progress and Completed Orders",
    "onTap": () {
      // Handle navigation to Orders Page
      debugPrint('Navigate to My Orders');
    },
  },
  {
    "icon": Icons.account_balance_outlined, // Icon for "Bank Account"
    "title": "Bank Account",
    "subtitle": "Withdraw balance to registered bank account",
    "onTap": () {
      // Handle navigation to Bank Account Page
      debugPrint('Navigate to Bank Account');
    },
  },
  {
    "icon": Icons.local_offer_outlined, // Icon for "My Coupons"
    "title": "My Coupons",
    "subtitle": "List of all the discounted coupons",
    "onTap": () {
      // Handle navigation to Coupons Page
      debugPrint('Navigate to My Coupons');
    },
  },
  {
    "icon": Icons.notifications_outlined, // Icon for "Notifications"
    "title": "Notifications",
    "subtitle": "Set any kind of notification message",
    "onTap": () {
      // Handle navigation to Notifications Page
      debugPrint('Navigate to Notifications');
    },
  },
  {
    "icon": Icons.lock_outlined, // Icon for "Account Privacy"
    "title": "Account Privacy",
    "subtitle": "Manage data usage and connected accounts",
    "onTap": () {
      // Handle navigation to Account Privacy Page
      debugPrint('Navigate to Account Privacy');
    },
  },
];