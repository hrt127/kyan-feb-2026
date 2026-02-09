#!/usr/bin/env python3
import csv
from datetime import datetime
import os

def log_fill():
    fills_path = 'data/comp2_fills.csv'
    asset = input("Asset (BTC/ETH): ").upper()
    structure = input("Structure (e.g. iron_condor): ").lower()
    legs = input("Legs: ")
    price = input("Entry Price: ")
    complexity = input("Complexity Estimate: ")
    
    row = {
        'timestamp': datetime.now().isoformat(),
        'trade_id': f"TC2-{datetime.now().strftime('%M%S')}",
        'asset': asset,
        'structure': structure,
        'legs': legs,
        'entry_price': price,
        'exit_price': '0.0',
        'pnl_usd': '0.0',
        'complexity_est': complexity,
        'status': 'open',
        'notes': ''
    }
    
    file_exists = os.path.exists(fills_path)
    with open(fills_path, 'a', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=row.keys())
        if not file_exists or os.path.getsize(fills_path) == 0:
            writer.writeheader()
        writer.writerow(row)
    print("✅ Logged.")

if __name__ == '__main__':
    log_fill()
