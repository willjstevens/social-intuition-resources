
/*
 * si Local Info:
 * 
 * 		postgres://si:si123@localhost:5432/si
 *
 * dpnd2gump6sso Heroku Dev Info:
 * 
 * 		postgres://buzybiyvdqtalt:jQmL2Jwc6DJL-FJ2K8QLFRfGQ-@ec2-54-225-101-60.compute-1.amazonaws.com:5432/dpnd2gump6sso
 * 
 * 
 *  Local User: 	si
 *  Heroku User:	buzybiyvdqtalt
 * 
 */

create or replace function si_update_trig_func() returns trigger as $$
	begin
		new.update_timestamp = now();
		return new;
	end;
$$ language plpgsql;

create sequence config_id_seq start 1;
grant select, update on config_id_seq to si;
create table "config" (
	id integer primary key default nextval('config_id_seq'),
	category varchar(100) not null,
	key varchar(500) not null,
	value varchar(2000) not null,
	description varchar(1000) not null,
	insert_timestamp timestamp with time zone default now(),
	update_timestamp timestamp with time zone,
	delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "config" to si;

create sequence system_notification_id_seq start 1;
grant select, update on system_notification_id_seq to si;
create table "system_notification" (
  id integer primary key default nextval('system_notification_id_seq'),
  category varchar(100) not null,
  action varchar(100) not null,
  notification_data varchar(2000) not null,
  is_config_change boolean not null,
  insert_timestamp timestamp with time zone default now(),
  delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "system_notification" to si;

create sequence system_notification_history_id_seq start 1;
grant select, update on system_notification_history_id_seq to si;
create table "system_notification_history" (
  id integer primary key default nextval('system_notification_history_id_seq'),
  system_notification_id integer not null,
  instance_id varchar(100) not null,
  result_code integer not null,
  result_message varchar(1000),
  history_order integer not null,
  insert_timestamp timestamp with time zone default now(),
  delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "system_notification_history" to si;

create sequence user_id_seq start 1;
grant select, update on user_id_seq to si;
create table "user" (
	id integer primary key default nextval('user_id_seq'),
	username varchar(25) not null,
	email varchar(100) not null,
	first_name varchar(25) not null,
	last_name varchar(25) not null,
	birthdate date not null,
	gender varchar(6) not null,
	password varchar(16) not null,
	password_question varchar(100) not null,
	password_answer varchar(100) not null,
	locale char(5) not null default 'EN_US',
	cookie_value varchar(200) null,
	verification_code varchar(100) not null,
	verification_code_issued_timestamp timestamp with time zone not null,
	verification_completed_timestamp timestamp with time zone,
	is_enabled boolean not null,
	is_admin boolean not null,
	is_deleted boolean not null,
	in_agreement boolean not null,
	insert_timestamp timestamp with time zone default now(),
	update_timestamp timestamp with time zone,
	delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "user" to si;

create sequence cohort_id_seq start 1;
grant select, update on cohort_id_seq to si;
create table "cohort" (
  id integer primary key default nextval('cohort_id_seq'),
  inviter_user_id integer not null,
  consenter_user_id integer not null,
  is_accepted boolean,
  insert_timestamp timestamp with time zone default now(),
  update_timestamp timestamp with time zone,
  delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "cohort" to si;

create sequence intuition_id_seq start 1;
grant select, update on intuition_id_seq to si;
create table "intuition" (
  id integer primary key default nextval('intuition_id_seq'),
  user_id integer not null,
  intuition varchar(150) not null,
  visibility varchar(25) not null,
  prediction_type varchar(25) not null,
  prediction_choice_id integer not null,
  correct_prediction_choice_id integer,
  display_prediction boolean not null,
  display_cohorts_predictions boolean not null,
  expiration_timestamp timestamp with time zone,
  insert_timestamp timestamp with time zone default now(),
  update_timestamp timestamp with time zone,
  delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "intuition" to si;

create sequence prediction_choice_id_seq start 1;
grant select, update on prediction_choice_id_seq to si;
create table "prediction_choice" (
  id integer primary key default nextval('prediction_choice_id_seq'),
  intuition_id integer not null,
  contributor_user_id integer, /* used only for custom predictions */
  prediction_order integer not null,
  prediction varchar(100) not null,
  insert_timestamp timestamp with time zone default now(),
  update_timestamp timestamp with time zone,
  delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "prediction_choice" to si;

create sequence cohort_intuition_prediction_id_seq start 1;
grant select, update on cohort_intuition_prediction_id_seq to si;
create table "cohort_intuition_prediction" (
  id integer primary key default nextval('cohort_intuition_prediction_id_seq'),
  intuition_id integer not null,
  user_id integer not null,
  prediction_choice_id integer, /* null until user selects it */
  override_display_cohort_prediction boolean not null,
  is_correct boolean not null,
  insert_timestamp timestamp with time zone default now(),
  update_timestamp timestamp with time zone,
  delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "cohort_intuition_prediction" to si;

create sequence intuition_like_id_seq start 1;
grant select, update on intuition_like_id_seq to si;
create table "intuition_like" (
  id integer primary key default nextval('intuition_like_id_seq'),
  user_id integer not null,
  intuition_id integer not null,
  insert_timestamp timestamp with time zone default now(),
  update_timestamp timestamp with time zone,
  delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "intuition_like" to si;

create sequence intuition_comment_id_seq start 1;
grant select, update on intuition_comment_id_seq to si;
create table "intuition_comment" (
  id integer primary key default nextval('intuition_comment_id_seq'),
  user_id integer not null,
  intuition_id integer not null,
  comment_order integer not null,
  comment varchar(1000) not null,
  insert_timestamp timestamp with time zone default now(),
  update_timestamp timestamp with time zone,
  delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "intuition_comment" to si;

create sequence intuition_comment_like_id_seq start 1;
grant select, update on intuition_comment_like_id_seq to si;
create table "intuition_comment_like" (
  id integer primary key default nextval('intuition_comment_like_id_seq'),
  user_id integer not null,
  intuition_id integer not null,
  intuition_comment_id integer not null,
  insert_timestamp timestamp with time zone default now(),
  update_timestamp timestamp with time zone,
  delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "intuition_comment_like" to si;

create sequence outcome_like_id_seq start 1;
grant select, update on outcome_like_id_seq to si;
create table "outcome_like" (
  id integer primary key default nextval('outcome_like_id_seq'),
  user_id integer not null,
  intuition_id integer not null,
  insert_timestamp timestamp with time zone default now(),
  update_timestamp timestamp with time zone,
  delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "outcome_like" to si;

create sequence outcome_comment_id_seq start 1;
grant select, update on outcome_comment_id_seq to si;
create table "outcome_comment" (
  id integer primary key default nextval('outcome_comment_id_seq'),
  user_id integer not null,
  intuition_id integer not null,
  comment_order integer not null,
  comment varchar(1000) not null,
  insert_timestamp timestamp with time zone default now(),
  update_timestamp timestamp with time zone,
  delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "outcome_comment" to si;

create sequence outcome_comment_like_id_seq start 1;
grant select, update on outcome_comment_like_id_seq to si;
create table "outcome_comment_like" (
  id integer primary key default nextval('outcome_comment_like_id_seq'),
  user_id integer not null,
  intuition_id integer not null,
  outcome_comment_id integer not null,
  insert_timestamp timestamp with time zone default now(),
  update_timestamp timestamp with time zone,
  delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "outcome_comment_like" to si;


create sequence feedback_id_seq start 1;
grant select, update on feedback_id_seq to si;
create table "feedback" (
	id integer primary key default nextval('feedback_id_seq'),
	name varchar(100) not null,
  email varchar(100) not null,
	comment varchar(2000) not null,
	insert_timestamp timestamp with time zone default now(),
	delete_timestamp timestamp with time zone
);
grant select, insert, update, delete on table "feedback" to si;

alter table "system_notification_history"
  add constraint system_notification_id_const foreign key (system_notification_id)
  references "system_notification" (id) match simple
  on update no action on delete no action;

alter table "cohort"
  add constraint inviter_user_id_const foreign key (inviter_user_id)
  references "user" (id) match simple
  on update no action on delete no action;

alter table "cohort"
  add constraint consenter_user_id_const foreign key (consenter_user_id)
  references "user" (id) match simple
  on update no action on delete no action;

alter table "intuition"
  add constraint user_id_const foreign key (user_id)
  references "user" (id) match simple
  on update no action on delete no action;

alter table "intuition"
  add constraint prediction_choice_id_const foreign key (prediction_choice_id)
  references "prediction_choice" (id) match simple
  on update no action on delete no action;

alter table "intuition"
  add constraint correct_prediction_choice_id_const foreign key (correct_prediction_choice_id)
  references "prediction_choice" (id) match simple
  on update no action on delete no action;

alter table "prediction_choice"
  add constraint intuition_id_const foreign key (intuition_id)
  references "intuition" (id) match simple
  on update no action on delete no action;

alter table "prediction_choice"
  add constraint contributor_user_id_const foreign key (contributor_user_id)
  references "user" (id) match simple
  on update no action on delete no action;

alter table "cohort_intuition_prediction"
  add constraint intuition_id_const foreign key (intuition_id)
  references "intuition" (id) match simple
  on update no action on delete no action;

alter table "cohort_intuition_prediction"
  add constraint user_id_const foreign key (user_id)
  references "user" (id) match simple
  on update no action on delete no action;

alter table "cohort_intuition_prediction"
  add constraint prediction_choice_id_const foreign key (prediction_choice_id)
  references "prediction_choice" (id) match simple
  on update no action on delete no action;

alter table "intuition_like"
  add constraint intuition_id_const foreign key (intuition_id)
  references "intuition" (id) match simple
  on update no action on delete no action;

alter table "intuition_like"
  add constraint user_id_const foreign key (user_id)
  references "user" (id) match simple
  on update no action on delete no action;

alter table "intuition_comment"
  add constraint intuition_id_const foreign key (intuition_id)
  references "intuition" (id) match simple
  on update no action on delete no action;

alter table "intuition_comment"
  add constraint user_id_const foreign key (user_id)
  references "user" (id) match simple
  on update no action on delete no action;

alter table "intuition_comment_like"
  add constraint intuition_id_const foreign key (intuition_id)
  references "intuition" (id) match simple
  on update no action on delete no action;

alter table "intuition_comment_like"
  add constraint user_id_const foreign key (user_id)
  references "user" (id) match simple
  on update no action on delete no action;

alter table "intuition_comment_like"
  add constraint intuition_comment_id_const foreign key (intuition_comment_id)
  references "intuition_comment" (id) match simple
  on update no action on delete no action;

alter table "outcome_like"
  add constraint intuition_id_const foreign key (intuition_id)
  references "intuition" (id) match simple
  on update no action on delete no action;

alter table "outcome_like"
  add constraint user_id_const foreign key (user_id)
  references "user" (id) match simple
  on update no action on delete no action;

alter table "outcome_comment"
  add constraint intuition_id_const foreign key (intuition_id)
  references "intuition" (id) match simple
  on update no action on delete no action;

alter table "outcome_comment"
  add constraint user_id_const foreign key (user_id)
  references "user" (id) match simple
  on update no action on delete no action;

alter table "outcome_comment_like"
  add constraint intuition_id_const foreign key (intuition_id)
  references "intuition" (id) match simple
  on update no action on delete no action;

alter table "outcome_comment_like"
  add constraint user_id_const foreign key (user_id)
  references "user" (id) match simple
  on update no action on delete no action;

alter table "outcome_comment_like"
  add constraint outcome_comment_id_const foreign key (outcome_comment_id)
  references "outcome_comment" (id) match simple
  on update no action on delete no action;

create trigger si_update_trig_config
  before update on config
  for each row execute procedure si_update_trig_func();

create trigger si_update_trig_user
  before update on public."user"
  for each row execute procedure si_update_trig_func();

create trigger si_update_trig_cohort
  before update on cohort
  for each row execute procedure si_update_trig_func();

create trigger si_update_trig_intuition
  before update on intuition
  for each row execute procedure si_update_trig_func();

create trigger si_update_trig_prediction_choice
  before update on prediction_choice
  for each row execute procedure si_update_trig_func();

create trigger si_update_trig_cohort_intuition_prediction
  before update on cohort_intuition_prediction
  for each row execute procedure si_update_trig_func();

create trigger si_update_trig_intuition_like
  before update on intuition_like
  for each row execute procedure si_update_trig_func();

create trigger si_update_trig_intuition_comment
  before update on intuition_comment
  for each row execute procedure si_update_trig_func();

create trigger si_update_trig_intuition_comment_like
  before update on intuition_comment_like
  for each row execute procedure si_update_trig_func();

create trigger si_update_trig_outcome_like
  before update on outcome_like
  for each row execute procedure si_update_trig_func();

create trigger si_update_trig_outcome_comment
  before update on outcome_comment
  for each row execute procedure si_update_trig_func();

create trigger si_update_trig_outcome_comment_like
  before update on outcome_comment_like
  for each row execute procedure si_update_trig_func();

/*
 *  Supporting Data
 */
	
-- Configurations

insert into config 
	(category, key, value, description)
	values
	('CONTROLLER', 'cookieExpirySeconds', '31536000', 'The number of seconds in a year until a cookie expires and is passed to the cookie object.');
insert into config 
	(category, key, value, description)
	values
	('ENVIRONMENT', 'environment', 'dev', 'The environment of which the application is executing. Values should be dev or prod.');
insert into config 
	(category, key, value, description)
	values
	('ENVIRONMENT', 'siteDomainHttp', 'http://localhost:8080', 'The full abolsolute domain prefix of the website.');
insert into config 
	(category, key, value, description)
	values
	('ENVIRONMENT', 'siteDomainHttps', 'https://localhost:8443', 'The full HTTPS abolsolute domain prefix of the website.');
insert into config
	(category, key, value, description)
	values
	('ENVIRONMENT', 'cacheMemoryMaximum', '256000000', 'The maximum amount of bytes allocated to caching memory.');
insert into config
	(category, key, value, description)
	values
	('ENVIRONMENT', 'providerSecureRequestHeaderName', 'x-forwarded-proto', 'The request header key name for the flag whether/not a page was on SSL before reaching the application.');
insert into config 
	(category, key, value, description)
	values
	('LOG', 'level', 'FINE', 'The current level of the logger application wide.');
insert into config 
	(category, key, value, description)
	values
	('SERVICE_SYSTEM', 'scheduledJobDelay', '5', 'The scheduler service job delay between full completion of each execution.');
insert into config 
	(category, key, value, description)
	values
	('SERVICE_ACCOUNT', 'verificationPeriodAllowanceDays', '7', 'The number of days a user has to verify his/her account by clicking on the link in the email.');
insert into config 
	(category, key, value, description)
	values
	('UTILITY', 'emailConnectionString', 'mail.smtp.host=smtpout.secureserver.net,mail.smtp.port=465,mail.smtp.socketFactory.port=465,mail.smtp.socketFactory.class=javax.net.ssl.SSLSocketFactory,mail.smtp.auth=true,mail.debug=true,sender.email=support@valloc.com,sender.username=support@valloc.com,sender.password=supporty42#', 'A key/value pair tokenized string of all SMTP configuration for email sending.');



