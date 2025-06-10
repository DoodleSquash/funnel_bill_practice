import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Item UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.0,
            letterSpacing: 0,
          ),
          bodyMedium: TextStyle(
             fontFamily: 'Segoe UI',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.0,
            letterSpacing: 0,
            textBaseline: TextBaseline.alphabetic,
          ),
          bodySmall: TextStyle(
             fontFamily: 'Segoe UI',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.0,
            letterSpacing: 0,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
             fontFamily: 'Segoe UI',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.0,
            letterSpacing: 0,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
      ),
      home: const StockItemScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StockItemScreen extends StatefulWidget {
  const StockItemScreen({super.key});

  @override
  State<StockItemScreen> createState() => _StockItemScreenState();
}

class _StockItemScreenState extends State<StockItemScreen> {
  String selectedItemType = 'Goods';
  String selectedGroup = 'Bottles 1L';
  String selectedUnit = 'Pcs. (Pieces)';
  String selectedCompany = 'Some Company Name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Container(color: Color.fromRGBO(0, 0, 0, 0.2)),
          ),

          Container(
            height: 68,
            color: Color.fromRGBO(255, 255, 255, 1),
            child: Center(
              child: Container(
                width: 400, // Adjust width as needed
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 12,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: Border.all(
                    color: const Color.fromRGBO(168, 209, 255, 1),
                    width: 1,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Company",
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(108, 108, 108, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 8),
                      child: Icon(
                        Icons.search,
                        color: Color.fromRGBO(71, 160, 255, 1),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),

          // Sidebar
          Container(
            width: 225,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 15),
                Container(
                  height: 63,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(235, 244, 255, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromRGBO(235, 244, 255, 1),
                        child: SvgPicture.asset(
                          'assets/icons/Account_png.svg',
                          width: 29,
                          height: 29,
                        ),
                      ),
                      const SizedBox(width: 12),

                      Text(
                        "Shree Ganesh\nMetal Works",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                _SidebarButton(
                  svgAsset: 'assets/icons/dashboard.svg',
                  label: "Dashboard",
                ),
                _SidebarButton(
                  svgAsset: 'assets/icons/Invoices.svg',
                  label: "Invoices",
                ),
                _SidebarButton(
                  svgAsset: 'assets/icons/Inventory.svg',
                  label: "Inventory",
                  selected: true,
                ),
                _SidebarButton(
                  svgAsset: 'assets/icons/Reports.svg',
                  label: "Reports",
                ),
                _SidebarButton(svgAsset: 'assets/icons/Gst.svg', label: "Gst"),
                _SidebarButton(
                  svgAsset: 'assets/icons/All Documents.svg',
                  label: "All Documents",
                ),
                // const Divider(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(247, 247, 247, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      leading: null,
                      trailing: const Icon(
                        Icons.keyboard_arrow_down, // <-- Arrow icon
                        size: 28,
                        color: Colors.black54,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          top: 4,
                          bottom: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/Books.svg',
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Books",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      visualDensity: const VisualDensity(
                        horizontal: 0,
                        vertical: -2,
                      ),
                      childrenPadding: EdgeInsets.zero,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                      children: [
                        _SidebarButton(label: "Party Books"),
                        _SidebarButton(label: "Banking Books"),
                        _SidebarButton(label: "Other Books"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // width: 1568;
          // height: 890;
          // top: 140px;
          // left: 289px;
          // border-radius: 20px;

          // Main Content
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 289),
            child: Container(
              height: 890,
              width: 1568,
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 98,
                top: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Create Stock Item",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Form
                      Expanded(
                        flex: 2, // Give more space to the form if you want
                        child: _StockItemForm(
                          selectedItemType: selectedItemType,
                          onItemTypeChanged: (val) {
                            setState(() {
                              selectedItemType = val!;
                            });
                          },
                          selectedGroup: selectedGroup,
                          onGroupChanged: (val) {
                            setState(() {
                              selectedGroup = val!;
                            });
                          },
                          selectedUnit: selectedUnit,
                          onUnitChanged: (val) {
                            setState(() {
                              selectedUnit = val!;
                            });
                          },
                          selectedCompany: selectedCompany,
                          onCompanyChanged: (val) {
                            setState(() {
                              selectedCompany = val!;
                            }); // Handle company change if needed
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Tax Info
                      Expanded(flex: 1, child: _TaxInfoForm()),
                      const SizedBox(width: 10),
                      // Reference Images
                      Expanded(flex: 1, child: _ReferenceImages()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //
        ],
      ),

      //
    );
  }
}

// ============ COMPONENTS =============

class _SidebarButton extends StatelessWidget {
  final String? svgAsset; // Change from IconData? to String? for SVG asset path
  final String label;
  final bool selected;
  const _SidebarButton({
    this.svgAsset,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          svgAsset != null
              ? SvgPicture.asset(
                svgAsset!,
                width: 24,
                height: 24,
                // color: selected ? Colors.blue : Colors.grey,
              )
              : null,
      title: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.blue : Colors.black,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: selected,
      selectedTileColor: Colors.blue.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    );
  }
}

class _StockItemForm extends StatelessWidget {
  final String selectedItemType;
  final ValueChanged<String?> onItemTypeChanged;
  final String selectedGroup;
  final ValueChanged<String?> onGroupChanged;
  final String selectedUnit;
  final ValueChanged<String?> onUnitChanged;
  final String selectedCompany;
  final ValueChanged<String?> onCompanyChanged;

  const _StockItemForm({
    required this.selectedItemType,
    required this.onItemTypeChanged,
    required this.selectedGroup,
    required this.onGroupChanged,
    required this.selectedUnit,
    required this.onUnitChanged,
    required this.selectedCompany,
    required this.onCompanyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 708,
      padding: const EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 30),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 251, 255, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT COLUMN
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _LabeledField(
                  label: "Item Type",
                  child: _DropdownField(
                    value: selectedItemType,
                    hint: "Goods",
                    items: const ["Goods", "Services"],
                    onChanged: onItemTypeChanged,
                  ),
                ),
                const SizedBox(height: 30),

                // Item Name with Add Alias
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Item Name",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(108, 108, 108, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Add Alias",
                            style: TextStyle(
                              color: Color.fromRGBO(26, 132, 246, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    _TextField(hint: "Rocket"),
                  ],
                ),
                const SizedBox(height: 30),

                // Alias Name with Remove Alias
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Alias Name",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(108, 108, 108, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Remove Alias",
                            style: TextStyle(
                              color: Color.fromRGBO(26, 132, 246, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    _TextField(hint: "Pocket//."),
                  ],
                ),
                const SizedBox(height: 30),

                _LabeledField(
                  label: "Add To Group",
                  child: _DropdownField(
                    value: selectedGroup,
                    hint: "Bottles 1L",
                    items: const ["Bottles 1L", "Boxes", "Cartons", "Packets"],
                    onChanged: onGroupChanged,
                  ),
                ),
                const SizedBox(height: 30),

                _LabeledField(
                  label: "Unit",
                  child: _DropdownField(
                    value: selectedUnit,
                    hint: "Pcs. (Pieces)",
                    items: const ["Pcs. (Pieces)", "Kg", "Litres", "Meters"],
                    onChanged: onUnitChanged,
                  ),
                ),
                const SizedBox(height: 30),

                _LabeledField(
                  label: "Supplied From",
                  child: _DropdownField(
                    value: selectedCompany,
                    hint: "Some Company Name",
                    items: const [
                      "Some Company Name",
                      "Bottles 1L",
                      "Boxes",
                      "Cartons",
                      "Packets",
                    ],
                    onChanged: onCompanyChanged,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 32),
          // RIGHT COLUMN
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Opening Stock Quantity with right-aligned hint
                _LabeledField(
                  label: "Opening Stock Quantity",
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      _TextField(hint: ""),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text("20,000,000 Pcs."),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Price (In Rupees) with Change button and right-aligned hint
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price (In Rupees)",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(108, 108, 108, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Change From Rupees",
                            style: TextStyle(
                              color: Color.fromRGBO(26, 132, 246, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        _TextField(hint: ""),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text("20,000,000 Rs."),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 38),

                _LabeledField(
                  label: "Product Code",

                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "SGMW-24-001 - Auto Generated",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(
                            168,
                            209,
                            255,
                            1,
                          ), // <-- Updated color
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(
                            168,
                            209,
                            255,
                            1,
                          ), // <-- Updated color
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(
                            71,
                            160,
                            255,
                            1,
                          ), // <-- Selected color
                          width: 2,
                        ),
                      ),
                      // isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          'assets/icons/settings_icon.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                _LabeledField(
                  label: "Note",
                  child: _TextField(hint: "Fnifinf"),
                ),

                const SizedBox(height: 30),

                // Variants section at the bottom
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Variants",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(width: 2),
                        SvgPicture.asset(
                          'assets/icons/Variants.svg',
                          width: 13,
                          height: 13,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(235, 244, 255, 1),
                        border: Border.all(
                          color: Color.fromRGBO(
                            168,
                            209,
                            255,
                            1,
                          ), // <-- Updated color
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "This Stock Item Does Not Contain Variants Yet, Click On Create Variants To Add New Item",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 22),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  Colors.white, // <-- Set background to white
                              side: const BorderSide(
                                color: Color.fromRGBO(77, 160, 255, 1),
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: const Size(0, 40),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Create New Variant",
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset(
                                  'assets/icons/Variants plus.svg',
                                  width: 20,
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TaxInfoForm extends StatelessWidget {
  const _TaxInfoForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 708,
      // width: 398,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 251, 255, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tax Information label and GST field with switch
          _LabeledField(
            label: "Tax Information",
            child: TextField(
              decoration: InputDecoration(
                hintText: "GST",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(168, 209, 255, 1),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(168, 209, 255, 1),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(71, 160, 255, 1),
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    height: 32,
                    child: CupertinoSwitch(
                      value: true,
                      onChanged: (val) {},
                      activeTrackColor: Color.fromRGBO(32, 137, 255, 1),
                    ),
                  ),
                ),
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 50,
                  minHeight: 22,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // HSN Code with arrow
          _LabeledField(
            label: "HSN Code",

            child: _DropdownField(
              hint: "6546",
              items: const ["6546", "1234", "7890"], // Example HSN codes
              onChanged: (val) {},
            ),
          ),

          const SizedBox(height: 30),

          // Taxes box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 30),
            decoration: BoxDecoration(
              color: Color.fromRGBO(235, 244, 255, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _TaxRow(label: "Central Tax", value: "9%"),
                const SizedBox(height: 12),
                _TaxRow(label: "State Tax", value: "9%"),
                const SizedBox(height: 12),
                _TaxRow(label: "IGST", value: "9%"),
                const SizedBox(height: 12),
                _TaxRow(label: "Cess", value: "9%"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TaxRow extends StatelessWidget {
  final String label;
  final String value;
  const _TaxRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black54,
               fontFamily: 'Segoe UI',
            ),
          ),
        ),
        SizedBox(
          width: 120,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: value,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(168, 209, 255, 1),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(168, 209, 255, 1),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(71, 160, 255, 1),
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 10,
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
               fontFamily: 'Segoe UI',
            ),
          ),
        ),
      ],
    );
  }
}

class _ReferenceImages extends StatelessWidget {
  const _ReferenceImages();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 708,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 251, 255, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Reference Images",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(108, 108, 108, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color.fromRGBO(152, 201, 255, 1),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    width: 220,
                    height: 220,
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                      bottom: 14,
                    ),
                    child: Image.asset(
                      'assets/images/funnel.png', // Your image asset
                      width: 220,
                      height: 220,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color.fromRGBO(152, 201, 255, 1),
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(0, 40),
                        backgroundColor: Color.fromRGBO(245, 249, 255, 1),
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Change Image",
                            style: TextStyle(
                              color: Color.fromRGBO(40, 40, 40, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 12),
                          SvgPicture.asset(
                            'assets/icons/Folder_icon.svg', // Your folder icon asset
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
            const SizedBox(height: 32), // This pushes the button to the bottom
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color.fromRGBO(77, 160, 255, 1),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(220, 40),
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Add Reference Document",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset(
                        'assets/icons/Variants plus.svg', // Replace with your plus icon asset
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String label;
  final Widget child;
  const _LabeledField({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(108, 108, 108, 1),
            fontWeight: FontWeight.w500, // <-- Use weigh 500 for labels
          ),
        ),
        const SizedBox(height: 15),
        child,
      ],
    );
  }
}

class _TextField extends StatelessWidget {
  final String hint;
  const _TextField({required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400, // <-- weight 400 for input text
      ),
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(168, 209, 255, 1), // <-- Updated color
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(168, 209, 255, 1), // <-- Updated color
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(71, 160, 255, 1), // <-- Selected color
            width: 2,
          ),
        ),
        // isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String? value;
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _DropdownField({
    this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hint),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        // fontFamily: 'Segoe UI', // <-- Removed!
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: Color.fromRGBO(71, 160, 255, 1),
        size: 28,
        // Do NOT set fontFamily here!
      ),
      items:
          items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                 style: const TextStyle(
                   fontFamily: 'Segoe UI', // <-- Removed!
                 ),
              ),
            );
          }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(168, 209, 255, 1),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(168, 209, 255, 1),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(71, 160, 255, 1),
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
      ),
    );
  }
}
