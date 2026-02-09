# Options Trading - Kyan Competition #2 Refresher
*Updated for Feb 9, 2026 market conditions*

## Current Market Context (Feb 9, 8pm SAST)

**BTC: $68,600** (Bearish structure)
- Recent rejection at $72.2k, failed $70k hold
- Support levels: $66.2k | $63k | $60.1k
- Weak bounce volume, heavy structure

**ETH: $2,025** (Neutral-bearish)
- Down 11% from last week
- Testing triangle support at $2,013
- Extreme Fear sentiment (14/100)

**Market Regime:** Dispersion market, narrow breadth, failed breakouts common

---

## Core Concepts

### What Are Options?
- **Call:** Right to BUY asset at strike before expiry
- **Put:** Right to SELL asset at strike before expiry

### Key Terms
- **Strike:** Exercise price
- **Premium:** Option cost (or credit if selling)
- **Expiry:** Worthless date if not exercised
- **ITM:** Call strike < spot, Put strike > spot
- **OTM:** Call strike > spot, Put strike < spot
- **ATM:** Strike ≈ spot price

---

## Multi-Leg Strategies (Competition-Optimized)

### 1. Bear Put Spread (PRIORITY for current BTC structure)
**Complexity: 0.6 | Best for: Bearish bias**

```
Example: BTC $68.6k → Expecting drop to $63k

BUY  68k Put  (pay $3,200 premium)
SELL 63k Put  (receive $1,400 premium)
***
Net Debit: $1,800
Max Profit: $5,000 - $1,800 = $3,200 (at $63k or below)
Max Loss: $1,800 (above $68k)
Breakeven: $66.2k

When to use: BTC failing to reclaim $70k, volume weak
Exit: Take profit at $63k support test
```

### 2. Iron Condor (ETH range-bound play)
**Complexity: 1.2 | Best for: Neutral-low volatility**

```
Example: ETH $2,025 → Expecting $1,900-$2,250 range

SELL 2,300 Call (collect $150)
BUY  2,500 Call (pay $60)
SELL 1,900 Put  (collect $180)
BUY  1,700 Put  (pay $70)
***
Net Credit: $200
Max Profit: $200 (ETH stays $1,900-$2,300)
Max Loss: $1,800 (outside range)

When to use: After big drop, consolidation expected
Current setup: ETH triangle support holding, low volume
Exit: 50% max profit ($100) or if breaks $1,800/$2,300
```

---

## Greeks Quick Reference

### Delta (Δ) - Directional exposure
- ATM calls/puts: ±0.50 delta
- ITM: ±0.70-0.90 (moves almost 1:1 with spot)
- OTM: ±0.20-0.30 (small spot sensitivity)

**Current market:** Bearish → favor put deltas or short call deltas

### Gamma (Γ) - Delta acceleration
- High near ATM, spikes close to expiry
- **Risk:** BTC moving fast ($68k → $63k) = delta flips quickly
- **Opportunity:** Sell gamma (iron condors) if expecting slow grind

### Theta (Θ) - Time decay
- **Positive theta = you sold options** (iron condors, credit spreads)
- **Negative theta = you bought options** (debit spreads, straddles)
- **Current market:** Low volatility = theta works against long options faster

### Vega (V) - IV sensitivity
- **Long vega = profit from IV spike** (straddles, long options)
- **Short vega = profit from IV crush** (iron condors, credit spreads)
- **Current setup:** Extreme Fear (IV suppressed) → Buying vega = cheap insurance

---

## Position Sizing for Competition

**Testnet capital:** 250k USDC

**Day 1-2 (Learning phase):**
- 20-30% per structure (50k-75k)
- 3-4 concurrent positions
- Test platform, understand fills

**Day 3-5 (Farming phase):**
- 40-50% per structure (100k-125k)
- 6-8 concurrent positions
- Maximize complexity scoring

**Day 6-7 (Lock-in phase):**
- Reduce to 30% per structure
- Close profitable, avoid late liquidation
- Preserve activity streak
