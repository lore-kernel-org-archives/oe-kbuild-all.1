Content-Type: multipart/mixed; boundary="===============8883615311378546817=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 05/10] net: mscc: ocelot: don't rely on preprocessor for vcap key/action packing
Date: Tue, 25 Feb 2020 12:58:08 +0800
Message-ID: <202002251214.oEJC0ZlT%lkp@intel.com>
In-Reply-To: <20200224130831.25347-6-olteanv@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8883615311378546817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Vladimir,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master linus/master v5.6-rc3 next-20200224]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Vladimir-Oltean/Wire-up-Oc=
elot-tc-flower-to-Felix-DSA/20200224-231012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
c3e042f54107376cfbbd215e11878a2a75e1e228
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/mscc/ocelot_board.c:266:19: sparse: sparse: symbol =
'vsc7514_vcap_is2_keys' was not declared. Should it be static?
>> drivers/net/ethernet/mscc/ocelot_board.c:346:19: sparse: sparse: symbol =
'vsc7514_vcap_is2_actions' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8883615311378546817==--

