import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  List<String> cartItems = ['mirror', 'seat', 'door'];
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: cartItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // color: AppTheme.of(context).secondaryBackground,
                    boxShadow: [
                      const BoxShadow(
                        blurRadius: 4,
                        color: Color(0x320E151B),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Hero(
                          tag: 'ControllerImage',
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            // child: Image.network(
                            //   cartItems[index].image,
                            //   width: 80,
                            //   height: 80,
                            //   fit: BoxFit.fitWidth,
                            // ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 8),
                                child: Text(
                                  cartItems[index],
                                  style: TextStyle(color: Colors.black),
                                  // style: AppTheme.of(context).subtitle2.override(
                                  //       fontFamily: 'Poppins',
                                  //       color: AppTheme.of(context).primaryText,
                                  //     ),
                                ),
                              ),
                              // Text(
                              //   '\$${cartItems[index].price}',
                              //   style: AppTheme.of(context).bodyText2,
                              // ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 8, 0, 0),
                                // child: Text(
                                //   'Quanity: ${cartItems[index].quantity}',
                                //   style: AppTheme.of(context).bodyText2,
                                // ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete_outline_rounded,
                            color: Color(0xFFE86969),
                            size: 20,
                          ),
                          onPressed: () {
                            // Remove item
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
    ;
  }
}
