/*
Medical Specialty Expert System
Course: Artificial Intelligence
Language: Prolog

Description:
An expert system that recommends suitable medical specialties
based on the user's preferences using a rule-based knowledge base.
*/
%Facts
doctor(high,improving_lives,deep_analysis,hospital,['Pediatrician 🩺','Radiology 🩻']).
doctor(high,improving_lives,fast_decisions,hospital,['Paramedic 🚑',' Anesthesiology 💉']).
doctor(high,saving_lives,deep_analysis,hospital,['Pharmacist 💊','Surgeon 💉']).
doctor(high,saving_lives,fast_decisions,hospital,['Pharmacist 💊','Critical Care 🚨']).
doctor(medium,improving_lives,deep_analysis,hospital,['Pharmacist 💊','Pediatrician 🩺']).
doctor(medium,improving_lives,fast_decisions,hospital,['Dentist 🦷','Pharmacist 💊']).
doctor(medium,saving_lives,deep_analysis,hospital,['Pharmacist 💊','Surgeon 💉']).
doctor(medium,saving_lives,fast_decisions,hospital,['Critical Care 🚨','Cardiology 🫀']).
doctor(low,improving_lives,deep_analysis,hospital,['Family Medicine 🩺','Pathology 🔬']).
doctor(low,improving_lives,fast_decisions,hospital,['Orthopedic Doctor 🦴','Respiratory Therapy 🫁']).
doctor(low,saving_lives,deep_analysis,hospital,['Physical Therapist 🦽','Pediatrician 🩺']).
doctor(low,saving_lives,fast_decisions,hospital,['Physical Therapist 🦽','Pediatrician 🩺']).
doctor(high,improving_lives,deep_analysis,clinic,['Pharmacist 💊','Pediatrician 🩺']).
doctor(high,improving_lives,fast_decisions,clinic,['Dentist 🦷','Pharmacist 💊']).
doctor(high,saving_lives,deep_analysis,clinic,['Cardiology 🫀','Oncology 🥼']).
doctor(high,saving_lives,fast_decisions,clinic,['Paramedic 🚑','Critical Care 🚨']).
doctor(medium,improving_lives,deep_analysis,clinic,['Pharmacist 💊','Pediatrician 🩺']).
doctor(medium,improving_lives,fast_decisions,clinic,['Dentist 🦷','Anesthesiology 💉']).
doctor(medium,saving_lives,deep_analysis,clinic,['Pulmonology 🫁','Neurology 🧠']).
doctor(medium,saving_lives,fast_decisions,clinic,['General Surgery 💉','Cardiology 🫀']).
doctor(low,improving_lives,deep_analysis,clinic,['Family Medicine 🩺','Pathology 🔬']).
doctor(low,improving_lives,fast_decisions,clinic,['Veterinary Medicine 🥼','Occupational Therapy 💉']).
doctor(low,saving_lives,deep_analysis,clinic,['Neurology 🧠','Pulmonology 🫁']).
doctor(low,saving_lives,fast_decisions,clinic,['Infectious Disease Specialist 🦠','Critical Care 🚨']).
doctor(high,improving_lives,deep_analysis,center,['Physical Therapy 🦽','Speech Pathology 🗣']).
doctor(high,improving_lives,fast_decisions,center,['Family Medicine 🩺','Paramedic 🚑']).
doctor(high,saving_lives,deep_analysis,center,['Oncology','Pediatric Oncology']).
doctor(high,saving_lives,fast_decisions,center,['Thoracic Surgery 🩻','Anesthesiology 💉']).
doctor(medium,improving_lives,deep_analysis,center,['Radiology 🩻','Dietitian 🥗']).
doctor(medium,improving_lives,fast_decisions,center,['Optometrist 👁','Orthopedic Doctor 🦴']).
doctor(medium,saving_lives,deep_analysis,center,['Cardiac Technology 🫀','Stroke Specialist 🧠']).
doctor(medium,saving_lives,fast_decisions,center,['Stroke Specialist 🧠','Cardiology 🫀']).
doctor(low,improving_lives,deep_analysis,center,['Pathology 🔬','Physical Therapy 🦽']).
doctor(low,improving_lives,fast_decisions,center,['Internist 🩻','Prosthetics 🦿']).
doctor(low,saving_lives,deep_analysis,center,['Pathology 🔬','Hematology 🩸']).
doctor(low,saving_lives,fast_decisions,center,['Preventive Medicine 🛡','Paramedic 🚑']).

