import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/foundation.dart';

class OpenAIService {
  static final OpenAIService _instance = OpenAIService._internal();

  factory OpenAIService() => _instance;

  final requestMessages = <OpenAIChatCompletionChoiceMessageModel>[];

  OpenAIService._internal() {
    OpenAI.apiKey = const String.fromEnvironment('API_KEY');

    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [OpenAIChatCompletionChoiceMessageContentItemModel.text(" ")],
      role: OpenAIChatMessageRole.system,
    );

    requestMessages.add(systemMessage);
  }

  Future<String?> chat(String userMessage) async {
    _addMessage(isFromUser: true, message: userMessage);

    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      seed: 6,
      messages: requestMessages,
      temperature: 0.2,
      maxTokens: 500,
    );
    final text = chatCompletion.choices.last.message.content?.first.text;

    if (text == null) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    } else {
      _addMessage(isFromUser: false, message: text);

      if (kDebugMode) {
        print('${chatCompletion.usage.promptTokens}\t$text');
      }
    }

    return text;
  }

  void _addMessage({required String message, required bool isFromUser}) {
    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(message),
      ],
      role: isFromUser
          ? OpenAIChatMessageRole.user
          : OpenAIChatMessageRole.assistant,
    );
    requestMessages.add(userMessage);
  }

  Future<String?> suggestMeal(String workoutName) async {
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
            "Suggest a pre-workout meal for the workout: $workoutName"),
      ],
      role: OpenAIChatMessageRole.system,
    );

    requestMessages.add(systemMessage);

    final chatCompletion = await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      seed: 6,
      messages: requestMessages,
      temperature: 0.2,
      maxTokens: 500,
    );

    final text = chatCompletion.choices.last.message.content?.first.text;

    if (text == null) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    } else {
      _addMessage(isFromUser: false, message: text);

      if (kDebugMode) {
        print('${chatCompletion.usage.promptTokens}\t$text');
      }
    }

    return text;
  }
}
