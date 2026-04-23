import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../models/transaction.dart' as model;
import '../../providers/transaction_provider.dart';
import '../add_transaction/camera/camera_capture_screen.dart';
import 'day_detail_screen.dart';
import 'backgrounds/background_manager.dart';
import 'home_package/home_header.dart';
import 'home_package/summary_cards.dart';
import 'home_package/category_filter_bar.dart';
import 'home_package/month_navigation_bar.dart';
import 'home_package/calendar_grid.dart';
import 'home_package/home_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _currentMonth = DateTime(DateTime.now().year, DateTime.now().month);
  model.Category? _selectedCategory;
  model.TransactionType? _selectedType;
  bool _isTypeFilterActive = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<TransactionProvider>(context, listen: false);
      provider.loadUserName();
      provider.loadGreeting();
    });
  }

  // ── Month navigation ─────────────────────────────────────────────────────

  void _prevMonth() {
    HapticFeedback.selectionClick();
    setState(
      () => _currentMonth =
          DateTime(_currentMonth.year, _currentMonth.month - 1),
    );
  }

  void _nextMonth() {
    HapticFeedback.selectionClick();
    setState(
      () => _currentMonth =
          DateTime(_currentMonth.year, _currentMonth.month + 1),
    );
  }

  void _pickMonthYear() {
    HapticFeedback.selectionClick();
    int tempYear = _currentMonth.year;
    int tempMonth = _currentMonth.month;

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1C1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => StatefulBuilder(
        builder: (ctx, setS) => Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Text(
                'Chọn tháng & năm',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => setS(() => tempYear--),
                    icon: const Icon(Icons.chevron_left, color: Colors.white),
                  ),
                  SizedBox(
                    width: 80,
                    child: Text(
                      '$tempYear',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => setS(() => tempYear++),
                    icon: const Icon(Icons.chevron_right, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 2.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 12,
                itemBuilder: (_, i) {
                  final m = i + 1;
                  final isSelected = m == tempMonth;
                  return GestureDetector(
                    onTap: () => setS(() => tempMonth = m),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        gradient: isSelected
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFF6C63FF),
                                  Color(0xFF9D8EFF),
                                ],
                              )
                            : null,
                        color: isSelected
                            ? null
                            : Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : Colors.white.withOpacity(0.1),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'T$m',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white60,
                          fontSize: 14,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () => _currentMonth = DateTime(tempYear, tempMonth),
                    );
                    Navigator.pop(ctx);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Xác nhận',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Filters ──────────────────────────────────────────────────────────────

  void _toggleTypeFilter(model.TransactionType type) {
    HapticFeedback.selectionClick();
    setState(() {
      if (_isTypeFilterActive && _selectedType == type) {
        _isTypeFilterActive = false;
        _selectedType = null;
      } else {
        _isTypeFilterActive = true;
        _selectedType = type;
      }
    });
  }

  // ── Day tap ──────────────────────────────────────────────────────────────

  void _onDayTap(DateTime date, List<model.Transaction> txList) {
    HapticFeedback.selectionClick();
    if (txList.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CameraCaptureScreen(preselectedDate: date),
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => DayDetailScreen(date: date, transactions: txList),
      );
    }
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return BackgroundManager(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: const HomeFab(),
        body: SafeArea(
          child: Consumer<TransactionProvider>(
            builder: (context, provider, _) {
              final allTx = provider.transactions;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    HomeHeader(allTx: allTx)
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: -0.1, end: 0),
                    const SizedBox(height: 12),
                    SummaryCards(
                      allTx: allTx,
                      currentMonth: _currentMonth,
                      selectedType: _selectedType,
                      isTypeFilterActive: _isTypeFilterActive,
                      onToggleType: _toggleTypeFilter,
                    ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
                    const SizedBox(height: 10),
                    CategoryFilterBar(
                      selectedCategory: _selectedCategory,
                      onCategoryChanged: (cat) =>
                          setState(() => _selectedCategory = cat),
                    ).animate().fadeIn(delay: 300.ms, duration: 600.ms),
                    const SizedBox(height: 10),
                    MonthNavigationBar(
                      currentMonth: _currentMonth,
                      onPrev: _prevMonth,
                      onNext: _nextMonth,
                      onPickMonthYear: _pickMonthYear,
                    ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
                    const SizedBox(height: 10),
                    CalendarGrid(
                      allTx: allTx,
                      currentMonth: _currentMonth,
                      selectedCategory: _selectedCategory,
                      selectedType: _selectedType,
                      isTypeFilterActive: _isTypeFilterActive,
                      onDayTap: _onDayTap,
                    ).animate().fadeIn(delay: 500.ms, duration: 600.ms),
                    const SizedBox(height: 100),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}