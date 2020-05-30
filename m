Content-Type: multipart/mixed; boundary="===============8812491145654392788=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [android-common:android-mainline-tracking 341/538] drivers/pwm/core.c:513:3: note: in expansion of macro 'dev_warn'
Date: Sat, 30 May 2020 10:47:36 +0800
Message-ID: <202005301031.14rc8t4F%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8812491145654392788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android-mainline-tra=
cking
head:   c1584c842224d77fc736a5a6c556ab37d75961ab
commit: 43e98045665a9a008fad4c787bf88d8d9cb287d4 [341/538] FROMLIST: pwm: C=
onvert period and duty cycle to u64
config: i386-randconfig-m021-20200529 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c: In function 'pwm_apply_state_debug':
drivers/pwm/core.c:514:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 3 has type 'u64' {aka 'const long long unsigned i=
nt'} [-Wformat=3D]
514 |     ".apply didn't pick the best available period (requested: %u, app=
lied: %u, possible: %u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
>> drivers/pwm/core.c:513:3: note: in expansion of macro 'dev_warn'
513 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:514:64: note: format string is defined here
514 |     ".apply didn't pick the best available period (requested: %u, app=
lied: %u, possible: %u)n",
|                                                               ~^
|                                                                |
|                                                                unsigned i=
nt
|                                                               %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:514:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 4 has type 'u64' {aka 'long long unsigned int'} [=
-Wformat=3D]
514 |     ".apply didn't pick the best available period (requested: %u, app=
lied: %u, possible: %u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
>> drivers/pwm/core.c:513:3: note: in expansion of macro 'dev_warn'
513 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:514:77: note: format string is defined here
514 |     ".apply didn't pick the best available period (requested: %u, app=
lied: %u, possible: %u)n",
|                                                                          =
  ~^
|                                                                          =
   |
|                                                                          =
   unsigned int
|                                                                          =
  %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:514:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 5 has type 'u64' {aka 'long long unsigned int'} [=
-Wformat=3D]
514 |     ".apply didn't pick the best available period (requested: %u, app=
lied: %u, possible: %u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
>> drivers/pwm/core.c:513:3: note: in expansion of macro 'dev_warn'
513 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:514:91: note: format string is defined here
514 |     ".apply didn't pick the best available period (requested: %u, app=
lied: %u, possible: %u)n",
|                                                                          =
                ~^
|                                                                          =
                 |
|                                                                          =
                 unsigned int
|                                                                          =
                %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:519:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 3 has type 'u64' {aka 'const long long unsigned i=
nt'} [-Wformat=3D]
519 |     ".apply is supposed to round down period (requested: %u, applied:=
 %u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
drivers/pwm/core.c:518:3: note: in expansion of macro 'dev_warn'
518 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:519:59: note: format string is defined here
519 |     ".apply is supposed to round down period (requested: %u, applied:=
 %u)n",
|                                                          ~^
|                                                           |
|                                                           unsigned int
|                                                          %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:519:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 4 has type 'u64' {aka 'long long unsigned int'} [=
-Wformat=3D]
519 |     ".apply is supposed to round down period (requested: %u, applied:=
 %u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
drivers/pwm/core.c:518:3: note: in expansion of macro 'dev_warn'
518 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:519:72: note: format string is defined here
519 |     ".apply is supposed to round down period (requested: %u, applied:=
 %u)n",
|                                                                       ~^
|                                                                        |
|                                                                        un=
signed int
|                                                                       %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:528:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 3 has type 'u64' {aka 'const long long unsigned i=
nt'} [-Wformat=3D]
528 |     ".apply didn't pick the best available duty cycle (requested: %u/=
%u, applied: %u/%u, possible: %u/%u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
drivers/pwm/core.c:527:3: note: in expansion of macro 'dev_warn'
527 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:528:68: note: format string is defined here
528 |     ".apply didn't pick the best available duty cycle (requested: %u/=
%u, applied: %u/%u, possible: %u/%u)n",
|                                                                   ~^
|                                                                    |
|                                                                    unsign=
ed int
|                                                                   %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:528:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 4 has type 'u64' {aka 'const long long unsigned i=
nt'} [-Wformat=3D]
528 |     ".apply didn't pick the best available duty cycle (requested: %u/=
%u, applied: %u/%u, possible: %u/%u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
drivers/pwm/core.c:527:3: note: in expansion of macro 'dev_warn'
527 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:528:71: note: format string is defined here
528 |     ".apply didn't pick the best available duty cycle (requested: %u/=
%u, applied: %u/%u, possible: %u/%u)n",
|                                                                      ~^
|                                                                       |
|                                                                       uns=
igned int
|                                                                      %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:528:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 5 has type 'u64' {aka 'long long unsigned int'} [=
-Wformat=3D]
528 |     ".apply didn't pick the best available duty cycle (requested: %u/=
%u, applied: %u/%u, possible: %u/%u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
drivers/pwm/core.c:527:3: note: in expansion of macro 'dev_warn'
527 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:528:84: note: format string is defined here
528 |     ".apply didn't pick the best available duty cycle (requested: %u/=
%u, applied: %u/%u, possible: %u/%u)n",
|                                                                          =
         ~^
