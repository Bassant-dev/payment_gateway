import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment_app/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment_app/features/checkout/presentation/views/payment_details.dart';
import 'package:payment_app/features/checkout/presentation/views/widget/cart_info_item.dart';
import 'package:payment_app/features/checkout/presentation/views/widget/payment_method_bottom_sheet.dart';
import 'package:payment_app/features/checkout/presentation/views/widget/total_price.dart';

import '../../../../../core/widget/custom_button.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(height: 18,),
          Expanded(child: Image.asset("assets/images/Group.png")),
          const SizedBox(height: 25,),
          const OrderInfoItem(
            title:'Order Subtotal' ,
            value: '\$42.97',
          ),
          const SizedBox(height: 3,),
          const OrderInfoItem(
            title:'Discount' ,
            value: '\$0',
          ),
          const SizedBox(height: 3,),
          const OrderInfoItem(
            title:'Shipping' ,
            value: '\$8',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xFFC6C6C6),
          ),
          const TotalPrice(title: 'Total',value: '\$50.97' ,),
          const SizedBox(height: 16,),

           CustomButton(
             text: 'Complete Payment',
             onTap: (){

           showModalBottomSheet(context: context,shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(16)
           ), builder:(context){
             return BlocProvider(
               create: (context)=> PaymentCubit(CheckoutRepoImpl()),
                 child: const PaymentMethodsBottomSheet());
           });

          },
           ),
          const SizedBox(height: 12,),

        ],
      ),
    );
  }


}

