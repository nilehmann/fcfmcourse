\ProvidesClass{dcccourse}[2015/04/01 Beta 0.4
LaTeX Class for documents of the courses in the Department of Computer Science, University of Chile]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt]{article}

%REQUIRED PACKAGES
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{enumerate}
\RequirePackage[letterpaper]{geometry}
\RequirePackage{ifthen}
\RequirePackage{forloop}

%%COMMANDS FOR PROBLEMS
\global\let\@num\@empty
\newcommand{\num}[1]{\def\@num{#1}}

\def\@@title{Auxiliar \@num{} - \@title}
\AtBeginDocument{\maketitle\enumerate[\bf P1.]}
\AtEndDocument{\endenumerate}
\global\let\problem\item


%% GEOMETRY
\newlength{\FP@margin}
\setlength{\FP@margin}{1in}
\setlength{\textwidth}{\paperwidth}
\addtolength{\textwidth}{-2\FP@margin}
\setlength{\oddsidemargin}{\FP@margin}
\addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}

%% HEADER 
\global\let\@course\@empty
\newcommand{\course}[1]{\def\@course{#1}}

\def\@university{Universidad de Chile}
\def\@department{Departamento de Ciencias de la Computaci\'on}

\setlength\headheight{4.5em} 
\pagestyle{fancy}
\lhead{\small \@university\\ \@department\ifthenelse{\equal\@course\@empty}{}{\\ \@course}}
\rhead{\includegraphics[scale=0.25]{fcfm_dcc.eps}}

%% TITLE
\newcommand{\@email}[1]{\ifthenelse{\equal#1\@empty}{}{\texttt{[#1]}}}

\global\let\@professor\@empty
\newcommand{\professor}[2][\@empty]{\def\@professor{#2 \@email{#1}}}

\newcounter{assistantCnt}
\newcommand{\assistant}[2][\@empty]{\expandafter\def\csname assistant@\theassistantCnt\endcsname{#2 \@email{#1}} \stepcounter{assistantCnt}}

\newcommand{\@Auxiliar}{Auxiliar\ifthenelse{\value{assistantCnt} = 1}{}{es}:\relax}

\renewcommand{\maketitle}{
  \begin{center}
    \LARGE{\begin{minipage}{0.88\textwidth}\centering \@@title\end{minipage}}
    \vskip 0.5em
    \small
    {
    \setlength{\tabcolsep}{2pt}
    \begin{tabular}{rl}
      Profesor: & \@professor
      \ifthenelse{\value{assistantCnt} = 0}{}{\\[0.2em]
        \newcounter{cnt}
        \forloop{cnt}{0}{\value{cnt} < \value{assistantCnt}}{
          \ifthenelse{\value{cnt} = 0}{\@Auxiliar}{\\} & \csname assistant@\thecnt \endcsname 
        }
      }
    \end{tabular}
    }

    \vskip 1.5em
    \normalsize
  \end{center}
}

