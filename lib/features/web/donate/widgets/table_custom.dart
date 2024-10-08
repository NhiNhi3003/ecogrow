import 'package:eco_grow/core/components/flexible_text_custom.dart';
import 'package:eco_grow/core/components/title_text_widget.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/double_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/core/utils/format_date_utils.dart';
import 'package:eco_grow/features/mobile/profile/profile_screen.dart';
import 'package:eco_grow/model/donate_model.dart';
import 'package:flutter/material.dart';
import 'package:pagination_flutter/pagination.dart';

class TableCustomResponsive extends StatefulWidget {
  final List<DonateModel> datas;
  final bool isMobile;

  const TableCustomResponsive(
      {super.key, required this.datas, required this.isMobile});

  @override
  _TableCustomResponsiveState createState() => _TableCustomResponsiveState();
}

class _TableCustomResponsiveState extends State<TableCustomResponsive> {
  int currentPage = 1;
  int rowsPerPage = 10;
  String searchQuery = '';
  final String _tableTitle = 'Danh sách người ủng hộ';
  final String _transactionCode = 'Mã Giao dịch';
  final String _name = 'Tên';
  final String _money = 'Tiền ủng hộ';
  final String _note = 'Ghi chú';
  final String _createAt = 'Ngày giao dịch';
  final String _transactionInf = 'Thông tin giao dịch';

  @override
  Widget build(BuildContext context) {
    final filteredData = widget.datas.where((donate) {
      return donate.transactionCode!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          donate.userName!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          donate.money.toString().contains(searchQuery) ||
          donate.note!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          donate.createAt.toString().contains(searchQuery);
    }).toList();

    final startIndex = (currentPage - 1) * rowsPerPage;
    final endIndex = startIndex + rowsPerPage;
    final displayedData = filteredData.sublist(
      startIndex,
      endIndex > filteredData.length ? filteredData.length : endIndex,
    );

    return widget.isMobile
        ? _buildDataTableWebMobile(
            displayedData: displayedData, filteredData: filteredData)
        : _buildDataTableWeb(
            displayedData: displayedData,
            filteredData: filteredData,
          );
  }

  Widget _buildDataTableWeb({
    required List<DonateModel> displayedData,
    required List<DonateModel> filteredData,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppUtils.webPaddingHoriz),
      child: Column(
        children: [
          TitleTextWidget(title: _tableTitle),
          const SizedBox(height: 20.0),
          _buildSearchBar(width: 400.0, height: 50.0),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              headingTextStyle: AppStyle.headerTableText,
              border: TableBorder.all(color: AppColor.accentColor),
              headingRowColor:
                  const WidgetStatePropertyAll(AppColor.accentColor),
              columns: [
                DataColumn(label: FlexibleTextCustom(_transactionCode)),
                DataColumn(label: FlexibleTextCustom(_name)),
                DataColumn(label: FlexibleTextCustom(_money)),
                DataColumn(label: FlexibleTextCustom(_note)),
                DataColumn(label: FlexibleTextCustom(_createAt)),
              ],
              rows: List.generate(displayedData.length, (index) {
                final row = displayedData[index];
                return DataRow(
                  color: WidgetStateProperty.all(
                    index % 2 == 0 ? Colors.grey[200] : Colors.white,
                  ),
                  cells: [
                    DataCell(Text(row.transactionCode.toString())),
                    DataCell(Text(row.userName.toString())),
                    DataCell(Text(row.money.toVND())),
                    DataCell(Text(row.note.toString())),
                    DataCell(
                        Text(FormatDateUtils.formatDateTime(row.createAt))),
                  ],
                );
              }),
            ),
          ),
          _builPagination(filteredData, pagesVisible: 5),
        ],
      ),
    );
  }

  Widget _builPagination(List<DonateModel> filteredData,
      {required int pagesVisible}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Pagination(
          numOfPages: (filteredData.length / rowsPerPage).ceil(),
          selectedPage: currentPage,
          pagesVisible: pagesVisible,
          onPageChanged: (page) {
            setState(() {
              currentPage = page;
            });
          },
          nextIcon: const Icon(Icons.arrow_forward_ios,
              color: AppColor.accentColor, size: 14),
          previousIcon: const Icon(Icons.arrow_back_ios,
              color: AppColor.accentColor, size: 14),
          activeTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          activeBtnStyle: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColor.accentColor),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(38),
              ),
            ),
          ),
          inactiveBtnStyle: ButtonStyle(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38),
            )),
          ),
          inactiveTextStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar({required double width, required double height}) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchQuery = value;
            currentPage = 1;
          });
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          constraints: BoxConstraints.expand(height: height, width: width),
          hintText: 'Tìm kiếm...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide:
                const BorderSide(color: AppColor.accentColor, width: 2.0),
          ),
        ),
      ),
    );
  }

  Widget _buildDataTableWebMobile({
    required List<DonateModel> displayedData,
    required List<DonateModel> filteredData,
  }) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppUtils.mobilePaddingHoriz),
      child: Column(
        children: [
          TitleTextWidget(title: _tableTitle),
          const SizedBox(height: 20.0),
          _buildSearchBar(width: double.infinity, height: 50.0),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              headingTextStyle: AppStyle.headerTableText,
              border: TableBorder.all(color: AppColor.accentColor),
              headingRowColor:
                  const WidgetStatePropertyAll(AppColor.accentColor),
              // ignore: deprecated_member_use
              dataRowHeight: 140,
              columns: [
                DataColumn(label: FlexibleTextCustom(_transactionInf)),
              ],
              rows: List.generate(displayedData.length, (index) {
                final row = displayedData[index];
                return DataRow(
                  color: WidgetStateProperty.all(
                    index % 2 == 0 ? Colors.grey[200] : Colors.white,
                  ),
                  cells: [
                    DataCell(
                      SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '#${row.transactionCode.toString().toUpperCase()}'),
                            Text('Tên: ${row.userName.toString()}'),
                            Text('Số tiền: ${row.money.toVND()}'),
                            Text('Ghi chú: ${row.note.toString()}'),
                            Text(
                                'Ngày donate: ${FormatDateUtils.formatDateTime(row.createAt)}'),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          _builPagination(filteredData, pagesVisible: 3)
        ],
      ),
    );
  }
}
