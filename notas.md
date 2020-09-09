# Notas personales

## Planteamiento del problema

Los equipos de monitoreo climatológico funcionan de la misma forma que la mayoría de los servidores en el mercado; Un equipo de cómputo que está corriendo un programa, llamado servicio, constantemente para escuchar las peticiones de sus clientes y permitir el acceso a los datos que ha posee.

Pero de la misma forma, al ser un equipo de cómputo con funciones específicas, requiere de un alto grado de entendimiento de las funciones que realiza para poder modificarlas, así como un diagnóstico detallado y complicado para poder repararlas en caso de un fallo.

[...] Párrafo sobre los problemas de escalabilidad de las estaciones [...]. *No es posible crear una red de estaciones y mantenerlas y monitorearlas sin esfuerzo*.

[...] Párrafo puente pendiente [...]

Por lo tanto, se propone la creación de un servicio e interfaz para facilitar la administración y mantenimiento general de los equipos meteorológicos, que *has an objective to aim to a broader audience* para así reducir a los tiempos de respuesta de los fallos de las estaciones meteorológicas.


### Antecedentes

Debido a su alta [...],  las estaciones meteorológicas se han buscado crear más resilentes [...], pero eso no evita que sean completamente resistente a fallos.

Actualmente las estaciones funcionan [...].

### Definición del problema

Debido a la complejidad de los sistemas de monitoreo tecnológico, y al alto grado de conocimiento que es requerido para el monitorear las estaciones y darles mantenimiento. [...] el atender los fallos de las estaciones meteorológicas lleva tiempo y expertise, aún cuando estas fallas no sean críticas o complicadas

## Obejtivo

Crear un sistema de monitoreo y control para estaciones meteorológicas que permita una respuesta rápida de los equipos no especializados al cuidado de las estaciones meteorológicas.

## Objetivos específicos

- Hacer un sistema modular y extendible para el monitoreo de las estaciones meteorológicas.

- Crear un sistema central para coordinar los datos.

- Crear un API para consultar estatus de las estaciones meteorológicas.

- Crear una interfaz gráfica para monitorear el estatus de las estaciones.

- Integrar las diferentes estaciones meteorológicas existentes al sistema.

- Integrar un sistema *existente* de notificaciones/alertas para fallos críticos de las estaciones.

## Justificación


## Metodología

Para el desarrollo de este programa, se utilizará la estrategia de desarrollo en cascada. En esta estrategia de desarrollo secuencial de software, se realiza un análisis exhaustivo de las características requeridas en el sistema a desarrollar antes de llevar a cabo su desarrollo. Esta estrategia será benéfica para el desarrollo del proyecto debido a que se posee un requerimiento inicial claro.\cite{Balaji2012WATEERFALLV}

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

- Sistema de alertas. Autodocumentación, abrir la posibilidad de hacer todo 100% automático. Ofrecer un sistema en un futuro que sea plug & play para las estaciones. Las mantenga activas y sepa diagnosticar y resolver problemas. Ayudando así al mantenimiento virtualmente automático de estaciones.

- Para evitar almacenar credenciales, utilizar una password ssh *viva* la cual sea utilizada para agregar la llave SSH al "servidor" (raspberry).

- Hacer la posibilidad de crear *conectores*, que monitoreen servicios específicos.

- Buscar como resolver el problema de los usuarios y los permisos necesarios para obtener el estatus de los servicios (no tener llave de root ni sudo, para hacerlo más seguro).

- Se busca hacer una plataforma que permita alertas rápidas, pero que al mismo tiempo no sea estricta en los tiempos de conexión (fuzzy programming).

- [X] ~~¿Gitlab CI/CD?~~

- Trabajos futuros, la informacion que queda puede ser usada para entrenar un sistema que resuelva automáticamente los issues.

- El sistema debe ser completamente extendible, se debe poder extraer como tal el código y pegarlo en otro proyecto python sin mayores modificaciones. *Ecosistema de submódulos de git (?)*

- Salud y espacio de los USB donde los datos meteorolóficos se almacenan.

- Módulo de conexión extendible (SSH, SMNP, TELNET),  


## Lenguaje y framework

- ~~¿PHP o Python? Parece ser necesario utilizar Python, para tener un sitema unificado de lenguajes. Probablemente Django, aunque preferiría evitarlo.~~

- **Django para backend**, pelear por FastAPI

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
