import numbers
from statistics import mode
from unicodedata import name
from xml.sax.handler import DTDHandler
from flask import Flask, render_template, redirect, request, url_for, session,  flash, send_file, session, jsonify, send_from_directory
from flask_mysqldb import MySQL, MySQLdb
import flask_excel as excel
import pickle
import numpy as np
import os
import pandas as pd
import sys
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from matplotlib import pyplot
import matplotlib.pyplot as plt
from sklearn.metrics import confusion_matrix, accuracy_score, recall_score, precision_score, classification_report
import pickle
from matplotlib.backends.backend_agg import FigureCanvasAgg as FigureCanvas
from matplotlib.figure import Figure
from flask import Response
import io
import urllib
import bcrypt
import csv
import seaborn
from flask_session import Session
from openpyxl import load_workbook
import joblib
from datetime import datetime
from flask_sqlalchemy import SQLAlchemy
from pyexpat import features
from flask_session import Session


app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'skripsi1'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
mysql = MySQL(app)


model1 = pickle.load(open("informatika.pkl", "rb"))
model2 = pickle.load(open("ind.pkl", "rb"))
model3 = pickle.load(open("elektro.pkl", "rb"))
model4 = pickle.load(open("kimia.pkl", "rb"))
model5 = pickle.load(open("tekpang.pkl", "rb"))

