document.addEventListener('DOMContentLoaded', () => {

    //Linea de tiempo
    const eventos = document.querySelectorAll('.evento');
    eventos.forEach(evento => {
        evento.addEventListener('click', () => {
            const titulo = evento.querySelector('h3')?.innerText || 'Sin título';
            const fecha = evento.querySelector('span')?.innerText || 'Sin datos';
            const data = evento.querySelector('p')?.innerText || 'Sin datos';

            alert(`Evento:${titulo} ${fecha}\n Data: ${data}`);
        });
    });

    //Descargar imagenes
    document.querySelectorAll('#perfil img, .imagen, .galeria').forEach(img => {
        img.addEventListener('dblclick', () => {
            const link = document.createElement('a');
            link.href = img.src;
            link.download = 'imagen.jpg';
            link.target = '_blank';
            link.click();
        });
    });
});



//Vlidaciones
const form = document.getElementById('form-mensaje');
const alertContainer = document.getElementById('alertContainer');

if (form && alertContainer) {
    const campos = {
        nombre: {
            regex: /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{3,}$/,
            error: 'El nombre debe tener mínimo 3 caracteres y solo letras'
        },
        correo: {
            regex: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
            error: 'Ingresa un correo válido'
        },
        mensaje: {
            validar: (v) => v.trim().length > 10,
            error: 'El mensaje debe tener al menos 10 caracteres'
        }
    };

    //Alertas
    function mostrarAlerta(mensaje, tipo) {
        const color = tipo === 'success' ? 'green' : 'red';
        alertContainer.innerHTML = `
            <div class="bg-${color}-100 border border-${color}-400 text-${color}-700 px-4 py-3 rounded-lg">
                <span>${mensaje}</span>
                <span class="float-right cursor-pointer" onclick="this.parentElement.remove()">✕</span>
            </div>
        `;
        setTimeout(() => alertContainer.innerHTML = '', 5000);
    }

    //Validar campos
    function validar(nombre) {
        const input = document.getElementById(nombre);
        const error = document.getElementById(`${nombre}-error`);
        const config = campos[nombre];
        const valor = input.value.trim();

        const esValido = config.regex ? config.regex.test(valor) : config.validar(valor);

        input.className = input.className.replace(/border-(gray|red|green)-\d+/g, '') +
            (esValido ? ' border-green-500' : ' border-red-500');
        error.textContent = esValido ? '' : config.error;
        error.classList.toggle('hidden', esValido);

        return esValido;
    }

    Object.keys(campos).forEach(nombre => {
        const input = document.getElementById(nombre);
        input.addEventListener('blur', () => validar(nombre));
        input.addEventListener('input', () => {
            if (input.classList.contains('border-red-500')) validar(nombre);
        });
    });

    //Enviar
    form.addEventListener('submit', (e) => {
        e.preventDefault();

        const validos = Object.keys(campos).map(validar);

        if (validos.every(v => v)) {
            mostrarAlerta('¡Mensaje enviado con éxito!', 'success');
            console.log('Datos:', Object.fromEntries(new FormData(form)));
            form.reset();
        } else {
            mostrarAlerta('Corrige los errores en el formulario', 'error');
        }
    });
}
