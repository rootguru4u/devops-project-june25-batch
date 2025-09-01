from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def home():
    return (
        f"Hello from Flask! 🚀<br>"
        f"RDS: {os.getenv('RDS_ENDPOINT')}<br>"
        f"Redis: {os.getenv('REDIS_ENDPOINT')}<br>"
        f"S3: {os.getenv('S3_BUCKET')}"
    )

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)