from flask import Flask, jsonify
import time
import math
import os

app = Flask(__name__)

@app.route("/")
def health():
    return jsonify({"status": "running"})

@app.route("/cpu")
def cpu_load():
    start = time.time()
    # Burn CPU for ~20 seconds
    while time.time() - start < 20:
        math.sqrt(123456789) ** 2

    return jsonify({"message": "CPU load test completed"})

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080))
    app.run(host="0.0.0.0", port=port)
