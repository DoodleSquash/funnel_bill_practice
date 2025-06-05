import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Item UI',
      theme: ThemeData(primarySwatch: Colors.blue),
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

          Container(height: 68, color: Color.fromRGBO(255, 255, 255, 1)),

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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      const SizedBox(width: 32),
                      // Tax Info
                      Expanded(flex: 1, child: _TaxInfoForm()),
                      const SizedBox(width: 32),
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
      // width: 730, // <-- Match the SizedBox width above
      padding: const EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 50),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 25, 57, 100),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _LabeledField(
                    label: "Item Type",
                    child: _DropdownField(
                      value: selectedItemType,
                      hint: "Goods",
                      items: const ["Goods", "Services"],
                      onChanged: onItemTypeChanged,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Item Name"),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Add Alias"),
                            ),
                          ],
                        ),
                        _TextField(hint: "Rocket"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Alias Name"),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Remove Alias"),
                            ),
                          ],
                        ),
                        _TextField(hint: "Pocket//."),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: _LabeledField(
                    label: "Add To Group",
                    child: _DropdownField(
                      value: selectedGroup,
                      hint: "Bottles 1L",
                      items: const [
                        "Bottles 1L",
                        "Boxes",
                        "Cartons",
                        "Packets",
                      ],
                      onChanged: onGroupChanged,
                    ),
                  ),
                ),
                Expanded(
                  child: _LabeledField(
                    label: "Unit",
                    child: _DropdownField(
                      value: selectedUnit,
                      hint: "Pcs. (Pieces)",
                      items: const ["Pcs. (Pieces)", "Kg", "Litres", "Meters"],
                      onChanged: onUnitChanged,
                    ),
                  ),
                ),
                Expanded(
                  child: _LabeledField(
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
                ),
              ],
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _LabeledField(
                    label: "Opening Stock Quantity",
                    child: _TextField(hint: "20,000,000 Pcs."),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("price (in rupees)"),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed: () {},
                              child: const Text("change from rupees"),
                            ),
                          ],
                        ),
                        _TextField(hint: "20,000,000 rs."),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: _LabeledField(
                    label: "Product Code",
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "SGMW-24-001 - auto generated",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset(
                          'assets/icons/settings_icon.svg',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: _LabeledField(
                    label: "Note",
                    child: _TextField(hint: "Fnifinf"),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Switch(value: true, onChanged: (_) {}),
                      const Text("Variants"),
                      const SizedBox(width: 16),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text("Create New Variant"),
                      ),
                    ],
                  ),
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
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 251, 255, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Tax Information",
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(width: 8),
              const Text("GST"),
              Switch(value: true, onChanged: (_) {}),
            ],
          ),
          const SizedBox(height: 12),
          _LabeledField(label: "HSN Code", child: _TextField(hint: "6546")),
          const SizedBox(height: 12),
          _LabeledField(label: "Central Tax", child: _TextField(hint: "9%")),
          const SizedBox(height: 12),
          _LabeledField(label: "State Tax", child: _TextField(hint: "9%")),
          const SizedBox(height: 12),
          _LabeledField(label: "IGST", child: _TextField(hint: "9%")),
          const SizedBox(height: 12),
          _LabeledField(label: "Cess", child: _TextField(hint: "9%")),
        ],
      ),
    );
  }
}

class _ReferenceImages extends StatelessWidget {
  const _ReferenceImages();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 708,
      // width: 308,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 251, 255, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue.shade100),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: const Center(
              child: Icon(Icons.image, size: 60, color: Colors.blue),
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.folder_open),
            label: const Text("Change Image"),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Add Reference Document"),
          ),
        ],
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
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 4),
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
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Colors.white, // <-- Ensure white background
        filled: true, // <-- Ensure background is filled
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
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
      items:
          items.map((item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white, // <-- Ensure white background
        filled: true, // <-- Ensure background is filled
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color.fromRGBO(71, 160, 255, 1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color.fromRGBO(71, 160, 255, 1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(71, 160, 255, 1),
            width: 2,
          ),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
      ),
    );
  }
}
