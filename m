Content-Type: multipart/mixed; boundary="===============7527710960811897830=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC v1 2/3] drivers: nvmem: Add driver for QTI qfprom-efuse support
Date: Sat, 16 May 2020 22:22:00 +0800
Message-ID: <202005162206.yf3hc8dE%lkp@intel.com>
In-Reply-To: <1589307480-27508-3-git-send-email-rbokka@codeaurora.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7527710960811897830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ravi,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v5.7-rc5 next-20200515]
[cannot apply to linux/master]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Ravi-Kumar-Bokka/Add-QTI-Q=
FPROM-Efuse-driver-support/20200514-154913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/nvmem/qfprom-efuse.c:209:6: sparse: sparse: symbol 'addr_in_qfpr=
om_range' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7527710960811897830==--

