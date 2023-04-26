import json
from flask import Flask, request, jsonify;
import firebase_admin
from firebase_admin import credentials, firestore, initialize_app
from flask_cors import CORS
from datetime import datetime

cred = credentials.Certificate('key.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

app = Flask(__name__)
CORS(app)


@app.route('/users', methods=['GET'])
def query_user_records():
    user_id = request.args.get('user_id')

    # Get a reference to the Firestore collection
    collection_ref = db.collection('users_data')

    # Query the collection for the user record with the given ID
    query = collection_ref.where('user_id', '==', user_id).get()

    # Check if the query returned any results
    if not query:
        return jsonify({'error': 'Data not found'}), 404

    # Convert the first result to a dictionary
    record = query[0].to_dict()

    # Return the user record
    return jsonify(record)

@app.route('/users', methods=['POST'])
def create_user_record():
    user_record = json.loads(request.data)

    # Get a reference to the Firestore collection
    collection_ref = db.collection('users_data').document(user_record['user_id'])

    # Check if the user record already exists in the collection
    results = collection_ref.get()
    if results.exists:
        return jsonify({'error': 'User already exists'}), 409

    # Add the user record to the collection
    else:
        collection_ref.set(user_record)
        return jsonify(user_record), 201
    
@app.route('/users', methods=['PUT'])
def update_user_record():
    record = json.loads(request.data)

    # Get a reference to the Firestore collection
    collection_ref = db.collection('users_data')

    # Query the collection for the user record with the given ID
    query = collection_ref.where('user_id', '==', record['user_id']).get()

    # Check if the query returned any results
    if not query:
        return jsonify({'error': 'User not found'}), 404

    # Update the first result with the new data
    document_ref = query[0].reference
    document_ref.update({'dob': record['dob'],
                        'year_group': record['year_group'],
                        'major': record['major'],
                        'campus_residence': record['campus_residence'],
                        'fav_food': record['fav_food'],
                        'fav_movie': record['fav_movie']})

    # Get the updated record
    updated_record = document_ref.get().to_dict()

    # Return the updated record
    return jsonify(updated_record)


@app.route('/comments', methods=['POST'])
def create_comment_record():
    comment_record = json.loads(request.data)
    
    # Get references to the Firestore collection
    comments_collection_ref = db.collection('comments')
    
    # Check if User with that email exists
    user_query = db.collection('users_data').where('email', '==', comment_record['email']).get()
    if not user_query:
        return jsonify({'error': 'No user exists with that email'}), 404
    
    # Add timestamp field to comment_record
    comment_record['timestamp'] = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    # Add the new comment record to the comments collection
    comments_collection_ref.add(comment_record)
    return jsonify(comment_record)

                
                
