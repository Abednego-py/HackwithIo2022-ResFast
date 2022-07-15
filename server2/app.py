from flask import Flask, abort, request, jsonify
from flask_cors import CORS
app = Flask(__name__)

CORS(app)

@app.route("/")
def home():
    return "Welcome to ResFast"

@app.route('/api/get_user_details', methods=['POST'])
def get_user_details():
    fullname = request.form.get("fullname")
    phoneNumber = request.form.get("phoneNumber")
    address = request.form.get("address")
    email = request.form.get("email")
    complaint  = request.form.get("complaint")

    return jsonify({
        "fullname": fullname,
        "phoneNumber": phoneNumber,
        "address": address,
        "email" : email,
        "complaint" : complaint
    })

if __name__ == '__main__':
    app.run(debug=True)