# ytnobody/ukigumo-ci

This docker image provides [ukigumo-server](https://github.com/ukigumo/Ukigumo-Server) and [ukigumo-agent](https://github.com/ukigumo/Ukigumo-Agent).

[Ukigumo](http://ukigumo.github.io/ukigumo/) is a minimalist CI server that written in [perl](https://www.perl.org/).

## USAGE

### How to run

    docker run -it -p 2829:2829 -p 2828:2828 -v /opt/ukigumo:/opt/ukigumo ytnobody/ukigumo-ci

### Preparing for CI

1. Add ``.ukigumo.yml`` file in your repository. Example.

    before_install:
      - "plenv local 5.14"
      - "cpanm -L ./extlib --installdeps --with-develop -n ."
    script:
      - "prove -Iextlib/lib/perl5 -Ilib t/"

2. Add a WebHook

If you using GitHub, you can use ukigumo agent's github hook.

- Example of WebHook URL : ``http://your-host:2829/api/github_hook``

Otherwise, you can use ukigumo agent's enqueue api.

- Example of Enqueue API's URL : ``http://your-host:2829/api/v0/enqueue``

You can try to enqueue by cURL like as followings.

    curl -X POST \
        -d repository=https://your.git/yourname/your-repo.git \
        -d branch=master \
        http://your-host:2829/api/v0/enqueue

3. Make some changes to your repository

Then, test will be running on your ukigumo-ci container.

## Contained Perl Versions

You can use following perls via ``plenv local`` command in ``before_install``.

- 5.20 (perl-5.20.3)
- 5.18 (perl-5.18.4)
- 5.16 (perl-5.16.3)
- 5.14 (perl-5.14.4)
- 5.12 (perl-5.12.5)
- 5.10 (perl-5.10.1)

## VOLUME

- /opt/ukigumo

## EXPOSED PORT

- TCP/2828 : Ukigumo Server
- TCP/2929 : Ukigumo Agent

## SEE ALSO

- [Moznion's Ukigumo quick start guidance (in japanese)](http://moznion.hatenadiary.com/entry/2014/05/02/181147)
