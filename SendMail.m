function SendMail(sender_id, sender_pass,receiver_id,subject,body_message,attachment)

%% Set up Gmail SMTP service.
% Then this code will set up the preferences properly:

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

