import json
from operator import contains
from typing import List
import unittest
from flask import jsonify
import pytest
from main import app

# @pytest.fixture
# def app():
#     yield app


def test_get_all_container():

    response =  app.test_client().get('/containers')

    containers = json.loads(response.data.decode('utf-8'))

    print("<====>")
    print(type(containers))
    print("<====>")
    
    assert response.status_code == 200
    assert isinstance(containers, list)
    assert type(containers[0]) is dict
    assert containers[0]['Config']['Hostname'] == "dexter-VirtualBox"
