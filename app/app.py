from flask import Flask, request
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST

app = Flask(__name__)

# Define a counter metric for requests
REQUEST_COUNTER = Counter('http_requests_total', 'Total HTTP Requests', ['method', 'endpoint'])

@app.route('/')
def index():
    return 'Hello, World!!!!!!'

@app.route('/about')
def about():
    return 'About Page'

# New route for exposing metrics to Prometheus
@app.route('/metrics')
def metrics():
    return generate_latest()

# Custom route for simulating requests (optional)
@app.route('/simulate_request', methods=['POST'])
def simulate_request():
    # Increment the request counter for POST requests to /simulate_request
    REQUEST_COUNTER.labels(method=request.method, endpoint=request.path).inc()
    return 'Simulated Request'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
