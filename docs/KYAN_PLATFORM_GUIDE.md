# Kyan Platform - Combo Builder & Execution Guide
*Sepolia Testnet - Competition #2*

## Interface Overview

### Main Sections
1. **Markets:** BTC-PERP, ETH-PERP, BTC-OPTIONS, ETH-OPTIONS
2. **Combo Builder:** Multi-leg strategy constructor
3. **Portfolio:** Open positions, PnL, margin
4. **Order Book:** Live bids/asks per instrument
5. **Greeks Panel:** Delta, gamma, theta, vega display

---

## Combo Builder: Step-by-Step

### Example 1: Bear Put Spread (Current BTC Setup)

**Goal:** Profit from BTC $68.6k → $63k drop

**Steps:**

1. **Open Combo Builder**
   - Navigate to "Options" → "Combos" → "Create New"

2. **Leg 1: Buy 68k Put**
   ```
   Asset: BTC | Type: Put | Strike: 68,000 | Action: BUY
   ```

3. **Leg 2: Sell 63k Put**
   ```
   Asset: BTC | Type: Put | Strike: 63,000 | Action: SELL
   ```

4. **Review & Submit**
   - Net Debit: ~$1,800
   - Complexity: 0.6 points
   - Order Type: LIMIT

---

## Hunting Order Book Inefficiencies

### 1. Volatility Skew
- Check BTC put chain for overpriced out-of-the-money puts.
- Buy underpriced strikes, sell overpriced ones.

### 2. Bid-Ask Spread Exploitation
- Mid-point pricing (Limit orders) is mandatory.
- WIDE spreads (10%+) are opportunities to capture edge if filled at mid.
