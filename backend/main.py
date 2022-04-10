from flask import Flask, jsonify, request
import docker

app = Flask(__name__)

client = docker.from_env()

@app.route('/')
def test_app():
    return 'test endpoints work'


@app.route('/containers', methods=['GET'])
def get_all_container():

    containers = []

    for container in client.containers.list(all = True):
        containers.append(container.attrs)

    #print(containers[0])

    return jsonify(containers)


@app.route('/containers/<containerName>')
def get_by_name(containerName):

    container = client.containers.get(containerName)

    return jsonify(container.attrs)


@app.route('/containers/<containerId>', methods=['GET'])
def get_container_by_id(containerId):

    container = client.containers.get(containerId)

    return jsonify(container.attrs)


@app.route('/container/images', methods=['POST'])
def create_image():

    file_storage = request.files.get('dockerfile', '')
    file_obj = request.files['dockerfile']
    # print(file_obj)
    container_image = client.images.build(
        fileobj = file_obj,
        tag = "custom",
        rm = True
    )
    print(container_image[0])
    return jsonify(container_image[0].attrs)


if __name__ == "__main__":
    app.run(debug=True)