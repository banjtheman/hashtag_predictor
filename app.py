from flask import Flask
from flask import request
import os

app = Flask(__name__)

@app.route("/")
def predict():

    #get picture url
    picture = request.args.get('picture')

    #download picture to dir
    os.system("curl -o temp_image "+picture)


    #run predict
    command = "python label_image.py --graph=/tmp/output_graph.pb --labels=/tmp/output_labels.txt --input_layer=Placeholder --output_layer=final_result --image=./temp_image"


    #return predictions
    out = os.popen(command).read()
    return out
