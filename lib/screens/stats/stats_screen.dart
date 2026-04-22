import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/transaction.dart' as model;
import '../../../providers/transaction_provider.dart';
import 'category_breakdown.dart';
import 'pie_chart_card.dart';
import 'time_selector.dart';
import 'interactive_summary_card.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int _selectedMonthOffset = 0;
  int _selectedYearOffset = 0;
  model.TransactionType? _selectedTypeFilter;

  // ✅ Danh sách màu cho các category
  final List<Color> _categoryColors = [
    const Color(0xFF6C63FF),
    const Color(0xFFFF6B6B),
    const Color(0xFF4CAF50),
    const Color(0xFFFF9800),
    const Color(0xFF2196F3),
    const Color(0xFFE91E63),
    const Color(0xFF9C27B0),
  ];

  // ✅ Các category hợp lệ cho từng loại giao dịch
  static const List<model.Category> _incomeCategories = [
    model.Category.salary,
    model.Category.bonus,
    model.Category.investment,
    model.Category.other,
  ];

  static const List<model.Category> _expenseCategories = [
    model.Category.food,
    model.Category.transport,
    model.Category.shopping,
    model.Category.health,
    model.Category.entertainment,
    model.Category.other,
  ];

  DateTime get _currentMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month + _selectedMonthOffset);
  }

  int get _currentYear {
    final now = DateTime.now();
    return now.year + _selectedYearOffset;
  }

  List<model.Transaction> _getMonthly(List<model.Transaction> all) => all
      .where(
        (t) =>
            t.date.year == _currentMonth.year &&
            t.date.month == _currentMonth.month,
      )
      .toList();

  List<model.Transaction> _getYearly(List<model.Transaction> all) =>
      all.where((t) => t.date.year == _currentYear).toList();

  void _toggleTypeFilter(model.TransactionType type) {
    setState(() {
      if (_selectedTypeFilter == type) {
        _selectedTypeFilter = null;
      } else {
        _selectedTypeFilter = type;
      }
    });
  }

  bool _isValidCategory(
    model.Transaction t,
    model.TransactionType? filterType,
  ) {
    if (filterType == null) return true;

    if (filterType == model.TransactionType.income) {
      return _incomeCategories.contains(t.category);
    }

    if (filterType == model.TransactionType.expense) {
      return _expenseCategories.contains(t.category);
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xFF6C63FF),
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Thống kê',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Theo tháng'),
              Tab(text: 'Theo năm'),
            ],
          ),
        ),
        body: Consumer<TransactionProvider>(
          builder: (context, provider, _) {
            return TabBarView(
              children: [
                _buildMonthTabContent(provider.transactions),
                _buildYearTabContent(provider.transactions),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMonthTabContent(List<model.Transaction> all) {
    final monthly = _getMonthly(all);
    final data = _calculateData(monthly, _selectedTypeFilter);

    return Column(
      children: [
        TimeSelector(
          type: TimeSelectorType.month,
          currentMonth: _currentMonth,
          onPrev: () => setState(() => _selectedMonthOffset--),
          onNext: _selectedMonthOffset < 0
              ? () => setState(() => _selectedMonthOffset++)
              : null,
        ),
        _buildFilterStatus(),
        Expanded(
          child: KeyedSubtree(
            key: ValueKey('month-${_selectedTypeFilter?.index ?? -1}'),
            child: _buildContent(
              data,
              DateTime(_currentMonth.year, _currentMonth.month, 1),
              DateTime(_currentMonth.year, _currentMonth.month + 1, 0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildYearTabContent(List<model.Transaction> all) {
    final yearly = _getYearly(all);
    final data = _calculateData(yearly, _selectedTypeFilter);

    return Column(
      children: [
        TimeSelector(
          type: TimeSelectorType.year,
          currentYear: _currentYear,
          onPrev: () => setState(() => _selectedYearOffset--),
          onNext: _selectedYearOffset < 0
              ? () => setState(() => _selectedYearOffset++)
              : null,
        ),
        _buildFilterStatus(),
        Expanded(
          child: KeyedSubtree(
            key: ValueKey('year-${_selectedTypeFilter?.index ?? -1}'),
            child: _buildContent(
              data,
              DateTime(_currentYear, 1, 1),
              DateTime(_currentYear, 12, 31),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterStatus() {
    if (_selectedTypeFilter == null) {
      return const SizedBox.shrink();
    }

    return Container(
      color: const Color(0xFF6C63FF),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _selectedTypeFilter == model.TransactionType.income
                ? Icons.arrow_downward
                : Icons.arrow_upward,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            _selectedTypeFilter == model.TransactionType.income
                ? 'Đang xem: THU'
                : 'Đang xem: CHI',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => setState(() => _selectedTypeFilter = null),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
    );
  }

  _DataResult _calculateData(
    List<model.Transaction> transactions,
    model.TransactionType? filterType,
  ) {
    final List<model.Transaction> baseList = filterType == null
        ? transactions
        : transactions.where((t) => t.type == filterType).toList();

    double totalIncome = 0;
    double totalExpense = 0;

    for (var t in transactions) {
      if (t.type == model.TransactionType.income) {
        totalIncome += t.amount;
      } else {
        totalExpense += t.amount;
      }
    }

    final Map<model.Category, double> categoryMap = {};

    for (var t in baseList.where((t) => _isValidCategory(t, filterType))) {
      categoryMap[t.category] = (categoryMap[t.category] ?? 0) + t.amount;
    }

    return _DataResult(categoryMap, totalExpense, totalIncome, filterType);
  }

  Widget _buildContent(_DataResult data, DateTime startDate, DateTime endDate) {
    final total = data.filterType == model.TransactionType.income
        ? data.totalIncome
        : data.totalExpense;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        InteractiveSummaryCard(
          income: data.totalIncome,
          expense: data.totalExpense,
          selectedFilter: _selectedTypeFilter,
          onTypeTap: _toggleTypeFilter,
        ),
        const SizedBox(height: 16),
        if (_shouldShowEmpty(data))
          _buildEmptyChart()
        else ...[
          // ✅ ĐÃ SỬA: Thêm categoryColors
          PieChartCard(
            expenseMap: data.categoryMap,
            total: total,
            categoryColors: _categoryColors,
          ),
          const SizedBox(height: 16),
          // ✅ ĐÃ SỬA: Thêm categoryColors
          CategoryBreakdown(
            expenseMap: data.categoryMap,
            total: total,
            categoryColors: _categoryColors,
            startDate: startDate,
            endDate: endDate,
          ),
        ],
      ],
    );
  }

  bool _shouldShowEmpty(_DataResult data) {
    return data.categoryMap.isEmpty;
  }

  Widget _buildEmptyChart() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(Icons.pie_chart_outline, size: 64, color: Colors.grey.shade300),
          const SizedBox(height: 12),
          Text(
            _selectedTypeFilter == null
                ? 'Không có dữ liệu'
                : _selectedTypeFilter == model.TransactionType.income
                ? 'Không có khoản THU nào'
                : 'Không có khoản CHI nào',
            style: TextStyle(color: Colors.grey.shade400, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class _DataResult {
  final Map<model.Category, double> categoryMap;
  final double totalExpense;
  final double totalIncome;
  final model.TransactionType? filterType;

  _DataResult(
    this.categoryMap,
    this.totalExpense,
    this.totalIncome,
    this.filterType,
  );
}
