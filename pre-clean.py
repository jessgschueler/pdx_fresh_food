import pandas as pd
import googlemaps


def sextant_id(address):
    """
    Determine administrative sextant based on address
    """
    add_list = address.split()
    sextant_list = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']
    for i in add_list:
        if i in sextant_list:
            return i
    return 'UNKNOWN'

def api_call(address):
    """
    Call google maps api to determine neighborhood
    """
    API_KEY = #YOUR API KEY HERE
    gmaps = googlemaps.Client(key=API_KEY)
    return_dict = gmaps.geocode(address)
    try:
        neighborhood = return_dict[0]['address_components'][2]['long_name']
        return neighborhood
    except:
        return 'UNKNOWN'

def add_id(food_df, loc_col, path):
    """
    Add Portland Administrative Sextant to Datasets
    """
    df = pd.read_csv(path, error_bad_lines=False)
    food_df['sextant'] = food_df[loc_col].map(sextant_id)
    food_df.to_csv(path)

def add_neighborhood(food_df, loc_col, path):
    """
    Add neighborhood to datasets
    """
    df = pd.read_csv(path, error_bad_lines=False)
    food_df['nighborhood'] = food_df[loc_col].map(api_call)
    food_df.to_csv(path)
