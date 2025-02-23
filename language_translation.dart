import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  var languages = ['English', 'Hindi', 'Marathi', 'Punjabi'];
  var originLanguage = "English";
  var destinationLanguage = "Hindi";
  var output = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    if (src == "--" || dest == "--" || input.trim().isEmpty) {
      setState(() {
        output = "Failed to translate";
      });
      return;
    }

    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);

    setState(() {
      output = translation.text;
    });
  }

  String getLanguageCode(String language) {
    if (language == "English") return "en";
    if (language == "Hindi") return "hi";
    if (language == "Marathi") return "mr";
    if (language == "Punjabi") return "pa";
    return "--";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: const Text("Language Translator", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Language Selection Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // From Language Dropdown
                  DropdownButton<String>(
                    value: originLanguage,
                    dropdownColor: Colors.grey[800], // Improved dropdown visibility
                    style: const TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.white,
                    onChanged: (String? value) {
                      setState(() {
                        originLanguage = value!;
                      });
                    },
                    items: languages.map((String lang) {
                      return DropdownMenuItem(
                        value: lang,
                        child: Text(lang, style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                  const SizedBox(width: 10),
                  // To Language Dropdown
                  DropdownButton<String>(
                    value: destinationLanguage,
                    dropdownColor: Colors.grey[800], // Improved dropdown visibility
                    style: const TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.white,
                    onChanged: (String? value) {
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },
                    items: languages.map((String lang) {
                      return DropdownMenuItem(
                        value: lang,
                        child: Text(lang, style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Input Field
              TextFormField(
                controller: languageController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter text to translate...',
                  labelStyle: const TextStyle(fontSize: 15, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Translate Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2b3c5a),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  translate(getLanguageCode(originLanguage), getLanguageCode(destinationLanguage), languageController.text);
                },
                child: const Text("Translate", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),

              const SizedBox(height: 20),

              // Output Text
              Text(
                output,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
