class DockerContainer:
    def __init__(self, id, image, name, status, createdAt) -> None:
        self.Id = id
        self.Image = image
        self.Name = name
        self.Status = status
        self.CreatedAt = createdAt
