\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs0500}[01/2026 CS 0500 LaTeX class]

\LoadClass[11pt]{article}
\RequirePackage[margin=1in, headheight=14pt]{geometry}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{titling}
\RequirePackage{etoolbox}
\RequirePackage{framed}
\RequirePackage{xcolor}
\RequirePackage{algorithm}
\RequirePackage{algpseudocodex}
\RequirePackage{bold-extra}
\RequirePackage{hyperref}
\RequirePackage{enumerate}
\RequirePackage{physics}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{algorithm} 
\RequirePackage{todonotes}
\RequirePackage{listings}
\RequirePackage{multicol}
\definecolor{shadecolor}{gray}{0.8}



%%% Header, footer, and title customization
\renewcommand{\footrulewidth}{1pt}
\fancypagestyle{plain}{
    \fancyhead[L]{\textbf{CSCI 500}}
    \fancyhead[C]{Data Structures, Algorithms, and Intractability}
    \fancyhead[R]{\textbf{Lorenzo De Stefani}}
    \fancyfoot[L]{\documentName}
    \fancyfoot[R]{Spring 2026}
}
\fancypagestyle{exam}{
    \fancyhead[L]{\textbf{CSCI 500}}
    \fancyhead[C]{Data Structures, Algorithms, and Intractability}
    \fancyhead[R]{\textbf{Lorenzo De Stefani}}
    \fancyfoot[L]{\textbf{Name:}}
    \fancyfoot[R]{\textbf{Banner ID: \underline{B\phantom{XXXXXXXX}}}}
}
\fancypagestyle{exam-takehome}{
    \fancyhead[L]{\textbf{CSCI 500}}
    \fancyhead[C]{Data Structures, Algorithms, and Intractability}
    \fancyhead[R]{\textbf{Lorenzo De Stefani}}
    \fancyfoot[L]{}
    \fancyfoot[R]{Spring 2026}
}
\pagestyle{plain}

\renewcommand{\author}{\PackageError{cs0500}{Don't write your name on the assignment !}}
% Leave the argument empty ({}) to remove the due date
\newcommand{\due}{\date}

\setlength{\droptitle}{-4em}
\renewcommand{\maketitle}{\begin{center}\huge\textbf{\@title}\\\vspace{0.5em}\Large\ifdefempty{\@date}{}{Due: \@date}\end{center}}

%%% Convenience Commands
\newcommand{\hwk}[3]{%
    \newcommand{\assignmentNumber}{#1}
    \newcommand{\documentName}{#2}
    \title{Homework \assignmentNumber: \documentName}
    \due{#3}
}

\newcommand{\exam}[2]{%
    \pagestyle{exam}
    \newcommand{\assignmentNumber}{#1}
    \title{Exam \assignmentNumber}
    \due{#2}
    \renewcommand{\maketitle}{\begin{center}\huge\textbf{\@title}\\\vspace{0.5em}\Large\ifdefempty{\@date}{}{\@date}\end{center}}
}

\newcommand{\midterm}[1]{%
    \pagestyle{exam}
    \title{Midterm}
    \due{#1}
    \renewcommand{\maketitle}{\begin{center}\huge\textbf{\@title}\\\vspace{0.5em}\Large\ifdefempty{\@date}{}{\@date}\end{center}}
}

\newcommand{\pramidterm}{%
    \pagestyle{exam}
    \title{Practice Midterm}
    % \due{#1}
    \renewcommand{\maketitle}{\begin{center}\huge\textbf{\@title}\\\vspace{0.5em}\Large\ifdefempty{\@date}{}{\@date}\end{center}}
}

\newcommand{\final}[1]{%
    \pagestyle{exam-takehome}
    \title{Final}
    \due{#1}
    \renewcommand{\maketitle}{\begin{center}\huge\textbf{\@title}\\\vspace{0.5em}\Large\ifdefempty{\@date}{}{\@date}\end{center}}
}

\newcommand{\prafinal}[1]{%
    \pagestyle{exam}
    \title{Practice Final}
    \due{#1}
    \renewcommand{\maketitle}{\begin{center}\huge\textbf{\@title}\\\vspace{0.5em}\Large\ifdefempty{\@date}{}{\@date}\end{center}}
}

\newcommand{\completion}[1]{%
    \pagestyle{exam}
    \title{Course Completion Assignment}
    \due{#1}
    \renewcommand{\maketitle}{\begin{center}\huge\textbf{\@title}\\\vspace{0.5em}\Large\ifdefempty{\@date}{}{\@date}\end{center}}
}

\newcommand{\sol}[2]{%
    \newcommand{\assignmentNumber}{#1}
    \newcommand{\documentName}{#2}
    \title{Solution \assignmentNumber: \documentName}
    \due{}
}

\newcommand{\examsol}[1]{%
    \newcommand{\documentName}{#1}
    \title{Solution: \documentName}
}

\newcommand{\guide}[1]{%
    \newcommand{\documentName}{#1}
    \title{#1}
    \due{}
}

\newcommand{\assignmentInstructions}{%
    \setlength{\parindent}{0pt}
    This homework must be typed in \LaTeX. Please use the code released as part of the homework, remove these instructions and fill in the solutions.

    \medskip

    Please ensure that your solutions are complete, concise, and communicated clearly. Use full sentences and plan your presentation before you write. Except where indicated, consider every problem as asking for a proof.

    \medskip Your solutions must be submitted using Gradescope. When doing so, please correctly mark the pages with the solutions to each problem.
}

\newcounter{problemCounter}
\newenvironment{problem}[1][]{\begin{shaded}\refstepcounter{problemCounter}\par\medskip
        \noindent \textbf{Problem~\theproblemCounter. #1}}{\end{shaded}\medskip}

\newenvironment{solution}{\begin{proof}[Solution]}{\end{proof}}

% Pseudocode
\newcommand{\chigh}[2]{%
    \BeginBox[fill=#1]
    #2
    \EndBox
}

\newcommand{\cstring}[2]{%
    \BoxedString[fill=#1]{#2}
}

\newcommand{\Input}{\Require}

\renewcommand{\Output}{\Ensure}

\algrenewcommand\algorithmicrequire{\textbf{Input:}}
\algrenewcommand\algorithmicensure{\textbf{Output:}}

\makeatletter
\preto{\@verbatim}{\topsep=0pt \partopsep=0pt}
\algrenewcommand\ALG@beginalgorithmic{\ttfamily}
\makeatother

\DeclareRobustCommand{\midtermpolicyremind}{
\textbf{Reminder}:
Your name should not appear anywhere on your hand-in; each individual
page of the homework should include your Banner ID only. For your digital submission, each page should include work for only one problem (i.e., make a new page/new pages for each problem).

Collaboration or any kind of use of any third-party resource is strictly \textbf{not allowed} on this assignment. The TA staff will only answer questions regarding clarifications on the statement of the problems in the assignment. Questions should be asked via private posts on Ed. Please monitor Ed, as we will post clarifications of frequently asked questions there. 

Hand in your solutions by 14:29pm to Gradescope.
See the course syllabus for the late policy. Usage of any materials outside of course notes, the course textbook, lecture slides and Ed posts is strictly forbidden.

You may apply up to two late days to this assignment.
}

\newcommand*{\mdtrm}[1]{ %
  \DeclareRobustCommand{\CS@asgnname}{Midterm #1} %
  \setboolean{CS@ishwkorlab}{true} %
  \DeclareRobustCommand{\CS@asgnnum}{#1} %
  \DeclareRobustCommand{\CS@dateprefix}{Due: } %
  \setboolean{CS@isprac}{false} %
}