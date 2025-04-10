from flask import Flask, request
import json

# 创建应用对象
app = Flask(__name__)


@app.route("/abc")  # 就是表示http://127.0.0.1:5000/
def hello_world():
    return "hello world!"


@app.route("/scoredata")  # 就是表示http://127.0.0.1:5000/
def score_data():
    file_path = "static/json/tripScore.json"
    with open(file_path, "r", encoding='utf-8') as f:
        data = json.load(f)
        return json.dumps(data, ensure_ascii=False)


@app.route("/rankdata")  # 就是表示http://127.0.0.1:5000/
def rank_data():
    file_path = "static/json/rank.json"
    with open(file_path, "r", encoding='utf-8') as f:
        data = json.load(f)
        return json.dumps(data, ensure_ascii=False)

@app.route("/rankPriceData")  # 就是表示http://127.0.0.1:5000/
def rank_price_data():
    file_path = "static/json/rankPrice.json"
    with open(file_path, "r", encoding='utf-8') as f:
        data = json.load(f)
        return json.dumps(data, ensure_ascii=False)

@app.route("/rankDayData")  # 就是表示http://127.0.0.1:5000/
def rank_day_data():
    file_path = "static/json/rankDay.json"
    with open(file_path, "r", encoding='utf-8') as f:
        data = json.load(f)
        return json.dumps(data, ensure_ascii=False)

@app.route("/hotScoreData")  # 就是表示http://127.0.0.1:5000/
def hot_score_data():
    file_path = "static/json/hotScore.json"
    with open(file_path, "r", encoding='utf-8') as f:
        data = json.load(f)
        return json.dumps(data, ensure_ascii=False)


@app.route("/efscdata")  # 就是表示http://127.0.0.1:5000/
def efsc_data():
    file_path = "static/json/efsc.json"
    with open(file_path, "r", encoding='utf-8') as f:
        data = json.load(f)
        return json.dumps(data, ensure_ascii=False)


@app.route("/prodata")  # 就是表示http://127.0.0.1:5000/
def pro_data():
    file_path = "static/json/pro.json"
    with open(file_path, "r", encoding='utf-8') as f:
        data = json.load(f)
        return json.dumps(data, ensure_ascii=False)


@app.route("/mapdata")  # 就是表示http://127.0.0.1:5000/
def map_data():
    file_path = "static/json/map.json"
    with open(file_path, "r", encoding='utf-8') as f:
        data = json.load(f)
        return json.dumps(data, ensure_ascii=False)


@app.route("/chinadata")  # 就是表示http://127.0.0.1:5000/
def china_data():
    file_path = "static/json/china.json"
    with open(file_path, "r", encoding='utf-8') as f:
        data = json.load(f)
        return json.dumps(data, ensure_ascii=False)


@app.route("/mapprovincedata")
def map_province_data():
    province_name = request.args.get("name")
    file_path = ("static/json/maps/province/" +
                 province_name + ".json")
    with open(file_path, "r", encoding='utf-8') as f:
        data = json.load(f)
        return json.dumps(data, ensure_ascii=False)


@app.route("/radardata")
def radar_data():
    file_path = "static/json/radar.json"
    with open(file_path, "r", encoding='utf-8') as f:
        data = json.load(f)
        return json.dumps(data, ensure_ascii=False)


@app.route("/tripData")
def mec_data():
    file_path = "static/json/tripMonth.json"
    with open(file_path, "r", encoding='utf-8') as f:
        data = json.load(f)
        return json.dumps(data, ensure_ascii=False)


if __name__ == "__main__":
    app.run(debug=True)
