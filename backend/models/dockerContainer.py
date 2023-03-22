class DockerContainer:
    def __init__(self, id, image, name, status, createdAt) -> None:
        self.id = id
        self.image = image
        self.name = name
        self.status = status
        self.createdAt = createdAt
