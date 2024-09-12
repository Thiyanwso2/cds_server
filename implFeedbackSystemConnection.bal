
import ballerinax/health.fhir.cds;

# This method acts like an interface to route the feedback request appropriate feedback
# connection methods.
#
# + hookId - id of the hook being invoked.
# + feedback - Feedback record to be processed.
# + return - return CdsError, if any.
isolated function submitFeedback(string hookId, cds:Feedbacks feedback) returns cds:CdsError? {
    match (hookId) {
                "regular-medications" => {
            return connectFeedbackSystemForRegular_Medications(feedback);
        }
                "static-patient-greeter" => {
            return connectFeedbackSystemForStatic_Patient_Greeter(feedback);
        }
                "radiology" => {
            return connectFeedbackSystemForRadiology(feedback);
        }
                "radiology-order" => {
            return connectFeedbackSystemForRadiology_Order(feedback);
        }
                "vaccines" => {
            return connectFeedbackSystemForVaccines(feedback);
        }
                "book-imaging-center" => {
            return connectFeedbackSystemForBook_Imaging_Center(feedback);
        }
            }

    string message = string `Can not find a cds service with the name: ${hookId}`;
    int statusCode = 404;
    cds:CdsError cdsError = cds:createCdsError(message, statusCode);
    return cdsError;
}

# ====================================== Please do your implementations to the below methods ===========================

# Handle feedback service connectivity.
#
# + feedback - Feedback record to be processed.
# + return - return CdsError, if any.
isolated function connectFeedbackSystemForRegular_Medications (cds:Feedbacks feedback) returns cds:CdsError? {
    string hookId = "regular-medications";
    return cds:createCdsError(string `Rule repository backend not implemented/ connected yet`, 501);
}

# Handle feedback service connectivity.
#
# + feedback - Feedback record to be processed.
# + return - return CdsError, if any.
isolated function connectFeedbackSystemForStatic_Patient_Greeter (cds:Feedbacks feedback) returns cds:CdsError? {
    string hookId = "static-patient-greeter";
    return cds:createCdsError(string `Rule repository backend not implemented/ connected yet`, 501);
}

# Handle feedback service connectivity.
#
# + feedback - Feedback record to be processed.
# + return - return CdsError, if any.
isolated function connectFeedbackSystemForRadiology (cds:Feedbacks feedback) returns cds:CdsError? {
    string hookId = "radiology";
    return cds:createCdsError(string `Rule repository backend not implemented/ connected yet`, 501);
}

# Handle feedback service connectivity.
#
# + feedback - Feedback record to be processed.
# + return - return CdsError, if any.
isolated function connectFeedbackSystemForRadiology_Order (cds:Feedbacks feedback) returns cds:CdsError? {
    string hookId = "radiology-order";
    return cds:createCdsError(string `Rule repository backend not implemented/ connected yet`, 501);
}

# Handle feedback service connectivity.
#
# + feedback - Feedback record to be processed.
# + return - return CdsError, if any.
isolated function connectFeedbackSystemForVaccines (cds:Feedbacks feedback) returns cds:CdsError? {
    string hookId = "vaccines";
    return cds:createCdsError(string `Rule repository backend not implemented/ connected yet`, 501);
}

# Handle feedback service connectivity.
#
# + feedback - Feedback record to be processed.
# + return - return CdsError, if any.
isolated function connectFeedbackSystemForBook_Imaging_Center (cds:Feedbacks feedback) returns cds:CdsError? {
    string hookId = "book-imaging-center";
    return cds:createCdsError(string `Rule repository backend not implemented/ connected yet`, 501);
}

