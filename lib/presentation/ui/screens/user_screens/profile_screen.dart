import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://static.wikia.nocookie.net/kungfupanda/images/7/73/KFP3-promo-po4.jpg/revision/latest?cb=20150726165358',
                fit: BoxFit.fitHeight,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                height: 32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
            ),
            leading: const Icon(Icons.arrow_back),
            leadingWidth: 80,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Dummy Name", style: Theme.of(context).textTheme.titleLarge,),
                      const Spacer(),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.edit_square, size: 30,))
                    ],
                  ),
                  Text("dummyemail@gmail.com", style: Theme.of(context).textTheme.bodyLarge,),
                  const SizedBox(height: 20,),
                  Card(
                    color: Colors.grey.shade50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12,),
                      child: Row(
                        children: [
                          const SizedBox(width: 12,),
                          const Icon(Icons.card_giftcard_rounded, size: 50, color: Colors.orange,),
                          const SizedBox(width: 20,),
                          Text("Your have 3 voucher", style: Theme.of(context).textTheme.titleSmall)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text("Favourite", style: Theme.of(context).textTheme.titleSmall,),

                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
