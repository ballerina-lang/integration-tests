package resources.services;

import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.errors;

@http:configuration {
    basePath:"/sql"
}
service <http> IntegratorService {

   @http:resourceConfig {
        methods:["POST"],
        path:"/insert/perRecord"
    }
    resource insertPerRecordToDBResource (message m) {
        message response = {};
        errors:Error err;
        json payload = messages:getJsonPayload(m);
        var keys, resultCount, err = insertPerRecordToDB(payload);
        if (err == null){
              string responsePayload;
              int length = lengthof keys;
              int i = 0;
              while (i<length){
                    if (i == 0){
                         responsePayload = keys[i];
                     }
                     else{
                        responsePayload = responsePayload + keys[i];
                    }
                    i = i+1;
              }
              responsePayload = responsePayload + "insertedRowCount:" + resultCount;
              messages:setStringPayload(response, responsePayload);
        }
        else{
              messages:setStringPayload(response, err.msg);
        }

        reply response;
    }

     @http:resourceConfig {
        methods:["POST"],
        path:"/insert/nonkey"
    }
     resource insertAutoGeneratedKeysNonKeyColResource (message m) {
        message response = {};
        errors:Error err;
        json payload = messages:getJsonPayload(m);
        var keys, resultCount, err = insertAutoGeneratedKeysNonKeyCol(payload);
        if (err == null){
              string responsePayload;
              int length = lengthof keys;
              int i = 0;
              while (i<length){
                    if (i == 0){
                         responsePayload = keys[i];
                     }
                     else{
                        responsePayload = responsePayload + keys[i];
                    }
                    i = i+1;
              }
              responsePayload = responsePayload + "insertedRowCount:" + resultCount;
              messages:setStringPayload(response, responsePayload);
        }
        else{
              messages:setStringPayload(response, err.msg);
        }
        reply response;
    }

       @http:resourceConfig {
        methods:["POST"],
        path:"/insert/missingcol"
    }

    resource insertMissingColResource (message m) {
        message response = {};
        errors:Error err;
        json payload = messages:getJsonPayload(m);
        var keys, resultCount, err = insertWithMissingCol(payload);
        if (err == null){
              string responsePayload;
              int length = lengthof keys;
              int i = 0;
              while (i<length){
                    if (i == 0){
                         responsePayload = keys[i];
                     }
                     else{
                        responsePayload = responsePayload + keys[i];
                    }
                    i = i+1;
              }
              responsePayload = responsePayload + "insertedRowCount:" + resultCount;
              messages:setStringPayload(response, responsePayload);
        }
        else{
              messages:setStringPayload(response, err.msg);
        }
        reply response;
    }

    @http:resourceConfig {
        methods:["POST"],
        path:"/insert/foreignkey"
    }
    resource insertForeignKeyResource (message m) {
        message response = {};
        errors:Error err;
        json payload = messages:getJsonPayload(m);
        var resultCount, err = insertWithForeignKey(payload);
        if (err == null){
              string responsePayload;
              responsePayload = "insertedRowCount:" + resultCount;
              messages:setStringPayload(response, responsePayload);
        }
        else{
              messages:setStringPayload(response, err.msg);
        }
        reply response;
    }

    @http:resourceConfig {
        methods:["POST"],
        path:"/insert/foreignkeyviolate"
    }
    resource insertForeignKeyViolateResource (message m) {
        message response = {};
        errors:Error err;
        json payload = messages:getJsonPayload(m);
        var resultCount, err = insertWithForeignKeyViolation(payload);
        if (err == null){
              string responsePayload;
              responsePayload = "insertedRowCount:" + resultCount;
              messages:setStringPayload(response, responsePayload);
        }
        else{
              messages:setStringPayload(response, err.msg);
        }
        reply response;
    }

    @http:resourceConfig {
        methods:["POST"],
        path:"/insert/exceeds"
    }
    resource insertExceedsDataSizeResource (message m) {
        message response = {};
        errors:Error err;
        json payload = messages:getJsonPayload(m);
        var keys, resultCount, err = insertExceedsSize(payload);
        if (err == null){
              string responsePayload;
              int length = lengthof keys;
              int i = 0;
              while (i<length){
                    if (i == 0){
                         responsePayload = keys[i];
                     }
                     else{
                        responsePayload = responsePayload + keys[i];
                    }
                    i = i+1;
              }
              responsePayload = responsePayload + "insertedRowCount:" + resultCount;
              messages:setStringPayload(response, responsePayload);
        }
        else{
              messages:setStringPayload(response, err.msg);
        }
        reply response;
    }

    @http:resourceConfig {
        methods:["POST"],
        path:"/insert/batchupdatesuccess"
    }
    resource batchUpdateSuccessResource (message m) {
        message response = {};
        errors:Error err;
        json payload = messages:getJsonPayload(m);
        int batchInsertedCount;
        int total;
        string finalResponsePayload;
        int i = 0;

        var updatedCount, err = batchUpdateSuccess(payload);
        if (err == null){
             int lengthUpdatedCount = lengthof updatedCount;
             while (i < lengthUpdatedCount){
              batchInsertedCount = updatedCount[i];
              total = total + batchInsertedCount;
              i = i + 1;
            }
              finalResponsePayload = <string>total;
        }
        else{
             finalResponsePayload = err.msg;
        }
        messages:setStringPayload(response, finalResponsePayload);
        reply response;
    }

      @http:resourceConfig {
        methods:["POST"],
        path:"/insert/batchupdateforeign"
    }
    resource batchUpdateForeignKeyResource (message m) {
        message response = {};
        errors:Error err;
        json payload = messages:getJsonPayload(m);
        int batchInsertedCount;
        int total;
        string finalResponsePayload;
        int i = 0;

        var updatedCount, err = batchUpdateForeignKeyRef(payload);
        if (err == null){
             int lengthUpdatedCount = lengthof updatedCount;
             while (i < lengthUpdatedCount){
              batchInsertedCount = updatedCount[i];
              total = total + batchInsertedCount;
              i = i + 1;
            }
              finalResponsePayload = <string>total;
        }
        else{
             finalResponsePayload = err.msg;
        }
        messages:setStringPayload(response, finalResponsePayload);
        reply response;
    }

     @http:resourceConfig {
        methods:["POST"],
        path:"/insert/innerjoin"
    }
    resource insertWithInnerJoinResource (message m) {
        message response = {};
        errors:Error err;
        string responsePayload;

        var resultCount, err = insertRecordsWithInnerJoin();
        if (err == null){
              responsePayload = <string>resultCount;
              messages:setStringPayload(response, responsePayload);
        }
        else{
              messages:setStringPayload(response, err.msg);
        }

        reply response;
    }

    @http:resourceConfig {
        methods:["POST"],
        path:"/insert/leftjoin"
    }
    resource insertWithLeftJoinResource (message m) {
        message response = {};
        errors:Error err;
        string responsePayload;

        var resultCount, err = insertRecordsWithLeftJoin();
        if (err == null){
              responsePayload = <string>resultCount;
              messages:setStringPayload(response, responsePayload);
        }
        else{
              messages:setStringPayload(response, err.msg);
        }

        reply response;
    }
}