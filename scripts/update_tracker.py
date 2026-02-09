#!/usr/bin/env python3
import pandas as pd
from datetime import datetime
import os

def update_tracker():
    fills_path = 'data/comp2_fills.csv'
    summary_path = 'data/comp2_tracker_summary.csv'
    
    if not os.path.exists(fills_path) or os.path.getsize(fills_path) < 100:
        print("❌ No fills logged yet.")
        return
    
    fills = pd.read_csv(fills_path)
    total_complexity = fills['complexity_est'].sum()
    total_trades = len(fills)
    open_positions = len(fills[fills['status'] == 'open'])
    cumulative_pnl = fills['pnl_usd'].sum()
    
    complexity_target = 50.0
    trade_target = 60.0
    
    print(f"\n📊 KYAN COMP #2 TRACKER")
    print(f"Complexity:  {total_complexity:.1f}/{complexity_target}")
    print(f"Trades:      {total_trades}/{int(trade_target)}")
    print(f"PnL:         ${cumulative_pnl:,.2f}")

if __name__ == '__main__':
    update_tracker()
