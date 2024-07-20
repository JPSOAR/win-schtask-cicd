import requests
import argparse
import json
import os


def get_cat_fact():
    # GET a cat fact from cat-fact.herokuapp.com
    cat_fact_response = requests.get('https://cat-fact.herokuapp.com/facts')
    # Ensure the response is valid
    cat_fact_response.raise_for_status()
    
    return cat_fact_response.json()[0]

def main():
    parser = argparse.ArgumentParser(description='Download a cat fact and save it to a file.')
    parser.add_argument('-outpath', type=str, required=True, help='The path to the output file (including the file name) where the cat fact will be saved.')
    args = parser.parse_args()

    # Create the directory if it doesn't exist
    os.makedirs(os.path.dirname(args.outpath), exist_ok=True)
    
    # Get a cat fact and write to the output path as a json file
    cat_fact = get_cat_fact()
    
    with open(args.outpath, 'w') as f:
        f.write(json.dumps(cat_fact,indent=4))

if __name__ == '__main__':
    main()

