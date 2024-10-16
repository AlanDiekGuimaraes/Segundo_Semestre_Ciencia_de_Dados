# instalar a biblioteca pip install moviepy
# pip install SpeechRecognition pydub

from moviepy.editor import *
import time

video = VideoFileClip("Video_para_texto\Aula03.mp4")
audio = video.audio
audio.write_audiofile("Video_para_texto\Aula03.mp3")

import subprocess
import os
time.sleep(20)

local_arquivo = "Video_para_texto/Aula03.mp3"
nome_modelo = "medium"

diretorio_saida = f"Video_para_texto"
diretorio_saida = f"output-{nome_modelo}"
arquivo_saida = os.path.join(diretorio_saida, "transcription.txt")

os.makedirs(diretorio_saida, exist_ok=True)

subprocess.run(
  [
    "whisper", 
    "--language", "pt", 
    "--word_timestamps", "True",
    "--output_dir", diretorio_saida,
    "--output_format", "txt",  # Define o formato de saída como texto 
    local_arquivo
  ]
)

print(f"Transcrição salva em {arquivo_saida}")