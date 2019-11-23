//
//  ResponseFormatter.hpp
//  MintCrisprFirmware
//
//  Created by Harry O'Brien on 22/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

#ifndef ResponseFormatter_h
#define ResponseFormatter_h

#include <Arduino.h>

// MARK: - JSON Namespace
namespace JSON {
	struct BaseValuePair {
		String name;
		String value;

		BaseValuePair() {}
		BaseValuePair(String setName, String setValue) {
			name = setName;
			value = setValue;
		}
	};

	template<typename T>
	struct ValuePair: public BaseValuePair {

		ValuePair() {}
		ValuePair(String setName, T setValue) {
			name = setName;
			value = String(setValue);
		}
	};

	struct UnitDetail {
		String name = "";
		BaseValuePair* data;
		int length;

		UnitDetail() {}

		UnitDetail(BaseValuePair* setData, int setCount) :
		data(setData),
		length(setCount)
		{}

		UnitDetail(String setName, BaseValuePair* setData, int setCount) :
		name(setName),
		data(setData),
		length(setCount)
		{}
	};

	struct Array {
		String name;
		UnitDetail *data;
		int length;

		Array() {}

		Array(String setName, UnitDetail* setData, int setCount) :
		name(setName),
		data(setData),
		length(setCount)
		{}
	};
}; // namespace JSON

// MARK: - Response Formatter
class ResponseFormatter {

	char* jsonResponse;
	int stringLength = 0;

public:
	ResponseFormatter() {
		jsonResponse = new char[500];

		//todo: clean this up -> looks messy
		jsonResponse[0] = "{";
		stringLength += 1;
	}

	void operator << (JSON::BaseValuePair pair) {
		//append the ("name": "value") pair
		char jsonString[] = ("\"" + pair.name + "\": \"" + pair.value + "\", ");
		jsonResponse[stringLength] = jsonString;
		stringLength += strlen(jsonString);

	}

	void operator << (JSON::UnitDetail unit) {
		//append name if applicable
		if (unit.name != "") {
			char name[] = ("\"" + unit.name + "\": ");
			jsonResponse[stringLength] = name;
			stringLength += strlen(name);
		}

		jsonResponse += "{";
		stringLength += 1;
		for(int i = 0; i < unit.length; i++){
			(*this) << unit.data[i];
		}

		//remove unecessary comma, append closing curly bracket and comma
    // jsonResponse.remove(jsonResponse.length()-2, 2);
		char closing[] = ("}, ");
		jsonResponse[stringLength] = closing;
		stringLength += 3;
	}

	void operator << (JSON::Array arr) {
		//apend name
		char name[] = ("\"" + arr.name + "\": [");
		jsonResponse[stringLength] = name;
		stringLength += strlen(name);

		for(int i = 0; i < arr.length; i++) {
			(*this) << arr.data[i];
		}

		//remove unnecessary comma, append closing array bracket and comma
		// jsonResponse.remove(jsonResponse.length()-2, 2);
		char closing[] = ("], ");
		jsonResponse[stringLength] = closing;
		stringLength += strlen(closing);
	}

	char* returnJsonResponse() {
		// jsonResponse.remove(jsonResponse.length()-2, 2);
		char closing[] = ("}");
		jsonResponse[stringLength] = closing;
		stringLength += strlen(closing);

		Serial.println(jsonResponse);

		return jsonResponse;
	}
};

#endif /* ResponseFormatter_h */
