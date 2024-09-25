import talib


# Function to check if a stock is taking MA 44 support using TA-Lib
def is_taking_ma_support(df, ma_period):
    # Calculate the 44-day moving average of the Close price using TA-Lib
    df['MA44'] = talib.SMA(df['Close'], timeperiod=ma_period)

    # Define a tolerance for support
    tolerance = 0.01

    # Check if the Close price is near or bouncing off the MA 44
    df['Support'] = (df['Close'] <= df['MA44'] * (1 + tolerance)) & (df['Close'] >= df['MA44'] * (1 - tolerance))

    # Return True if any row shows support, else False
    return df['Support'].any()
