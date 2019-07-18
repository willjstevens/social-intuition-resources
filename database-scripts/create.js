

var db = db.getSiblingDB('si');
print('Connected to SI.');


/* Run this if authentication fails
var schema = db.system.version.findOne({"_id" : "authSchema"});
schema.currentVersion = 3;
db.system.version.save(schema);
 */

/* Normal script

use si;
db.createUser(
    {
        user: "si",
        pwd: "si765",
        roles: [
            { role: "readWrite", db: "si" }
        ]
    }
);
 */

db.config.insert({
    category: 'proto',
    key: 'proto',
    value: 'proto',
    description: 'proto.'
});
db.config.ensureIndex({key: 1});
db.config.remove({key: 'proto'});
print('Created collection config and indexes.');


db.feedback.insert({
    name: 'name',
    email: 'email',
    comment: 'comment',
    insertTimestamp: 'proto',
    deleteTimestamp: 'proto'
});
db.feedback.remove({name: 'proto'});
print('Created collection feedback.');


db.user.insert({
    username: 'proto',
    email: 'proto',
    firstName: 'proto',
    lastName: 'proto',
    fullName: 'proto',
    birthdate: 'proto',
    gender: 'proto',
    password: 'proto',
    passwordQuestion: 'proto',
    passwordAnswer: 'proto',
    timezone: 'proto',
    cookieValue: 'proto',
    verificationCode: 'proto',
    verificationCodeIssuedTimestamp: 'proto',
    verificationCompletedTimestamp: 'proto',
    isEnabled: 'proto',
    isAdmin: 'proto',
    isDeleted: 'proto',
    inAgreement: 'proto',
    insertTimestamp: 'proto',
    updateTimestamp: 'proto',
    deleteTimestamp: 'proto'
});
db.user.ensureIndex({username: 1});
db.user.ensureIndex({firstName: 1});
db.user.ensureIndex({lastName: 1});
db.user.ensureIndex({cookieValue: 1});
db.user.ensureIndex({
        firstName: "text",
        lastName: "text"
    }
);
db.user.remove({username: 'proto'});
print('Created collection user and indexes.');


db.deviceSession.insert({
    userId: 'proto',
    deviceId: 'proto',
    sessionId: 'proto',
    insertTimestamp: 'proto',
    updateTimestamp: 'proto',
    deleteTimestamp: 'proto'
});
db.deviceSession.ensureIndex({deviceId: 1});
db.deviceSession.ensureIndex({sessionId: 1});
db.deviceSession.remove({userId: 'proto'});
print('Created collection deviceSession and indexes.');


db.cohort.insert({
    inviterUserId: 'proto',
    inviterFullName: 'proto',
    consenterUserId: 'proto',
    consenterFullName: 'proto',
    isAccepted: false,
    isIgnored: false,
    insertTimestamp: 'proto',
    updateTimestamp: 'proto',
    deleteTimestamp: 'proto'
});
db.cohort.ensureIndex({inviterUserId: 1});
db.cohort.ensureIndex({consenterUserId: 1});
db.cohort.remove({inviterUserId: 'proto'});
print('Created collection cohort and indexes.');


db.intuition.insert({
    userId: 'proto',
    userFullName: 'proto',
    intuitionText: 'proto',
    visibility: 'proto',
    predictionType: 'proto',
    prediction: {
        predictionText: 'proto',
        contributorUserId: 'proto',
        contributorFullName: 'proto'
    },
    predictionChoices: [{
        predictionText: 'proto',
        contributorUserId: 'proto',
        contributorFullName: 'proto',
        cohortPredictions: [{
            userId: 'proto',
            userFullName: 'proto',
            imageUrl: 'proto'
        }]
    }],
    outcome: {
        predictionText: 'proto',
        insertTimestamp: 'proto',
        updateTimestamp: 'proto',
        likes: [{
            userId: 'proto',
            userFullName: 'proto'
        }],
        comments: [{
            userId: 'proto',
            userFullName: 'proto',
            commentText: 'proto',
            insertTimestamp: 'proto',
            updateTimestamp: 'proto',
            deleteTimestamp: 'proto',
            likes: [{
                userId: 'proto',
                userFullName: 'proto'
            }]
        }]
    },
    scoreIntuition: true,
    displayPrediction: false,
    displayCohortsPredictions: false,
    allowCohortsToContributePredictions: false,
    expirationTimestamp: new Date(),
    likes: [{
        userId: 'proto',
        userFullName: 'proto'
    }],
    comments: [{
        userId: 'proto',
        userFullName: 'proto',
        commentText: 'proto',
        insertTimestamp: 'proto',
        updateTimestamp: 'proto',
        deleteTimestamp: 'proto',
        likes: [{
            userId: 'proto',
            userFullName: 'proto'
        }]
    }],
    postTimestamp: 'proto',
    insertTimestamp: 'proto',
    updateTimestamp: 'proto',
    deleteTimestamp: 'proto'
});
db.intuition.ensureIndex({userId: 1});
db.intuition.ensureIndex({visibility: 1});
db.intuition.ensureIndex({predictionType: 1});
db.intuition.ensureIndex({'cohortPredictions.userId': 1});
db.intuition.ensureIndex({'likes._id': 1});
db.intuition.remove({'userId': 'proto'});
print('Created collection intuition and indexes.');


