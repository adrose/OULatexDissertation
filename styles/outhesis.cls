%%
%% This file `osuthesis.cls' was originally adapted from `report.cls'.
%%
%%
%% Copyright (C) 1999, 2005, 2020
%% Oklahoma State University
%%
%% Original author: Brian O'Dell
%% Revised: Ryan T. Ratliff  2005
%% Revised: Paul Fili, Edward Richmond 2020
%%
%% YOU SHOULD NOT NEED TO CHANGE ANYTHING IN THIS FILE DIRECTLY.
%% SEE THE dissertation_main.tex FILE FOR THE DATA WHICH YOU
%% NEED TO SUPPLY
%%
%% Usage:
%%      This class file follows the format for theses and dissertations
%%      of Oklahoma State University.  A sample document template is shown
%%      below.  For special information (name, degree, etc.) use standard
%%      capitalization rules except where noted.  IT IS IMPORTANT TO
%%      MAINTAIN THIS SEQUENCE.  User-supplied information is denoted with
%%      ``< ... >''.
%%
%%              % Sample OSU /Dissertation
%%
%%              \documentclass{osuthesis}
%%
%%              \title{<TITLE>} % Title in ALL CAPS
%%              \formattedtitle{<TITLE>} % Same as \title, but with line
%%                                       % breaks to obtain the inverted
%%                                       % pyramid shape required for
%%                                       % title and approval pages
%%              \author{<AUTHOR>} % Author in ALL CAPS
%%
%%              % Earned degree(s)
%%              \degreeone{%
%%                <Degree>\\%
%%                <Institution>\\%
%%                <City>, <State/Country>\\%
%%                <Year>}
%%              \degreeone{%
%%                <Degree>\\%
%%                <Institution>\\%
%%                <City>, <State/Country>\\%
%%                <Year>} % (If applicable)
%%
%%              % Current degree information
%%              \degreesought{<DEGREE>} % Degree in ALL CAPS
%%              \degreedate{<Month>, <Year>}
%%              \majorfield{<Field>}
%%
%%              \begin{document}
%%
%%              \bibliographystyle{plain}  % Several styles available,
%%                                         % check with your department
%%
%%              % FOREMATTER
%%              \maketitle        % Creates title page.
%%              \makeapproval{5}  % Creates spproval page.  The argument
%%                                % (the numeral 4,5, or 6) is the number of
%%                                % signatures required (Remember to add one
%%                                % for the Dean of the Graduate College.)
%%
%%              \begin{preface}   % Creates Preface page (OPTIONAL)
%%                <Preface text here.>
%%              \end{preface}
%%
%%              \begin{acknowledge}  % Creates Acknowledgments
%%                                   % page (OPTIONAL)
%%                <Acknowledgment text here.>
%%              \end{acknowledge}
%%
%%              \tableofcontents  % Creates table of contents
%%              \listoffigures    % Creates list of figures (IF APPLICABLE)
%%              \listoftables     % Creates list of tables (IF APPLICABLE)
%%
%%              % BODY OF THESIS
%%              <Text>  % (Recommend storing text in separate *.tex file, then
%%                      % including with \include{<filename>}.)
%%
%%              % BIBLIOGRAPHY
%%              \bibliography{<*.bib file(s)>}
%%
%%              % APPENDICES
%%              \appendix
%%              <Text>  % (Recommend storing text in separate *.tex file, then
%%                      % including with \include{<filename>}.)
%%
%%              % MISCELLANEOUS
%%              \begin{vita}{<Name>}{<Degree>}{<Field>} % Creates vita
%%                \vitaitem{Personal Data:} <Text> % OPTIONAL
%%                \vitaitem{Education:} <Text> Completed the requirements
%%                  for the <Degree> degree with a major in <Field> at
%%                  Oklahoma State University in <Month>, <Year>.
%%                \vitaitem{Experience:} <Text>
%%                \vitaitem{Professional Memberships:} <Text>
%%              \end{vita}
%%
%%              \begin{abstract}{<Name>}{<Degree>}{<Field>} % Creates abstract
%%                <Text> % (350 word maximum)
%%              \end{abstract}
%%
%%              \end{document}
%%
%%
%% Notes:
%%   1) A proof environment is defined in this file.  It must be removed
%%      if an included package (e.g., amsmath) also defines this environment
%%      or an error will result.
%%   2) Theorem-like environments are defined (using the environment name
%%      in parenthesis) for Theorem (theorem), Lemma (lemma),
%%      Corollary (corollary), Problem (problem), Definition (definition),
%%      Assumption (assumption), Example (example), and Remark (remark).
%%   3) Remember that the abstract must be submitted separately from the
%%      thesis, and that six copies must be submitted.
%%   4) Remember to include two blank pages before the title page and after
%%      the vita.
%%
%%
%% This file requires LaTeX2e.
%% -------------------------------------------------
%%
%%
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
%%


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{osuthesis}
              [2020/02/04 v2.0
 Oklahoma State University Thesis/Dissertation document class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{letterpaper,10pt,oneside,onecolumn,final,openany}
\ProcessOptions

\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}


