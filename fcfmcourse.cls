\ProvidesClass{fcfmcourse}[2016/16/02 Beta 0.5
LaTeX Class for standardization of teaching assistant classes in the Faculty of Physical and Mathematical Sciences, University of Chile]

%%%%%% OPTIONS DECLARATION
\def\@dep{fcfm}
\DeclareOption{das}{\def\@dep{das}}
\DeclareOption{dcc}{\def\@dep{dcc}}
\DeclareOption{fcfm}{\def\@dep{fcfm}}
\DeclareOption{dfi}{\def\@dep{dfi}}
\DeclareOption{dgf}{\def\@dep{dgf}}
\DeclareOption{geo}{\def\@dep{geo}}
\DeclareOption{dic}{\def\@dep{dic}}
\DeclareOption{die}{\def\@dep{die}}
\DeclareOption{dii}{\def\@dep{dii}}
\DeclareOption{dim}{\def\@dep{dim}}
\DeclareOption{diqbt}{\def\@dep{diqbt}}
\DeclareOption{minas}{\def\@dep{minas}}

\newif\if@usedate\@usedatefalse
\DeclareOption{usedate}{\@usedatetrue}

\newif\if@sol\@solfalse
\DeclareOption{sol}{\@soltrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt]{article}

%%%%%% REQUIRED PACKAGES
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{enumerate}
\RequirePackage[letterpaper]{geometry}
\RequirePackage{ifthen}
\RequirePackage{forloop}
\RequirePackage{xparse}
\RequirePackage{environ}

%%%%%% DEPARTMENTS
\def\name@das{Departamento de Astronom\'{\i}a}
\def\name@dcc{Departamento de Ciencias de la Computaci\'on}
\def\name@dfi{Departamento de F\'{\i}sica}
\def\name@dgf{Departamento de Geof\'{\i}sica}
\def\name@dic{Departamento de Ingenier\'{\i}a Civil}
\def\name@die{Departamento de Ingenier\'{\i}a El\'ectrica}
\def\name@dii{Departamento de Ingenier\'{\i}a Industrial}
\def\name@dimec{Departamento de Ingenier\'{\i}a Mec\'anica}
\def\name@dim{Departamento de Ingenier\'{\i}a Matem\'atica}
\def\name@diqbt{Departamento de Ingenier\'{\i}a Qu\'{\i}mica y Biotecnolog\'{\i}a}
\def\name@fcfm{Facultad de Ciencias F\'{\i}sicas y Matem\'aticas}
\def\name@geo{Departamento de Geolog\'{\i}a}
\def\name@minas{Departamento de Ingenier\'{\i}a en Minas}

\newcommand{\@logo}{logos/fcfm_\@dep.eps}
\newcommand{\@department}{\expandafter\csname name@\@dep\endcsname}


%%%%%% COMMANDS FOR PROBLEMS
\newenvironment{problems}{\enumerate[\bf P1.]}{\endenumerate}
% \AtBeginDocument{\maketitle\enumerate[\bf P1.]}
% \AtEndDocument{\endenumerate}
\global\let\problem\item
\NewEnviron{solution}{\if@sol\vskip 0.25em \hskip -\leftmargin{\bf Soluci\'on:} \\\BODY\fi}


%%%%%% GEOMETRY
\newlength{\FP@margin}
\setlength{\FP@margin}{1in}
\setlength{\textwidth}{\paperwidth}
\addtolength{\textwidth}{-2\FP@margin}
\setlength{\oddsidemargin}{\FP@margin}
\addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}

%%%%%% HEADER 
\def\@university{Universidad de Chile}
\global\let\@course\@empty
\NewDocumentCommand\course{ o m }{%
  \IfValueTF{#1}{%
    \def\@course{#1 {-} #2}%
  }{%
    \def\@course{#2}
  }%
}


\setlength\headheight{4.5em} 
\pagestyle{fancy}
\lhead{\small \@university\\ \@department\ifthenelse{\equal\@course\@empty}{}{\\ \@course}}
\rhead{\includegraphics[scale=0.25]{\@logo}}

%%%%%% TITLE
\RenewDocumentCommand\title{ o m }{%
  \IfValueTF{#1}{%
    \def\@title{Auxiliar #1 {-} #2}
  }{%
    \def\@title{#2}
  }
}
\newcommand{\@email}[1]{\texttt{[#1]}}

% COMMANDS TO ADD PROFESSORS
\newcounter{professorCnt}
\NewDocumentCommand\professor{ o m }{%
  \IfValueTF{#1}{%
    \expandafter\gdef\csname professor@\theprofessorCnt\endcsname{#2 \@email{#1}} 
  }{%
    \expandafter\gdef\csname professor@\theprofessorCnt\endcsname{#2} 
  }%
  \stepcounter{professorCnt}
}
\newcommand{\@Profesor}{Profesor\ifthenelse{\value{professorCnt} = 1}{}{es}:}

% COMMANDS TO ADD TEACHING ASSISTANTS
\newcounter{assistantCnt}
\NewDocumentCommand\assistant{ o m }{%
  \IfValueTF{#1}{%
    \expandafter\gdef\csname assistant@\theassistantCnt\endcsname{#2 \@email{#1}} 
  }{%
    \expandafter\gdef\csname assistant@\theassistantCnt\endcsname{#2} 
  }%
  \stepcounter{assistantCnt}
}
\newcommand{\@Auxiliar}{Auxiliar\ifthenelse{\value{assistantCnt} = 1}{}{es}:}

\newcounter{cnt}
\renewcommand{\maketitle}{
  \begin{center}
    {\LARGE\begin{minipage}{0.88\textwidth}\centering \@title\end{minipage}}
    \vskip 0.5em
    \small
    {
    \setlength{\tabcolsep}{2pt}
    \begin{tabular}{rl}
      \ifthenelse{\value{professorCnt} = 0}{}{%
        \forloop{cnt}{0}{\value{cnt} < \value{professorCnt}}{
          \ifthenelse{\value{cnt} = 0}{\@Profesor}{\\} & \csname professor@\thecnt\endcsname 
        }
      }
      \ifthenelse{\value{assistantCnt} = 0}{}{\\[0.2em]
        \forloop{cnt}{0}{\value{cnt} < \value{assistantCnt}}{
          \ifthenelse{\value{cnt} = 0}{\@Auxiliar}{\\} & \csname assistant@\thecnt\endcsname 
        }
      }
    \end{tabular}
    }
    \if@usedate
    \vskip 0.5em
    \@date
    \fi

    \vskip 1.5em
    \normalsize
  \end{center}
}

