import 'package:flutter/material.dart';
import './view/calendar_page.dart';
import './view/dashboard_page.dart';
import './view/info_page.dart';
import './view/profile_page.dart';




const backgroundColor = Color.fromARGB(255, 249, 230, 236);
// var buttonColor = Color.fromARGB(255, 245, 0, 163);
var buttonColor = Colors.pinkAccent[400];
var unselectedButtonColor = Colors.pink[200];
var textColor = Colors.pinkAccent[700];
const borderColor = Colors.purple;
// const borderColor = Color.fromARGB(255, 110, 67, 193);

const borderColorLight = Color.fromARGB(255, 186, 104, 200);

// const borderColorLight = Color.fromARGB(170, 110, 67, 193);

List<String> emoji_name = ['Happy', 'Sad', 'Angry', 'Love', 'Good'];
List<String> emojis = ['😄', '😢', '😠', '❤️', '👍'];

//FIREBASE



final pages = [
  DashboardPage(),
  CalendarPage(),
  InfoPage(),
  ProfilePage(),
];
Map<String, Map<String, List<String>>> menstrualGuidelines = {
  'Disposable  Pad': {
    ' ': [
      "Welcome to our guide on using disposable pads, a convenient and widely used option for managing menstrual flow. To help you use them effectively and comfortably, here are some general guidelines:"
    ],
    '1. Selection': [
      "• Choose disposable pads that match your flow and comfort preferences. They come in various sizes and absorbencies, so select the one that suits you best."
    ],
    '2. Placement': [
      "• Peel off the adhesive backing and securely attach the disposable pad to the inside of your underwear, making sure it's centered and flat."
    ],
    '3. Changing Routine': [
      "• Change your disposable pad every 4-6 hours, or more frequently if needed. Timely changes prevent leaks and maintain freshness."
    ],
    '4. Disposal': [
      "• When it's time for a change, fold the used pad in half with the soiled side facing inward, and use the adhesive backing to secure it. This helps contain odor and keeps it discreet.",
      "• Dispose of used pads in a sanitary disposal bin. Do not flush them down the toilet, as they can cause plumbing issues."
    ],
    '5. On-The-Go Convenience': [
      "• Carry extra disposable pads with you in a discreet pouch or bag, especially when you're away from home."
    ],
    '6. Privacy': [
      "• Change your disposable pad in a private setting, such as a restroom stall, to maintain your comfort and privacy."
    ],
    '7. Hygiene': [
      "• Always wash your hands before and after changing your disposable pad to prevent the spread of germs."
    ],
    '8. Skin Care': [
      "• Pay attention to your skin's sensitivity. If you experience irritation, consider using pads with hypoallergenic materials or changing to a different brand."
    ],
    '9. Backup Options': [
      "• It's a good idea to have spare disposable pads on hand in case your flow is heavier than expected."
    ],
    '10. Odor Control': [
      "• Some disposable pads come with odor-absorbing technology. If odor is a concern for you, choose pads designed for this purpose."
    ],
    '11. Environmental Consideration': [
      "• While disposable pads are convenient, they contribute to landfill waste. Consider eco-friendly alternatives like reusable pads or menstrual cups if you're concerned about environmental impact."
    ],
    '12. Comfort and Fit': [
      "• Experiment with different brands and styles to find the disposable pads that provide the best comfort and fit for your body."
    ],
    '13. Allergies and Sensitivities': [
      "• Be aware of any allergies or sensitivities you may have to materials commonly used in disposable pads. If you experience irritation, consult a healthcare professional."
    ],
  },
  'Menstrual Cloth': {
    ' ': [
      'Welcome to our app\'s guide on using menstrual cloth. Menstrual cloth is a reusable, eco-friendly, and cost-effective alternative to disposable menstrual products. To help you make the most of this sustainable option, we\'ve put together some practical guidelines:'
    ],
    '1. Getting Started': [
      '• Ensure you have an adequate supply of menstrual cloth pads or liners for your cycle. A typical recommendation is to have at least 5-7 cloth pads.'
    ],
    '2. Prepping Your Cloth': [
      '• Wash your menstrual cloth pads before your first use following the manufacturer\'s instructions.',
      '• Make sure you have access to clean water and soap for washing.'
    ],
    '3. Proper Placement': [
      '• Position the cloth pad in your underwear with the absorbent side against your body and the waterproof layer facing outward.'
    ],
    '4. Changing Regularly': [
      '• Change the cloth pad every 4-6 hours, adjusting as needed based on your flow to prevent leaks and discomfort.'
    ],
    '5. On-The-Go Convenience': [
      '• Carry a small, waterproof pouch with you to store used cloth pads when you\'re away from home. This keeps them discreet and prevents odors.'
    ],
    '6. Quick Cleaning': [
      '• Rinse used cloth pads in cold water as soon as possible to prevent staining. You can do this in a sink or using a portable water bottle.',
      '• Store the rinsed cloth pad in a separate waterproof bag until washing.'
    ],
    '7. Thorough Washing': [
      '• When you have access to clean water and soap, wash the cloth pads either by hand or in a washing machine.',
      '• Use cold water for the initial rinse and hot water for the main wash. Avoid harsh detergents or fabric softeners.',
      '• For handwashing, gently scrub to remove any remaining stains and rinse until water runs clear.'
    ],
    '8. Drying Effectively': [
      '• Hang clean cloth pads in direct sunlight or a well-ventilated area to dry. Sunlight helps disinfect and remove stains.',
      '• Ensure they are completely dry before storing.'
    ],
    '9. Safe Storage': [
      '• Store clean and dry cloth pads in a clean, dry place until your next cycle.'
    ],
    '10. Privacy and Discretion': [
      '• Plan your cloth pad changes in private settings, especially when outside your home. Consider carrying a small wet bag or pouch for discreet transportation.'
    ],
    '11. Maintenance Check': [
      '• Regularly inspect your cloth pads for signs of wear and tear. Replace them if they become thin or less absorbent over time.'
    ],
    '12. Personalization': [
      '• If you prefer, choose dark-colored or patterned cloth pads to reduce the visibility of stains.'
    ],
  },
  'Reusable pad': {
    ' ': [
      'Welcome to our guide on using reusable pads, a sustainable and eco-friendly alternative to disposable menstrual products. These guidelines will help you make the most of reusable pads for your menstrual needs:'
    ],
    '1. Preparation': [
      "• Start by acquiring an adequate supply of reusable pads. It's advisable to have at least 5-7 pads for a complete cycle."
    ],
    '2. Pre-Washing': [
      "• Before your first use, wash the reusable pads according to the manufacturer's instructions. This ensures they are clean and ready for use.",
      "• Make sure you have access to clean water and soap for washing."
    ],
    '3. Placement': [
      "• Position the reusable pad inside your underwear with the absorbent side facing up and the waterproof layer facing down."
    ],
    '4. Changing Routine': [
      "• Change the reusable pad every 4-6 hours or as needed based on your menstrual flow. Prompt changing prevents leaks and maintains comfort."
    ],
    '5. On-The-Go Convenience': [
      "• Carry a small waterproof pouch or bag with you to store used pads when you're away from home. This keeps them discreet and prevents odors."
    ],
    '6. Immediate Care': [
      "• After removing the used pad, rinse it in cold water as soon as possible to prevent staining. This can be done in a sink or using a portable water bottle.",
      "• Store the rinsed pad in a separate waterproof bag until you can wash it."
    ],
    '7. Thorough Cleaning': [
      "• When you have access to clean water and soap, wash the reusable pads either by hand or in a washing machine.",
      "• Use cold water for the initial rinse and hot water for the main wash. Avoid harsh detergents or fabric softeners.",
      "• For handwashing, gently scrub to remove any remaining stains and rinse until water runs clear."
    ],
    '8. Drying Properly': [
      "• Hang the clean pads in direct sunlight or a well-ventilated area to dry. Sunlight helps disinfect and remove stains.",
      "• Ensure the pads are completely dry before storing them."
    ],
    '9. Safe Storage': [
      "• Store clean and dry reusable pads in a clean, dry place until your next cycle."
    ],
    '10. Privacy and Discretion': [
      "• Plan your pad changes in a private setting, especially when outside your home.",
      "• Consider carrying a small wet bag or pouch for discreet transportation."
    ],
    '11. Maintenance Check': [
      "• Regularly inspect your reusable pads for signs of wear and tear. Replace them if they become thin or less absorbent over time."
    ],
    '12. Personalization': [
      "• If you prefer, choose pads with different colors or patterns to suit your style and reduce the visibility of stains."
    ],
  },
  'Tampons': {
    ' ': [
      'Tampons are a common and discreet way to manage menstrual flow. To help you use them safely and effectively, here are some general guidelines:'
    ],
    '1. Selection': [
      "• Choose the right tampon size and absorbency level based on your flow. Start with a lower absorbency and increase as needed."
    ],
    '2. Clean Hands': [
      "• Wash your hands thoroughly with soap and water before handling a tampon."
    ],
    '3. Unwrapping and Inserting': [
      "• Unwrap the tampon from its packaging, but leave the string hanging.",
      "• Find a comfortable position, whether standing with one leg elevated or sitting on the toilet.",
      "• Hold the tampon applicator or the base of the tampon (depending on the type) and gently insert it into your vaginal canal, aiming it toward your lower back.",
      "• Follow the instructions provided on the tampon package for correct insertion."
    ],
    '4. Ensuring Proper Placement': [
      "• Ensure the tampon is inserted deep enough so that you can't feel it. If you do feel discomfort, it may not be inserted far enough.",
      "• The string should hang outside your body, allowing for easy removal."
    ],
    '5. Monitor and Change': [
      "• Keep track of the time when you insert the tampon. Tampons can typically be worn for up to 4-8 hours, depending on your flow. Change them regularly to avoid leakage and discomfort.",
      "• Avoid wearing a tampon for more than 8 hours to reduce the risk of toxic shock syndrome (TSS)."
    ],
    '6. Removal': [
      "• To remove the tampon, wash your hands first.",
      "• Gently pull the string downward and outward to slide the tampon out.",
      "• Dispose of it in the trash. Do not flush tampons down the toilet, as they can cause plumbing issues."
    ],
    '7. Alternate Products': [
      "• It's a good idea to use pads or panty liners alongside tampons, especially on heavier flow days, for added protection against leaks."
    ],
    '8. Discomfort and Allergies': [
      "• If you experience discomfort, irritation, or allergies while using tampons, consider trying a different brand or type.",
      "• Choose unscented tampons to minimize the risk of irritation."
    ],
    '9. TSS Awareness': [
      "• Be aware of the symptoms of toxic shock syndrome (TSS), a rare but serious condition associated with tampon use. If you experience sudden high fever, vomiting, diarrhea, rash, or other unusual symptoms, remove the tampon immediately and seek medical attention."
    ],
    '10. Environmental Impact': [
      "• Tampons are disposable and contribute to waste. If you're concerned about the environment, consider reusable options like menstrual cups or cloth pads."
    ],
    '11. Emptying Regularly': [
      "• If you're using tampons during the night, remember to set an alarm to check and change them if needed to ensure you don't exceed the recommended wear time."
    ]
  },
  'Menstrual Cup': {
    ' ': [
      "Using a menstrual cup is an eco-friendly and cost-effective way to manage your menstrual cycle. These guidelines will help you use a menstrual cup effectively and comfortably:"
    ],
    '1. Selection': [
      "• Choose the right size and style of menstrual cup based on your age, flow, and whether or not you've given birth vaginally. Consult the cup manufacturer's guidelines for sizing."
    ],
    '2. Preparing for Use': [
      "• Before using the menstrual cup for the first time, sterilize it by boiling it in water for 5-10 minutes. Afterward, allow it to cool and dry."
    ],
    '3. Wash Your Hands': [
      "• Always start by thoroughly washing your hands with soap and water before handling the menstrual cup."
    ],
    '4. Folding and Inserting': [
      "• Fold the menstrual cup according to your preferred fold (e.g., C-fold, punch-down fold).",
      "• Insert the folded cup into your vaginal canal, angling it slightly toward your tailbone. It should sit lower than a tampon but should not be felt when properly inserted."
    ],
    '5. Ensuring Proper Seal': [
      "• Rotate the cup gently to create a seal, which prevents leaks. You may hear or feel a slight suction when it's sealed correctly."
    ],
    '6. Monitoring and Emptying': [
      "• Wear the menstrual cup for up to 12 hours, depending on your flow. You can wear it overnight.",
      "• Check the cup periodically, especially during heavier flow days, and empty it when it's about two-thirds full to avoid leaks."
    ],
    '7. Removal': [
      "• To remove the cup, first wash your hands.",
      "• Gently pinch the base of the cup to release the seal. Then, wiggle it slightly while pulling down to ease removal."
    ],
    '8. Emptying and Cleaning': [
      "• Empty the contents of the cup into the toilet or sink.",
      "• Rinse the cup with cold water first to prevent staining, and then wash it with mild, unscented soap and warm water.",
      "• If you're in a public restroom without access to a sink, you can use menstrual cup wipes or simply empty it and reinsert it."
    ],
    '9. Sterilization': [
      "• Sterilize the menstrual cup between cycles by boiling it for 5-10 minutes. Store it in a breathable pouch in a clean, dry place between uses."
    ],
    '10. Reusable and Eco-Friendly': [
      "• One menstrual cup can last for years, significantly reducing waste compared to disposable products."
    ],
    '11. Allergies and Sensitivities': [
      "• Be aware of any allergies or sensitivities you may have to the material the menstrual cup is made from (usually medical-grade silicone, rubber, or latex). Choose a hypoallergenic option if necessary."
    ],
    '12. Practice Makes Perfect': [
      "• It may take a few cycles to become fully comfortable with using a menstrual cup.",
      "• Don't be discouraged if you don't get it right on the first try."
    ]
  },
  'Myths': {
    "1. Menstruating individuals are impure and should be isolated.": [
      "In some parts of Nepal, there is a belief that menstruating individuals are impure and should be isolated from the rest of the family or community. This practice, known as 'Chhaupadi,' has been officially banned but still persists in some areas."
    ],
    "2. Menstrual blood is harmful to crops and livestock.": [
      "Some rural communities in Nepal believe that coming into contact with menstrual blood can harm crops and livestock. This belief has led to the segregation of menstruating individuals from agricultural activities."
    ],
    "3. Menstruating individuals should not enter temples or kitchens.": [
      "There is a common belief that menstruating individuals should not enter temples or kitchens because they are considered impure during their periods. This practice can limit their access to religious and household spaces."
    ],
    "4. Menstrual pain is a sign of weakness or punishment.": [
      "Some people in Nepal may believe that experiencing menstrual pain is a sign of weakness or a form of punishment. This misconception can lead to the neglect of menstrual health issues."
    ],
    "5. Discussing menstruation openly is taboo.": [
      "In many parts of Nepal, discussing menstruation openly is considered a taboo subject. This lack of open communication can lead to misinformation and stigmatization."
    ],
    "6. Menstruation can be controlled or delayed through specific rituals or practices.":
        [
      "There are traditional beliefs that certain rituals or practices can control or delay menstruation. These beliefs can lead to harmful practices and a lack of proper menstrual education."
    ],
    "7. Women shouldn't engage in physical activity or exercise during menstruation.":
        [
      "Exercise can help alleviate menstrual discomfort and is generally safe during menstruation."
    ],
    "8. Menstrual blood attracts sharks and other animals.": [
      "There is no scientific basis for this belief; menstrual blood does not attract sharks or wildlife."
    ],
    "9. Women should avoid swimming during menstruation.": [
      "Swimming is possible while using appropriate menstrual products, such as tampons or menstrual cups."
    ],
    "10. Menstruation syncs up among women who live together.": [
      "The idea of menstrual synchronization is largely anecdotal, with limited scientific evidence."
    ],
    "11. You can't get pregnant during your period.": [
      "While less likely, pregnancy is still possible during menstruation, especially with shorter menstrual cycles."
    ],
    "12. Period pain is normal and doesn't require medical attention.": [
      "While some discomfort is common, severe menstrual pain may indicate an underlying medical condition and should be addressed."
    ],
    "13. You should avoid certain foods during menstruation.": [
      "There is no need to avoid specific foods during menstruation; a balanced diet is essential for overall health."
    ],
    "14. Menstrual blood loss is the same for everyone.": [
      "Menstrual flow varies between individuals and can change over time."
    ],
  },
  "Facts": {
    "1. Menstruation is a natural and healthy process.": [
      "Menstruation is the body's natural way of shedding the uterine lining, preparing for possible pregnancy."
    ],
    "2. The menstrual cycle varies in length.": [
      "The menstrual cycle's length can vary significantly among individuals, typically ranging from 21 to 35 days."
    ],
    "3. Menstrual products are diverse.": [
      "There is a wide variety of menstrual products available, allowing individuals to choose what suits them best."
    ],
    "4. Menstrual hygiene is essential.": [
      "Proper menstrual hygiene, including regular product changes, helps prevent infection and discomfort."
    ],
    "5. Some individuals experience PMS (Premenstrual Syndrome).": [
      "PMS symptoms, such as mood swings and bloating, can occur in the days leading up to menstruation."
    ],
    "6. Menstruation can affect mood.": [
      "Hormonal fluctuations during the menstrual cycle can influence mood and emotions."
    ],
    "7. Menstruation may come with discomfort.": [
      "Mild cramping and breast tenderness are common, but severe pain may indicate an underlying condition."
    ],
    "8. Menstrual education is important.": [
      "Educating individuals about menstruation and proper hygiene helps reduce stigma and promote well-being."
    ],
    "9. Period poverty is a global issue.": [
      "Many individuals worldwide lack access to affordable menstrual products, affecting their health and opportunities."
    ],
    "10. Menstrual health is linked to overall health.": [
      "Changes in menstrual patterns or severe menstrual symptoms may signal underlying health conditions that require medical attention."
    ],
  },
  'Key Terms': {
    "1. Menstruation or menses": [
      "Menstruation or menses is the natural bodily process of releasing blood and associated matter from the uterus through the vagina as part of the menstrual cycle."
    ],
    "2. Menarche": [
      "Menarche is the onset of menstruation, the time when a girl has her first menstrual period."
    ],
    "3. Menstrual hygiene management (MHM)": [
      "Menstrual hygiene management (MHM) refers to management of hygiene associated with the menstrual process.",
      "WHO and UNICEF Joint Monitoring Programme (JMP) for drinking water, sanitation, and hygiene has used the following definition of MHM:",
      "'Women and adolescent girls are using a clean menstrual management material to absorb or collect menstrual blood, that can be changed in privacy as often as necessary for the duration of a menstrual period, using soap and water for washing the body as required, and having access to safe and convenient facilities to dispose of used menstrual management materials. They understand the basic facts linked to the menstrual cycle and how to manage it with dignity and without discomfort or fear.'"
    ],
    "4. Menstrual health and hygiene (MHH)": [
      "Menstrual health and hygiene (MHH) encompasses both MHM and the broader systemic factors that link menstruation with health, well-being, gender equality, education, equity, empowerment, and rights.",
      "These systematic factors have been summarized by UNESCO as accurate and timely knowledge, available, safe, and affordable materials, informed and comfortable professionals, referral and access to health services, sanitation and washing facilities, positive social norms, safe and hygienic disposal and advocacy and policy."
    ],
    "5. Menstruator": [
      "A menstruator is a person who menstruates and therefore has menstrual health and hygiene needs – including girls, women, transgender and non-binary persons.",
      "Throughout this guidance, the term ‘girls and women’ is used as a shorthand term to increase readability and refers to all menstruators regardless of gender identity."
    ],
    "6. Menstrual hygiene materials": [
      "Menstrual hygiene materials are the products used to catch menstrual flow, such as pads, cloths, tampons or cups."
    ],
    "7. Menstrual supplies": [
      "Menstrual supplies are other supportive items needed for MHH, such as body and laundry soap, underwear, and pain relief items."
    ],
    "8. Menstrual facilities": [
      "Menstrual facilities are those facilities most associated with a safe and dignified menstruation, such as toilets and water infrastructure."
    ],
  },
};

