# Notas personales

## Hipótesis

Creando un sistema para monitorear las estaciones meteorológicas, así como un control de reportes de incidentes es posible mejorar los tiempos de respuesta a los incidentes, ~~así como minimizar la pérdida de datos por fallas de programa/sistema~~.

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

- *Frontend* VueJS. Es lo suficientemente sencillo y lindo.

- Autenticación

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


**[chapman2015birmingham]**

- Usan campbell scientific

> However, there is a general paucity of measurements in urban areas because of the cost of standard monitoring equipment and its upkeep, as well as the need for national weather and climate monitoring stations to be located outside urban areas 

- [WMO_guide_2014]

But climate data are also integral in making the city even smarter by controlling en-ergy demand and reducing disruption on transport networks.

> Aginova Sentinel Micro ~150 USD are used to monitor ONLY  air data

> Low/No cost loggers are important for the development of better interfaces?

# Si tengo una cita que viene de otra cita, de donde cito la cita?

> Uno de los retos con los que se ha encontrado al optar por el desarrollo de estaciones meteorologicas *platafform-agnostic* es el mantenimiento de las mismas.

> Puedo juntarme con el sujeto que esta haciendo los analisis meteorologicos para ver un sistema de administracion de la metadata/las configuraciones de las estaciones?

El siguiente paso logico para el desarollo de un sistema de monitoreo de climatologia economico sustentable.


https://docs.masoniteproject.com/
