% Cargar el archivo de audio
[audio, fs] = audioread('Audio_Actividad_5.wav');

% Definir parámetros del efecto de retardo
delay_time = 0.2; % en segundos
delay_samples = round(delay_time * fs); % convertir tiempo de retardo a muestras

% Aplicar el efecto de retardo una vez
audio_delayed = delayseq(audio, delay_samples);

% Definir parámetros para el eco adicional
num_echos = 3; % número de repeticiones del eco adicional
delay_time_echo = 0.3; % tiempo de retardo para cada eco adicional (en segundos)
delay_samples_echo = round(delay_time_echo * fs); % convertir tiempo de retardo a muestras

% Aplicar el efecto de retardo adicional (eco)
for i = 1:num_echos
    audio_delayed = audio_delayed + delayseq(audio, delay_samples + i * delay_samples_echo);
end

% Factor de escala para reducir el nivel del audio (por ejemplo, reducir a la mitad)
factor_escala = 0.1;

% Reducir el nivel del audio multiplicando por el factor de escala
audio_reducido = audio_delayed * factor_escala;

% Reproducir el audio original, el audio con nivel reducido y el audio con efecto de eco
sound(audio, fs);
pause(length(audio) / fs); % pausa para reproducir el audio original
sound(audio_reducido, fs);
sound(audio_delayed, fs);

% Graficar la forma de onda del audio original, el audio con nivel reducido y el audio con efecto de eco
t_audio = (0:length(audio)-1) / fs; % Vector de tiempo para el audio original
t_audio_delayed = (0:length(audio_delayed)-1) / fs; % Vector de tiempo para el audio con efecto de eco

figure;

% Graficar la forma de onda del audio original (en azul)
subplot(3, 1, 1);
plot(t_audio, audio, 'b');
title('Audio Original');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

% Graficar la forma de onda del audio con nivel reducido (en rojo)
subplot(3, 1, 2);
plot(t_audio_delayed, audio_reducido, 'r');
title('Audio con Nivel Reducido');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

% Graficar la forma de onda del audio con efecto de eco (en verde)
subplot(3, 1, 3);
plot(t_audio_delayed, audio_delayed, 'g');
title('Audio con Efecto de Eco');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

% Ajustar el tamaño de la figura para que las subtramas sean más visibles
set(gcf, 'Position', [100, 100, 800, 600]);

%{
Esta es la sección 2: filtrado de audio

%}

% Cargar el archivo de audio
[audio, fs] = audioread('Audio_Actividad_5.wav');

% Especificar las características del filtro pasa-altos
orden = 100; % Orden del filtro
frec_corte = 1000; % Frecuencia de corte (en Hz)

% Diseñar el filtro pasa-altos
b = fir1(orden, frec_corte / (fs/2), 'high');

% Aplicar el filtro al audio
audio_filtrado = filter(b, 1, audio);

% Vector de tiempo para la forma de onda del audio original
t_audio = (0:length(audio)-1) / fs;

% Vector de tiempo para la forma de onda del audio filtrado
t_audio_filtrado = (0:length(audio_filtrado)-1) / fs;

% Graficar la forma de onda del audio original y el audio filtrado
figure;
subplot(2, 1, 1);
plot(t_audio, audio);
title('Audio Original');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

subplot(2, 1, 2);
plot(t_audio_filtrado, audio_filtrado);
title('Audio Filtrado (Frecuencias Altas)');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

% Ajustar el tamaño de la figura para que las subtramas sean más visibles
set(gcf, 'Position', [100, 100, 800, 600]);















