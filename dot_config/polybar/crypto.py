import json
import requests

api_url = "https://api.pacoca.io/prices"

btcb_address = "0x7130d2a12b9bcbfae4f2634d864a1ee1ce3ead9c"
weth_address = "0x2170ed0880ac9a755fd29b2688956bd959f933f8"

request_params = {
    "chain": 56,
    "tokens": [weth_address, btcb_address]
}

response = requests.post(api_url, json = request_params)

tokens = response.json()

output_str = "💴 BTC: ${btc_price}  |  💶 ETH: ${eth_price}".format(
# output_str = "B: ${btc_price} | ⧫: ${eth_price} ".format(
    btc_price = round(tokens[btcb_address], 2),
    eth_price = round(tokens[weth_address], 2)
)

print(output_str)