% ********************************************************
% **************** SPECIAL DECLARATIONS ******************
% ********************************************************

% Theorem-like environments defined at end of this document.

% Define single- and double-space environments.
\def\ssp{\def\baselinestretch{1.0}\large\normalsize}
\def\msp{\def\baselinestretch{1.3}\large\normalsize}
\def\dsp{\def\baselinestretch{1.67}\large\normalsize}

% The formatted title
\def\formattedtitle#1{\gdef\@formattedtitle{#1}}

% The full (unabbreviated) name of the degree
\def\degreesought#1{\gdef\@degreesought{#1}}

% The year the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}

% The name of your degree's field (e.g. Economics, Computer Science)
\def\majorfield#1{\gdef\@majorfield{#1}}

% Previous degrees
\newif\if@onedegree
\@onedegreetrue
\def\degreeone#1{\gdef\@degreeone{#1}}
\def\degreetwo#1{\gdef\@degreetwo{#1}\@onedegreefalse}
\def\degreethree#1{\gdef\@degreethree{#1}\@onedegreefalse}

% Commands for proof environment (adapted from amsgen.sty & amsthm.sty)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareRobustCommand{\qed}{%
 \ifmmode % if math mode, assume display: omit penalty etc.
  \else \leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
  \fi
  \quad\hbox{\qedsymbol}}
\newcommand{\openbox}{\leavevmode
  \hbox to.77778em{%
  \hfil\vrule
  \vbox to.675em{\hrule width.6em\vfil\hrule}%
  \vrule\hfil}}
\newcommand{\qedsymbol}{{\mbox{\rule[0pt]{1.5ex}{1.5ex}}}}

%%%%the following is the modified proof environment from the university%%%%%%%%%%%%
%\newenvironment{proof}{%
  %\par\normalfont\topsep12pt%
   %\trivlist
     % \item[\hskip\labelsep\itshape Proof.]\ignorespaces
  %}{%
 % %\qed\endtrivlist}
  %$\Box$\endtrivlist}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 %%%%%%%this is the proof environment I copied from amsthm package and it works better%%%%%%%%%%%%%%%%%%%%%
  \newenvironment{proof}[1][\proofname]{\par
  \normalfont
  \topsep6\p@\@plus6\p@ \trivlist
  \item[\hskip\labelsep\itshape
    #1.]\ignorespaces
}{%
  \qed\endtrivlist %%this ending symbol is a solid black box
 % $\Box$\endtrivlist %%change the ending symbol from a solid black box to an empty box
}
\newcommand{\proofname}{Proof}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define a placeholder counter for roman-numbered pages.
\newcounter{placeholder}

% Define inverted pyramid title paragraph shape
\newcommand{\invertedpyramid}{\parshape=3 0in 4in 0.25in 3.5in 0.5in 3in}

% ********************************************************
% ********************************************************


% ********************************************************
% ****************** PAGE FORMATTING *********************
% ********************************************************

\dsp   % Use double spacing for text

\newfont{\ninerm}{cmr9}
\newfont{\tenrm}{cmr10}

\setlength{\voffset}{0in}
\setlength{\hoffset}{0in}
\setlength{\topmargin}{0in}
\setlength{\headheight}{0pt} % 12pt}
\setlength{\headsep}{0pt} % 12pt}
\setlength{\textwidth}{6in}
\setlength{\textheight}{9in} % 624pt} % = 9in - 24 pts for heightheight and sep = 624 pts (72 pt = 1 in)
\setlength{\oddsidemargin}{0.3125in} % adds to nominal 1in margin
\setlength{\footskip}{36pt}  % 0.5in

