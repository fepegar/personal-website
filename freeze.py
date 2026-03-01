from main import app
from flask_frozen import Freezer
import shutil

app.config["FREEZER_DESTINATION"] = "build"
app.config["FREEZER_RELATIVE_URLS"] = True

freezer = Freezer(app)

if __name__ == "__main__":
    freezer.freeze()
    shutil.copy("static/CNAME", "build/CNAME")