|                                                                          =
          |
|                                                                          =
          unsigned int
|                                                                          =
         %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
--
|                                                                          =
                          %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:528:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 8 has type 'u64' {aka 'long long unsigned int'} [=
-Wformat=3D]
528 |     ".apply didn't pick the best available duty cycle (requested: %u/=
%u, applied: %u/%u, possible: %u/%u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
drivers/pwm/core.c:527:3: note: in expansion of macro 'dev_warn'
527 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:528:104: note: format string is defined here
528 |     ".apply didn't pick the best available duty cycle (requested: %u/=
%u, applied: %u/%u, possible: %u/%u)n",
|                                                                          =
                             ~^
|                                                                          =
                              |
|                                                                          =
                              unsigned int
|                                                                          =
                             %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:535:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 3 has type 'u64' {aka 'const long long unsigned i=
nt'} [-Wformat=3D]
535 |     ".apply is supposed to round down duty_cycle (requested: %u/%u, a=
pplied: %u/%u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
drivers/pwm/core.c:534:3: note: in expansion of macro 'dev_warn'
534 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:535:63: note: format string is defined here
535 |     ".apply is supposed to round down duty_cycle (requested: %u/%u, a=
pplied: %u/%u)n",
|                                                              ~^
|                                                               |
|                                                               unsigned int
|                                                              %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:535:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 4 has type 'u64' {aka 'const long long unsigned i=
nt'} [-Wformat=3D]
535 |     ".apply is supposed to round down duty_cycle (requested: %u/%u, a=
pplied: %u/%u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
drivers/pwm/core.c:534:3: note: in expansion of macro 'dev_warn'
534 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:535:66: note: format string is defined here
535 |     ".apply is supposed to round down duty_cycle (requested: %u/%u, a=
pplied: %u/%u)n",
|                                                                 ~^
|                                                                  |
|                                                                  unsigned=
 int
|                                                                 %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:535:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 5 has type 'u64' {aka 'long long unsigned int'} [=
-Wformat=3D]
535 |     ".apply is supposed to round down duty_cycle (requested: %u/%u, a=
pplied: %u/%u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
drivers/pwm/core.c:534:3: note: in expansion of macro 'dev_warn'
534 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:535:79: note: format string is defined here
535 |     ".apply is supposed to round down duty_cycle (requested: %u/%u, a=
pplied: %u/%u)n",
|                                                                          =
    ~^
|                                                                          =
     |
|                                                                          =
     unsigned int
|                                                                          =
    %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:535:5: warning: format '%u' expects argument of type 'un=
signed int', but argument 6 has type 'u64' {aka 'long long unsigned int'} [=
-Wformat=3D]
535 |     ".apply is supposed to round down duty_cycle (requested: %u/%u, a=
pplied: %u/%u)n",
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
drivers/pwm/core.c:534:3: note: in expansion of macro 'dev_warn'
534 |   dev_warn(chip->dev,
|   ^~~~~~~~
drivers/pwm/core.c:535:82: note: format string is defined here
535 |     ".apply is supposed to round down duty_cycle (requested: %u/%u, a=
pplied: %u/%u)n",
|                                                                          =
       ~^
|                                                                          =
        |
|                                                                          =
        unsigned int
|                                                                          =
       %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:562:4: warning: format '%u' expects argument of type 'un=
