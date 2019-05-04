FROM tensorflow/tensorflow
#Install deps
RUN apt-get update
RUN apt-get install -y curl vim 
RUN pip install instalooter
RUN pip install tensorflow-hub
RUN pip install numpy
RUN pip install flask

#Add files
ADD label_image.py /home
ADD app.py /home
ADD retrain.py /home
ADD app.sh /home

RUN mkdir /home/hashtags
WORKDIR /home

#For Flask API
EXPOSE 5000

#To keep image up
CMD ["tail" ,"-f" ,"/dev/null"]
