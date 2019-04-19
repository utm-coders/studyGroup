import datetime
import yaml
import smtplib
import argparse
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


def get_event():
    """Retrieve event matching the current date

    Args:
        None

    Returns:
        event (:obj:'dict'): Dictionary storing information on current day's event
    """

    today = datetime.date.today()

    # YY/mm/dd
    current_date = today.strftime("%Y-%m-%d")  # E.g. 2019-04-18

    with open('../_data/events.yml', 'r') as stream:

        # Load all events with as separate list elements
        all_events = yaml.safe_load(stream)

        # Loop through list and parse event dictionary
        for event in all_events:

            # Get only event matching current date
            if event['date'] == current_date:
                return event


def create_message(sender, receivers, event):
    """Parses today's event dictionary and composes HTML message with details

    Args:
        sender ('str'): Sender Email. Provided ast command-line. Must be UToronto Email
        receivers (:obj:'list' of :obj:'str'): List with receiving Emails as string elements. Email sent to all Emails in list.
        event (:obj:'dict'): Dictionary storing information on current day's event

    Returns:
        msg (:obj:'MIMEMultipart'): Email in HTML format. See email.mime.multipart.MIMEMultipart().
    """

    # If event not empty, retrieve details and compose message.
    if event:

        path_to_script = 'https://github.com/utm-coders/studyGroup/blob/gh-pages/scripts/lessonEmail.py'

        date = event['date']
        key = event['key']
        description = event['description']
        subject = '{0} Programming workshop: {1}'.format(date, key)
        youtube_link = event['youtube_link']
        # print(youtube_link)

        # Create email MIMEMultipart object
        msg = MIMEMultipart()
        msg['From'] = sender
        msg['To'] = ', '.join(receivers)
        msg['Subject'] = subject

        body = """\
        <html>
            <head></head>
            <body>
                Hey all,
                <br>

                <p>
                Here is the link to today's programming workshop:
                </p>

                <p>
                <b>Lesson name:</b> {0}<br>
                <b>Lesson description:</b> {1}<br>
                <b>Link to lesson:</b> {2}<br>
                </p>

                <p>
                This Email was sent automatically using
                <a href="{3}">this script</a>
                </p>
                <br>

                Ahmed and James
                <br>
            </body>
        </html>
        """.format(key, description, youtube_link, path_to_script)

        # Add body to MIMEMultipart object
        msg.attach(MIMEText(body, 'html'))  # Make sure message is HTML

        return msg
    else:
        # If no events matched. Print and exit.
        print("There were no events matching the current date. Exiting!")
        raise SystemExit


def send_email(user, password, msg):
    """Send Email with today's event detail, including link to stream

    Args:
        user ('str'): UTORID. Asked from user as input.
        password ('str'): UTOR password. Asked from user as input.
        msg (:obj:'MIMEMultipart'): Email in HTML format. See email.mime.multipart.MIMEMultipart().

    Returns:
        None: Sends ecrypted (TLS) Email over SMTP server.
    """

    try:
        # Start SMTP server. Host currently fixed as UofT
        smtp = smtplib.SMTP(host='smtp.utoronto.ca', port=587)

        # Identify the client (i.e., yourself), start secure connection and login
        smtp.ehlo()
        smtp.starttls()
        smtp.ehlo()
        smtp.login(user=user, password=password)

        # Conver message text to string and send
        text = msg.as_string()
        # print(text)
        smtp.sendmail(sender, receivers, text)
        smtp.quit()
        print("Successfully sent email")

    except Exception as E:
        print(E)
        print("Error: unable to send email")


if __name__ == '__main__':

    # Define command line arguments
    parser = argparse.ArgumentParser(
        prog="Send Email to UTM biology department with details for current day's programming workshop, including link to livestream.")
    parser.add_argument(
        'sender', help="Email from which to send Email. Currenty, must be UToronto Email.", type=str)
    args = vars(parser.parse_args())

    event = get_event()  # Get current day's event
    sender = args['sender']  # Get sender from command-line

    # Email sent to all addresses in list
    receivers = ['james.santangelo37@gmail.com']
    msg = create_message(sender, receivers, event)  # Create Email message

    # Get user-provided UTORID and password.
    user = input("What is your UTORID?: ")
    password = input("What is your password?: ")

    send_email(user, password, msg)