db.notification.insert({
    userId: 'proto',
    type: 'proto',
    message: 'proto',
    data: 'proto',
    isHandled: true,
    insertTimestamp: 'insertTimestamp'
});
db.notification.ensureIndex({userId: 1});
db.notification.remove({userId: 'proto'});
print('Created collection notification and indexes.');


db.score.insert({
    userId: 'proto',
    ownedCorrect: [],
    ownedIncorrect: [],
    cohortCorrect: [],
    cohortIncorrect: []
});
db.score.ensureIndex({userId: 1});
db.score.remove({userId: 'proto'});
print('Created collection score and indexes.');


db.preference.insert({
    userId: 'proto',
    key: 'key',
    value: 'value'
});
db.preference.ensureIndex({userId: 1});
db.preference.remove({userId: 'proto'});
print('Created collection preference and indexes.');


db.referral.insert({
    referralCode: 'proto',
    title: 'proto',
    buttonTitle: 'proto',
    targetUrl: 'proto',
    isNativeUrl: true,
    requiresSession: true,
    progressMessage: 'proto',
    insertTimestamp: 'insertTimestamp'
});
db.referral.ensureIndex({referralCode: 1});
db.referral.remove({referralCode: 'proto'});
print('Created collection referral and indexes.');


db.config.insert({
    category: 'CLIENT',
    key: 'clientConfig',
    value: '{"facebookAppId": "897206583688866","googleClientId": "34806908672-8ngpsbl4np817f79n33pv64h6bp97hum.apps.googleusercontent.com"}',
    description: 'Configuration sent down to the web or mobile client.'
});
db.config.insert({
    category: 'CONTROLLER',
    key: 'cookieExpirySeconds',
    value: 31536000,
    description: 'The number of seconds in a year until a cookie expires and is passed to the cookie object.'
});
db.config.insert({
    category: 'ENVIRONMENT',
    key: 'environment',
    value: 'dev',
    description: 'The environment of which the application is executing. Values should be dev or prod.'
});
db.config.insert({
    category: 'ENVIRONMENT',
    key: 'siteDomainHttp',
    value: 'http://localhost:8080',
    description: 'The full abolsolute domain prefix of the website.'
});
db.config.insert({
    category: 'ENVIRONMENT',
    key: 'siteDomainHttps',
    value: 'https://localhost:8443',
    description: 'The full HTTPS abolsolute domain prefix of the website.'
});
db.config.insert({
    category: 'ENVIRONMENT',
    key: 'siteDomainOverride',
    value: 'https://socialintuition.co',
    description: 'The override typically used to satisfy social media integration when local testing.'
});
db.config.insert({
    category: 'ENVIRONMENT',
    key: 'cacheMemoryMaximum',
    value: '256000000',
    description: 'The maximum amount of bytes allocated to caching memory.'
});
db.config.insert({
    category: 'ENVIRONMENT',
    key: 'providerSecureRequestHeaderName',
    value: 'x-forwarded-proto',
    description: 'The request header key name for the flag whether/not a page was on SSL before reaching the application.'
});
db.config.insert({
    category: 'LOG',
    key: 'level',
    value: 'FINEST',
    description: 'The current level of the logger application wide.'
});
db.config.insert({
    category: 'SERVICE_SYSTEM',
    key: 'scheduledJobDelay',
    value: '5',
    description: 'The scheduler service job delay between full completion of each execution.'
});
db.config.insert({
    category: 'SERVICE_ACCOUNT',
    key: 'verificationPeriodAllowanceDays',
    value: '7',
    description: 'The number of days a user has to verify his/her account by clicking on the link in the email.'
});
db.config.insert({
    category: 'SERVICE_ACCOUNT',
    key: 'userGuestImageUrl',
    value: 'https://s3.amazonaws.com/si-static/user-guest-image',
    description: 'Image for guests.'
});
db.config.insert({
    category: 'SERVICE_ACCOUNT',
    key: 'userDefaultImageUrl',
    value: 'https://s3.amazonaws.com/si-static/user-default-image',
    description: 'Image for default user until overridden.'
});
db.config.insert({
    category: 'SERVICE_APPLICATION',
    key: 'intuitionExpiration',
    value: '7',
    description: 'The number of days a user until the intuition expires.'
});
db.config.insert({
    category: 'UTILITY',
    key: 'emailConnectionString',
    value: 'mail.smtp.host=smtpout.secureserver.net,mail.smtp.port=465,mail.smtp.socketFactory.port=465,mail.smtp.socketFactory.class=javax.net.ssl.SSLSocketFactory,mail.smtp.auth=true,mail.debug=true,sender.email=support@valloc.com,sender.username=support@valloc.com,sender.password=supporty42#',
    description: 'A key/value pair tokenized string of all SMTP configuration for email sending.'
});
print('Inserted configuration documents.');

db.createUser({
    user: "si",
    pwd: "si765",
    roles: [ "readWrite" ]
});


print('DONE creating SI database.');

