import datetime
import yaml
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


today = datetime.date.today()

# YY/mm/dd
current_date = today.strftime("%Y-%m-%d")
# print(current_date)

# Identify sender and receiver
sender = 'james.santangelo@mail.utoronto.ca'
receivers = ['james.santangelo37@gmail.com']

with open('../_data/events.yml', 'r') as stream:
    try:
        # Load events with as separate list elements
        all_events = yaml.safe_load(stream)

        # Loop through list and parse event dictionary
        for event in all_events:
            if event['key'] == "project-management":

                date = event['date']
                key = event['key']
                description = event['description']
                subject = '{0} Programming workshop: {1}'.format(date, key)
                youtube_link = event['youtube_link']
                # print(youtube_link)

                msg = MIMEMultipart()
                msg['From'] = sender
                msg['To'] = ', '.join(receivers)
                msg['Subject'] = subject

                body = """
                Hey all,

                Here is the link to today's programming workshop:

                Lesson name: {0}
                Lesson description: {1}
                Link to lesson: {2}

                """.format(key, description, youtube_link)
                msg.attach(MIMEText(body, 'plain'))
    except yaml.YAMLError as exc:
        print(exc)

try:
    smtp = smtplib.SMTP(host='smtp.utoronto.ca', port=587)
    smtp.ehlo()
    smtp.starttls()
    smtp.ehlo()
    smtp.login('santang3', 'q63dVyiJqg6f')
    text = msg.as_string()
    print(text)
    smtp.sendmail(sender, receivers, text)
    smtp.quit()
    print("Successfully sent email")
except Exception as E:
    print(E)
    # print("Error: unable to send email")
