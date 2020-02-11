Content-Type: multipart/mixed; boundary="===============2976907057133795825=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [sashal-linux-stable:queue-5.4 261/307] include/linux/regulator/consumer.h:600:1: error: expected identifier or '(' before '{' token
Date: Tue, 11 Feb 2020 11:39:54 +0800
Message-ID: <202002111151.fyNfdw5u%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2976907057133795825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git queue-5.4
head:   cb67f104d36f9904c09380c9f2915befb2b0c558
commit: 38731b3de58d3176b091fbc62d1f7c8cfe4b6bca [261/307] regulator: core:=
 Add regulator_is_equal() helper
config: h8300-h8300h-sim_defconfig (attached as .config)
compiler: h8300-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 38731b3de58d3176b091fbc62d1f7c8cfe4b6bca
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dh8300 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/amba/bus.h:19:0,
                    from drivers/of/platform.c:14:
>> include/linux/regulator/consumer.h:600:1: error: expected identifier or =
'(' before '{' token
    {
    ^
   include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' =
declared 'static' but never defined [-Wunused-function]
    regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
    ^~~~~~~~~~~~~~~~~~

vim +600 include/linux/regulator/consumer.h

   597	=

   598	static inline bool
   599	regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
 > 600	{
   601		return false;
   602	}
   603	#endif
   604	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2976907057133795825==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2976907057133795825==--