signed int', but argument 5 has type 'u64' {aka 'long long unsigned int'} [=
-Wformat=3D]
562 |    ".apply is not idempotent (ena=3D%d pol=3D%d %u/%u) -> (ena=3D%d p=
ol=3D%d %u/%u)n",
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
>> drivers/pwm/core.c:561:3: note: in expansion of macro 'dev_err'
561 |   dev_err(chip->dev,
|   ^~~~~~~
drivers/pwm/core.c:562:46: note: format string is defined here
562 |    ".apply is not idempotent (ena=3D%d pol=3D%d %u/%u) -> (ena=3D%d p=
ol=3D%d %u/%u)n",
|                                             ~^
|                                              |
|                                              unsigned int
|                                             %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:562:4: warning: format '%u' expects argument of type 'un=
signed int', but argument 6 has type 'u64' {aka 'long long unsigned int'} [=
-Wformat=3D]
562 |    ".apply is not idempotent (ena=3D%d pol=3D%d %u/%u) -> (ena=3D%d p=
ol=3D%d %u/%u)n",
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
>> drivers/pwm/core.c:561:3: note: in expansion of macro 'dev_err'
561 |   dev_err(chip->dev,
|   ^~~~~~~
drivers/pwm/core.c:562:49: note: format string is defined here
562 |    ".apply is not idempotent (ena=3D%d pol=3D%d %u/%u) -> (ena=3D%d p=
ol=3D%d %u/%u)n",
|                                                ~^
|                                                 |
|                                                 unsigned int
|                                                %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:562:4: warning: format '%u' expects argument of type 'un=
signed int', but argument 9 has type 'u64' {aka 'long long unsigned int'} [=
-Wformat=3D]
562 |    ".apply is not idempotent (ena=3D%d pol=3D%d %u/%u) -> (ena=3D%d p=
ol=3D%d %u/%u)n",
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
>> drivers/pwm/core.c:561:3: note: in expansion of macro 'dev_err'
561 |   dev_err(chip->dev,
|   ^~~~~~~
drivers/pwm/core.c:562:71: note: format string is defined here
562 |    ".apply is not idempotent (ena=3D%d pol=3D%d %u/%u) -> (ena=3D%d p=
ol=3D%d %u/%u)n",
|                                                                      ~^
|                                                                       |
|                                                                       uns=
igned int
|                                                                      %llu
In file included from include/linux/device.h:15,
from include/linux/acpi.h:15,
from drivers/pwm/core.c:9:
drivers/pwm/core.c:562:4: warning: format '%u' expects argument of type 'un=
signed int', but argument 10 has type 'u64' {aka 'long long unsigned int'} =
[-Wformat=3D]
562 |    ".apply is not idempotent (ena=3D%d pol=3D%d %u/%u) -> (ena=3D%d p=
ol=3D%d %u/%u)n",
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
19 | #define dev_fmt(fmt) fmt
|                      ^~~
>> drivers/pwm/core.c:561:3: note: in expansion of macro 'dev_err'
561 |   dev_err(chip->dev,
|   ^~~~~~~
drivers/pwm/core.c:562:74: note: format string is defined here
562 |    ".apply is not idempotent (ena=3D%d pol=3D%d %u/%u) -> (ena=3D%d p=
ol=3D%d %u/%u)n",
|                                                                         ~^
|                                                                          |
|                                                                          =
unsigned int
|                                                                         %=
llu

vim +/dev_warn +513 drivers/pwm/core.c

0c2498f1660878 Sascha Hauer     2011-01-28  467  =

