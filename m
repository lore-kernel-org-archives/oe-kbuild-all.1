Content-Type: multipart/mixed; boundary="===============8480989103743920584=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: arceb-elf-ld: include/linux/leds.h:193: undefined reference to `devm_led_classdev_register_ext'
Date: Sat, 10 Oct 2020 11:19:24 +0800
Message-ID: <a400ff82-e36f-346c-fd57-e1a0a75acd4e@intel.com>
In-Reply-To: <20201008071507.GA29893@amd>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8480989103743920584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 10/8/20 3:15 PM, Pavel Machek wrote:
> Hi!
>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
>> head:   c85fb28b6f999db9928b841f63f1beeb3074eeca
>> commit: 92a81562e695628086acb92f95090ab09d9b9ec0 leds: lp55xx: Add multi=
color framework support to lp55xx
>> date:   3 months ago
>> config: arc-randconfig-r035-20201008 (attached as .config)
>> compiler: arceb-elf-gcc (GCC) 9.3.0
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3D92a81562e695628086acb92f95090ab09d9b9ec0
>>          git remote add linus https://git.kernel.org/pub/scm/linux/kerne=
l/git/torvalds/linux.git
>>          git fetch --no-tags linus master
>>          git checkout 92a81562e695628086acb92f95090ab09d9b9ec0
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss ARCH=3Darc
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
> Hi robot. Do you have human around to talk to?
>
>> All errors (new ones prefixed by >>):
>>
>>     arceb-elf-ld: lib/stackdepot.o: in function `filter_irq_stacks':
>>     lib/stackdepot.c:331: undefined reference to `__irqentry_text_start'
>>     arceb-elf-ld: lib/stackdepot.c:331: undefined reference to `__irqent=
ry_text_start'
>>     arceb-elf-ld: lib/stackdepot.o: in function `in_irqentry_text':
>>     lib/stackdepot.c:323: undefined reference to `__irqentry_text_end'
>>     arceb-elf-ld: lib/stackdepot.c:323: undefined reference to `__irqent=
ry_text_end'
>>     arceb-elf-ld: lib/stackdepot.c:324: undefined reference to `__softir=
qentry_text_start'
>>     arceb-elf-ld: lib/stackdepot.c:324: undefined reference to `__softir=
qentry_text_start'
>>     arceb-elf-ld: lib/stackdepot.c:325: undefined reference to `__softir=
qentry_text_end'
>>     arceb-elf-ld: lib/stackdepot.c:325: undefined reference to
> What is going on here? Did you just start testing arc? The commit
> is... really old.
>

Hi Pavel,

Only this error "arceb-elf-ld: include/linux/leds.h:193: undefined =

reference to `devm_led_classdev_register_ext'" was found in this commit,
other errors are for reference only, and the test config is a rand =

config, so it's discovered by chance.

Best Regards,
Rong Chen
--===============8480989103743920584==--

