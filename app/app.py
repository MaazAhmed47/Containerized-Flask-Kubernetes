from flask import Flask
import socket
import os

app = Flask(__name__)

@app.route("/")
def home():
    hostname = socket.gethostname()
    return f"""
    <h1> SNA LAB Project</h1>
    <p><b>Served by Pod:</b> {hostname}</p>
    <p><b>Environment:</b> Kubernetes</p>
    """

@app.route("/health")
def health():
    return "OK", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
