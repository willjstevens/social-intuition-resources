var db = db.getSiblingDB('si');
print('Connected to SI');

print('About to drop collections.');

db.config.drop();
print('Dropped config.');

db.user.drop();
print('Dropped user.');

db.deviceSession.drop();
print('Dropped deviceSession.');

db.cohort.drop();
print('Dropped cohort.');

db.feedback.drop();
print('Dropped feedback.');

db.notification.drop();
print('Dropped notification.');

db.intuition.drop();
print('Dropped intuition.');

db.score.drop();
print('Dropped score.');

db.referral.drop();
print('Dropped referral.');

db.dropUser('si');
print('Dropped user si.');




db.dropDatabase();



print('DONE dropping database.');