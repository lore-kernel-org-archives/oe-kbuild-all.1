Content-Type: multipart/mixed; boundary="===============1995534692761982292=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/3] i2c: convert SMBus alert setup function to return an ERRPTR
Date: Thu, 13 Feb 2020 18:10:36 +0800
Message-ID: <202002131843.NNfqQqky%lkp@intel.com>
In-Reply-To: <20200210172929.6001-2-wsa+renesas@sang-engineering.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1995534692761982292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

I love your patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on v5.6-rc1 next-20200212]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Wolfram-Sang/i2c-updates-t=
o-SMBus-alert-setup/20200213-051237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/i2c/i2c-core-smbus.c:714:1-3: WARNING: PTR_ERR_OR_ZERO can be us=
ed

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1995534692761982292==--

