public with sharing class LifecycleLoggerController {
    @AuraEnabled
    public static void logMessage(String message) {
        System.debug(message);
    }
}