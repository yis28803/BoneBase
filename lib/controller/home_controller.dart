// lib/features/pokemon/controllers/home_controller.dart
// Chỉ chịu trách nhiệm UI logic (navigation, toast)
// Toàn bộ state + business logic đã chuyển sang PokemonProvider

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_theme.dart';
import '../providers/pokemon_provider.dart';
import '../screens/pokemon/collection_screen.dart';
import '../screens/pokemon/creature_detail_screen.dart';
import '../screens/pokemon/summon_screen.dart';
import '../data/evolution_chains_data.dart'; // kAllEvolutionChains

class HomeController {
  // ✅ Không còn lưu state ở đây — collected và pullHistory sống trong PokemonProvider

  Future<void> onSummon(BuildContext context) async {
    final provider = context.read<PokemonProvider>();

    if (provider.isCollectionComplete) {
      _showToast(
        context,
        '🎉 Bạn đã sưu tầm tất cả Pokémon!',
        textColor: Colors.white,
      );
      return;
    }

    // Provider chịu trách nhiệm random + build Pokemon object
    final pokemon = await provider.performSummon();
    if (pokemon == null) return;

    if (!context.mounted) return;

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SummonScreen(
          pokemon: pokemon,
          onDismiss: () async {
            // ✅ confirmSummon lưu vào DB + cập nhật Provider state
            await provider.confirmSummon(pokemon);
            if (context.mounted) Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  void openCollection(BuildContext context) {
    final provider = context.read<PokemonProvider>();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CollectionScreen(
          // ✅ Lấy data từ Provider thay vì local list
          collected: provider.collected,
          allChains: kAllEvolutionChains, // ✅ Toàn bộ chain, CollectionScreen tự lọc
          onPokemonTap: (pokemon) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CreatureDetailScreen(
                  pokemon: pokemon,
                  // ✅ Lấy history từ Provider
                  pullHistory: provider.getHistoryForPokemon(pokemon.id),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showToast(
    BuildContext context,
    String message, {
    Color textColor = Colors.white,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: textColor)),
        backgroundColor: AppColors.bgElevated,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}