374c1104eb72b9 Jason Yan        2020-04-02  468  static void pwm_apply_stat=
e_debug(struct pwm_device *pwm,
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  469  				  const struct pw=
m_state *state)
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  470  {
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  471  	struct pwm_state *la=
st =3D &pwm->last;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  472  	struct pwm_chip *chi=
p =3D pwm->chip;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  473  	struct pwm_state s1,=
 s2;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  474  	int err;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  475  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  476  	if (!IS_ENABLED(CONF=
IG_PWM_DEBUG))
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  477  		return;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  478  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  479  	/* No reasonable dia=
gnosis possible without .get_state() */
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  480  	if (!chip->ops->get_=
state)
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  481  		return;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  482  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  483  	/*
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  484  	 * *state was just a=
pplied. Read out the hardware state and do some
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  485  	 * checks.
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  486  	 */
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  487  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  488  	chip->ops->get_state=
(chip, pwm, &s1);
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  489  	trace_pwm_get(pwm, &=
s1);
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  490  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  491  	/*
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  492  	 * The lowlevel driv=
er either ignored .polarity (which is a bug) or as
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  493  	 * best effort inver=
ted .polarity and fixed .duty_cycle respectively.
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  494  	 * Undo this inversi=
on and fixup for further tests.
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  495  	 */
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  496  	if (s1.enabled && s1=
.polarity !=3D state->polarity) {
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  497  		s2.polarity =3D sta=
te->polarity;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  498  		s2.duty_cycle =3D s=
1.period - s1.duty_cycle;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  499  		s2.period =3D s1.pe=
riod;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  500  		s2.enabled =3D s1.e=
nabled;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  501  	} else {
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  502  		s2 =3D s1;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  503  	}
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  504  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  505  	if (s2.polarity !=3D=
 state->polarity &&
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  506  	    state->duty_cycl=
e < state->period)
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  507  		dev_warn(chip->dev,=
 ".apply ignored .polarity\n");
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  508  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  509  	if (state->enabled &&
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  510  	    last->polarity =
=3D=3D state->polarity &&
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  511  	    last->period > s=
2.period &&
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  512  	    last->period <=
=3D state->period)
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10 @513  		dev_warn(chip->dev,
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  514  			 ".apply didn't pi=
ck the best available period (requested: %u, applied: %u, possible: %u)\n",
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  515  			 state->period, s2=
.period, last->period);
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  516  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  517  	if (state->enabled &=
& state->period < s2.period)
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  518  		dev_warn(chip->dev,
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  519  			 ".apply is suppos=
ed to round down period (requested: %u, applied: %u)\n",
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  520  			 state->period, s2=
.period);
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  521  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  522  	if (state->enabled &&
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  523  	    last->polarity =
=3D=3D state->polarity &&
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  524  	    last->period =3D=
=3D s2.period &&
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  525  	    last->duty_cycle=
 > s2.duty_cycle &&
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  526  	    last->duty_cycle=
 <=3D state->duty_cycle)
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  527  		dev_warn(chip->dev,
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  528  			 ".apply didn't pi=
ck the best available duty cycle (requested: %u/%u, applied: %u/%u, possibl=
e: %u/%u)\n",
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  529  			 state->duty_cycle=
, state->period,
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  530  			 s2.duty_cycle, s2=
.period,
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  531  			 last->duty_cycle,=
 last->period);
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  532  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  533  	if (state->enabled &=
& state->duty_cycle < s2.duty_cycle)
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  534  		dev_warn(chip->dev,
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  535  			 ".apply is suppos=
ed to round down duty_cycle (requested: %u/%u, applied: %u/%u)\n",
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  536  			 state->duty_cycle=
, state->period,
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  537  			 s2.duty_cycle, s2=
.period);
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  538  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  539  	if (!state->enabled =
&& s2.enabled && s2.duty_cycle > 0)
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  540  		dev_warn(chip->dev,
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  541  			 "requested disabl=
ed, but yielded enabled with duty > 0");
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  542  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  543  	/* reapply the state=
 that the driver reported being configured. */
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  544  	err =3D chip->ops->a=
pply(chip, pwm, &s1);
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  545  	if (err) {
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  546  		*last =3D s1;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  547  		dev_err(chip->dev, =
"failed to reapply current setting\n");
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  548  		return;
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  549  	}
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  550  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  551  	trace_pwm_apply(pwm,=
 &s1);
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  552  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  553  	chip->ops->get_state=
(chip, pwm, last);
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  554  	trace_pwm_get(pwm, l=
ast);
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  555  =

3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  556  	/* reapplication of =
the current state should give an exact match */
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  557  	if (s1.enabled !=3D =
last->enabled ||
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  558  	    s1.polarity !=3D=
 last->polarity ||
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  559  	    (s1.enabled && s=
1.period !=3D last->period) ||
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  560  	    (s1.enabled && s=
1.duty_cycle !=3D last->duty_cycle)) {
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10 @561  		dev_err(chip->dev,
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  562  			".apply is not ide=
mpotent (ena=3D%d pol=3D%d %u/%u) -> (ena=3D%d pol=3D%d %u/%u)\n",
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  563  			s1.enabled, s1.pol=
arity, s1.duty_cycle, s1.period,
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  564  			last->enabled, las=
t->polarity, last->duty_cycle,
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  565  			last->period);
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  566  	}
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  567  }
3ad1f3a33286dc Uwe Kleine-K=C3=B6nig 2020-02-10  568  =


:::::: The code at line 513 was first introduced by commit
:::::: 3ad1f3a33286dc67d595f6fab3a3a9e583bc738a pwm: Implement some checks =
for lowlevel drivers

:::::: TO: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
:::::: CC: Thierry Reding <thierry.reding@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8812491145654392788==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8812491145654392788==--

