Content-Type: multipart/mixed; boundary="===============0047225817807703345=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 2/8] sfc: make capability checking a nic_type function
Date: Tue, 12 May 2020 09:01:32 +0800
Message-ID: <202005120824.MqtuMTak%lkp@intel.com>
In-Reply-To: <ad6213aa-b163-8708-47a4-553cb5aa0a8f@solarflare.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0047225817807703345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Edward,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on linus/master v5.7-rc5 next-20200511]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Edward-Cree/sfc-remove-nic=
_data-usage-in-common-code/20200512-011744
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
a6f0b26d6a5dcf27980e65f965779a929039f11d
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/sfc/siena.c:951:14: sparse: sparse: symbol 'siena_c=
heck_caps' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0047225817807703345==--

