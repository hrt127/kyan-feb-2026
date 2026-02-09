# Kyan Competition #2 - Automated Trading Intelligence System
*Feb 9-15, 2026 | Sepolia Testnet*

## 🎯 Competition Overview

**Prize Structure:**
- 250,000 Krystals (200k activity, 50k top 25)
- Exclusive merch (top 10 only)
- VIP access (#1 only)

**Our Goal:** Top 10 finish via volume + complexity dominance

**Stage 2 baseline:** 48th place, 38.83 complexity
**Comp #2 target:** Top 10, 50+ complexity, 60+ trades, 5,000+ Krystals

---

## 📊 System Architecture

### Automation Pipeline
```
make morning-brief
    ↓
[CoinGecko API] → BTC/ETH prices (live)
[Elfa API v2] → Narrative intelligence
    ↓
[Decision Engine] → Bias calculation
    ↓
[Strategy Matrix] → 17 trade ideas (0.8-1.6 complexity each)
    ↓
outputs/decision_plan.md + outputs/daily_plan.md
    ↓
[EXECUTE ON KYAN TESTNET]
    ↓
make log-fill → Interactive trade logger
    ↓
make update-tracker → Real-time progress metrics
```

---

## 🚀 Quick Start

### Initial Setup
```bash
cd ~/dojo/projects/trading-comps/kyan-feb-2026
make init          # Initialize structure
make morning-brief # Generate first day plan
```

### Daily Workflow
```bash
# 1. Morning (7am SAST)
make morning-brief
cat outputs/decision_plan.md    # Review bias
cat outputs/daily_plan.md        # Review 17 trade ideas

# 2. Execution (throughout day)
# - Execute 8-10 trades on Kyan testnet
# - After each trade:
make log-fill                     # Interactive logger

# 3. Evening (9pm SAST)
make status                       # Quick metrics check
make update-tracker               # Calculate progress
```

---

## 📁 File Structure

```
kyan-feb-2026/
├── scripts/
│   ├── fetch_market.py           # CoinGecko price sync
│   ├── fetch_narrative.py        # Elfa API v2 intel
│   ├── decision_engine.py        # Bias calculation
│   ├── generate_strategies.py   # 17 trade matrix
│   ├── update_tracker.py         # Metrics calculator
│   └── log_fill_interactive.py   # Fill logger
├── outputs/
│   ├── decision_plan.md          # Daily bias + scan
│   └── daily_plan.md             # 17 trade recipes
├── data/
│   ├── comp2_fills.csv           # Trade-by-trade log
│   └── comp2_tracker_summary.csv # Running metrics
├── docs/
│   ├── OPTIONS_BASICS.md         # Strategy refresher
│   ├── KYAN_PLATFORM_GUIDE.md    # Platform mechanics
│   ├── WEEK_STRATEGY_CALENDAR.md # Day-by-day playbook
│   └── PROGRESSION_REPORT.md     # Stage 2 vs Comp #2 evolution
└── Makefile                      # Automation commands
```

---

## 🎮 Command Reference
- `make morning-brief`: Generate daily intel + 17 trade ideas
- `make log-fill`: Interactive CLI to log a filled trade
- `make update-tracker`: Calculate total complexity and trade pace
- `make status`: Quick metrics view
- `make view-trades`: Browse logged trades history
- `make eod-summary`: Day-end report generation

---

## 🏆 Competition Targets
- **60+ total trades**
- **50+ complexity points**
- **Top 10 leaderboard rank**
- **5,000+ Krystals earned**

---

## 🚨 Critical Reminders
1. **Discord link required** for Krystal eligibility.
2. **Layer3 quest mandatory** for Day 1 activity credit.
3. **Complexity > PnL** for this competition's leaderboard mechanics.
