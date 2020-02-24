Content-Type: multipart/mixed; boundary="===============8951980982968744276=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 22/89] clk: bcm: rpi: Discover the firmware clocks
Date: Tue, 25 Feb 2020 00:47:40 +0800
Message-ID: <202002250020.9fsQ277c%lkp@intel.com>
In-Reply-To: <d197ab836d84b89b94ff1927872126767d921e94.1582533919.git-series.maxime@cerno.tech>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8951980982968744276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next anholt/for-next v5.6-rc3 next-202=
00224]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/drm-vc4-Supp=
ort-BCM2711-Display-Pipeline/20200224-172730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/clk/bcm/clk-raspberrypi.c:327:31-37: ERROR: application of sizeo=
f to pointer

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8951980982968744276==--

