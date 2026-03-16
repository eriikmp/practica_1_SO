from bottle import route, run
import datetime
import subprocess

@route('/hi')
def hi():
    # Esto saca la fecha y hora actual
    ahora = datetime.datetime.now()
    return f"Hola, hoy es {ahora.strftime('%d/%m/%Y')} y son las {ahora.strftime('%H:%M:%S')}"

@route('/status')
def status():
    # Este comando le pregunta al sistema que servicios estan activos
    try:
        resultado = subprocess.check_output(['systemctl', 'list-units', '--type=service',  '--state=running'])
        return f"<h1>Servicios Activos</h1><pre>{resultado.decode('utf-8')}</pre>"
    except:
        return "Error al obtener los servicios del sistema"

# Esto lanza el servidor en el puerto 8080
run(host='0.0.0.0', port=8080)
