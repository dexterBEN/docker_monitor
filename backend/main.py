from flask import Flask, jsonify, request, make_response
from flask_cors import CORS
import docker
import docker.errors
import json

app = Flask(__name__)
CORS(app)

client = None

@app.route('/')
def test_app():
    return 'test endpoints work'


@app.route('/servers/<ipAdresse>', methods=['GET'])
def connect_to_server(ipAdresse):

    global client
    
    server_adresse = "tcp://"+ipAdresse

    try:
        client = docker.DockerClient(base_url = server_adresse)
    except docker.errors.DockerException as e:
        print("ERROR ====>", e)
        return "502"

    # print(client.containers)
    if client is None:
        return "502"

    return server_adresse


@app.route('/containers', methods=['GET'])
def get_all_container():

    containers = []

    for container in client.containers.list(all = True):
        containers.append(container.attrs)

    #print(containers[0])

    return jsonify(containers)


@app.route('/containers/<containerName>')
def get_by_name(containerName):

    client_res = client.containers.get(containerName)
    # container: DockerContainer = DockerContainer(client_res.attrs['Id'], client_res.attrs['Image'], client_res.attrs['Name'], client_res.attrs['State']['Status'], client_res.attrs['Created'])

    # print("Container -->", container.id)

    return jsonify(client_res.attrs)


@app.route('/containers/<containerId>', methods=['GET'])
def get_container_by_id(containerId):

    container = client.containers.get(containerId)

    return jsonify(container.attrs)


@app.route('/container/images', methods=['POST'])
def create_image():

    file_storage = request.files.get('dockerfile', '')
    file_obj = request.files['dockerfile']
    # print(file_obj)

    try:
        container_image = client.images.build(
            fileobj = file_obj,
            tag = "hello",
            rm = True
        )
    except docker.errors.BuildError as e:
        print(e)


    print(container_image[0])
    return jsonify(container_image[0].attrs)


@app.route('/docker-monitor/images', methods=['GET'])
def get_all_image():

    images = []

    for image in client.images.list(all = True):
        images.append(image.attrs)

    return jsonify(images)


@app.route('/docker-monitor/container/restart/<containerId>', methods=['POST'])
def restart_container(containerId):

    container = client.containers.get(container_id=containerId)

    actionResult = container.restart()

    # print(actionResult.attrs)
    response = make_response("container started well", 200)
    return response


@app.route('/docker-monitor/container/stop/<containerId>', methods=['POST'])
def stop_container(containerId):

    container = client.containers.get(container_id=containerId)

    actionResult = container.stop()
    response = make_response("container started well", 200)
    return response


if __name__ == "__main__":
    app.run(debug=True)