@app.route("/")
@app.route("/pages-login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form['email']
        password = request.form['password'].encode('utf-8')

        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM user WHERE email=%s", (email,))
        user = cur.fetchone()
        cur.close()
        if len(user) > 0:
            if bcrypt.hashpw(password, user['password'].encode('utf-8')) == user['password'].encode('utf-8'):
                session['loggedin'] = True
                session['posisi'] = user['posisi']
                session['name'] = user['name']
                session['email'] = user['email']
                return redirect(url_for('index'))
            else:
                flash('Email atau Password salah', 'danger')
        else:
            return render_template("pages-login.html")
    return render_template("pages-login.html")


@app.route("/pages-register", methods=["GET", "POST"])
def register():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        posisi = request.form['posisi']
        password = request.form['password'].encode('utf-8')
        hash_password = bcrypt.hashpw(password, bcrypt.gensalt())

        cur = mysql.connection.cursor()
        cur.execute(
            'SELECT * FROM user WHERE email=%s', (email, ))
        user = cur.fetchone()
        if user is None:
            cur.execute("INSERT INTO user (name,email,password,posisi) VALUES (%s,%s,%s,%s)",
                        (name, email, hash_password, posisi))
            mysql.connection.commit()
            session['name'] = name
            session['email'] = email
            session['posisi'] = posisi
            flash('Registrasi Berhasil', 'success')
            return redirect(url_for("register"))
        else:
            flash('Username atau Email sudah ada', 'danger')
    return render_template('pages-register.html')

@app.route("/user")
def user():
    # make connection to mysql
    cur = mysql.connection.cursor()
    if 'loggedin' in session :
        if session['posisi'] in ['Tata Usaha', 'Prodi']:
            # Eksekusi query SELECT
            cur.execute("SELECT * FROM user")
            # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
            data = cur.fetchall()

            # menyisipkan data ke tampil_user.html
            return render_template('user.html', user=data)
        else:
            return render_template('pages-error-404.html')
    return redirect(url_for('pages-login'))

@app.route('/edit_user/<id>', methods=["POST", "GET"])
def edit_user(id):
    if 'loggedin' in session:
        if session['posisi'] == 'Tata Usaha':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM user WHERE id=%s', (id))
            data = cur.fetchone()
            if request.method == 'POST':
                id = request.form['id']
                name = request.form['name']
                password = request.form['password'].encode('utf-8')
                hash_password = bcrypt.hashpw(password, bcrypt.gensalt())
                email = request.form['email']
                posisi = request.form['posisi']

                sql = "UPDATE user SET name=%s, password=%s, email=%s, posisi=%s WHERE id=%s"
                val = (name, hash_password, email, posisi, id)
                cur.execute(sql, val)
                mysql.connection.commit()
                flash('Data berhasil diubah', 'success')
            return render_template('edit_user.html', data=data)
        else:
            flash('Silahkan Login Dahulu', 'danger')
    return redirect(url_for('pages-login'))

# fungsi untuk menghapus data

@app.route('/hapus_user/<id>', methods=['GET', 'POST'])
def hapus_user(id):
    if 'loggedin' in session and session['posisi'] in ['Tata Usaha', 'Prodi']:
        cur = mysql.connection.cursor()
        cur.execute('DELETE FROM user WHERE id=%s', (id))
        mysql.connection.commit()
        return redirect(url_for('user'))
    else:
        flash('Silahkan Login Dahulu', 'danger')
    return redirect(url_for('pages-login'))


@app.route('/logout')
def logout():
    session.clear()
    return render_template('pages-login.html')

@app.route("/index")
def index():
    # Logika untuk halaman utama (index) Anda
    return render_template('index.html')

def industri(cur, df):
    plt.switch_backend('agg')
    df = df.reset_index(drop=True)
    df.columns = ['nim','nama','prodi','Lama Penulisan','SKS','IPK','TOEFL','Kelas']
    def_status = 0
    df.fillna(def_status, inplace = True)
    data = df.loc[:, ['Lama Penulisan', 'SKS', 'IPK', 'TOEFL']]
    X = data
    predictions = model2.predict(X)
    hasil_prediksi = pd.Series(predictions).map({0: "Tepat Waktu", 1: "Tidak Tepat Waktu"})
    df['Hasil'] = hasil_prediksi

    df = df[['nim', 'nama', 'prodi', 'Lama Penulisan', 'SKS', 'IPK', 'TOEFL', 'Hasil']]
    
    df.to_excel('dataset/Klasifikasi_industri.xlsx', float_format='%.2f', index=None)
    
    result = df

    result['Hasil'].value_counts().plot(kind='bar', color=['skyblue', 'orange'])

    # Menyimpan plot
    plt.savefig('static/assets/img/pred_industri.png', bbox_inches="tight")

    df_list = result.values.tolist()

    cur.execute("TRUNCATE TABLE industri")
    cur.connection.commit()

    sql = "INSERT INTO industri (nim, nama, prodi, lama_penulisan, sks, ipk, toefl, class) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
        cur.execute(sql, val)
    cur.connection.commit()

    return result

def informatika(cur, df):
    plt.switch_backend('agg')
    df = df.reset_index(drop=True)
    df.columns = ['nim','nama','prodi','Lama Penulisan','SKS','IPK','TOEFL','Kelas']
    def_status = 0
    df.fillna(def_status, inplace = True)
    data = df.loc[:, ['Lama Penulisan', 'SKS', 'IPK', 'TOEFL']]
    X = data
    predictions = model1.predict(X)
    hasil_prediksi = pd.Series(predictions).map({0: "Tepat Waktu", 1: "Tidak Tepat Waktu"})
    df['Hasil'] = hasil_prediksi

    df = df[['nim', 'nama', 'prodi', 'Lama Penulisan', 'SKS', 'IPK', 'TOEFL', 'Hasil']]
    
    df.to_excel('dataset/Klasifikasi_industri.xlsx', float_format='%.2f', index=None)
    
    result = df

    # Membuat plot bar dengan dua warna
    result['Hasil'].value_counts().plot(kind='bar', color=['skyblue', 'orange'])

    # Menyimpan plot
    plt.savefig('static/assets/img/pred_informatika.png', bbox_inches="tight")

    df_list = result.values.tolist()

    cur.execute("TRUNCATE TABLE informatika")
    cur.connection.commit()

    sql = "INSERT INTO informatika (nim, nama, prodi, lama_penulisan, sks, ipk, toefl, class) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
        cur.execute(sql, val)
    cur.connection.commit()

    return result

def kimia(cur, df):
    plt.switch_backend('agg')
    df = df.reset_index(drop=True)
    df.columns = ['nim','nama','prodi','Lama Penulisan','SKS','IPK','TOEFL','Kelas']
    def_status = 0
    df.fillna(def_status, inplace = True)
    data = df.loc[:, ['Lama Penulisan', 'SKS', 'IPK', 'TOEFL']]
    X = data
    predictions = model2.predict(X)
    hasil_prediksi = pd.Series(predictions).map({0: "Tepat Waktu", 1: "Tidak Tepat Waktu"})
    df['Hasil'] = hasil_prediksi

    df = df[['nim', 'nama', 'prodi', 'Lama Penulisan', 'SKS', 'IPK', 'TOEFL', 'Hasil']]
    
    df.to_excel('dataset/Klasifikasi_kimia.xlsx', float_format='%.2f', index=None)
    
    result = df

    # memasukan hasil ke variabel result
    result = df

     # Membuat plot bar dengan dua warna
    result['Hasil'].value_counts().plot(kind='bar', color=['skyblue', 'orange'])

    # Menyimpan plot
    plt.savefig('static/assets/img/pred_kimia.png', bbox_inches="tight")

    df_list = result.values.tolist()

    cur.execute("TRUNCATE TABLE kimia")
    cur.connection.commit()

    sql = "INSERT INTO kimia (nim, nama, prodi, lama_penulisan, sks, ipk, toefl, class) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
        cur.execute(sql, val)
    cur.connection.commit()

    return result

def elektro(cur, df):
    plt.switch_backend('agg')
    df = df.reset_index(drop=True)
    df.columns = ['nim','nama','prodi','Lama Penulisan','SKS','IPK','TOEFL','Kelas']
    def_status = 0
    df.fillna(def_status, inplace = True)
    data = df.loc[:, ['Lama Penulisan', 'SKS', 'IPK', 'TOEFL']]
    X = data
    predictions = model2.predict(X)
    hasil_prediksi = pd.Series(predictions).map({0: "Tepat Waktu", 1: "Tidak Tepat Waktu"})
    df['Hasil'] = hasil_prediksi

    df = df[['nim', 'nama', 'prodi', 'Lama Penulisan', 'SKS', 'IPK', 'TOEFL', 'Hasil']]
    
    df.to_excel('dataset/Klasifikasi_elektro.xlsx', float_format='%.2f', index=None)
    
    # memasukan hasil ke variabel result
    result = df

    # Membuat plot bar dengan dua warna
    result['Hasil'].value_counts().plot(kind='bar', color=['skyblue', 'orange'])

    # Menyimpan plot
    plt.savefig('static/assets/img/pred_elektro.png', bbox_inches="tight")

    df_list = result.values.tolist()

    cur.execute("TRUNCATE TABLE elektro")
    cur.connection.commit()

    sql = "INSERT INTO elektro (nim, nama, prodi, lama_penulisan, sks, ipk, toefl, class) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
        cur.execute(sql, val)
    cur.connection.commit()

    return result

def tekpang(cur, df):
    plt.switch_backend('agg')
    df = df.reset_index(drop=True)
    df.columns = ['nim','nama','prodi','Lama Penulisan','SKS','IPK','TOEFL','Kelas']
    def_status = 0
    df.fillna(def_status, inplace = True)
    data = df.loc[:, ['Lama Penulisan', 'SKS', 'IPK', 'TOEFL']]
    X = data
    predictions = model2.predict(X)
    hasil_prediksi = pd.Series(predictions).map({0: "Tepat Waktu", 1: "Tidak Tepat Waktu"})
    df['Hasil'] = hasil_prediksi

    df = df[['nim', 'nama', 'prodi', 'Lama Penulisan', 'SKS', 'IPK', 'TOEFL', 'Hasil']]
    
    df.to_excel('dataset/Klasifikasi_tekpang.xlsx', float_format='%.2f', index=None)
    
    result = df
    
    # Membuat plot bar dengan dua warna
    result['Hasil'].value_counts().plot(kind='bar', color=['skyblue', 'orange'])

    # Menyimpan plot
    plt.savefig('static/assets/img/pred_tekpang.png', bbox_inches="tight")
    df_list = result.values.tolist()

    cur.execute("TRUNCATE TABLE tekpang")
    cur.connection.commit()

    sql = "INSERT INTO tekpang (nim, nama, prodi, lama_penulisan, sks, ipk, toefl, class) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
        cur.execute(sql, val)
    cur.connection.commit()

    return result

@app.route("/prediksi", methods=["POST", "GET"])
def prediksi():
    if 'loggedin' in session and 'posisi' in session and (session['posisi'] == 'Tata Usaha' or session['posisi'] == 'Prodi'):
        if session['posisi'] == 'Tata Usaha':

            cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

            if request.method == 'GET':
                return render_template('prediksi.html')

            elif request.method == 'POST':
                excel_file = request.files["file"]
                df = pd.read_excel(excel_file)
                dataset_type = request.form["datasetType"]

                if dataset_type == 'Informatika':
                    result = informatika(cur, df)

                elif dataset_type == 'Teknik Industri':
                    result = industri(cur, df)

                elif dataset_type == 'Teknik Elektro':
                    result = elektro(cur, df)

                elif dataset_type == 'Teknik Kimia':
                    result = kimia(cur, df)
                
                elif dataset_type == 'Teknologi Pangan':
                    result = tekpang(cur,df)

                else:
                    return render_template('pages-error-404.html')

                hasil = result.to_html(classes='table', justify='center').replace(
                    "<thead>", "<thead class='thead-primary table-hover'>")

                # menyisipkan data ke hasil_cluster
                return render_template('result.html', hasil=hasil)
            else:
                return render_template('prediksi.html')
        else:
            return render_template('pages-error-404.html')
    flash('Silahkan Login Dahulu', 'danger')
    return redirect(url_for('pages-login'))


@app.route("/result")
def result():
    return render_template("result.html")

@app.route("/hasil-infor")
def hasil_infor():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    # Eksekusi query SELECT
    cur.execute("SELECT * FROM informatika")
    # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
    data = cur.fetchall()

    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM informatika WHERE class = 'Tidak Tepat Waktu'")
    data0 = cur.fetchone()
    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM informatika WHERE class = 'Tepat Waktu'")
    data1 = cur.fetchone()

    # menyisipkan data ke tampil_user.html
    return render_template('hasil-infor.html', data=data, data0=data0, data1=data1)



@app.route("/hasil-industri")
def hasil_industri():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM industri")
    data = cur.fetchall()

    cur.execute("SELECT COUNT(*) as Jumlah FROM industri WHERE class = 'Tidak Tepat Waktu'")
    data0 = cur.fetchone()
    cur.execute("SELECT COUNT(*) as Jumlah FROM industri WHERE class = 'Tepat Waktu'")
    data1 = cur.fetchone()

    return render_template('hasil-industri.html', data=data, data0=data0, data1=data1)


@app.route("/hasil-elektro")
def hasil_elektro():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    # Eksekusi query SELECT
    cur.execute("SELECT * FROM elektro")
    # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
    data = cur.fetchall()

    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM elektro WHERE class = 'Tidak Tepat Waktu'")
    data0 = cur.fetchone()
    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM elektro WHERE class = 'Tepat Waktu'")
    data1 = cur.fetchone()

    # menyisipkan data ke tampil_user.html
    return render_template('hasil-elektro.html', data=data, data0=data0, data1=data1)


@app.route("/hasil-kimia")
def hasil_kimia():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    # Eksekusi query SELECT
    cur.execute("SELECT * FROM kimia")
    # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
    data = cur.fetchall()

    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM kimia WHERE class = 'Tidak Tepat Waktu'")
    data0 = cur.fetchone()
    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM kimia WHERE class = 'Tepat Waktu'")
    data1 = cur.fetchone()

    # menyisipkan data ke tampil_user.html
    return render_template('hasil-kimia.html', data=data, data0=data0, data1=data1)


@app.route("/hasil-tekpang")
def hasil_tekpang():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    # Eksekusi query SELECT
    cur.execute("SELECT * FROM tekpang")
    # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
    data = cur.fetchall()

    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM tekpang WHERE class = 'Tidak Tepat Waktu'")
    data0 = cur.fetchone()
    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM tekpang WHERE class = 'Tepat Waktu'")
    data1 = cur.fetchone()

    # menyisipkan data ke tampil_user.html
    return render_template('hasil-tekpang.html', data=data, data0=data0, data1=data1)

@app.route('/download/report_infor/csv')
def download_infor():
    cur = None
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM informatika1")
        result = cur.fetchall()

        output = io.StringIO()
        writer = csv.writer(output)

        line = ['id_infor,nama,nim,prodi,semester_metopen,lama penulisan,sks,ipk,toefl,class']
        writer.writerow(line)

        for row in result:
            line = [str(row['id_infor']) + ',' + row['nama'] + ',' + row['nim'] + ',' + row['prodi'] + ',' + row['semester_metopen'] +
                    ',' + row['lama_penulisan'] + ',' + row['sks'] + ',' + row['ipk'] + ',' + row['toefl'] + ',' + row['class']]
            writer.writerow(line)

        output.seek(0)
        return Response(output, mimetype="text/csv", headers={"Content-Disposition": "attachment;filename=Klasisfikasi_informatika_Report.csv"})
    except Exception as e:
        print(e)
    finally:
        cur.close()
    return render_template('download_infor.html')

@app.route('/download/report_industri/csv')
def download_industri():
    cur = None
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM industri")
        result = cur.fetchall()

        output = io.StringIO()
        writer = csv.writer(output)

        line = ['id_ind,nama,nim,jurusan,ms,sks,ipk,toefl,class']
        writer.writerow(line)

        for row in result:
            line = [str(row['id_ind']) + ',' + row['nama'] + ',' + row['nim'] + ',' + row['jurusan'] +
                    ',' + row['ms'] + ',' + row['sks'] + ',' + row['ipk'] + ',' + row['toefl'] + ',' + row['class']]
            writer.writerow(line)

        output.seek(0)
        return Response(output, mimetype="text/csv", headers={"Content-Disposition": "attachment;filename=Klasisfikasi_industri_Report.csv"})
    except Exception as e:
        print(e)
    finally:
        cur.close()
    return render_template('download_industri.html')

@app.route('/download/report_kimia/csv')
def download_kimia():
    cur = None
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM kimia")
        result = cur.fetchall()

        output = io.StringIO()
        writer = csv.writer(output)

        line = ['id_kimia,nama,nim,jurusan,ms,sks,ipk,toefl,class']
        writer.writerow(line)

        for row in result:
            line = [str(row['id_kimia']) + ',' + row['nama'] + ',' + row['nim'] + ',' + row['jurusan'] +
                    ',' + row['ms'] + ',' + row['sks'] + ',' + row['ipk'] + ',' + row['toefl'] + ',' + row['class']]
            writer.writerow(line)

        output.seek(0)
        return Response(output, mimetype="text/csv", headers={"Content-Disposition": "attachment;filename=Klasisfikasi_kimia_Report.csv"})
    except Exception as e:
        print(e)
    finally:
        cur.close()
    return render_template('download_kimia.html')

@app.route('/download/report_elektro/csv')
def download_elektro():
    cur = None
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM elektro")
        result = cur.fetchall()

        output = io.StringIO()
        writer = csv.writer(output)

        line = ['id_elektro,nama,nim,jurusan,ms,sks,ipk,toefl,class']
        writer.writerow(line)

        for row in result:
            line = [str(row['id_elektro']) + ',' + row['nama'] + ',' + row['nim'] + ',' + row['jurusan'] +
                    ',' + row['ms'] + ',' + row['sks'] + ',' + row['ipk'] + ',' + row['toefl'] + ',' + row['class']]
            writer.writerow(line)

        output.seek(0)
        return Response(output, mimetype="text/csv", headers={"Content-Disposition": "attachment;filename=Klasisfikasi_elektro_Report.csv"})
    except Exception as e:
        print(e)
    finally:
        cur.close()
    return render_template('download_elektro.html')
    

@app.route('/download/report_tekpang/csv')
def download_tekpang():
    cur = None
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM tekpang")
        result = cur.fetchall()

        output = io.StringIO()
        writer = csv.writer(output)

        line = ['id_tp,nama,nim,jurusan,ms,sks,ipk,toefl,class']
        writer.writerow(line)

        for row in result:
            line = [str(row['id_tp']) + ',' + row['nama'] + ',' + row['nim'] + ',' + row['jurusan'] +
                    ',' + row['ms'] + ',' + row['sks'] + ',' + row['ipk'] + ',' + row['toefl'] + ',' + row['class']]
            writer.writerow(line)

        output.seek(0)
        return Response(output, mimetype="text/csv", headers={"Content-Disposition": "attachment;filename=Klasisfikasi_tekpang_Report.csv"})
    except Exception as e:
        print(e)
    finally:
        cur.close()
    return render_template('download_tekpang.html')



if __name__ == '__main__':
    app.secret_key = "skripsi"
    app.run(debug=True)