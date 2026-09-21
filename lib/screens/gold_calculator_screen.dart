import 'package:flutter/material.dart';
import '../utils/gold_formulas.dart';
import '../widgets/number_input.dart';
import '../widgets/result_card.dart';

class GoldCalculatorScreen extends StatefulWidget { const GoldCalculatorScreen({super.key}); @override State<GoldCalculatorScreen> createState() => _GoldCalculatorScreenState(); }
class _GoldCalculatorScreenState extends State<GoldCalculatorScreen> {
  final price=TextEditingController(), weight=TextEditingController(), making=TextEditingController(text:'0'), profit=TextEditingController(text:'0'), tax=TextEditingController(text:'0');
  double raw=0,makingValue=0,profitValue=0,taxValue=0,total=0;
  double n(TextEditingController c)=>double.tryParse(c.text)??0;
  void calculate(){final p=n(price),w=n(weight),m=n(making),pr=n(profit),t=n(tax); setState((){raw=GoldFormulas.rawGoldValue(weight:w,pricePerGram:p);makingValue=GoldFormulas.makingCharge(rawValue:raw,makingPercent:m);profitValue=GoldFormulas.sellerProfit(rawValue:raw,makingValue:makingValue,profitPercent:pr);taxValue=GoldFormulas.tax(taxBase:raw+makingValue+profitValue,taxPercent:t);total=GoldFormulas.finalPrice(rawValue:raw,makingValue:makingValue,profitValue:profitValue,taxValue:taxValue);});}
  @override void dispose(){price.dispose();weight.dispose();making.dispose();profit.dispose();tax.dispose();super.dispose();}
  @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('محاسبه قیمت طلا')),body:ListView(padding:const EdgeInsets.all(20),children:[
    const Text('اطلاعات محاسبه',style:TextStyle(fontSize:18,fontWeight:FontWeight.w800)),const SizedBox(height:14),
    NumberInput(controller:price,label:'قیمت هر گرم طلای ۱۸ عیار',suffix:'تومان',decimal:false),const SizedBox(height:12),NumberInput(controller:weight,label:'وزن طلا',suffix:'گرم'),const SizedBox(height:12),NumberInput(controller:making,label:'اجرت ساخت',suffix:'%'),const SizedBox(height:12),NumberInput(controller:profit,label:'سود فروشنده',suffix:'%'),const SizedBox(height:12),NumberInput(controller:tax,label:'مالیات',suffix:'%'),const SizedBox(height:18),
    FilledButton.icon(onPressed:calculate,icon:const Icon(Icons.calculate_rounded),label:const Text('محاسبه')),if(total>0)...[const SizedBox(height:18),ResultCard(title:'نتیجه',children:[ResultRow(title:'ارزش خام طلا',value:raw),ResultRow(title:'اجرت ساخت',value:makingValue),ResultRow(title:'سود فروشنده',value:profitValue),ResultRow(title:'مالیات',value:taxValue),const Divider(height:20),ResultRow(title:'قیمت نهایی',value:total,bold:true)])]
  ]));
}
