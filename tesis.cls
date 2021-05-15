%%
%% tesis.cls - Clase de LaTeX2e para tesis de la  UACJ, IIT
%% Cumple con el reglamento de tesis del Grupo de Sistemas Distribuidos y Multiagentes ( [fmstyle] )
%% (Rev. Julio 2005)
%%
%% La opci'on [atstyle] ( otro formato) cumple con reglamento de tesis del Grupo de Sistemas Distribuidos y Multiagentes
%% (Rev. Julio 2005)
%%
%%
%% Version 3.0c por Juan Acosta Guadarrama
%% http://www.jguadarrama.link
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Version 3.0 - Junio 2016 / Juan C. Acosta Guadarrama
%%
%% - se corrigieron errores en los margenes
%% - numeraci\'on de p\'aginas m\'as correcta
%% - la primera p'agina numerada es el prefacio, luego la simbolog\'{i}a (con n'umeros romanos)
%% - se puede elegir entre doctor o maestro para generar las portadas y hoja de aprobaci'on
%% - no hay cambios notables desde octubre de 2006 
%%
%% Version 1.0 - Julio 2005 / H'ector Rafael Orozco Aguirre
%%
%% - {abstract} y {thanks} no se numeran
%% - la primera p'agina numerada es el 'indice general (con n'umeros romanos)
%% - la bibliograf'ia aparece en el 'indice general.
%% - los cap'itulos y ap'endices se numeran en arabigo.
%%
%% Version 0.9 - Julio 2005 / H'ector Rafael Orozco Aguirre
%%
%% - cambios generales del c'odigo, ahora la clase esta basada
%%   en report.cls como la mayoria de las clases de tesis alrededor del mundo.
%% - el campo \author soporta y maneja correctamente el comando \and para poder
%%   especificar varios autores. (codigo prestado de llncs.cls)
%% - cambi'o la forma de especificar el jurado, ahora hay campos individuales
%%   para \director, \sinodala, \sinodalb, y \sinodalc.
%% - crea automaticamente la forma de liberacion final: \approvalpage.
%% - se corrigi'o y funcionan correctamente los modos de espaciado, ahora hay
%%   \singlespacing, \doublespacing, asi como los ambientes `singlespace'
%%   y `doublepace'.
%% - se corrigieron los margenes a los valores oficiales.
%% - se cambiaron los defaults a: 12pt, oneside, doublespacing.
%% - se actualizaron los archivos de los logotipos, ahora tienen mucha mejor calidad
%%   y se guardaron en verdadero formato vectorial (no mapa de bits)
%% - se agrego compatibilidad para el estilo requerido usando la opcion [atstyle],
%%   el default es [fmstyle].
%% - la clase carga automaticamente a babel en espa~nol y se cambia la leyenda
%%   espa~nola `Cuadro' por el esperado valor de `Tabla'.
%% - el estilo de programaci'on mejoro mucho en general
%%
%% Version 0.8 - Junio 2005 / H'ector Rafael Orozco Aguirre
%% - primera version de tesis.
%%

\usepackage[utf8]{inputenc}  % descomentar para teclado en español de Unix, Mac y posiblemente Windows
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{tesis}[2006/10/06 v2.0 Formato para tesis de la Academia de Sistemas Computacionales UACJ]

\newif\if@isdraft
\newif\if@atstyle
\newif\ifdoctor\doctortrue
\newcommand{\@logosource}{Escudo-uacj2015-color-sin-fondo.png}

\DeclareOption{draft}{ \@isdrafttrue  \PassOptionsToClass{draft}{report} }
\DeclareOption{final}{ \@isdraftfalse \PassOptionsToClass{final}{report} }
\DeclareOption{openright}{ \PassOptionsToClass{openright}{report} }
\DeclareOption{openany}{ \PassOptionsToClass{openany}{report} }
\DeclareOption{twoside}{ \PassOptionsToClass{twoside}{report} }
\DeclareOption{oneside}{ \PassOptionsToClass{oneside}{report} }
\DeclareOption{fleqn}{ \PassOptionsToClass{fleqn}{report} }
\DeclareOption{leqno}{ \PassOptionsToClass{leqno}{report} }
\DeclareOption{openbib}{ \PassOptionsToClass{openbib}{report} }
\DeclareOption{black}{\gdef\@logosource{Escudo-uacj2015-color-sin-fondo.png}}
\DeclareOption{color}{\gdef\@logosource{logocolor}}
\DeclareOption{gray}{\gdef\@logosource{logogray}}
\DeclareOption{atstyle}{\@atstyletrue}
\DeclareOption{fmstyle}{\@atstylefalse}
\DeclareOption{doctor}{\doctortrue}
\DeclareOption{lic}{\doctorfalse}

\ExecuteOptions{final,oneside,openright,fmstyle,black,lic}
\ProcessOptions
\LoadClass[letterpaper,onecolumn,openright,12pt]{report}[1996/10/31]

% load babel using spanish %
\RequirePackage[spanish,activeacute]{babel}

% characters and accents in spanish %
%\RequirePackage[utf8]{inputenc}

% load graphicx %
\RequirePackage{ifpdf}
\ifpdf
  \RequirePackage[pdftex]{graphicx}
  \pdfcompresslevel=9
  \DeclareGraphicsExtensions{.pdf,.png}
\else
  \RequirePackage[dvips]{graphicx}
  \DeclareGraphicsExtensions{.eps,.ps}
\fi

% class fields %
\newcommand{\@authorid}{}
\renewcommand{\@author}{\ClassError{tesis}{Falta especificar \string\author{}{}}
 {Usa el comando \string\author{}{} en el preámbulo para especificar tu nombre.\MessageBreak
 El primer argumento es la matrícula (ID) y el segundo el nombre completo.}}
\renewcommand{\author}[2]{\gdef\@author{#2}\gdef\@authorid{#1}}

\newcommand{\@authorbid}{}
\newcommand{\@authorb}{\ClassError{tesis}{Falta especificar \string\authorb{}{}}
 {Usa el comando \string\authorb{}{} en el preámbulo para especificar el nombre del otro autor. El 1er argumento es la matrícula (ID) y el segundo el nombre completo. Se elimina el texto cuando no hay otro alumno}}
\newcommand{\authorb}[2]{\gdef\@authorb{#2}\gdef\@authorbid{#1}}

\renewcommand{\@title}{\ClassError{tesis}{Falta especificar \string\title{}}
 {Usa el comando \string\title{} en el preámbulo para especificar \MessageBreak
  el título de tu tesis.}}
\renewcommand{\title}[1]{\gdef\@title{#1}}

\newcommand{\@directorname}{}
\newcommand{\@directortitle}{}
\newcommand{\@director}{\ClassError{tesis}{Falta especificar \string\director{}{}}
 {Usa el comando \string\director[]{}{} en el preámbulo para especificar a tu \MessageBreak
  director de tesis. El primer argumento es su titulo (Prof. Dr., Dr. ,M. en C.) \MessageBreak
  y el segundo su nombre completo. Opcionalmente puedes modificar su puesto \MessageBreak
  en el jurado si es distinto a `Director de Tesis'.}}
\newcommand{\director}[3][Director de Tesis]%
  {\gdef\@directorname{#1}\gdef\@directortitle{#2}\gdef\@director{#3}}

\newcommand{\@titularname}{}
\newcommand{\@titulartitle}{}
\newcommand{\@titular}{\ClassError{tesis}{Falta especificar \string\titular{}{}}
 {Usa el comando \string\titular[]{}{} en el preámbulo para especificar a tu \MessageBreak
  director de tesis. El primer argumento es su titulo (Prof. Dr., Dr. ,M. en C.) \MessageBreak
  y el segundo su nombre completo. Opcionalmente puedes modificar su puesto \MessageBreak
  en el jurado si es distinto a `Titular de Seminario de Titulaci\'on II'.}}
\newcommand{\titular}[3][Director de Tesis]%
  {\gdef\@titularname{#1}\gdef\@titulartitle{#2}\gdef\@titular{#3}}

\newcommand{\@directorbname}{}
\newcommand{\@directorbtitle}{}
\newcommand{\@directorb}{\ClassError{tesis}{Falta especificar \string\directorb{}{}}
 {Usa el comando \string\director[]{}{} en el preámbulo para especificar a tu \MessageBreak
  director de tesis. El primer argumento es su titulo (Prof. Dr., Dr. ,M. en C.) \MessageBreak
  y el segundo su nombre completo. Opcionalmente puedes modificar su puesto \MessageBreak
  en el jurado si es distinto a `Director de Tesis'.}}
\newcommand{\directorb}[3][Director B de Tesis]%
  {\gdef\@directorbname{#1}\gdef\@directorbtitle{#2}\gdef\@directorb{#3}}

\newcommand{\@directorbp}{\ClassError{tesis}{Falta especificar \string\directorbp{}{}}
 {Usa el comando \string\directorbp[]{}{} en el preámbulo para especificar al \MessageBreak
  Director B del jurado en tu defensa de tesis. El primer argumento es su \MessageBreak
  titulo (Dr., M. en C.) y el segundo su nombre completo. Opcionalmente puedes %
                                                                           \MessageBreak
  modificar su puesto en el jurado si es distinto a `Sinodal B'.}}
\newcommand{\directorbp}[2][Director B-Puesto]%
  {\gdef\@directorbp{#2}}

\newcommand{\@sinodalaname}{}
\newcommand{\@sinodalatitle}{}
\newcommand{\@sinodala}{\ClassError{tesis}{Falta especificar \string\sinodala{}{}}
 {Usa el comando \string\sinodala[]{}{} en el preámbulo para especificar al \MessageBreak
  Sinodal A del jurado en tu defensa de tesis. El primer argumento es su \MessageBreak
  titulo (Dr., M. en C.) y el segundo su nombre completo. Opcionalmente puedes %
                                                                           \MessageBreak
  modificar su puesto en el jurado si es distinto a `Sinodal A'.}}
\newcommand{\sinodala}[3][Sinodal]%
  {\gdef\@sinodalaname{#1}\gdef\@sinodalatitle{#2}\gdef\@sinodala{#3}}

\newcommand{\@sinodalbname}{}
\newcommand{\@sinodalbtitle}{}
\newcommand{\@sinodalb}{\ClassError{tesis}{Falta especificar \string\sinodalb{}{}}
 {Usa el comando \string\sinodalb[]{}{} en el preámbulo para especificar al \MessageBreak
  Sinodal B del jurado en tu defensa de tesis. El primer argumento es su \MessageBreak
  titulo (Dr., M. en C.) y el segundo su nombre completo. Opcionalmente puedes %
                                                                           \MessageBreak
  modificar su puesto en el jurado si es distinto a `Sinodal B'.}}
\newcommand{\sinodalb}[3][Sinodal]%
  {\gdef\@sinodalbname{#1}\gdef\@sinodalbtitle{#2}\gdef\@sinodalb{#3}}

\newcommand{\@sinodalcname}{}
\newcommand{\@sinodalctitle}{}
\newcommand{\@sinodalc}{\ClassError{tesis}%
  {Falta especificar \string\sinodalc{}{}}
 {Usa el comando \string\sinodalc[]{}{} en el preámbulo para especificar al \MessageBreak
  Sinodal B del jurado en tu defensa de tesis. El primer argumento es su \MessageBreak
  titulo (Dr., M. en C.) y el segundo su nombre completo. Opcionalmente puedes %
                                                                           \MessageBreak
  modificar su puesto en el jurado si es distinto a `Sinodal C'.}}
\newcommand{\sinodalc}[3][Sinodal]%
  {\gdef\@sinodalcname{#1}\gdef\@sinodalctitle{#2}\gdef\@sinodalc{#3}}

\newcommand{\@institution}{\large Instituto de Ingeniería y Tecnología\par\vspace{1\@line} Departamento de Ingeniería Eléctrica y Computación}
\newcommand{\institution}[1]{\gdef\@institution{#1}}
\newcommand{\@address}{Ciudad Juárez, Chihuahua\xspace}
\newcommand{\address}[1]{\gdef\@address{#1}}
\newcommand{\@termyear}{\thisterm}
\newcommand{\termyear}[1]{\gdef\@termyear{#1}}
\newcommand{\@monthyear}{\thismonth}
\newcommand{\monthyear}[1]{\gdef\@monthyear{#1}}
\renewcommand{\@date}{\longdate}
\renewcommand{\date}[1]{\gdef\@date{#1}}

\newcommand{\logosource}[1]{\gdef\@logosource{#1}}

% default date/time strings %
\newcommand{\monthname}{\ifcase\month\or Enero\or Febrero\or
      Marzo\or Abril\or Mayo\or Junio\or Julio\or Agosto\or Septiembre\or
      Octubre\or Noviembre\or Diciembre\fi}
\newcommand{\termname}{\ifcase\month\or Invierno\or Invierno\or
      Primavera\or Primavera\or Primavera\or Verano\or Verano\or Verano\or Otoño\or
      Otoño\or Otoño\or Invierno\fi}

\newcount\hours \newcount\minutes
\def\SetTime{\hours=\time
        \global\divide\hours by 60
        \minutes=\hours
        \multiply\minutes by 60
        \advance\minutes by-\time
        \global\multiply\minutes by-1 }
\SetTime

\newcommand{\thisterm}{\termname\ de \the\year}
\newcommand{\thismonth}{\monthname\ de \the\year}
\newcommand{\longdate}{\@arabic\day\ de \monthname\ de \the\year}
\newcommand{\shortdate}{\@arabic\day/\@arabic\month/\@arabic\year}
\newcommand{\shorttime}{\number\hours:\ifnum\minutes<10 0\fi\number\minutes}

\newcommand{\draftmodeleyend}{(TESIS COMPILADA EN MODO DRAFT)}
\newcommand{\draftleyend}{BORRADOR \shorttime{} - \shortdate{}}
\newcommand{\blankpageleyend}{(esta página se ha dejado en blanco de manera intencional)}

% double & singlespacing %
\def\setspace@size{\ifx\@currsize\normalsize\@normalsize\else\@currsize\fi}
\def\doublespacing{\def\baselinestretch{1.5} \setspace@size}
\def\singlespacing{\def\baselinestretch{0.5} \setspace@size}

\newenvironment{singlespace}{\vskip\baselineskip\singlespacing\vskip-\baselineskip}{\par}
\newenvironment{doublespace}{\vskip\baselineskip\doublespacing\vskip-\baselineskip}{\par}

% floats & footnotes singlespaced %
\let\latexx@xfloat=\@xfloat
\def\@xfloat #1[#2]{\latexx@xfloat #1[#2]
  \def\baselinestretch{1}\@normalsize\normalsize}
\long\def\@footnotetext#1{
  \insert\footins{
    \def\baselinestretch{1}
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{
      \csname p@footnote\endcsname\@thefnmark}
    \color@begingroup \@makefntext{
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}
    \color@endgroup}}
\long\def\@mpfootnotetext#1{
  \global\setbox\@mpfootins\vbox{
    \unvbox \@mpfootins
    \def\baselinestretch {1}
    \reset@font\footnotesize
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{
      \csname p@mpfootnote\endcsname\@thefnmark}
    \color@begingroup \@makefntext{
       \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}
   \color@endgroup}}

\newcommand*{\@normalsize}{\normalsize}
\doublespacing

% page numbering %
%\pagenumbering{roman}
%\newcommand{\frontmatter}{\cleardoublepage\pagenumbering{roman}}
%\newcommand{\mainmatter}{\cleardoublepage\pagenumbering{arabic}}

% page margins %
\if@twoside
  \setlength{\oddsidemargin}{25mm}
  \addtolength{\oddsidemargin}{-1in}
  \setlength{\evensidemargin}{25mm}
  \addtolength{\evensidemargin}{-1in}
  \setlength{\textwidth}{\paperwidth}
  \addtolength{\textwidth}{-50mm}
\else
  \setlength{\oddsidemargin}{25mm}
  \addtolength{\oddsidemargin}{-1in}
  \setlength{\evensidemargin}{25mm}
  \addtolength{\evensidemargin}{-1in}
  \setlength{\textwidth}{\paperwidth}
  \addtolength{\textwidth}{-50mm}
\fi

\setlength{\topmargin}{10mm}
\addtolength{\topmargin}{-10mm}

\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}
\addtolength{\textheight}{-\footskip}
\addtolength{\textheight}{-50mm}

% support for \and in author%
\newcounter{@count}
\newcounter{@index}

\def\@undefineand{
 \def\and{
   \ClassError{tesis}{Illegal use of \string\and}%
     {Do not use the \string\and\space command outside the author field}
 }
}

\@undefineand
\newcommand{\@typeauthor}[2]{
 \def\and{\stepcounter{@index}\relax
          \ifnum\value{@index}=\value{@count}%
           #2
          \else
              #1
           \fi}%
  \setbox0=\vbox{\setcounter{@count}{1}\def\and{\stepcounter{@count}}\@author}
  \setcounter{@index}{1}\@author\@undefineand
 }

% titlepage
\newlength{\@line}
\setlength{\@line}{7pt}

\renewcommand\maketitle{
  \begingroup\doublespacing % always typeset title pages in doublespacing %
  \begin{titlepage}%
  \begin{center}
    \vspace{\@line}{\Large{UNIVERSIDAD AUTÓNOMA DE CIUDAD JUÁREZ}}\par
    \vspace{\@line}{\large\@institution}\par
    \vspace{3\@line}\includegraphics [scale=0.6]{\@logosource}\par
    \vspace{2\@line}{\Large \@title}\par
    \ifdoctor
    \textsc{Tesis de Doctorado/a en Ciencias de la Ingenier{\'{i}}a}\par
    \else
    \vspace{3\@line}{Reporte Técnico de Investigación presentado por:}\par
    \fi
        \vspace{1\@line}{\@author\  \@authorid\\\@authorb\ \@authorbid}\par
    \vspace{2\@line}{Requisito  para la obtención del título de:}\par
        \ifdoctor
        \textbf{Doctor/a en Ciencias de la Ingeniería}\par
        \else
        \vspace{1\@line}{INGENIERO EN SISTEMAS COMPUTACIONALES}\par
        \fi
    \vfill\textsc{Asesor:}\par
        \vspace{3\@line}{\@directortitle\ \@director}\\
        {\@directorbtitle\ \@directorb}\par
  \end{center}
    \vspace{1\@line}\textrm{\@address}%\par
    \textrm{\hfill\@termyear}
    %\textrm{\hspace{24pt}\@termyear}
  \end{titlepage}%
%  \begin{titlepage}%
%  	\begin{center}
%  		\vspace{\@line}\textbf{\Large{UNIVERSIDAD AUT\'ONOMA DE CIUDAD JU\'AREZ}}\par
%  		\vspace{\@line}\textbf{\large\@institution}\par
%  		\vspace{\@line}\includegraphics [scale=0.8]{\@logosource}\par
%  		\vspace{\@line}\textbf{\LARGE \@title}\par
%  		\vspace{0.5\@line}
%  		\begin{singlespace}
%  			\ifdoctor
%  			\textsc{Tesis de Doctorado en Ciencias de la Ingenier{\'{i}}a}\par
%  			\else
%  			\textsc{PROYECTO DE TITULACI\'O QUE PRESENTA:}\par
%  			\fi
%  			\textbf{\@author}\par
%  			\vfill\textsc{Para obtener el grado de:}\par
%  			\ifdoctor
%  			\textbf{Doctor/a en Ciencias de la Ingenier{\'{i}}a}\par
%  			\else
%  			\textbf{Licenciado en Matem\'aticas}\par
%  			\fi
%  			\vfill\textsc{\@directorname}\par
%  			\textbf{\@directortitle\ \@director}\par      
%  		\end{singlespace}
%  		\textrm{\@address. \hfill \@monthyear}
%  	\end{center}
%  \end{titlepage}%
  \endgroup
}

\def\approvalprint{
%  \begin{titlepage}
  \doublespacing
%  \frontmatter
%  \begin{center}
%\normalsize
\begin{flushright}
\@address, a \@date\\
Asunto: Autorización de publicación
\end{flushright}
{\bf
C. \@author\\
Presente.-}\par
\vspace{2\@line}

En virtud de que cumple satisfactoriamente los requisitos solicitados, informo a usted que se autoriza la publicación del documento de \@title, para presentar los resultados del proyecto de titulación con el propósito de obtener el título de Licenciado en Ingeniería en Sistemas Computacionales.

Sin otro particular, reciba un cordial saludo.\par
\begin{center}
%Atentamente
\par\vspace{4\@line}
\@titulartitle\ \@titular \\
Profesor Titular de Seminario de Titulación II \\
\end{center}
\pagebreak
%  \begin{singlespace}
%  \@date\vfill
%  \end{singlespace}
%  \end{center}
%  \end{titlepage}
}




\def\approvalprintb{
%  \begin{titlepage}
  \doublespacing
 %\frontmatter
%  \begin{center}
%\normalsize
\begin{flushright}
\@address, a \@date\\
Asunto: Autorización de Impresión
\end{flushright}
{\bf
C. \@authorb\\
Presente.-}\par
\vspace{2\@line}

En virtud de que cumple satisfactoriamente los requisitos solicitados, informo a usted que se autoriza la impresión del proyecto de \@title, para presentar los resultados del proyecto de titulación con el propósito de obtener el título de Licenciado en Ingeniería en Sistemas Computacionales.

Sin otro particular, reciba un cordial saludo.\par
\begin{center}
%Atentamente
\par\vspace{4\@line}
\@titulartitle\ \@titular \\
Profesor Titular de Seminario de Titulación II \\
\end{center}
%  \begin{singlespace}
%  \@date\vfill
%  \end{singlespace}
%  \end{center}
%  \end{titlepage}
\pagebreak
}

\def\approvalpage{\newpage\pagestyle{headings}
%  \begin{titlepage}
  \doublespacing
  %\frontmatter
%  \begin{center}
%\normalsize
\begin{flushright}
\@address, a \@date\\
Asunto: Liberación de Asesoría
\end{flushright}
{\bf
Mtro. Ismael Canales Valdiviezo\\
Jefe del Departamento de Ingeniería\\
El\'ectrica y Computación\\
Presente.-}\par
\vspace{2\@line}

Por medio de la presente me permito comunicarle que, después de haber realizado las asesorías correspondientes al reporte técnico \@title, del alumno \@author de la Licenciatura en Ingeniería en Sistemas Computacionales, considero que lo ha concluido satisfactoriamente, por lo que puede continuar con los trámites de titulación intracurricular.

Sin más por el momento, reciba un cordial saludo.
\par
\begin{center}
Atentamente:
\par\vspace{4\@line}
\begin{tabular}{ccc}
\@director	\\
Profesor Investigador \\
\end{tabular}
\end{center}
  
  \begin{singlespace}
	  {Ccp:}\par
	  Coordinador del Programa de Sistemas Computacionales\par
	  {\@author}\par
	  Archivo\vfill
  \end{singlespace}
  %\fi
\pagebreak
%  \begin{singlespace}
%  \@date\vfill
%  \end{singlespace}
%  \end{center}
%  \end{titlepage}
}




\def\originalpage{
%  \begin{titlepage}
  \doublespacing
  \begin{center}
%\normalsize

{\bf \large
Declaración de Originalidad
}
  \end{center}
\par
\vspace{2\@line}

Yo, \@author declaro que el material contenido en esta publicación fue elaborado con la revisión de los documentos que se mencionan en el capítulo de Bibliografía, y que la solución obtenida es original y no ha sido copiada de ninguna otra fuente, ni ha sido usada para obtener otro título o reconocimiento en otra institución de educación superior.

\par
\begin{center}
%Atentamente
\par\vspace{6\@line}
\begin{tabular}{ccc}
\@author && \@authorb	\\
\end{tabular}
\end{center}
  \ifdoctor
  \textbf{\large Tesis de Doctorado en Ciencias de la Ingeniería}\par
  \else
  \fi
%  \begin{singlespace}
%  \@date\vfill
%  \end{singlespace}
%  \end{center}
%  \end{titlepage}
}





%thanks
\renewenvironment{thanks}
  {\pagestyle{empty}\chapter*{Agradecimientos}\thispagestyle{empty}}
  {\cleardoublepage\pagestyle{plain}\setcounter{page}\@ne}

%abstract
\renewenvironment{abstract}
  {\pagestyle{empty}\chapter*{\abstractname}\thispagestyle{empty}}

%symbols
\newenvironment{symbols}
  {\chapter*{Simbolog{\'{i}}a Utilizada}}

%preface
\newenvironment{preface}
  {\chapter*{Prefacio}}

  
  
  
  
  
  
% chapter headings
\if@atstyle
  \def\@makechapterhead#1{%
    \begin{center}\doublespacing
    \parindent \z@ \normalfont
      \ifnum \c@secnumdepth >\m@ne
        \Large \scshape \@chapapp\space \thechapter
        \par\nobreak
      \fi
      \interlinepenalty\@M
      \Large \scshape #1\par\nobreak
    \end{center}
  }
  \def\@makeschapterhead#1{%
    \begin{center}\doublespacing
      \parindent \z@
      \normalfont
      \interlinepenalty\@M
      \Large \scshape #1\par\nobreak
    \end{center}
  }
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                     {-3.5ex \@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus.2ex}%
                                     {\normalfont\large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                       {-3.25ex\@plus -1ex \@minus -.2ex}%
                                       {1.5ex \@plus .2ex}%
                                       {\normalfont\normalsize\bfseries}}
\else
  \def\@makechapterhead#1{%%%%%%%%
    \vspace*{50\p@}%
    \begin{singlespace}
      \parindent \z@ \raggedright \normalfont
      \ifnum \c@secnumdepth >\m@ne
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip \p@
      \fi
      \interlinepenalty\@M
      \Huge \bfseries #1\par\nobreak
      \vskip 40\p@%%modifica el espacio entre el título del capítulo y párrafo inicial
    \end{singlespace}
  }
  \def\@makeschapterhead#1{%
    \vspace*{50\p@}%
    \begin{singlespace}
      \parindent \z@ \raggedright
      \normalfont
      \interlinepenalty\@M
      \Huge \bfseries  #1\par\nobreak
      \vskip 40\p@
    \end{singlespace}
  }
\fi

\renewcommand{\part}{\ClassError{tesis}{Invalid command \string\part}%
  {The \string\part\space command is not available in tesis class}}

% page styles
\def\ps@empty{%
  \def\@oddfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
  \def\@evenfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
  \def\@oddhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
  \def\@evenhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
}

\def\ps@blankpage{%
  \def\@oddfoot{\if@isdraft\hfill\blankpageleyend\hfill\fi}
  \def\@evenfoot{\if@isdraft\hfill\blankpageleyend\hfill\fi}
  \def\@oddhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
  \def\@evenhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
}

\def\ps@plain{%
  \def\@oddfoot{\hfill\thepage\hfill}
  \def\@evenfoot{\hfill\thepage\hfill}
  \def\@oddhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
  \def\@evenhead{\if@isdraft\hfill\draftmodeleyend\hfill\fi}
}

\if@twoside
    \def\ps@headings{%
        \def\@oddfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
        \def\@evenfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
        \def\@evenhead{\thepage\hfil\slshape\leftmark}%
        \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
        \let\@mkboth\markboth
      \def\chaptermark##1{%
        \markboth {\MakeUppercase{%
          \ifnum \c@secnumdepth >\m@ne
              \@chapapp\ \thechapter. \ %
          \fi
          ##1}}{}}%
      \def\sectionmark##1{%
        \markright {\MakeUppercase{%
          \ifnum \c@secnumdepth >\z@
            \thesection. \ %
          \fi
          ##1}}}}
\else
    \def\ps@headings{%
      \def\@oddfoot{\if@isdraft\draftmodeleyend\hfill\draftleyend\fi}
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
      \def\chaptermark##1{%
        \markright {\MakeUppercase{%
          \ifnum \c@secnumdepth >\m@ne
              \@chapapp\ \thechapter. \ %
          \fi
          ##1}}}
      \def\sectionmark##1{%
        \markright {\MakeUppercase{%
          \ifnum \c@secnumdepth >\z@
            \thesection. \ %
          \fi
          ##1}}}}
\fi

% esto borra los encabezados de una p\'agina en blanco
\let\@oldcleardoublepage=\cleardoublepage
\renewcommand\cleardoublepage{
  \clearpage
  \thispagestyle{blankpage}
  \if@openright
    \@oldcleardoublepage
  \else
    \clearpage
  \fi
}

\pagestyle{headings}

% title page environment %
\renewenvironment{titlepage}{%
      \newpage
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    { \cleardoublepage
      \setcounter{page}\@ne
    }

% VERSE, QUOTATION, and QUOTE must be single-spaced. %
\let\@oldverse=\verse
\let\@oldquotation=\quotation
\let\@oldquote=\quote
\let\end@oldverse=\endverse
\let\end@oldquotation=\endquotation
\let\end@olquote=\endquote

\renewenvironment*{verse}{\begin{@oldverse}\begin{singlespace}}
    {\end{singlespace}\end{@oldverse}}

\renewenvironment*{quotation}{\begin{@oldquotation} \begin{singlespace}}
    {\end{singlespace}\end{@oldquotation}}

\renewenvironment*{quote}{\begin{@oldquote} \begin{singlespace}}
    {\end{singlespace} \end{@oldquote}}

\let\@oldthebibliography=\thebibliography
\let\end@oldthebibliography=\endthebibliography

\renewenvironment{thebibliography}[1]{%
  \begin{@oldthebibliography}{#1}%
  \addcontentsline{toc}{chapter}{\protect\numberline{}\bibname}%
}{\end{@oldthebibliography}}

% some corrections of spanish leyends given by babel %
\AtBeginDocument{
  \renewcommand\listtablename{\'Indice de tablas}
  \renewcommand\tablename{Tabla}
  \if@isdraft\setlength\overfullrule{5pt}\fi
}

\endinput
%%
%% End of file `tesis.cls'.
