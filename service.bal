import ballerina/http;
import ballerinax/health.fhir.cds;
import ballerina/log;

// AUTO-GENERATED FILE.
//
// This file is auto-generated by the CDS health tool.
// We do not recommend to modify it.

@http:ServiceConfig {
    cors: {
        // allowOrigins: ["http://localhost:5173", "http://localhost:5173/dashboard/lab-test", "http://localhost:5173/dashboard/"],
        allowOrigins: ["*"],
        allowCredentials: false,
        allowMethods: ["*"],
        allowHeaders: ["*"],
        maxAge: 84900
    }
}
service http:InterceptableService / on new http:Listener(9090) {

    public function createInterceptors() returns [RequestInterceptor, ResponseErrorInterceptor] {
        return [new RequestInterceptor(), new ResponseErrorInterceptor()];
    }


    # Discovery endpoint.
    #
    # + return - return CDS hook definition
    isolated resource function get cds\-services() returns http:Response {
        http:Response response = new ();
        if (cds:cds_services.count() > 0) {
            cds:Services services = {services: cds:cds_services};
            response.setJsonPayload(services);
        } else {
            response.setJsonPayload([]);
        }
        return response;
    }

    # Service endpoint.
    #
    # + hook_id - Registered id of the hook being invoked
    # + cdsRequest - cds request payload
    # + return - Clinical decisions as array of CDS cards
    isolated resource function post cds\-services/[string hook_id](@http:Payload cds:CdsRequest cdsRequest) returns http:Response {
        //Connect with decision support system implementation
        cds:CdsResponse|cds:CdsError cdsResponse = submitForDecision(hook_id, cdsRequest);
        return postProcessing(cdsResponse);
    }

    # Feedback endpoint.
    #
    # + hook_id - Registered id of the hook being invoked
    # + feedback - cds feedback payload
    # + return - return success message
    isolated resource function post cds\-services/[string hook_id]/feedback(@http:Payload cds:Feedbacks feedback) returns http:Response {
        //Connect with feedback system implementation
        cds:CdsError? result = submitFeedback(hook_id, feedback);
        return postProcessing(result);
    }

    isolated resource function post test(@http:Payload json body) returns json{
        log:printInfo(body.toBalString());

        return body;
    }
}
