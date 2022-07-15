import pandas as pd

def sextant_id(address):
    add_list = address.split()
    sextant_list = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']
    for i in add_list:
        if i in sextant_list:
            return i
    return 'UNKNOWN'

def add_id(food_df, loc_col, path):
    food_df['sextant'] = food_df[loc_col].map(sextant_id)
    food_df.to_csv(path)


def run(path, address):
    df = pd.read_csv(path, error_bad_lines=False)
    add_id(df,address,path)

run('data/CSA_Farm_Dropoff_Locations.csv', 'Location')