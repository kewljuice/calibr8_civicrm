# Installation
This module is installed as any other Drupal module.

- with Drush
```drush pm-enable -y calibr8_civicrm```

- with Composer

```composer config repositories.calibr8_civicrm vcs https://github.com/kewljuice/calibr8_civicrm```

```composer require calibrate/calibr8_civicrm ```

# Development

```
 // Export CiviCRM permissions as JSON.
 
 // Fetch roles.
 $permissions = \Drupal::service('user.permissions')->getPermissions();
 $permissions_by_provider = [];
 foreach ($permissions as $key => $permission) {
   $permissions_by_provider[$permission['provider']][] = $key;
 }

 // Loop all roles from System.
 $roles = \Drupal\user\Entity\Role::loadMultiple();
 $permissions_by_role = [];
 foreach ($roles as $role) {
   $perms = $role->getPermissions();
   foreach ($perms as $perm) {
     if (in_array($perm, $permissions_by_provider['civicrm'])) {
       $permissions_by_role[$role->id()][] = $perm;
     }
   }
 }
 
 // Export.
 $permissions_by_role = json_encode($permissions_by_role);
 dpm($permissions_by_role);
   
```
