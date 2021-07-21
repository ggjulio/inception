#### wordpress users

admin username : juligonz
pass: qwerty
mail: no@no.com

second user : Pickle Rick
username: pickle_rick
password: %dZ$zqBce0wj(8#4wgpii(Xt
mail: e@e.com

- [x] image nginx tls v1.3 uniquement
- [x] image php-fpm
- [x] image mysql
	- [x] add a way to execute scripts to setup db
- [x] image Wordpress + php-fpm
- [x] Domain Name -> juligonz.42.fr
- [x] Makefile
- [x] Change volume folder
	- [x] Fix volume...driver....

Bonus:
- [x] image ftp
- [x] image adminer
- [x] image redis
- [x] service de notre choix
- [x] site static de notre choix... (generator)

Note:
 - dommage d'avoir du code duplique (wordpress et adminer -> correction demande exactement 1 dockerfile par service)

- https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04
- https://www.digitalocean.com/community/questions/can-we-host-multiple-websites-in-nginx-at-localhost


- https://thibaut-deveraux.medium.com/a-docker-compose-file-to-install-wordpress-with-a-traefik-reverse-proxy-an-ssl-certificate-and-a-e878c2a03a17
- https://www.combell.com/fr/help/kb/comment-implementer-redis-dans-wordpress/

- https://hub.docker.com/_/redis
- https://codeable.io/wordpress-developers-intro-to-docker-part-two/

- https://www.cloudways.com/blog/install-redis-cache-wordpress/

##### dockerize dotnetcore app
- https://docs.docker.com/samples/dotnetcore/
##### static site generator .net core with Wyam
- https://wyam.io/
- https://www.youtube.com/watch?v=kkaseQEBwnA

##### Wyam or statiq ?
- https://statiq.dev/
- https://statiq.dev/framework/
- https://www.youtube.com/watch?v=43oQTRZqK9g
- https://statiq.dev/web/themes/

##### How to fix named volumes + host mount 
- https://docs.docker.com/engine/reference/commandline/volume_create/#/driver-specific-options
- https://man7.org/linux/man-pages/man8/mount.8.html
- https://github.com/moby/moby/issues/19990
- https://github.com/docker/compose/issues/7002
- https://stackoverflow.com/questions/39496564/docker-volume-custom-mount-point
- https://docs.docker.com/storage/volumes/
