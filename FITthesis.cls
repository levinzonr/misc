\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FITthesis}[2018/03/12 CTU FIT standard class for theses]

% created by Ondrej Guth <ondrej.guth@fit.cvut.cz>

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% options
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
\newif\if@thesistypedefined
\DeclareOption{thesis=B}{\gdef\@thesistype{B}\@thesistypedefinedtrue}
\DeclareOption{thesis=M}{\gdef\@thesistype{M}\@thesistypedefinedtrue}

\DeclareOption{czech}{
	\AtBeginDocument{\selectlanguage{czech}}
	\PassOptionsToPackage{\CurrentOption}{babel}
	\def\@lang{1}
}
\DeclareOption{english}{
	\AtBeginDocument{\selectlanguage{english}}
	\PassOptionsToPackage{english}{babel}
	\def\@lang{0}
}
\DeclareOption{slovak}{
	\AtBeginDocument{\selectlanguage{slovak}}
	\PassOptionsToPackage{\CurrentOption}{babel}
	\def\@lang{2}
}
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{memoir}}

\ExecuteOptions{11pt}
\ProcessOptions

\ifx\@lang\undefined
	\ClassError{FITthesis}{Language not specified}{Add option czech for Czech language or option english for English language or option slovak for Slovak language.}
\fi

\LoadClass[a4paper,twoside]{memoir}[2008/08/07]
\setsecnumdepth{subsubsection}
\chapterstyle{madsen}

\RequirePackage{babel}[2008/07/06]
\RequirePackage[unicode,pdfusetitle]{hyperref}

\RequirePackage{chngcntr}
\counterwithout*{footnote}{chapter}

\RequirePackage{lmodern}


\setlrmargins{4cm}{*}{*}\checkandfixthelayout

\RequirePackage{etoolbox}

\AtEndEnvironment{table}{\gdef\there@is@a@table{}}
\AtEndDocument{\ifdefined\there@is@a@table\label{tab:was:used:in:doc}\fi}
\DeclareRobustCommand{\listoftablescond}{\@ifundefined{r@tab:was:used:in:doc}{}{\listoftables*}}

