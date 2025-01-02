import 'package:fontresoft/fontresoft.dart';
import 'package:german_speaker/screens/alphabets.dart';
import 'package:german_speaker/screens/colors.dart';
import 'package:german_speaker/screens/days.dart';
import 'package:german_speaker/screens/month.dart';
import 'package:german_speaker/screens/numbers.dart';
import 'package:german_speaker/screens/quiz.dart';
import 'package:german_speaker/screens/speechtranslator.dart';
import 'package:german_speaker/screens/translator.dart';
import 'package:german_speaker/screens/verbs.dart';
import 'package:german_speaker/screens/textspeaker.dart';
import 'package:speech_to_text/speech_to_text.dart';

List category = [
  "ALPHABETS",
  "NUMBERS",
  "ACTION WORDS",
  "COLORS",
  "DAYS",
  "MONTHS",
  "TEXT TRANSLATOR",
  "QUIZ"
];

final List<String> imgList = [
  'image/abc.jpeg',
  'image/numbers.jpeg',
  'image/verb.jpeg',
  'image/color.jpeg',
  'image/day.jpeg',
  'image/month.png',
  'image/translator.jpeg',
  'image/quiz.jpeg'
];

List drawer = [
  "Home",
  "Alphabets",
  "Numbers",
  "Speech Translator",
  "Text Speaker",
  "Quiz"
];

List categoryWidgets = [
  Alphabet(),
  Numbers(),
  actionWords(),
  Color(),
  Day(),
  Month(),
  Translator(),
  Quiz()
];

List months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

final Map<String, String> germanmonth = {
  "January": "Januar",
  "February": "Februar",
  "March": "März",
  "April": "April",
  "May": "Mai",
  "June": "Juni",
  "July": "Juli",
  "August": "August",
  "September": "September",
  "October": "Oktober",
  "November": "November",
  "December": "Dezember",
};

List days = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];

final Map<String, String> germandays = {
  "Monday": "Montag",
  "Tuesday": "Dienstag",
  "Wednesday": "Mittwoch",
  "Thursday": "Donnerstag",
  "Friday": "Freitag",
  "Saturday": "Samstag",
  "Sunday": "Sonntag"
};

List color = [
  "Color",
  "Red",
  "Blue",
  "Purple",
  "Black",
  "White",
  "Yellow",
  "Orange",
  "Green",
  "Pink",
  "Violet",
  "Brown"
];

final Map<String, String> germanColor = {
  "Color": 'Farbe',
  "Red": "Rot",
  "Blue": "Blau",
  "Purple": "Lila",
  "Black": "Schwarz",
  "White": "Weiss",
  "Yellow": "Gelb",
  "Orange": "orange",
  "Green": "Grün",
  "Pink": "Rosa",
  "Violet": "Violetle",
  "Brown": "Braun"
};

List Verbs = [
  "Dancing",
  "Learning",
  "Going",
  "Living",
  "Driving",
  "Talking",
  "Fighting",
  "Thinking",
  "Speaking",
  "Laughing",
  "Playing"
];

final Map<String, String> germanVerbs = {
  "Dancing": "Tanzen",
  "Learning": "Lernen",
  "Going": "Gehen",
  "Living": "Leben",
  "Driving": "Fahrran",
  "Talking": "Reden",
  "Fighting": "Kampf",
  "Thinking": "Denken",
  "Speaking": "Apropos",
  "Laughing": "Lachen",
  "Playing": "Spielen"
};

final List<String> alphabets = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];
final Map<String, String> germanAlphabets = {
  'A': 'Aa',
  'B': 'Beh',
  'C': 'Tsey',
  'D': 'Dey',
  'E': 'Eh',
  'F': 'ef',
  'G': 'Geh',
  'H': 'Hah',
  'I': 'e',
  'J': 'Yot',
  'K': 'Kah',
  'L': 'El',
  'M': 'Em',
  'N': 'En',
  'O': 'Oh',
  'P': 'Peh',
  'Q': 'Kuh',
  'R': 'Er',
  'S': 'Es',
  'T': 'Teh',
  'U': 'Uh',
  'V': 'Fow',
  'W': 'Weh',
  'X': 'Iks',
  'Y': 'Upsilon',
  'Z': 'Tzett',
};

final List fonts = [
  Font.inconsolata(),
  Font.inter(),
  Font.lato(),
  Font.oswald(),
  Font.poppins(),
  Font.quicksand(),
  Font.robotoCondensed(),
  Font.shantellSans(),
  Font.sourceSans(),
  Font.sFProDisplay(),
  Font.sFProText(),
  Font.comfortaa(),
];

List imgurl = [
  "image/A.jpeg",
  "image/B.jpeg",
  "image/C.jpeg",
  "image/d.jpeg",
  "image/e.jpeg",
  "image/f.jpeg",
  "image/g.jpeg",
  "image/h.jpeg",
  "image/i.jpeg",
  "image/j.jpeg",
  "image/k.jpeg",
  "image/l.jpeg",
  "image/m.jpeg",
  "image/n.jpeg",
  "image/o.jpeg",
  "image/p.jpeg",
  "image/q.jpeg",
  "image/r.jpeg",
  "image/s.jpeg",
  "image/t.jpeg",
  "image/u.jpeg",
  "image/v.jpeg",
  "image/w.jpeg",
  "image/x.jpeg",
  "image/y.jpeg",
  "image/z.jpeg",
];

List num = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
];

final Map<String, String> germanNumbers = {
  '1': 'Eins',
  '2': 'Zwei',
  '3': 'Drei',
  '4': 'Vier',
  '5': 'Fünf',
  '6': 'Sechs',
  '7': 'Sieben',
  '8': 'Acht',
  '9': 'Neun',
  '10': 'Zehn',
  '11': 'Elf',
  '12': 'Zwölf',
  '13': 'Dreizehn',
  '14': 'Vierzehn',
  '15': 'Fünfzehn',
  '16': 'Sechzehn',
  '17': 'Siebzehn',
  '18': 'Achtzehn',
  '19': 'Neunzehn',
  '20': 'Zwanzig'
};