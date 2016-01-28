\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ihethesis}[2009/01/29 V 1.00 IHE Thesis]

% IHE Vorlage f??iplom- / Studien- / Master- / Bachelorarbeien-
% Options:  	diplom			fuer Diplomarbeit
%       	studien   		fuer Studienarbeit
%		master			fuer Masterarbeit
%		bachelor		fuer Bachelorarbeit
%
% Befehle:  \author{Verfasser der Arbeit}
%	    \betreuer{Hans Mustermann}
%           \zweitbetreuer{Hein Gro?
%           \datestart{{1.1.1999}
%           \dateend{1.1.2000}
%           \title{Title der Arbeit}
%
%           \abstract{TEXT}
%           \maketitle -> macht Deckblatt
%
% 2009.01.29 V1.0 by M. Janson & T. Kayser
% Based on ihescript.cls by T. Kayser
%
% Changelog
% 
% 13.03.09 Encoding changed to latin 1; german package replaced by ngerman
% 13.08.09 Institutaddress on the title page changed to arial, 
%	   additional abstract page at the end of the document added
% 06.11.09 new KIT logo and layout changes


\newif\ifg@rman
\DeclareOption{german}{\g@rmantrue}

\newif\if@diplom
\DeclareOption{diplom}{\@diplomtrue}

\newif\if@studien
\DeclareOption{studien}{\@studientrue}

\newif\if@master
\DeclareOption{master}{\@mastertrue}

\newif\if@bachelor
\DeclareOption{bachelor}{\@bachelortrue}

\newif\if@praktikum
\DeclareOption{praktikum}{\@praktikumtrue}

\newif\if@zweibetreuer
\@zweibetreuerfalse

\newif\if@dreibetreuer
\@dreibetreuerfalse

\newif\if@vierbetreuer
\@vierbetreuerfalse

% Execute Options
\ProcessOptions

\PassOptionsToClass{a4paper,12pt,DIV12,BCOR5mm,headings=normal}{scrbook}
%\PassOptionsToClass{a4paper,12pt,DIV12,BCOR5mm,normalheadings}{scrbook}
%\PassOptionsToClass{a4paper,12pt,DIV=12,BCOR=5mm,normalheadings}{scrbook} %oneside, 09.09.2010, S.Diebold

\LoadClass{scrbook}

\PassOptionsToPackage{top=2.5cm,bottom=2.5cm,inner=3cm,outer=3cm}{geometry}
%\PassOptionsToPackage{top=2.5cm,bottom=2.5cm,inner=3cm,outer=3cm}{geometry}%oneside, 09.09.2010, S.Diebold

\RequirePackage{geometry}
\RequirePackage[footsepline]{scrpage2}
\RequirePackage[T1]{fontenc}
\RequirePackage[latin1]{inputenc}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
%\RequirePackage{amssymb} % 09.09.2010, S.Diebold
\RequirePackage{graphicx}
\ifg@rman
   \RequirePackage{ngerman}
\fi
\RequirePackage{times}

%##############################
%\usepackage[thinspace,thinqspace,textstyle,amssymb]{SIunits}
\usepackage{subfigure}
%\usepackage{bibgerm}
\usepackage[numbers,sort&compress]{natbib}
%\usepackage[english]{betababel}%betababel: \bcode{a,b,...} griechische buchstaben direkt im text ohne math modus
\usepackage{multirow}
%\usepackage[printonlyused]{acronym}
\usepackage[absolute,overlay]{textpos}
%##############################




% Rahmen auf Titelseite, 09.09.2010, S.Diebold Korrektur: 10.02.2011 D.Mueller
\usepackage{tikz}
\newcommand{\diameter}{20}
\newcommand{\xone}{-20}
\newcommand{\xtwo}{470}
\newcommand{\yone}{60}
\newcommand{\ytwo}{-700}
\newcommand{\xoneplusdiameter}{0}
\newcommand{\xtwoplusdiameter}{490}


% Allgemeine Deklarationen

\newcommand{\betreuer}[1]{\def\@betreuer{#1}}   % Betreuer der Arbeit
\def\@betreuer{\relax}
\newcommand{\datestart}[1]{\def\@datestart{#1}} % Startdatum der  Arbeit
\def\@datestart{\relax}
\newcommand{\datecontinue}[1]{\def\@datecontinue{#1}} % zweites Startdatum der  Arbeit
\def\@datecontinue{\relax}
\newcommand{\dateend}[1]{\def\@dateend{#1}}     % Enddatum der Arbeit
\def\@dateend{\relax}
\newcommand{\datefinalend}[1]{\def\@datefinalend{#1}}     % zweites Enddatum der Arbeit
\def\@datefinalend{\relax}
\newcommand{\abstract}[1]{\def\@abstract{#1}}   % Abstract
\def\@abstract{\relax}
\newcommand{\zweitbetreuer}[1]{                 % Name des zweiten Betreuers
   \def\@zweitbetreuer{#1}
   \@zweibetreuertrue
}
\def\@zweitbetreuer{\relax}
\newcommand{\drittbetreuer}[1]{                 % Name des dritten Betreuers
   \def\@drittbetreuer{#1}
\@dreibetreuertrue
}
\def\@drittbetreuer{\relax}
\newcommand{\viertbetreuer}[1]{                 % Name des vierten Betreuers
   \def\@viertbetreuer{#1}
\@vierbetreuertrue
}
\def\@viertbetreuer{\relax}



% 06.11.2009 Adressblock an unteren Seitenrand hier definiert
\newcommand{\adressblock}
{
	\parbox{8cm}{
	\scriptsize
	\sffamily
	\vspace{0.6cm}
	\begin{tabular}{ll@{\hspace{1cm}}ll}
	Address:  &Institut f\"ur Hochfrequenztechnik und Elektronik&
	Tel.:& +49\,(0)\,721\,608\,425\,22 \\[-0.6ex]
	&Kaiserstra{\ss}e 12&
	Office:& +49\,(0)\,721\,608\,425\,23 \\[-0.6ex]
	&D-76131 Karlsruhe&
	Fax:& +49\,(0)\,721\,608\,425\,027 \\[-0.6ex]
	&&
	Email:& info@ihe.kit.edu\\[-0.6ex]
	Building:& Engesserstra{\ss}e 5, Geb. 30.10 &
	Web:& www.ihe.kit.edu
	\end{tabular} 
	}
	\hspace{6cm}
	%\hfill
	%\raisebox{-1cm}{\includegraphics[height=1.8cm]{logos/logo_ihe.pdf}}


%\vfill
\vspace{0.5cm}% 09.09.2010, S.Diebold

\begin{textblock}{10}[0,0](1.7,15.25)
	\vspace{-0.5cm}
	\parbox{15cm}{
	\scriptsize
	\sffamily
%\hspace{0.1cm}
\begin{tabular}
{l@{\hspace{14cm}}l}
\hspace{0.5cm}
\large{\textbf{www.kit.edu} }
\hspace{8cm}
\large{\textbf{www.iaf.fraunhofer.de} }
\end{tabular} }
\end{textblock}

\begin{textblock}{10}[0,0](1.7,15.25)
\parbox{14cm}{
\scriptsize
\sffamily
\vspace{0.25cm}
\hspace{3cm}
\begin{tabular}{l@{\hspace{0.5cm}}l}
\tiny{ \KIT@me }\end{tabular} }
\end{textblock}




}


\newcommand{\adressblockabstract}
{
	\parbox{8cm}{
	\scriptsize
	\sffamily
	\vspace{0.4cm}
	\begin{tabular}{ll@{\hspace{1cm}}ll}
	Address:  &Institut f\"ur Hochfrequenztechnik und Elektronik&
	Tel.:& +49\,(0)\,721\,608\,425\,22 \\[-0.6ex]
	&Kaiserstra{\ss}e 12&
	Office:& +49\,(0)\,721\,608\,425\,23 \\[-0.6ex]
	&D-76131 Karlsruhe&
	Fax:& +49\,(0)\,721\,608\,425\,027 \\[-0.6ex]
	&&
	Email:& info@ihe.kit.edu\\[-0.6ex]
	Building:& Engesserstra{\ss}e 5, Geb. 30.10 &
	Web:& www.ihe.kit.edu
	\end{tabular} 
	}
	\hspace{6cm}
	\vspace{1cm}
	%\hfill
	%\raisebox{-1cm}{\includegraphics[height=1.8cm]{logos/logo_ihe.pdf}}

\begin{textblock}{10}[0,0](1.7,15.25)
\parbox{14cm}{
\scriptsize
\sffamily
\vspace{0.25cm}
\hspace{3cm}
\begin{tabular}{l@{\hspace{0.5cm}}l}
\tiny{ \KIT@me }\end{tabular} }
\end{textblock}


%\vfill
%\vspace{0.5cm}% 09.09.2010, S.Diebold

}


%06.11.2009 Kopfzeile mit KIT-Logo und Institutsnamen
\newcommand{\logoheader}
{

	%\enlargethispage{2cm}
	\vspace*{-1.0cm}
	%\hspace{1em}
	%{\includegraphics[height=1.8cm]{logos/logo_kit.pdf}}
	\hspace{12em}
	%\rule[-4.55mm]{1pt}{15mm}
	%\hspace{1.75em}
	{\includegraphics[height=1.8cm]{logos/logo_iaf.pdf}}
	%\par
	\vspace{-0.3cm}
	%\parbox{8cm}
	%{
	%	\sffamily
	%	\large 
	%	\begin{flushright}
	%	Fachgebiet Hochfrequenz-\\
	%	und Mikrowellentechnik
	%	\end{flushright}
	%}
	
}


% Sprache/Arbeitstyp abh�ngige Deklarationen
\ifg@rman
   %\renewcommand{\figurename}{Bild}
   \renewcommand{\figurename}{Abb.}

   \if@diplom
      \newcommand{\rprtn@me}{Diplomarbeit}
   \fi
   \if@studien
      \newcommand{\rprtn@me}{Studienarbeit}
   \fi
   \if@master
      \newcommand{\rprtn@me}{Masterarbeit}
   \fi
   \if@bachelor
      \newcommand{\rprtn@me}{Bachelorarbeit}
   \fi
   \if@praktikum
      \newcommand{\rprtn@me}{}
   \fi

   \newcommand{\vonn@me}{von}
   \newcommand{\aufln@me}{Auflage}
   \newcommand{\editedbyn@ame}{Skript �berarbeitet von}
   \newcommand{\betreuern@me}{Betreuer}
   \newcommand{\zeitruamn@me}{Zeitraum}
   \newcommand{\denn@me}{den }
   \newcommand{\KIT@me}{KIT -- Universit{\"a}t des Landes Baden-W{\"u}rttemberg und nationales Forschungszentrum in der Helmholtz-Gemeinschaft}%09.09.2010, S.Diebold
   \newcommand{\eiderkln@me}{Eigenst\"andigkeitserkl{\"a}rung}
   \newcommand{\abstractn@me}{Zusammenfassung}

\else
   \renewcommand{\figurename}{Fig.}

   \if@diplom
      \newcommand{\rprtn@me}{Diploma Thesis}
   \fi
   \if@studien
      \newcommand{\rprtn@me}{Student research project}
   \fi
   \if@master
      \newcommand{\rprtn@me}{Master Thesis}
   \fi
   \if@bachelor
      \newcommand{\rprtn@me}{Bachelor Thesis}
   \fi

   \newcommand{\vonn@me}{by}
   \newcommand{\aufln@me}{Edition}
   \newcommand{\editedbyn@ame}{Script edited by}
   \newcommand{\betreuern@me}{Supervisor}
   \newcommand{\zeitruamn@me}{Period}
   \newcommand{\denn@me}{}
   \newcommand{\KIT@me}{KIT -- University of the State of Baden-Wuerttemberg and National Laboratory of the Helmholtz Association}%09.09.2010, S.Diebold
   \newcommand{\eiderkln@me}{Declaration}
   \newcommand{\abstractn@me}{Abstract}

   \newcommand{\glqq}{'}
   \newcommand{\grqq}{'}
\fi
\renewcommand{\chapterpagestyle}{scrheadings}%\clearscrplain\ohead[\pagemark]{\pagemark}
\renewcommand{\chapterheadstartvskip}{\setlength{\@tempdima}{\f@baselineskip}\vspace{1.0\@tempdima}}%Abstand zwischen Kopfzeile und Kapitelüberschrift
\renewcommand{\chapterheadendvskip}{\setlength{\@tempdima}{\f@baselineskip}\vspace{3.0\@tempdima}}%Abstand zwischen Kapitelüberschrift und Textanfang
\pagestyle{empty}
\ofoot{\pagemark}
\ifoot{\headmark}
\ohead{}

% some useful math declarations
\newcommand{\mr}[1]{\mathrm{#1}}
\newcommand{\D}{\displaystyle}
\DeclareMathOperator{\real}{Re}
\DeclareMathOperator{\imag}{Im}

\renewcommand{\baselinestretch}{1.3}
\setlength{\parindent}{0em}
\setlength{\parskip}{0.3em}

\sloppy
\raggedbottom

\newcommand{\eqnbigskip}{
   \setlength{\abovedisplayskip}{1.5em plus0.5em minus0.2em}
   \setlength{\belowdisplayskip}{1.5em plus0.5em minus0.2em}
   \setlength{\abovedisplayshortskip}{1em plus0.7em minus0.1em}
   \setlength{\belowdisplayshortskip}{1em plus0.7em minus0.1em}
}

% hyperlinks on
%\usepackage[colorlinks=false,pdfborder={0 0 0}]{hyperref} 
%\usepackage{hyperref} %09.09.2010, S.Diebold

% Titelseite

\renewcommand*{\maketitle}{%
\begin{titlepage}


% Zeichne Rahmen, 09.09.2010, S.Diebold
\begin{tikzpicture}[overlay]
\draw[color=gray]  
 		 (\xone pt, \yone pt)
  -- (\xtwo pt, \yone pt)
 arc (90:0:\diameter pt) 
  -- (\xtwoplusdiameter pt , \ytwo pt) 
	-- (\xoneplusdiameter pt , \ytwo pt)
 arc (270:180:\diameter pt)
	-- (\xone pt, \yone pt);
\end{tikzpicture}


\logoheader

\begin{center}
   \sffamily
   \vspace{1.0cm}
   \Large{\rprtn@me}
   \par
   \vspace{1.0cm}
   \par
   \rule[-2.5cm]{0pt}{5cm}
   \parbox{0.9\textwidth}
   {
      \linespread{1.5}
      \sffamily\centering\LARGE\textbf{\@title}
   }
   \par
   \vspace{1cm}
   {
\Large{\@author}}\par
   \vspace{2cm}
   \par
   \normalsize
   \begin{tabular}{rl}
       Degree Programme: & Embedded Systems Engineering \\[1em]
       Matriculation Number: & 3728492 \\[2em]
      \betreuern@me: & \@betreuer \\
      \if@zweibetreuer
         & \strut \@zweitbetreuer \\
      \else
         \strut \\[2em]
      \fi
      \if@dreibetreuer
         & \strut \@drittbetreuer \\[2em]
      \else
         \strut \\[2em]
      \fi      
\zeitruamn@me: & \@datestart\; -- \;\@dateend \\
   \end{tabular}
   \par
   \vspace{2em}
    Freiburg, \denn@me 09.12.2015
\end{center}
%\vfill 
%\adressblock
\end{titlepage}
\thispagestyle{empty}
\cleardoublepage

{
\renewcommand{\chapterpagestyle}{empty}
\pagestyle{empty}

% Eidesstaatliche Erkl�rung
\chapter*{\eiderkln@me}
\vspace*{3.0em}
\ifg@rman
	\noindent Hiermit erkl\"are ich, dass ich diese Arbeit selbst\"andig durchgef\"uhrt und abgefasst habe. Quellen,
Literatur und Hilfsmittel, die von mir benutzt wurden, sind als solche gekennzeichnet.
\else
	\noindent I hereby declare that this thesis is my own work and effort and
	that all sources cited or quoted are indicated and acknowledged by means of a
	comprehensive list of references.
\fi

\vspace*{2.0em}
\noindent Freiburg, \denn@me\@dateend

\vspace*{5.0em}
\noindent \@author
\thispagestyle{empty}
\cleardoublepage

% Zusammenfassung oder Abstract
\chapter*{\abstractn@me}

\vspace*{3.0em}
\@abstract

\thispagestyle{empty}
\cleardoublepage
}
	\newcommand{\makeiheabstract}
	{
		\cleardoublepage
		\pagestyle{empty}
		\logoheader
		\vspace{1cm}
		
		
		\textbf{\@author}\\
		\textbf{\rprtn@me: \@title}\\
		\textbf{\zeitruamn@me: \@datestart\; -- \;\@dateend}\\
		%\textbf{Zeitraumer: \@datecontinue\; -- \;\@datefinalend}\\
		\textbf{\betreuern@me: \@betreuer}
		\if@zweibetreuer
			\textbf{, \@zweitbetreuer}
		\else
			\\
		\fi
		\if@dreibetreuer
			\textbf{, \@drittbetreuer} \\
		\else
			\\
		\fi
		\vspace{1cm}
		
		\textbf{\abstractn@me:} \@abstract
		
		\vfill
		%\adressblockabstract
	}
	\pagestyle{scrheadings}
}
