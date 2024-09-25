import duckdb

from config import DATA_DB


class DbManager:
    connection: duckdb.DuckDBPyConnection

    # connection: Connection
    def __init__(self):
        self.connection = duckdb.connect(database=str(DATA_DB), read_only=False)

        create_table_query = """
        CREATE TABLE IF NOT EXISTS stock_data (
            Symbol VARCHAR,
            Date DATE,
            Open FLOAT,
            High FLOAT,
            Low FLOAT,
            Close FLOAT,
            Volume HUGEINT,
            TOTAL_TRADES FLOAT,
            QTY_PER_TRADE FLOAT,
            DLV_QTY FLOAT
        );
        """

        self.connection.execute(create_table_query)
        index_query = "CREATE UNIQUE INDEX IF NOT EXISTS stock_data_unique_idx ON stock_data (SYMBOL, Date)"
        self.connection.execute(index_query)

    def __del__(self):
        self.connection.close()
        pass