% line breaks in URL
\def\UrlBreaks{\do\/\do\-\do\_}

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% general commands
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\DeclareRobustCommand{\chapterstyletitle}[1]{
	\@makechapterhead{#1}
	\noindent
}

\newenvironment{introduction}{
	\setsecnumdepth{part}
	\if\@lang1\chapter{{\' U}vod}\else\if\@lang2\chapter{{\' U}vod}\else\chapter{Introduction}\fi\fi
}{
	\setsecnumdepth{subsubsection}
}

\newenvironment{conclusion}{
	\setsecnumdepth{part}
	\if\@lang1\chapter{Z{\' a}v{\v e}r}\else\if\@lang2\chapter{Z{\' a}ver}\else\chapter{Conclusion}\fi\fi
}{
	\setsecnumdepth{subsubsection}
}

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% template
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\newif\if@supervisordefined
\DeclareRobustCommand{\supervisor}[1]{
	\def\thesupervisor{#1}
	\@supervisordefinedtrue
}

\newif\if@departmentdefined
\DeclareRobustCommand{\department}[1]{
	\def\thedepartment{#1}
	\@departmentdefinedtrue
}

\newif \if@websitedefined
\DeclareRobustCommand {\website}[1] {
	\def\thewebsite{#1}
	\@websitedefinedtrue
}

\newif\if@acknowledgementsdefined
\DeclareRobustCommand{\acknowledgements}[1]{
	\def\theacknowledgements{#1}
	\@acknowledgementsdefinedtrue
}

\newif\if@abstractcsdefined
\DeclareRobustCommand{\abstractCS}[1]{
	\def\theabstractcs{#1}
	\@abstractcsdefinedtrue
}

\newif\if@abstractendefined
\DeclareRobustCommand{\abstractEN}[1]{
	\def\theabstracten{#1}
	\@abstractendefinedtrue
}

% \newif\if@declarationofauthenticitydefined
% \DeclareRobustCommand{\declarationOfAuthenticity}[1]{
% 	\def\thedeclarationofauthenticity{#1}
% 	\@declarationofauthenticitydefinedtrue
% }

\newif\if@cityfordeclarationdefined
\DeclareRobustCommand{\placeForDeclarationOfAuthenticity}[1]{
	\def\thecityfordeclaration{#1}
	\@cityfordeclarationdefinedtrue
}

\newif\if@keywordscsdefined
\DeclareRobustCommand{\keywordsCS}[1]{
	\def\thekeywordscs{#1}
	\@keywordscsdefinedtrue
}

\newif\if@keywordsendefined
\DeclareRobustCommand{\keywordsEN}[1]{
	\def\thekeywordsen{#1}
	\@keywordsendefinedtrue
}

\newif\if@authorwithdegreesdefined
\DeclareRobustCommand{\authorWithDegrees}[1]{
	\def\theauthorwithdegrees{#1}
	\@authorwithdegreesdefinedtrue
}

\newif\if@authorGNdefined
\DeclareRobustCommand{\authorGN}[1]{
	\def\theauthorGN{#1}
	\@authorGNdefinedtrue
}

\newif\if@authorFNdefined
\DeclareRobustCommand{\authorFN}[1]{
	\def\theauthorFN{#1}
	\@authorFNdefinedtrue
}

\DeclareRobustCommand{\thesistype}{\if@thesistypedefined\if\@thesistype B\if\@lang1{Bakal{\' a}{\v r}sk{\' a} pr{\' a}ce}\else\if\@lang2{Bakal{\' a}rska pr{\' a}ca}\else{Working paper}\fi\fi\else\if\@thesistype M\if\@lang1{Diplomov{\' a} pr{\' a}ce}\else\if\@lang2{Diplomov{\' a} pr{\' a}ca}\else{Master's thesis}\fi\fi\else\ClassError{FITthesis}{Thesis type not specified}{Add option thesis=B for bachelor's thesis or option thesis=M for master's thesis.}\fi\fi\else\ClassError{FITthesis}{Thesis type not specified}{Add option thesis=B for bachelor's thesis or option thesis=M for master's thesis.}\fi}


% \DeclareRobustCommand{\titlepage}{
% 	\begin{titlingpage}
% 		\begin{center}
% 			\noindent\begin{tabular*}{\textwidth}{m{.77\textwidth}m{.165\textwidth}}
% 				{\large\scshape \if\@lang1{
% 						{\v C}esk{\' e} vysok{\' e} u{\v c}en{\' i} technick{\' e} v~Praze
% 					}\else\if\@lang2{
% 						{\v C}esk{\' e} vysok{\' e} u{\v c}en{\' i} technick{\' e} v~Praze
% 					}\else{
% 						Czech Technical University in Prague
% 					}\fi\fi
% 					
% 					\vspace{3mm}
% 					
% 					\if\@lang1{
% 						Fakulta informa{\v c}n{\' i}ch technologi{\' i}
% 					}\else\if\@lang2{
% 						Fakulta informa{\v c}n{\' i}ch technologi{\' i}
% 					}\else{
% 						Faculty of Information Technology
% 					}\fi\fi
% 					
% 					\vspace{4mm}
% 					
% 					\if@departmentdefined
% 						\thedepartment
% 					\else
% 						\ClassError{FITthesis}{Department unspecified}{Specify the department using the \department command.}
% 					\fi
% 				} & \hfill\includegraphics[width=.16\textwidth]{cvut-logo-bw}
% 			\end{tabular*}
% 		\end{center}
% 		
% 
% 		\vfill
% 
% 		{\Large
% 			\noindent\thesistype
% 		}
% 		\vspace{1cm}
% 
% 		\if\thetitle\empty
% 			\ClassError{FITthesis}{Thesis' title unspecified}{Specify title of this thesis using the \protect\title\space command.}
% 		\else
% 			\noindent\textbf{\LARGE \begin{flushleft}\thetitle\end{flushleft}}
% 		\fi
% 
% 		\vspace{4mm}
% 
% 		\if@authorwithdegreesdefined
% 			\noindent\textbf{\Large \textit{\theauthorwithdegrees}}
% 		\else
% 			\ClassError{FITthesis}{Thesis' author with degrees unspecified}{Specify author of this thesis (i.e. your name \& degrees) using the \protect\theauthorwithdegrees\space command.}
% 		\fi
% 
% 		\vfill
% 
% 		\noindent\if\@lang1{Vedouc{\' i} pr{\' a}ce:}\else\if\@lang2{Ved\'uci pr{\' a}ce:}\else{Supervisor:}\fi\fi
% 			\if@supervisordefined%
% 				~\thesupervisor
% 			\else
% 				\ClassError{FITthesis}{Thesis' supervisor unspecified}{Specify the supervisor of this thesis using the \protect\thesupervisor\space command.}
% 			\fi
% 
% 		\vspace{1cm}
% 
% 		\noindent\today
% 	\end{titlingpage}
% }

\DeclareRobustCommand{\titlepage}{
        \begin{titlingpage}
        \noindent
        \if\@lang1{\includegraphics[width=0.5\textwidth]{cvut-logo-bw}}\else\if\@lang2{\includegraphics[width=0.5\textwidth]{cvut-logo-bw}}\else{\includegraphics[width=0.5\textwidth]{cvut-logo-bw-en}}\fi\fi
        
        \vfill
		
		{\Large\noindent\thesistype}

               \vspace{1cm}

               \if\thetitle\empty
                       \ClassError{FITthesis}{Thesis' title unspecified}{Specify title of this thesis using the \protect\title\space command.}
               \else
                       \noindent\textbf{\LARGE \begin{flushleft}\thetitle\end{flushleft}}
               \fi

 

               \vspace{4mm}

               \if@authorwithdegreesdefined

                       \noindent\textbf{\Large \textit{\theauthorwithdegrees}}

               \else

                       \ClassError{FITthesis}{Thesis' author with degrees unspecified}{Specify author of this thesis (i.e. your name \& degrees) using the \protect\theauthorwithdegrees\space command.}

               \fi

               \vfill

\if@departmentdefined

                                              \noindent \thedepartment

                                      \else

                                              \ClassError{FITthesis}{Department unspecified}{Specify the department using the \department command.}

                                      \fi

                              

\vspace{0.1cm}

               \noindent\if\@lang1{Vedouc{\' i} pr{\' a}ce:}\else\if\@lang2{Ved\'uci pr{\' a}ce:}\else{Lecturer:}\fi\fi
                       \if@supervisordefined%
                              ~\thesupervisor
                       \else

                               \ClassError{FITthesis}{Thesis' supervisor unspecified}{Specify the supervisor of this thesis using the \protect\thesupervisor\space command.}

                       \fi           

 

               \vspace{1cm}

 

                \noindent\today

        \end{titlingpage}

}

\DeclareRobustCommand{\acknowledgementspage}{
	\if@acknowledgementsdefined
		\cleardoublepage
		\thispagestyle{empty}
		
		~
		
		\vfill
		
		\if\@lang1\chapterstyletitle{Pod{\v e}kov{\' a}n{\' i}}\else\if\@lang2\chapterstyletitle{Po\v dakovanie}\else\chapterstyletitle{Acknowledgements}\fi\fi\theacknowledgements
	\fi
}

\DeclareRobustCommand{\imprintpage}{
	\clearpage
	\thispagestyle{empty}
	
	~
	
	\vfill
	
	\if\@lang1{
		\noindent {\v C}esk{\' e} vysok{\' e} u{\v c}en{\' i} technick{\' e} v~Praze

		\noindent Fakulta informa{\v c}n{\' i}ch technologi{\' i}}\else\if\@lang2{
		\noindent {\v C}esk{\' e} vysok{\' e} u{\v c}en{\' i} technick{\' e} v~Praze

		\noindent Fakulta informa{\v c}n{\' i}ch technologi{\' i}}\else{
		\noindent Czech Technical University in Prague
		
		\noindent Faculty of Information Technology
	}\fi\fi
	
	\noindent \textcopyright{} \the\year{} \theauthorGN{} \theauthorFN{}. \if\@lang1{V{\v s}echna pr{\' a}va vyhrazena.}\else\if\@lang2{V{\v s}etky pr{\' a}va vyhraden\'e.}\else{All rights reserved.}\fi\fi
	
	\if\@lang1{
		\noindent \textit{Tato pr{\' a}ce vznikla jako {\v s}koln{\' i} d{\' i}lo na {\v C}esk{\' e}m vysok{\' e}m u{\v c}en{\' i} technick{\' e}m v~Praze, Fakult{\v e} informa{\v c}n{\' i}ch technologi{\' i}. Pr{\' a}ce je chr{\' a}n{\v e}na pr{\' a}vn{\' i}mi p{\v r}edpisy a mezin{\' a}rodn{\' i}mi {\' u}mluvami o~pr{\' a}vu autorsk{\' e}m a pr{\' a}vech souvisej{\' i}c{\' i}ch s~pr{\' a}vem autorsk{\' y}m. K~jej\'\i{}mu u\v zit\'\i{}, s~v\'yjimkou bez\'uplatn\'ych z\'akonn\'ych licenc\'\i{} a nad r\'amec opr\'avn\v en\'\i{} uveden\'ych v~Prohl\'a\v sen\'\i{} na p\v redchoz\'\i{} stran\v e, je nezbytn\'y souhlas autora.}}\else\if\@lang2{
		\noindent \textit{T\'ato pr\'aca vznikla ako \v skolsk\'e dielo na  FIT \v CVUT v Prahe. Pr\'aca je chr\'anen\'a medzin\'arodn\'ymi predpismi a zmluvami o autorskom pr\'ave a pr\'avach s\'uvisiacich s autorsk\'ym pr\'avom. Na jej vyu\v zitie, s~v\'ynimkou bezplatn\'ych z\'akonn\'ych licenci\'\i, je nutn\'y s\'uhlas autora.}}\else{
		\noindent \textit{This thesis is school work as defined by Copyright Act of the Czech Republic. It has been submitted at Czech Technical University in Prague, Faculty of Information Technology. The thesis is protected by the Copyright Act and its usage without author's permission is prohibited (with exceptions defined by the Copyright Act).}
	}\fi\fi
	
	\if\@lang1{\subsection{Odkaz na tuto pr{\' a}ci} \theauthorFN{}, \theauthorGN{}. \textit{\thetitle{}}. \thesistype{}. Praha: {\v C}esk\'e vysok\'e u\v cen\'\i{} technick\'e v~Praze, Fakulta informa{\v c}n{\' i}ch technologi{\' i}, \the\year.\if@websitedefined{ Dostupn\'y tak\'e z~WWW: $\langle$\url{\thewebsite}$\rangle$.}\fi}\else\if\@lang2{\subsection{Odkaz na t\'uto pr{\' a}cu} \theauthorFN{}, \theauthorGN{}. \textit{\thetitle{}}. \thesistype{}. Praha: {\v C}esk\'e vysok\'e u\v cen\'\i{} technick\'e v~Praze, Fakulta informa{\v c}n{\' i}ch technologi{\' i}, \the\year.\if@websitedefined{ Dostupn\'y aj z~WWW: $\langle$\url{\thewebsite}$\rangle$.}\fi}\else{\subsection{Citation of this thesis} \theauthorFN{}, \theauthorGN{}. \textit{\thetitle{}}. \thesistype{}. Czech Technical University in Prague, Faculty of Information Technology, \the\year.\if@websitedefined{ Also available from: $\langle$\url{\thewebsite}$\rangle$.}\fi}\fi\fi
}

\DeclareRobustCommand{\abstractpage}{

	\if@abstractendefined
		\chapterstyletitle{Abstract}\theabstracten
	\else
		\ClassError{FITthesis}{Abstract in English unspecified}{Specify abstract in English using the \abstractEN command.}
	\fi

	\if@keywordsendefined
		\paragraph*{Keywords} \thekeywordsen{}
	\else
		\ClassError{FITthesis}{English keywords unspecified}{Specify the keywords in English of your thesis using \keywordsEN command.}
	\fi
}

\AfterEndPreamble{
	\frontmatter
	\pagestyle{plain}
	\cleardoublepage
% 	\setcounter{page}{3}
	\titlepage
	
	\setcounter{page}{3}
	\abstractpage


	\cleardoublepage
	\tableofcontents*

	\cleardoublepage
	\listoffigures*

	\cleardoublepage
	\listoftablescond

	\pagestyle{ruled}
	\mainmatter
}
