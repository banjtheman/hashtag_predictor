# Instagram Hashtag Predictor
By the end of this workshop you will have built an image classifier trained on Instagram hashtags of your chosing.

## Prerequisites
Docker - https://docs.docker.com/install/

## Getting Started
With docker installed, you can build the image from scratch

`
./build.sh
`

After the image is built, we can use the run script to start our working environment

`
./run.sh
`

## Get Data
In order to get data we will leverage instalooter(https://github.com/althonos/InstaLooter) to grab images
Its import to use the -n flag to limit how many images you want. The example below highlights getting the latest 50 images from 3 different hashtags. 

```
instalooter hashtag paleo hashtags/paleo -n 50  
instalooter hashtag keto hashtags/keto -n 50  
instalooter hashtag python hashtags/python -n 50  
```

The more images the longer training takes, but better predictions can be made.

## Train Model
With the use of Tensorflow Hub (https://github.com/tensorflow/hub) we can use a pretrained model that uses the Inception V3 architecture trained on ImageNet. This gives us a strong baseline to perform transfer learning, which takes everything this model knows already and creats a new model that focuses on our hashtaags. To begin trainning run... 

`
python retrain.py --image_dir ./hashtags/
`

For more info visit: https://www.tensorflow.org/hub/tutorials/image_retraining

## Deploy Model 
When the model has finished training, we can deploy a RESTful API endpoint with flask from the container to make live predictions

Start the flash serevr with
`
./app.sh
`

In another terminal window, you can make curl commands to hit the endpoint and by passing in an image url to the picture url parameter 

Example:
```
curl http://localhost:5000/?picture=https://blog.bulletproof.com/wp-content/uploads/2018/12/Ketogenic-Diet-for-Beginners_header-752x401.jpg
```

## Bouns
With the basics done, can you now build something with your hashtag image classifier? Here are some ideas...

* Machine Learning - Can you create better models, Use Tensorboard to compare models, try changing hyperparameters and getting more data  
* DevOps - Can you create a CI/CD pipeline to get data, train a model, and deploy the image to Cloud?  
* UI/UX - Make a UI that shows a picture from a URL and then displays the predictions, maybe even compare two images    
* Dev - Flask server is pretty brittle, can you add error handling, how about return data in JSON, or make a training endpoint?