Map<String, List<String>> periodBloodColors = {
  "1. Bright Red": [
    "Your blood will usually be bright red on the heaviest days of your period when you have a steady flow of fresh blood. It’s often brighter in color because it passes out of your body at a faster rate – meaning it has little time to oxidize and go darker.",
    "Blood clots usually occur during the heaviest days of your menstrual flow and are bright or dark red. ‘Blood clots are due to heavy bleeding, where the blood flow is faster and heavier than the body can process, leading to the formation of clots.’"
  ],
  "2. Dark Red": [
    "Dark red blood is very common, especially first thing in the morning. This is because after you’ve been lying down for a while, the blood has oxidized inside your uterus before coming out.",
    "You may also notice dark red blood at the end of your period (or at the very beginning) when the blood is moving at a slower pace and has more time to oxidize.",
    "After childbirth, your vaginal discharge (also called lochia) will be a dark red color. ‘Lochia behaves just like menstrual bleeding – immediately after birth, when the bleeding is at its heaviest, it’s usually bright red and then becomes darker as the flow decreases.’"
  ],
  "3. Dark Brown or Black": [
    "Dark brown or black blood is just older blood. Like with dark red blood, you may see brown or black blood at the very beginning or end of your cycle when blood is taking longer to leave your body.",
    "Brown discharge or spotting during pregnancy can indicate a miscarriage or an ectopic pregnancy, which is when the fertilized egg implants itself outside the uterus, usually in one of the fallopian tubes. If you’re bleeding heavily and you’re in a lot of pain, it’s important to speak to a midwife or doctor immediately for further investigation."
  ],
  "4. Light Pink": [
    "Pink blood is likely due to your cervical fluid mixing with your period blood and lightening the color – you may notice this on days when your flow is light, like at the end of your period.",
    "Anemia, a condition caused by low iron levels, can also cause pink period blood.",
    "Spotting can sometimes be light-pink due to the lighter nature of the bleeding.",
    "Pink vaginal discharge could also signal low estrogen levels – and it could be a sign of perimenopause. ‘Low estrogen levels may lead to pink discharge at different points of your cycle, and not necessarily when you'd expect a period.’"
  ],
  "5. Orange": [
    "Orange menstrual fluid may be a result of your menstrual blood mixing with cervical fluid.",
    "Orange period blood or discharge may also be a sign of an infection, like bacterial vaginosis. Or a sexually transmitted infection, such as trichomoniasis, which is caused by a parasite."
  ],
  "6. Grey": [
    "Grey period blood is usually a sign of an infection, like bacterial vaginosis.",
    "If you have gray discharge accompanied by blood clots or tissue, there’s a possibility that you’re having a miscarriage."
  ],
};

List<String> colorImages = [
  'asset/images/bright_red.png',
  'asset/images/dark_red.png',
  'asset/images/dark_brown.png',
  'asset/images/light_pink.png',
  'asset/images/orange.png',
  'asset/images/grey.png'
];
