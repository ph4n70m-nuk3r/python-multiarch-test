from api import settings

app = settings.app

@app.route("/", methods=['get'])
def index():
    response = 'Hello World!\n'
    return response
