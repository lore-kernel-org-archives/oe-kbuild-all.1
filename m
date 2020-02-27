Content-Type: multipart/mixed; boundary="===============0454718903878208734=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] clk: qcom: Add ipq6018 apss clock controller
Date: Fri, 28 Feb 2020 01:40:03 +0800
Message-ID: <202002280157.XsbiYL94%lkp@intel.com>
In-Reply-To: <1582797318-26288-3-git-send-email-sivaprak@codeaurora.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0454718903878208734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sivaprakash,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on v5.6-rc3 next-20200227]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Sivaprakash-Murugesan/Add-=
APSS-clock-controller-support-for-IPQ6018/20200227-185847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/clk/qcom/apss-ipq6018.c:39:10: sparse: sparse: symbol 'apss_pll_=
offsets' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0454718903878208734==--

