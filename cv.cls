% cv.cls
%
% Document class for CV
%
% (C) 2022 Lyuwen Fu
%
% Adapted from https://github.com/zachscrivena/simple-resume-cv
%
\ProvidesClass{cv}[2022/02/08 version 1.0.0]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

\RequirePackage{amsmath}
\RequirePackage{enumitem}
% Use Times font
\RequirePackage{times}
\RequirePackage[T1]{fontenc}
\RequirePackage{titlesec}
% Hyphenation: Disabled.
\RequirePackage[none]{hyphenat}
% PDF settings and properties.
\RequirePackage{hyperref}
% Geometry package for page margins.
\RequirePackage[
left=0.50in,
right=0.50in,
top=0.40in,
bottom=0.40in,
nohead,
includefoot]{geometry}

\pagestyle{empty}

%% Symbols (unicode).
\newcommand{\BulletSymbol}{{\normalfont\fontsize{6.5}{7.8}\selectfont\raisebox{0.17em}{$\bullet$}}}
\newcommand{\SubBulletSymbol}{{\normalfont\fontsize{6}{7.2}\selectfont\raisebox{0.17em}{$\bullet$}}}
\newcommand{\TildeSymbol}{{\normalfont\char"007E}}

\makeatletter
% Contacts
\gdef\@contacts{}
\newcommand{\contacts}[1]{%
  \gdef\@contacts{#1}%
}
% Title page.
\renewcommand{\maketitle}{
    \begin{center}
    \textbf{\huge\@author}\\
    \vspace*{0.5\baselineskip}
    \@contacts\\
    \end{center}
}
\makeatother

\makeatletter
% PDF settings and properties.
\AtBeginDocument{
\hypersetup{
pdftitle={Curriculum Vitae of \@author},
pdfauthor={\@author},
pdfcreator={PDFLaTeX},
pdfproducer={},
pdfkeywords={},
pdfpagemode={},
bookmarks=true,
unicode=true,
bookmarksopen=true,
pdfstartview=FitH,
pdfpagelayout=OneColumn,
pdfpagemode=UseOutlines,
% hidelinks,
breaklinks}
}
\makeatother

\titleformat{\section}[block]
{\normalfont\bfseries}
{}{0pt}{\uppercase}
\titlespacing{\section}{0 in}{0 in}{0 in}
\setlength\parindent{0pt}

% Abbreviations for months.
\newcommand{\LongMonth}[1]{%
\ifcase#1\relax
\or January%
\or February%
\or March%
\or April%
\or May%
\or June%
\or July%
\or August%
\or September%
\or October%
\or November%
\or December%
\fi}
\newcommand{\ShortMonth}[1]{%
\ifcase#1\relax
\or Jan%
\or Feb%
\or Mar%
\or Apr%
\or May%
\or Jun%
\or Jul%
\or Aug%
\or Sep%
\or Oct%
\or Nov%
\or Dec%
\fi}

% Select datestamp format.
\def\DatestampFormatSelection{2}

% Datestamp format: {yyyy}{MM}{dd} ---> yyyy-MM-dd (e.g., 2010-12-31).
\ifnum\DatestampFormatSelection=1
\newcommand{\DatestampYMD}[3]{\mbox{#1-#2-#3}}
\newcommand{\DatestampYM}[2]{\mbox{#1-#2}}
\newcommand{\DatestampY}[1]{#1}
\fi

% Datestamp format: {yyyy}{MM}{dd} ---> MMM yyyy (e.g., Dec 2010).
\ifnum\DatestampFormatSelection=2
\newcommand{\DatestampYMD}[3]{\mbox{\ShortMonth{#2} #1}}
\newcommand{\DatestampYM}[2]{\mbox{\ShortMonth{#2} #1}}
\newcommand{\DatestampY}[1]{#1}
\fi

% Datestamp format: {yyyy}{MM}{dd} ---> MMMM yyyy (e.g., December 2010).
\ifnum\DatestampFormatSelection=3
\newcommand{\DatestampYMD}[3]{\mbox{\LongMonth{#2} #1}}
\newcommand{\DatestampYM}[2]{\mbox{\LongMonth{#2} #1}}
\newcommand{\DatestampY}[1]{#1}
\fi

% Datestamp format: {yyyy}{MM}{dd} ---> yyyy (e.g., 2010).
\ifnum\DatestampFormatSelection=4
\newcommand{\DatestampYMD}[3]{#1}
\newcommand{\DatestampYM}[2]{#1}
\newcommand{\DatestampY}[1]{#1}
\fi

\setlist{align=parleft,left=0.2em,nolistsep}
\renewcommand\labelitemi{\BulletSymbol}
