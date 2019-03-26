clc, clear;
%% Sender ID and password
sender_id = 'human.fall.project@gmail.com'; 
sender_password = '123ABC++';

%% Receiver Id, subject of mail and Body message 
receiver_id = 'mourey@ualberta.ca';
subject = 'Assignment 2';
body_message = 'Do not forget the cutup date is on 27th February 2019';

%% Attach file
% give the path of the folder
startingFolder = 'C:\Users\Era\Desktop\New folder'; % Wherever you want.
defaultFileName = fullfile(startingFolder, '*.*');

%% Let user browse to attach a file.
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file to attach to the e-mail.');
if baseFileName == 0
	%% User clicked the Cancel button.
	return;
end
%%  Combine folder and base name into full file name.
attachedFullFileName = fullfile(folder, baseFileName); 
attachment=attachedFullFileName;
%% Calling the function
SendMail(sender_id, sender_password,receiver_id,subject,body_message,attachment)

function SendMail(sender_id, sender_pass,receiver_id,subject,body_message,attachment)

%% Set up Gmail SMTP service.
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','E_mail',sender_id);
setpref('Internet','SMTP_Username',sender_id);
setpref('Internet','SMTP_Password',sender_pass);

%% Gmail server.
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.starttls.enable','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

sendmail(receiver_id,subject,body_message,attachment);
end


