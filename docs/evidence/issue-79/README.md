# Issue #79 - Corrections UI Mobile

## Problèmes corrigés

### 1. Texte tronqué
- **HeroCard (compact)**: Ajout de `max-w-[80px]` pour les noms de héros
- **Slots d'équipe**: Ajout de `max-w-[60px]` pour les noms tronqués
- **Barre d'endurance (game)**: Ajustement de `max-w-[50px] sm:max-w-[60px]`
- **Nom du boss**: Ajout de `max-w-[80px] sm:max-w-[auto]` avec truncate

### 2. Layout shift des compteurs
- **Top bar (BomberCoins)**: Ajout de `min-w-[70px]` + `tabular-nums`
- **Compteurs quotidiens**: Ajout de `min-w-[2.5rem]` + `tabular-nums` 
- **Quick Stats (hub)**: Ajout de `tabular-nums` sur toutes les valeurs
- **Game HUD**: 
  - Coins: `min-w-[60px]` + `tabular-nums`
  - Bombs: `min-w-[40px]` + `tabular-nums`
  - Chests: `min-w-[50px]` + `tabular-nums`
  - Enemies: `min-w-[70px]` + `tabular-nums`
  - Speed button: `tabular-nums`
- **Stamina bars**: `tabular-nums` sur les compteurs
- **Auto-farm**: `tabular-nums` + `whitespace-nowrap`
- **Boss HP**: `tabular-nums` + `whitespace-nowrap`

### 3. Breakpoints mobile
- Ajout du breakpoint `xs: 375px` dans tailwind.config.ts
- Ajustement de `hidden xs:block` → `hidden sm:block` pour le titre BOMBERQUEST

## Captures d'écran à prendre

Pour valider les corrections, prendre des captures sur:

### Avant les corrections (reference)
- `before-mobile-375.png` - Vue mobile à 375px de largeur
- `before-mobile-390.png` - Vue mobile à 390px de largeur

### Après les corrections
- `after-mobile-375.png` - Vue mobile à 375px de largeur  
- `after-mobile-390.png` - Vue mobile à 390px de largeur

## Comment tester

1. Ouvrir Chrome DevTools (F12)
2. Basculer en mode appareil (Ctrl+Shift+M)
3. Tester à 375px et 390px de largeur
4. Vérifier:
   - Les compteurs ne sautent plus
   - Les noms de héros sont lisibles
   - Les boutons sont cliquables
   - Pas de troncature excessive
