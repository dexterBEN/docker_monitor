import json
from flask import jsonify
import pytest
from main import app


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

    response =  app.test_client().get('/containers/product_service')

    container = json.loads(response.data.decode('utf-8'))

    assert response.status_code == 200
    assert container != None
    assert container['Name'] == "/product_service"
