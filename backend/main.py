from flask import Flask


app = Flask(__name__)

@app.route('/')
def test_app():
    return 'test endpoints work'


if __name__ == "__main__":
    app.run(debug=True)