\newlength{\titlewidth} % defines width for title page text
\setlength{\titlewidth}{4in}
\newlength{\widertitlewidth} % defines wider width for title page text
\setlength{\widertitlewidth}{5in}

\setlength{\marginparsep}{0in}
\setlength{\marginparwidth}{0in}

\newlength{\mylengtha}  % Used in formatting vita and abstract
\newlength{\mylengthb}

% ********************************************************
% ********************************************************


% ********************************************************
% ********************  TITLE PAGE  **********************(no page number, put it at the very beginning of the thesis)
% ********************************************************

\newcommand{\maketitle}% Create coverpage layout.
  {\newpage \setlength{\partopsep}{0in} \setlength{\topskip}{0in}
   \thispagestyle{empty}
    \setcounter{page}{1}
   \renewcommand{\thepage}{\roman{page}}
   \begin{center}\ssp
     \vspace*{1in}\par
     \parbox{\widertitlewidth}{\centering \dsp \@formattedtitle}
     \par\vfill\par
     \if@onedegree
       \parbox{\titlewidth}{\centering \dsp By \par \@author %
               \@degreeone \par \ssp}
     \else
       \parbox{\widertitlewidth}{\centering \dsp By \linebreak\linebreak %
       \@author \linebreak\linebreak %
       \@degreeone \linebreak\linebreak %
       \@degreetwo \linebreak\linebreak %
       \@degreethree}
     \fi
     \par\vfill\par
     Submitted to the Faculty of the\\
     Graduate College of the\\
     Oklahoma State University\\
     in partial fulfillment of\\
     the requirements for\\
     the Degree of\\
     \@degreesought\\
     \@degreedate
   \end{center}
   \par\ssp\vspace*{0.875in}\par\dsp% 2 inch nominal bottom margin
   \newpage
   \renewcommand{\thepage}{\arabic{page}}
   }

% \maketitle outputs the complete titlepage.

% ********************************************************
% ********************************************************


% ********************************************************
% ******************  COPYRIGHT PAGE  ******************** 
% (not needed on and after May 2016)
% ********************************************************

%\newcommand{\makecopyright}% Create coverpage layout.
  %{\newpage
   %\thispagestyle{empty}
   %\renewcommand{\thepage}{\roman{page}}
   %\vspace*{\fill}\par
   %\begin{center}\dsp
    % COPYRIGHT \copyright\\
     %By\\
     %\@author\\
     %\@degreedate
   %\end{center}
   %\par\vspace*{\fill}\dsp
   %\newpage
   %\renewcommand{\thepage}{\arabic{page}}
   %}

% \maketitle outputs the complete titlepage.

% ********************************************************
% ********************************************************

