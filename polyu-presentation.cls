%% polyu-presentation.cls
%% Copyright 2022 Tom M. Ragonneau
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Tom M. Ragonneau.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{polyu-presentation}[2022/10/12 PolyU presentation document class]

% Load beamer class as basis
\PassOptionsToPackage{usenames,dvipsnames}{xcolor}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[10pt]{beamer}

% Manage frame numbering in appendices
\RequirePackage{appendixnumberbeamer}

% Beamer theme and color theme
\usetheme{Boadilla}
\usecolortheme{seahorse}
\usefonttheme{professionalfonts}
% \setbeamertemplate{footline}{
%     \leavevmode%
%     \hbox{%
%         \begin{beamercolorbox}[wd=0.333333\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}%
%             \usebeamerfont{author in head/foot}\insertshortauthor~(\insertshortinstitute)
%         \end{beamercolorbox}%
%         \begin{beamercolorbox}[wd=0.333333\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}%
%             \usebeamerfont{title in head/foot}\insertshorttitle
%         \end{beamercolorbox}%
%         \begin{beamercolorbox}[wd=0.333333\paperwidth,ht=2.25ex,dp=1ex,right]{date in head/foot}%
%             \usebeamerfont{date in head/foot}\insertshortsubtitle\hspace*{2em}
%             \usebeamertemplate{page number in head/foot}\hspace*{2ex}
%         \end{beamercolorbox}%
%     }%
%     \vskip0pt%
% }

% Modify beamer default template
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{itemize items}[triangle]

% Put only the numbered sections in the table of contents
\setbeamertemplate{section in toc}[sections numbered]

% Latin fonts
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}
\RequirePackage{csquotes}
\setsansfont{FiraSans}[
    Path=fonts/fira-sans/,
    Extension=.otf,
    UprightFont=*-Light,
    BoldFont=*-Medium,
    ItalicFont=*-LightItalic,
    BoldItalicFont=*-SemiBoldItalic,
]
\setmonofont{FiraMono}[
    Path=fonts/fira-mono/,
    Extension=.otf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
]

% Spacing between lines
\usepackage[nodisplayskipstretch]{setspace}
\setstretch{1.25}

% Mathematics
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{dsfont}
\RequirePackage{empheq}
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator{\card}{card}
\DeclareMathOperator{\conv}{conv}
\DeclareMathOperator{\diam}{diam}
\DeclareMathOperator{\rank}{rank}
\newcommand{\eqdef}{\mathrel{\stackrel{\mathsf{def}}{=}}}
\newcommand{\R}{\mathds{R}}
\newcommand{\T}{\mathsf{T}}
\newcommand{\abs}[2][]{#1\lvert#2#1\rvert}
\newcommand{\ceil}[2][]{#1\lceil#2#1\rceil}
\newcommand{\floor}[2][]{#1\lfloor#2#1\rfloor}
\newcommand{\negp}[2][]{#1[#2#1]_-}
\newcommand{\norm}[2][]{#1\lVert#2#1\rVert}
\newcommand{\posp}[2][]{#1[#2#1]_+}
\newcommand{\set}[2][]{#1\{#2#1\}}
\newcommand{\inner}[2][]{#1\langle#2#1\rangle}

% TikZ
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{pgfplotstable}
\RequirePackage{makecell}
\usetikzlibrary{calc,decorations.pathreplacing,overlay-beamer-styles,patterns,shapes}
\pgfplotsset{
    compat=1.18,
}
\usepgfplotslibrary{external}
\pgfplotscreateplotcyclelist{profiles}{
    thick,mark=none,NavyBlue,solid\\
    thick,mark=none,BurntOrange,dashed\\
    thick,mark=none,OliveGreen,dotted\\
    thick,mark=none,BrickRed,dashdotted\\
    thick,mark=none,Purple,densely dashed\\
    thick,mark=none,Mahogan,densely dashed\\
    thick,mark=none,Rhodamine,densely dashdotted\\
    thick,mark=none,Gray,loosely dashed\\
    thick,mark=none,LimeGreen,loosely dotted\\
    thick,mark=none,JungleGreen,loosely dashdotted\\
}
\pgfplotsset{
    every axis/.append style={
        label style={font=\footnotesize},
        legend cell align=left,
        legend style={
            rounded corners,
            thick,
            draw=black!15,
            % fill opacity=0.8,
            % draw opacity=1,
            % text opacity=1,
            font=\scriptsize,
        },
        tick label style={font=\footnotesize},
    },
}
\pgfkeys{/pgf/images/include external/.code=\includegraphics{#1}}
\tikzexternalize[
    prefix=figures/,
]

% Alert text
\setbeamercolor{alerted text}{fg=RedViolet}
\setbeamerfont{alerted text}{series=\bfseries\boldmath}

% Pseudocode
\usepackage[ruled,algosection,vlined]{algorithm2e}
\renewenvironment{algomathdisplay}{\begin{equation*}}{\@endalgocfline\end{equation*}\vspace{-\baselineskip}\;}
\newenvironment{algoempheq}[2][]{\empheq[#1]{#2}}{\@endalgocfline\endempheq\vspace{-\baselineskip}\;}
\renewcommand{\thealgocf}{}
\newcommand{\commfont}[1]{\ttfamily\textcolor{OliveGreen}{#1}}
\SetCommentSty{commfont}

% Listings environments
\usepackage[final]{listings}
\usepackage{lstautogobble}
\lstset{
    autogobble=true,
    basicstyle=\normalsize\ttfamily,
    belowcaptionskip=\bigskipamount,
    breakautoindent=true,
    breakatwhitespace=false,
    breaklines=true,
    commentstyle=\itshape\color{black!50},
    frame=none,
    keywordstyle=\bfseries\color{Maroon},
    % numbers=left,
    % numberstyle=\scriptsize\bfseries,
    postbreak=\space,
    showstringspaces=false,
    stepnumber=1,
    stringstyle=\itshape,
    tabsize=4,
}
\lstnewenvironment{lstmatlab}[1][]{
    \lstset{
        language=matlab,
        % morekeywords={},
        #1,
    }
}{}
\lstnewenvironment{lstpython}[1][]{
    \lstset{
        language=python,
        % morekeywords={},
        #1,
    }
}{}

% Set up SI units
\RequirePackage{siunitx}
\sisetup{
    group-separator={,},
}

% Bibliography information processing
\usepackage[
    style=ext-authoryear-comp,
    articlein=false,
    sorting=nyt,
    sortcites=false,
    maxcitenames=2,
]{biblatex}
\setbeamertemplate{bibliography item}[default]
\defbibenvironment{bibliography}{
	\list{}{
        \settowidth\labelwidth{\usebeamertemplate{bibliography item}}
        \setlength\leftmargin{\labelwidth}
        % \setlength\itemindent{-\leftmargin}
        % \addtolength\leftmargin{\leftmargin}
        \setlength\labelsep{\biblabelsep}
        \addtolength\leftmargin{\labelsep}
        \setlength\bibitemsep{\itemsep}
        \setlength\parsep{\bibparsep}
	}
}{\endlist}{\item}
\DeclareNameAlias{author}{family-given}

% Place a partial table of contents at the beginning of each section
\AtBeginSection[]{
	\begin{frame}
        \frametitle{Table of contents}
		\tableofcontents[currentsection,hideallsubsections]
	\end{frame}
}

% Email field
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{\texorpdfstring{\usebeamercolor[fg]{structure}#1}{#1}}}}

% Patch warning `Package hyperref Warning: Token not allowed in a PDF string (Unicode)'
\pdfstringdefDisableCommands{\def\translate#1{#1}}