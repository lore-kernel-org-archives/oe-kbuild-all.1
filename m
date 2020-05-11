Content-Type: multipart/mixed; boundary="===============0662616381493318507=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 9/9] rtw88: 8723d: Add 8723DE to Kconfig and Makefile
Date: Tue, 12 May 2020 03:07:29 +0800
Message-ID: <202005120230.86A2Fjow%lkp@intel.com>
In-Reply-To: <20200507042151.15634-10-yhchuang@realtek.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0662616381493318507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on wireless-drivers-next/master]
[cannot apply to wireless-drivers/master v5.7-rc5 next-20200511]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/yhchuang-realtek-com/rtw88=
-8723d-Add-RF-calibration-and-coex/20200507-134547
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-driv=
ers-next.git master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/realtek/rtw88/rtw8723d.c:1899:6: sparse: sparse: sy=
mbol 'rtw8723d_pwr_track' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0662616381493318507==--

