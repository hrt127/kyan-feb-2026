# Kyan Competition #2 - Automated Intel & Strategy
# Complexity Dominance & Narrative Alignment

PYTHON=./venv/bin/python3
DATA_DIR=data
SCRIPTS_DIR=scripts
OUTPUTS_DIR=outputs

.PHONY: init morning-brief test-elfa status clean comp2-log update-tracker log-fill view-trades eod-summary

init:
	mkdir -p $(DATA_DIR) $(SCRIPTS_DIR) $(OUTPUTS_DIR) docs
	touch $(DATA_DIR)/market_data.json
	@echo "✓ Project structure initialized"

morning-brief:
	@echo "🚀 [1/4] Fetching Price Data (CoinGecko)..."
	$(PYTHON) $(SCRIPTS_DIR)/fetch_market.py
	@echo "🌐 [2/4] Fetching Narrative Data (Elfa API v2)..."
	$(PYTHON) $(SCRIPTS_DIR)/fetch_narrative.py
	@echo "🧠 [3/4] Running Decision Engine..."
	$(PYTHON) $(SCRIPTS_DIR)/decision_engine.py
	@echo "📊 [4/4] Generating Strategy Matrix..."
	$(PYTHON) $(SCRIPTS_DIR)/generate_strategies.py
	@echo "\n--- KYAN DAILY INTEL READY ---"
	@cat $(OUTPUTS_DIR)/decision_plan.md
	@echo "\n--- AGGRESSIVE TRADE LIST ---"
	@head -n 25 $(OUTPUTS_DIR)/daily_plan.md

test-elfa:
	@echo "Testing Elfa Authentication..."
	export ELFA_API_KEY=$$(grep ELFA_API_KEY .env | cut -d'=' -f2) && curl -s -X GET "https://api.elfa.ai/v2/key-status" -H "x-elfa-api-key: $$ELFA_API_KEY" | jq .

# =============================================================================
# COMPETITION TRACKING SYSTEM
# =============================================================================

update-tracker:
	@$(PYTHON) $(SCRIPTS_DIR)/update_tracker.py

log-fill:
	@$(PYTHON) $(SCRIPTS_DIR)/log_fill_interactive.py

status:
	@echo "📊 Competition Status:"
	@if [ -f data/comp2_tracker_summary.csv ]; then \
		tail -1 data/comp2_tracker_summary.csv | awk -F',' '{print "Day "$$2" | Trades: "$$3"/60 | Complexity: "$$4"/50 | PnL: $$"$$6}'; \
	else \
		echo "No data yet. Run 'make log-fill' after executing trades."; \
	fi

view-trades:
	@if [ -f data/comp2_fills.csv ]; then \
		cat data/comp2_fills.csv | column -t -s',' | less -S; \
	else \
		echo "No trades logged yet."; \
	fi

eod-summary:
	@echo "📈 Generating end-of-day summary..."
	@$(PYTHON) $(SCRIPTS_DIR)/update_tracker.py
	@echo "\n📋 Recent trades:"
	@tail -5 data/comp2_fills.csv | column -t -s','

clean:
	rm -rf $(OUTPUTS_DIR)/*
	rm -rf $(DATA_DIR)/*.json
