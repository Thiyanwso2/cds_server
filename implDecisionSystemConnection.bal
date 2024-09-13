import ballerinax/health.fhir.cds;

# This method acts like an interface to route the request appropriate decision support
# connection methods.
#
# + hookId - Id of the hook being invoked.
# + cdsRequest - CdsRequest to sent to the backend.
# + return - return CdsResponse or CdsError.
isolated function submitForDecision(string hookId, cds:CdsRequest cdsRequest) returns cds:CdsResponse|cds:CdsError {
    match (hookId) {
        "regular-medications" => {
            return connectDecisionSystemForRegular_Medications(cdsRequest);
        }
        "static-patient-greeter" => {
            return connectDecisionSystemForStatic_Patient_Greeter(cdsRequest);
        }
        "radiology" => {
            return connectDecisionSystemForRadiology(cdsRequest);
        }
        "radiology-order" => {
            return connectDecisionSystemForRadiology_Order(cdsRequest);
        }
        "vaccines" => {
            return connectDecisionSystemForVaccines(cdsRequest);
        }
        "book-imaging-center" => {
            return connectDecisionSystemForBook_Imaging_Center(cdsRequest);
        }
    }

    string message = string `Can not find a cds service with the name: ${hookId}`;
    int statusCode = 404;
    cds:CdsError cdsError = cds:createCdsError(message, statusCode);
    return cdsError;
}

# ====================================== Please do your implementations to the below methods ===========================

# Handle decision service connectivity.
# 1. Map the received CdsRequest to the custom payload format, if needed (Optional).
# 2. Implement the connectivity with your external decision support system.
# 3. Send the CdsRequest to external system.
# 4. Get the response.
# 5. Map the received response to the CdsCards and Cds actions.
# 6. Return the CdsResponse.
#
# + cdsRequest - CdsRequest to sent to the backend.
# + return - return CdsResponse or CdsError
isolated function connectDecisionSystemForRegular_Medications(cds:CdsRequest cdsRequest) returns cds:CdsResponse|cds:CdsError {
    string hookId = "regular-medications";

    // // If needed, you can implement mapCdsRequestToDecisionServiceRequest method to
    // // transform CdsRequest to DecisionServiceRequest format
    // // For this you can use the Ballerina data mapper: https://ballerina.io/learn/vs-code-extension/implement-the-code/data-mapper/
    // anydata requestPayload = check mapCdsRequestToDecisionServiceRequest(cdsRequest);

    // // Here you should implement the logic to connect decisiton service
    // // Below is sample code
    // string decisionServiceUrl = "https://www.google.com";
    // http:Client|http:ClientError httpClient = new (decisionServiceUrl);
    // if (httpClient is http:ClientError) {
    //     return cds:createCdsError(httpClient.message(), 500);
    // }

    // anydata|http:ClientError response = httpClient->post("/", requestPayload.toJson());
    // if (response is http:ClientError) {
    //     return cds:createCdsError(response.message(), 500);
    // }

    // // map the received response to decision cards
    // // you can implement the mapDecisionServiceResponseToCdsCards method to
    // // transform DecisionServiceResponse to CdsCards
    // // For this you can use the Ballerina data mapper: https://ballerina.io/learn/vs-code-extension/implement-the-code/data-mapper/
    // cds:Card[] cards = [];
    // cds:Card|cds:CdsError card = mapDecisionServiceResponseToCdsCards(response);
    // if (card is cds:Card) {
    //     cards.push(card);
    // }

    // // If needed you can implement mapDecisionServiceResponseToCdsSystemActions method to
    // // transform DecisionServiceResponse to Cds system actions
    // // For this you can use the Ballerina data mapper: https://ballerina.io/learn/vs-code-extension/implement-the-code/data-mapper/
    // cds:Action[] systemActions = [];
    // cds:Action|cds:CdsError systemAction = mapDecisionServiceResponseToCdsSystemActions(response);
    // if (systemAction is cds:Action) {
    //     systemActions.push(systemAction);
    // }

    // cds:CdsResponse cdsResponse = {
    //     cards: cards,
    //     systemActions: systemActions
    // };

    cds:CdsResponse cdsResponse = {
        cards: [],
        systemActions: []
    };
    return cdsResponse;
}

# Handle decision service connectivity.
# 1. Map the received CdsRequest to the custom payload format, if needed (Optional).
# 2. Implement the connectivity with your external decision support system.
# 3. Send the CdsRequest to external system.
# 4. Get the response.
# 5. Map the received response to the CdsCards and Cds actions.
# 6. Return the CdsResponse.
#
# + cdsRequest - CdsRequest to sent to the backend.
# + return - return CdsResponse or CdsError
isolated function connectDecisionSystemForStatic_Patient_Greeter(cds:CdsRequest cdsRequest) returns cds:CdsResponse|cds:CdsError {
    string hookId = "static-patient-greeter";

    // // Follow the same approach mentioned in the above method

    cds:CdsResponse cdsResponse = {
        cards: [],
        systemActions: []
    };
    return cdsResponse;
}