quote(['Every life saved is a story continued.. and you, doctor, are the author.🔬','Your hands hold more than tools – they hold hope.🩺','You don’t just wear a white coat. You wear responsibility, trust, and strength.🔥','In your white coat, you wear strength and kindness.✨','Your care makes the world a healthier place💫
','Behind every recovery, there’s a doctor who cared⭐','Each patient you help is a victory for humanity🌟
','With each patient you help, you leave a lasting impact on the world around you🪽
','Becoming a doctor means becoming a source of hope in a world that needs it most🦋
']).


      
%the format predicate for custom spacing welcome message
intro_message :-
    format("╔══════════════════════════════════════════════════════════════════════╗~n", []),
    format("║        Welcome to the Medical Specialty Advisor!                     ║~n", []),
    format("║      Let's find the perfect path for your future in                  ║~n", []),
    format("║                   the world of medicine!                             ║~n", []),
    format("╚══════════════════════════════════════════════════════════════════════╝~n", []).


consult_now:- 
    % it print a welcome massage
    intro_message, 
  %it prints the system Introduction and Guidance Message
    writeln('👋 Hello! Before we begin, may I know your name? please enter only your first name , in small letters.'),
    % reads the user's name and print it it a message.
    read(Name),
    write('Nice to meet you, '),
    write(Name),writeln('! Let’s begin your journey. 🩺'),nl,
    writeln('I’m here to help you make one of the most important decisions in your medical career.
    Based on your interests and preferences, I’ll guide you toward discovering the medical specialty that suits you best.'),
    writeln('Whether you’re drawn to dentistry, pediatrics, ophthalmology, surgery...
              or you’re simply looking for a balanced lifestyle! I’m with you every step of the way.🥼'),write('Let start!  (Choose one of the options)'),nl, 
     
% It asks the user different questions to choose an appropriate Medical Specialty 
question(1,Pressure), 
question(2,Goal), 
question(3,Decision), 
question(4,Place), 

% If an appropriate  Medical Specialty is found,it prints the specialty and exits. 
(   the_specialty(Pressure,Goal,Decision,Place) ->   
                                       
exit_the_advisor 
;   % If no appropriate  Medical Specialty is found the loop repeats. 
fail                                         
). 
% Predicate to find an appropriate  Medical Specialty based on user input. 
the_specialty(Pressure, Goal, Decision,Place) :- 
%  based on the given ansewrs this perdicate chooses the appropriate Medical Specialty for the recipient.  
doctor(Pressure, Goal,Decision, Place,Specialty), 
% this perdicate Prints a message  with Medical Specialty recommendations. 
writeln('Based on the information you entered, we recommend the following medical specialties:'), 
% Calls a predicate to print the recommended Medical Specialty. 
write_specialty(Specialty), 
nl. 

%To pick a random quote 
randomq:-
    quote(List),
    length(List,Length),%To count the number of elements in List
    random(1,Length,Index),%To pick a random number
    nth1(Index,List,Quote),
    nl,write('Quote:'),write(Quote).

% Predicate to print the recommended Medical Specialty. 
write_specialty([]). 
write_specialty([Specialty_1, Specialty_2]) :- 
(Specialty_1\= Specialty_2),
write('1- '), 
writeln(Specialty_1), 
write('2- '), 
writeln(Specialty_2),
%call the randomq function to pick a random quote
randomq.

% Predicate to ask a question and validate the user's input for pressure, goal, and place. 
question(1, Pressure) :- 
    % This loop is to repeat the question until an right answer is found. 
    repeat,
% Asks the user about the recipient's pressure. 
writeln('What level of work-related pressure can you handle?(high/medium/low)'),writeln('Type your answers in small letters only. '),
% Used To Read the user's input. 
read(Pressure), 
% Validates the input. 
(Pressure \== high, Pressure \== medium, Pressure \== low -> 
% If the input is invalid, it prompts the user to enter again. 
writeln('Invalid answer. Please enter it again.'), 
fail 
;   % If the input is valid, it continues. 
true, ! 
). 


% Similar to the first question perdicate but these two asks for Goal,Decision,Work Place. 
question(2, Goal) :-
    repeat,
    writeln('What satisfies you more?(improving lives/saving lives)'),
    read_line_to_string(user_input, Input),
    ( Input == "improving lives" ->
        Goal = improving_lives, !
    ; Input == "saving lives" ->
        Goal = saving_lives, !
    ; writeln('Invalid answer. Please enter it again.'),
      fail
    ).

question(3, Decision) :-
    repeat,
writeln('What is your decision-making style?(fast decisions/deep analysis)'), 
   %to let the user enter their answers with space
    %Read an entire line typed by the user from the console, and store it as a string in Input
    read_line_to_string(user_input, Input),
    ( Input == "fast decisions" ->
        Decision = fast_decisions, !
    ; Input == "deep analysis" ->
        Decision = deep_analysis, !
    ; writeln('Invalid answer. Please enter it again.'),
      fail
    ).


question(4, Place):-
    repeat,
writeln('Where would you prefer to work?(hospital/clinic/center)'), 
read(Place), 
(\+(Place == hospital; Place == clinic; Place == center )-> 
writeln('Invalid answer. Please enter it again.'), 
fail 
;   true, ! 
). 
% Predicate to ask the user to exit  or to restart the advisor. 
exit_the_advisor :- 
nl, 
write('To end the program type (exit) and to restart type (restart).'), 
read(Answer), 
answer_action(Answer). 
% Predicate to exit the advisor . 
answer_action(exit) :- 
writeln('Thank you for using the Medical Specialty advisor. see you soon!'), 
!. 
% Predicate to re-ask the advisor. 
answer_action(restart) :- 
consult_now.  
% Predicate to reaske the user to exit or to re-ask the advisor if type wrong input. 
answer_action(_) :- 
writeln('Invalid answer. Please enter it again.'), 
exit_the_advisor.