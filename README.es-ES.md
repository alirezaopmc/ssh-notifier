

Notificador SSH para Telegram

<img width="752" alt="image" src="https://github.com/alirezaopmc/ssh-notifier/assets/35873101/d7093063-d949-4568-9ed0-4dcee8c20b24">


# Descripción general
Este es un script simple de notificación SSH para Telegram escrito en Bash. Envía notificaciones a un chat de Telegram especificado cada vez que se inicia una sesión SSH en el servidor.

# Instalación
## Paso 1: Copiar el directorio
Copia el directorio ssh-notifier al directorio /usr/local/ para hacerlo accesible públicamente.

```bash
cp -r ssh-notifier /usr/local/
```

## Paso 2: Actualizar la configuración de PAM
Abre el archivo /etc/pam.d/sshd y agrega la siguiente línea al final. Esta línea invoca el script del notificador con los parámetros correspondientes.

```bash
session required pam_exec.so /usr/local/ssh-notifier/app.sh "$PAM_USER" "$PAM_RHOST"
```

## Paso 3: Reiniciar el servicio SSH
Reinicia el servicio SSH para aplicar los cambios.

```bash
service ssh restart
```

# Configuración
Antes de utilizar el notificador, asegúrate de crear un archivo .env que contenga las variables necesarias:

```bash
TELEGRAM_BOT_TOKEN="YOUR_BOT_TOKEN"
TELEGRAM_CHAT_ID="YOUR_CHAT_ID"
```
Reemplaza YOUR_BOT_TOKEN y YOUR_CHAT_ID con el token real de tu bot de Telegram y el ID del chat.

# Uso
Una vez configurado, el notificador enviará un mensaje de Telegram cada vez que un usuario inicie sesión en el servidor mediante SSH.

# Notas adicionales
Asegúrate de que se establezcan los permisos necesarios para el script y de que sea ejecutable. Puedes utilizar el siguiente comando:

```bash
chmod +x /usr/local/ssh-notifier/app.sh
```

Siéntete libre de personalizar aún más el script según tus necesidades.
