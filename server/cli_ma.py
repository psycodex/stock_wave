import pandas as pd
import os
import talib

from biz.scan import is_taking_ma_support
from config import DAILY_FOLDER, DATA_DIR

# Load the ISIN and SYMBOL data
isin_df = pd.read_csv(DATA_DIR / 'isin.csv')

# Directory containing daily CSV files for each symbol
daily_data_dir = DAILY_FOLDER

# List to hold symbols taking MA 44 support
ma_support_symbols = []

if __name__ == "__main__":
    # Iterate over each symbol to analyze
    for index, row in isin_df.iterrows():
        symbol = row['SYMBOL'].lower()
        file_path = os.path.join(daily_data_dir, f"{symbol}.csv")

        if os.path.exists(file_path):
            # Load the daily data for the symbol
            daily_df = pd.read_csv(file_path)

            # Ensure the data is sorted by Date
            daily_df['Date'] = pd.to_datetime(daily_df['Date'])
            daily_df = daily_df.sort_values(by='Date')

            # Check if the stock is taking MA 44 support
            if is_taking_ma_support(daily_df, 44):
                ma_support_symbols.append(symbol)

    # Output the results
    print("Symbols taking MA 44 support:")
    for symbol in ma_support_symbols:
        print(symbol)