% ********************************************************
% *******************  APPROVAL PAGE  ********************
% (no need to put the dean of the graduate college for May 2016)
% ********************************************************
\newcommand{\makeapproval}[4]% Create approval page layout.
  {\newpage \setlength{\partopsep}{0in} \setlength{\topskip}{0in}
   \renewcommand{\thepage}{\roman{page}}
   \begin{center}\msp  % \msp adjusts the spacing between lines
     \vspace*{1in}\par
     \parbox{\widertitlewidth}{\centering \dsp \@formattedtitle}

 \mbox{} \\ \vspace{2cm}

     \parbox{\titlewidth}{Dissertation Approved:}\par


       \parbox{\titlewidth}{\centering %
         \begin{tabular}{@{}c@{}}
         % Remove names if creating signature page
           \rule{\titlewidth}{0in} \\ \mbox{} \\ \mbox{} \\%\mbox{Dissertation Advisors Name Here} \\
           \mbox{#1} \\
           \hline  % Sets width of sig. lines
           \mbox{Dissertation Advisor} \\
           \mbox{} \\ \mbox{} \\ \mbox{} \\

           \mbox{#2} \\
           \hline
           \mbox{} \\ \mbox{} \\ \mbox{} \\

           \mbox{#3} \\
           \hline
           \mbox{} \\ \mbox{} \\ \mbox{} \\

           \mbox{#4} \\
           \hline
           \mbox{} \\ \mbox{} \\ \mbox{} \\

           %{\ssp Dean of the Graduate College}
         \end{tabular}}
     \end{center}
  %\par\ssp\vspace*{1.8125in}\par\dsp% 4 inch nominal bottom margin
  \newpage
  \renewcommand{\thepage}{\arabic{page}}
  }
% \makeapproval outputs the complete approval page

% ********************************************************
% ********************************************************

% ********************************************************
% ***************  PREFACE PAGE  ****************(did not use)
% ********************************************************

\newenvironment{preface}
  {\renewcommand{\thepage}{\roman{page}}
    {\centering \ssp \rule{0in}{68pt} \par
       PREFACE \par
       \vspace*{0.25in} \par \dsp}
  }
  {\newpage\renewcommand{\thepage}{\arabic{page}}}

% ********************************************************
% ********************************************************


% ********************************************************
% ***************  ACKNOWLEDGMENTS PAGE  ****************(optional for May 2016)
% ********************************************************

\newenvironment{acknowledge}
  {\newpage \renewcommand{\thepage}{\roman{page}}
  \makeatletter
\def\blfootnote{\xdef\@thefnmark{}\@footnotetext}
\makeatother

     {\centering \ssp \rule{0in}{68pt} \par
        ACKNOWLEDGMENTS\blfootnote{Acknowledgments reflect the views of the author and are not endorsed
by committee members or Oklahoma State University.}

 \par
        \vspace*{0.25in} \par \dsp}
  }
  {\newpage\renewcommand{\thepage}{\arabic{page}}}

% ********************************************************
%*****************************Nomenclature
% ********************************************************
\newenvironment{nomenclature}
  {\newpage \renewcommand{\thepage}{\roman{page}}
     {\centering \ssp \rule{0in}{68pt} \par
        NOMENCLATURE \par
        \vspace*{0.25in} \par \dsp}
  }
  {}%\newpage\renewcommand{\thepage}{\arabic{page}}}

\newenvironment{listofsymbols}
  {\newpage \renewcommand{\thepage}{\roman{page}}
     {\centering \ssp \rule{0in}{68pt} \par
        LIST OF SYMBOLS \par
        \vspace*{0.25in} \par \dsp}
  }
  {}%\newpage\renewcommand{\thepage}{\arabic{page}}}
  
% ********************************************************
% *******************  ABSTRACT PAGE  ********************
% ********************************************************
\newenvironment{abstract}[5]{
        \newpage \vspace*{#5}\renewcommand{\thepage}{\roman{page}}
        {\dsp \parindent=0in
        Name:~~#1  \par 

        Date of Degree:~~#2  \par

        \settowidth{\mylengtha}{Title of Study:~~}
        \setlength{\mylengthb}{\textwidth}
        \addtolength{\mylengthb}{-\mylengtha}
        \mbox{Title of Study:~~#3}
           \par
        %
        Major Field:~~#4 \par

        } \ssp \parindent=0in \parskip=1em
        Abstract:   }
        %{\par \parskip=0in \vfill \par ADVISOR'S APPROVAL:~~\hrulefill}
 {\newpage\renewcommand{\thepage}{\arabic{page}}}
\newcommand{\abstractitem}[1]{\par \hangindent=0.375in \hangafter=1 \parindent=0in #1~}

% ********************************************************
% ********************************************************



% ********************************************************
% *********************  VITA PAGE  **********************(no page number, put it at the very end of the thesis)
% ********************************************************

\newenvironment{vita}[3]{%
        \newpage
        \addtocounter{page}{-1}
        \thispagestyle{empty}
        {\dsp \parindent=0in
          \vspace*{1in} \par
         \hspace*{-0.25in} \parbox{\textwidth}{\centering \dsp VITA \par
          #1 \par
          Candidate for the Degree of \par
          #2 \par}
        \par\rule{0in}{0.5in}\par
        %
        \settowidth{\mylengtha}{Thesis:~~}
        \setlength{\mylengthb}{\textwidth}
        \addtolength{\mylengthb}{-\mylengtha}
        \mbox{Thesis:~~\parbox[t]{\mylengthb}{\ssp \MakeUppercase{\@title} \par\null}}
           \par
        %
        Major Field:~~#3 \par
        Biographical: \par
        } \ssp  \parskip=1em
        }
        {\par \parskip=0in}

%\newcommand{\vitaitem}[1]{\par \hangindent=0.75in %%if we want the content of Education indented.
  % \hangafter=1 \parindent=0.375in #1~}

\newcommand{\vitaitem}[1]{\par \hangindent=0.375in %%No indent on the row for Education and the content of Education.
   \hangafter=1 \parindent=0.375in #1~}


\newcommand{\abitem}[1]{\par \hangindent=0.375in %
     \hangafter=1 \parindent=0.0in #1~}

% ********************************************************
% ********************************************************

\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
%\renewcommand \thepart {\@Roman\c@part}
%\renewcommand \thechapter {\@Roman\c@chapter}
% AFGR edited these lines
\renewcommand \thepart {\@arabic\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}

% To preserve roman numerals in subsections, use the command
%\renewcommand \thesection {\thechapter.\@arabic\c@section}
% instead of the command below:
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
\renewcommand \thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand \thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand \theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand \thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname~\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
                \null
                \thispagestyle{empty}%
                \newpage
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter
                    }
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{\centering#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%                                        %--------------------------Chapter Head
  \vspace*{72\p@}%
  {\parindent \z@ \raggedright \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 15\p@
    \fi
    \interlinepenalty\@M
     \bfseries #1\par\nobreak
    \vskip 15\p@
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{72\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
     \bfseries  #1\par\nobreak
    \vskip 15\p@                                                           %---------------------------------Section Def
  }}
\newcommand\section{\@startsection{section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\begin{center}\normalfont\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalfont\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalfont\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}

\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand\@chapapp{\appendixname}%
  \renewcommand\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{5\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{1}
\setcounter{tocdepth}{2}

% ********************************************************
% **************  TABLE OF CONTENTS PAGE  **************** %----------------------------------------------------------
% ********************************************************

\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \newpage
    % Note here we need one more inch, with header, we have 12 + 15 = 27 points
    % we've use for the header, now we need 72 - 27 = 45 pts, so we add that
    % via a \rule command, in TOC, LOT, and LOF's
    {\centering \ssp \rule{0in}{45pt} \par
       \osucontentsname \par \dsp}
    \renewcommand{\thepage}{\roman{page}} %\par
    %}
    \@starttoc{toc}
    \newpage
    %\setcounter{placeholder}{\value{page}}
    %\pagenumbering{arabic}   % resets page counter to 1, arabic format
    }
% ********************************************************
% ********************************************************

\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

  \newcommand*\l@page[2]{%
  \par \dsp
       \cname \hfill \pname
       \par \dsp
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand*\l@figure{\@dottedtocline{1}{2.5em}{4em}}
\let\l@table\l@figure

\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \newpage
    {\centering \ssp \rule{0in}{45pt} \par
       \listfigurename \par
       \fname \hfill \pname
       \rule{0in}{0.25in} \par \ssp} % \dsp}
    %\renewcommand{\thepage}{\roman{page}}
    %\setcounter{page}{\value{placeholder}}
    \@starttoc{lof} \newpage
    %\setcounter{placeholder}{\value{page}}
    %\pagenumbering{arabic}
    }
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    {\centering \ssp \rule{0in}{45pt} \par
       \listtablename \par
       \tname \hfill \pname
       \rule{0in}{0.25in} \par \dsp}
    %\renewcommand{\thepage}{\roman{page}}
    %\setcounter{page}{\value{placeholder}}
    \@starttoc{lot} \newpage
    %\setcounter{placeholder}{\value{page}}
    %\pagenumbering{arabic}
%\renewcommand{\thepage}{\arabic{page}}
    }

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\centerline{\bibname}}
        %\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}}% %changed to center bib heading
      \addcontentsline{toc}{chapter}{\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\osucontentsname{TABLE OF CONTENTS}
\newcommand\cname{Chapter}
\newcommand\fname{Figure}
\newcommand\tname{Table}
\newcommand\pname{Page}
\newcommand\listfigurename{LIST OF FIGURES}
\newcommand\listtablename{LIST OF TABLES}
\newcommand\bibname{REFERENCES}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{CHAPTER}
\newcommand\appendixname{\centerline{APPENDICES}\global\def\appendixname{APPENDICES}}
\newcommand\abstractname{Abstract}
\newcommand\today{}
\edef\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

% Theorem-like environments (must be defined here for section numbers).
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}{Lemma}[section]
\newtheorem{corollary}{Corollary}[section]
\newtheorem{proposition}{Proposition}[section]
\newtheorem{problem}{Problem}[section]
\newtheorem{definition}{Definition}[section]
\newtheorem{assumption}{Assumption}[section]
\newtheorem{example}{Example}[section]
\newtheorem{remark}{Remark}[section]
\newtheorem{conjecture}{Conjecture}[section]

\endinput
%%
%% End of file `osuthesis.cls'
