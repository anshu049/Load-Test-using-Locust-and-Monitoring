# app.py

from flask import Flask
from prometheus_client import Counter, generate_latest, REGISTRY
from flask import Response

app = Flask(__name__)

# Define a counter metric
REQUEST_COUNT = Counter('http_requests_total', 'Total HTTP Requests', ['method', 'endpoint', 'status'])

@app.route('/')
def hello_world():
    REQUEST_COUNT.labels(method='GET', endpoint='/', status=200).inc()
    return 'Hello, World!'

@app.route('/metrics')
def metrics():
    return Response(generate_latest(REGISTRY), mimetype='text/plain')

if __name__ == '__main__':
    app.run(debug=True)

