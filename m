Content-Type: multipart/mixed; boundary="===============1888106678576535242=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: undefined reference to `led_classdev_unregister'
Date: Thu, 07 Jan 2021 09:14:04 -0800
Message-ID: <7b677508-94b8-aa73-6844-2ab3dea91058@infradead.org>
In-Reply-To: <202101061932.tXwNws1g-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1888106678576535242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/6/21 3:22 AM, kernel test robot wrote:
> Hi Kurt,
> =

> FYI, the error/warning still remains.
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
> commit: 7d9ee2e8ff1541c60dcb5cfdf41def9659204c3e net: dsa: hellcreek: Add=
 PTP status LEDs
> date:   9 weeks ago
> config: microblaze-randconfig-r016-20210106 (attached as .config)
> compiler: microblaze-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D7d9ee2e8ff1541c60dcb5cfdf41def9659204c3e
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 7d9ee2e8ff1541c60dcb5cfdf41def9659204c3e
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dmicroblaze =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Now fixed in the netdev tree:

https://git.kernel.org/netdev/net/c/7f847db30408

> All errors (new ones prefixed by >>):
> =

>    microblaze-linux-ld: drivers/net/dsa/hirschmann/hellcreek_ptp.o: in fu=
nction `hellcreek_ptp_setup':
>>> (.text+0xf80): undefined reference to `led_classdev_register_ext'
>>> microblaze-linux-ld: (.text+0xf94): undefined reference to `led_classde=
v_register_ext'
>    microblaze-linux-ld: drivers/net/dsa/hirschmann/hellcreek_ptp.o: in fu=
nction `hellcreek_ptp_free':
>>> (.text+0x1018): undefined reference to `led_classdev_unregister'
>>> microblaze-linux-ld: (.text+0x1024): undefined reference to `led_classd=
ev_unregister'


-- =

~Randy

--===============1888106678576535242==--

