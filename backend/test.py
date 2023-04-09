import json
from flask import jsonify
from unittest.mock import MagicMock, patch
from main import app
import docker


def test_get_all_container():

    response =  app.test_client().get('/containers')

    containers = json.loads(response.data.decode('utf-8'))
    
    assert response.status_code == 200
    assert isinstance(containers, list)
    assert type(containers[0]) is dict
    assert containers[0]['Config']['Hostname'] == "dexter-VirtualBox"


def test_get_container_by_name():

    #to optimize:
    urlParams = ['product_service']

    response =  app.test_client().get('/containers/node_red_bench_test')

    container = json.loads(response.data.decode('utf-8'))

    assert response.status_code == 200
    assert container != None
    assert container['Name'] == "/node_red_bench_test"


@pytest.fixture
def mock_get_container():
    with patch('docker.models.containers.ContainerCollection.get') as mock_get:
        yield mock_get

def test_container_not_exist():

    # Arrange: mock the docker client's get method to raise a NotFound exception
    mock_get_container.side_effect = docker.errors.NotFound("Container not found")
        
    # Act: make a GET request to the endpoint with a non-existent container name
    response = app.test_client().get('/containers/nameWhichNotExist')
        
    # Assert: verify that the response has the expected status code and message
    assert response.status_code == 404
    assert "Container not found" in str(response.data)