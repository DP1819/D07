start transaction;

use `Acme-Handy-Worker`;

revoke all privileges on `Acme-Handy-Worker`.* from 'acme-user'@'%';

revoke all privileges on `Acme-Handy-Worker`.* from 'acme-manager'@'%';

drop user 'acme-user'@'%';

drop user 'acme-manager'@'%';

drop database `Acme-Handy-Worker`;


commit;
