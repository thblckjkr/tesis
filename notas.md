# Notas personales

## Planteamiento del problema

En la administración de equipos de monitoreo climatológico,


### Antecedentes

### Definición del problema



## Obejtivo

Crear un sistema de monitoreo y control para estaciones meteorológicas que permita una respuesta rápida de los equipos no especializados al cuidado de las estaciones meteorológicas.

## Objetivos específicos

- Hacer un sistema extendible para comunicarse con las estaciones meteorológicas basado en el protocolo SNMP.

- Crear un API para consultar estatus de las estaciones meteorológicas.

- Crear una interfaz gráfica para monitorear el estatus de las estaciones.

- Integrar las diferentes estaciones meteorológicas existentes al sistema.


## Justificación


## Hipótesis

Creando un sistema para monitorear las estaciones meteorológicas, así como un control de reportes de incidentes es posible mejorar los tiempos de respuesta a los incidentes, así como minimizar la pérdida de datos por fallas de programa/sistema.

## Preguntas de investigación

- ¿Cuánto tiempo pasa de el momento en el que una estación falla, y que se den cuenta?


---


### Problemática

Alta configurabilidad / flexibilidad. Plugins?

El equipo requiere de comandos y acciones por terminal, que requieren un nivel técnico avanzado. No existe una interfaz fácil para la interacción sencilla del monitoreo e identificacón de ellos.

¿Qué está corriendo? ¿Está conectada la davis? ¿Cuándo fue el último registro?

Que el programa arregle las cosas que el mismo pueda arreglar.

No hay una interfaz para ello.

Identificar-diagnosticar-resolver.

Público objetivo - Frida.

> ¿Los equipos se desconectan?
>
> ¿Los datos se pierden? - Consecuencia (Justificación)

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

- ~~Meter habilidades para helpdesk. Asignar issues, crear problemas, página de estatus, mostrar errores. Preferentemente como microservicio.~~

- Sistema de alertas. Autodocumentación.

- Para evitar almacenar credenciales, utilizar una password ssh *viva* la cual sea utilizada para agregar la llave SSH al "servidor" (raspberry).

- Hacer la posibilidad de crear *conectores*, que monitoreen servicios específicos.

- Buscar como resolver el problema de los usuarios y los permisos necesarios para obtener el estatus de los servicios (no tener llave de root ni sudo, para hacerlo más seguro).

- Se busca hacer una plataforma que permita alertas rápidas, pero que al mismo tiempo no sea estricta en los tiempos de conexión (fuzzy programming).

- [X] ~~¿Gitlab CI/CD?~~

- Trabajos futuros, la informacion que queda puede ser usada para entrenar un sistema que resuelva automáticamente los issues.


## Lenguaje y framework

- ~~¿PHP o Python? Parece ser necesario utilizar Python, para tener un sitema unificado de lenguajes. Probablemente Django, aunque preferiría evitarlo.~~

- **Django para backend**

- MariaDB o MongoDB para el backend? Otras alternativas no son necesarias por as mismas razones que la selección del lenguaje.

- Modelo de API - MC. No usar vistas. FirstAPI.

- Documentación en OpenAPI. (FastAPI?)

- Las vistas serán desarrolladas como un sistema aparte, para permitir la conexión de diversos sistemas.


## Salsas

https://ieeexplore.ieee.org/abstract/document/8543248

http://anshulkaushik.com/use-of-open-source-technolo.pdf

https://ieeexplore.ieee.org/abstract/document/8300092

- Librería de python - Webhook.

- Simple SMNP ¿? Cosechar información de Nagios.

- Notificaciones con Microsoft.
