# Notas personales

## Documento

### Justificación


> La justificiación va por el lado de medir (de forma directa) la cantidad de datos que se pierden por fallas técnicas, intentar medir tiempos de respuesta a las fallas, las fallas más comúnes y cuánto podríamos valorar la información que se pierde por ellos.
>
> Después de ello, argumentamos que la cantidad de datos que se evitará perder es lo suficientemente valiosa como para justificar el desarrollo del proyecto.
>
> También se requiere de mencionar lo valioso que son los datos y los usos que se les dan a los mismos, brevemente.

Debido a que la atención temprana de las *emergencias* relacionadas con el software o hardware de las estaciones meteorológicas ayuda a minimizar la pérdida de datos.

La pérdida de datos es crítica debido a que...

### Hipótesis

Creando un sistema para monitorear las estaciones meteorológicas, así como un control de reportes de incidentes es posible mejorar los tiempos de respuesta a los incidentes, así como minimizar la pérdida de datos por fallas de programa/sistema.

### Preguntas de investigación

- ¿Cuánto tiempo pasa de el momento en el que una estación falla, y que se den cuenta?

- ¿Para qué o que?

## Software features

- Meter habilidades para helpdesk. Asignar issues, crear problemas, página de estatus, mostrar errores. Preferentemente como microservicio.

- Para evitar almacenar credenciales, utilizar una password ssh *viva* la cual sea utilizada para agregar la llave SSH al "servidor" (raspberry).

- Hacer la posibilidad de crear *conectores*, que monitoreen servicios específicos.

- Buscar como resolver el problema de los usuarios y los permisos necesarios para obtener el estatus de los servicios (no tener llave de root ni sudo, para hacerlo más seguro).

- Se busca hacer una plataforma que permita alertas rápidas, pero que al mismo tiempo no sea estricta en los tiempos de conexión (fuzzy programming).


## Lenguaje y framework

- ¿PHP o Python? Parece ser necesario utilizar Python, para tener un sitema unificado de lenguajes. Probablemente Django, aunque preferiría evitarlo.

- MariaDB o MongoDB para el backend? Otras alternativas no son necesarias por as mismas razones que la selección del lenguaje.

- Modelo de API - MC. No usar vistas. FirstAPI.

- Documentación en OpenAPI. (FastAPI?)

- Las vistas serán desarrolladas como un sistema aparte, para permitir la conexión de diversos sistemas.


## Salsas

https://ieeexplore.ieee.org/abstract/document/8543248
