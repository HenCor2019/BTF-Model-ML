import json
import requests

BASE_URL = "http://localhost:8501/v1/models/brain_tumor_detection:predict"

request_json = json.dumps({
   "signature_name": "serving_default",
   "instances": []
})

response = requests.post(BASE_URL, data=request_json)
response.raise_for_status()
response = response.json()

print(response)