# Handle decision service connectivity.
# 1. Map the received CdsRequest to the custom payload format, if needed (Optional).
# 2. Implement the connectivity with your external decision support system.
# 3. Send the CdsRequest to external system.
# 4. Get the response.
# 5. Map the received response to the CdsCards and Cds actions.
# 6. Return the CdsResponse.
#
# + cdsRequest - CdsRequest to sent to the backend.
# + return - return CdsResponse or CdsError
isolated function connectDecisionSystemForRadiology(cds:CdsRequest cdsRequest) returns cds:CdsResponse|cds:CdsError {
    string hookId = "radiology";

    // // Follow the same approach mentioned in the above method

    cds:CdsResponse cdsResponse = {
        cards: [],
        systemActions: []
    };
    return cdsResponse;
}

# Handle decision service connectivity.
# 1. Map the received CdsRequest to the custom payload format, if needed (Optional).
# 2. Implement the connectivity with your external decision support system.
# 3. Send the CdsRequest to external system.
# 4. Get the response.
# 5. Map the received response to the CdsCards and Cds actions.
# 6. Return the CdsResponse.
#
# + cdsRequest - CdsRequest to sent to the backend.
# + return - return CdsResponse or CdsError
isolated function connectDecisionSystemForRadiology_Order(cds:CdsRequest cdsRequest) returns cds:CdsResponse|cds:CdsError {
    string hookId = "radiology-order";

    // // Follow the same approach mentioned in the above method

    cds:CdsResponse cdsResponse = {
        cards: [],
        systemActions: []
    };

    cds:Card card1 = {
        summary: "Prior authorization",
        indicator: "critical",
        'source: {
            label: "Static CDS Service Example",
            url: "https://example.com",
            icon: "https://example.com/img/icon-100px.png"
        },
        suggestions: [{label: "Kindly get pri-authorization"}],
        selectionBehavior: "at-most-one",
        links: [{label: "Prior-auth", url: "https://www.acmehealth.com/policies/lab-coverage", 'type: cds:ABSOLUTE}]
    };

    cds:Card card2 = {
        summary: "Alternative approaches",
        indicator: "info",
        'source: {
            label: "Static CDS Service Example",
            url: "https://example.com",
            icon: "https://example.com/img/icon-100px.png"
        },
        suggestions: [
            {label: "We feel this is very early stage to go for CT scan, kindly check whether this can be analysed further during the consultions"},
            {label: "Try X-Ray as an alternative"}],
        selectionBehavior: "any"
    };

    cdsResponse.cards.push(card1);
    cdsResponse.cards.push(card2);
    return cdsResponse;
}

# Handle decision service connectivity.
# 1. Map the received CdsRequest to the custom payload format, if needed (Optional).
# 2. Implement the connectivity with your external decision support system.
# 3. Send the CdsRequest to external system.
# 4. Get the response.
# 5. Map the received response to the CdsCards and Cds actions.
# 6. Return the CdsResponse.
#
# + cdsRequest - CdsRequest to sent to the backend.
# + return - return CdsResponse or CdsError
isolated function connectDecisionSystemForVaccines(cds:CdsRequest cdsRequest) returns cds:CdsResponse|cds:CdsError {
    string hookId = "vaccines";

    // // Follow the same approach mentioned in the above method

    cds:CdsResponse cdsResponse = {
        cards: [],
        systemActions: []
    };
    return cdsResponse;
}

# Handle decision service connectivity.
# 1. Map the received CdsRequest to the custom payload format, if needed (Optional).
# 2. Implement the connectivity with your external decision support system.
# 3. Send the CdsRequest to external system.
# 4. Get the response.
# 5. Map the received response to the CdsCards and Cds actions.
# 6. Return the CdsResponse.
#
# + cdsRequest - CdsRequest to sent to the backend.
# + return - return CdsResponse or CdsError
isolated function connectDecisionSystemForBook_Imaging_Center(cds:CdsRequest cdsRequest) returns cds:CdsResponse|cds:CdsError {
    string hookId = "book-imaging-center";

    // // Follow the same approach mentioned in the above method

    cds:CdsResponse cdsResponse = {
        cards: [],
        systemActions: []
    };
    return cdsResponse;
}

isolated function mapCdsRequestToDecisionServiceRequest(cds:CdsRequest cdsRequest) returns anydata|cds:CdsError => {};

isolated function mapDecisionServiceResponseToCdsCards(anydata payload) returns cds:Card|cds:CdsError => {summary: "", indicator: "", 'source: {label: ""}};

isolated function mapDecisionServiceResponseToCdsSystemActions(anydata payload) returns cds:Action|cds:CdsError => {'type: "delete", description: ""};
