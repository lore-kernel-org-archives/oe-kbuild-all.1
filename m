Content-Type: multipart/mixed; boundary="===============8526345700220129999=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: arceb-elf-ld: include/linux/leds.h:193: undefined reference to `devm_led_classdev_register_ext'
Date: Fri, 09 Oct 2020 20:49:01 -0700
Message-ID: <19af5277-6705-4900-ad70-cb9b674caf5c@infradead.org>
In-Reply-To: <a400ff82-e36f-346c-fd57-e1a0a75acd4e@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8526345700220129999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/9/20 8:19 PM, Rong Chen wrote:
> =

> =

> On 10/8/20 3:15 PM, Pavel Machek wrote:
>> Hi!
>>
>>> tree:=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/torva=
lds/linux.git master
>>> head:=C2=A0=C2=A0 c85fb28b6f999db9928b841f63f1beeb3074eeca
>>> commit: 92a81562e695628086acb92f95090ab09d9b9ec0 leds: lp55xx: Add mult=
icolor framework support to lp55xx
>>> date:=C2=A0=C2=A0 3 months ago
>>> config: arc-randconfig-r035-20201008 (attached as .config)
>>> compiler: arceb-elf-gcc (GCC) 9.3.0
>>> reproduce (this is a W=3D1 build):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wget https://raw.githu=
busercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod +x ~/bin/make.cr=
oss
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # https://git.kernel.o=
rg/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D92a81562e695628=
086acb92f95090ab09d9b9ec0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git remote add linus h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git fetch --no-tags li=
nus master
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout 92a81562e=
695628086acb92f95090ab09d9b9ec0
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attached .c=
onfig to linux build tree
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER_INSTALL_PATH=
=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross ARCH=3Darc
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>> Hi robot. Do you have human around to talk to?
>>
>>> All errors (new ones prefixed by >>):
>>>
>>> =C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.o: in function `filter_=
irq_stacks':
>>> =C2=A0=C2=A0=C2=A0 lib/stackdepot.c:331: undefined reference to `__irqe=
ntry_text_start'
>>> =C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.c:331: undefined refere=
nce to `__irqentry_text_start'
>>> =C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.o: in function `in_irqe=
ntry_text':
>>> =C2=A0=C2=A0=C2=A0 lib/stackdepot.c:323: undefined reference to `__irqe=
ntry_text_end'
>>> =C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.c:323: undefined refere=
nce to `__irqentry_text_end'
>>> =C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.c:324: undefined refere=
nce to `__softirqentry_text_start'
>>> =C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.c:324: undefined refere=
nce to `__softirqentry_text_start'
>>> =C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.c:325: undefined refere=
nce to `__softirqentry_text_end'
>>> =C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.c:325: undefined refere=
nce to
>> What is going on here? Did you just start testing arc? The commit
>> is... really old.
>>
> =

> Hi Pavel,
> =

> Only this error "arceb-elf-ld: include/linux/leds.h:193: undefined refere=
nce to `devm_led_classdev_register_ext'" was found in this commit,
> other errors are for reference only, and the test config is a rand config=
, so it's discovered by chance.

Hi,
Just for the record, I could not reproduce the build error
with the config file that was provided.

-- =

~Randy

--===============8526345700220129999==--

