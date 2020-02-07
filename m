Content-Type: multipart/mixed; boundary="===============7054018786413699406=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/3] platform/chrome: Add Type C connector class driver
Date: Fri, 07 Feb 2020 14:51:56 +0800
Message-ID: <202002071406.LXbYPq2Y%lkp@intel.com>
In-Reply-To: <20200205205954.84503-2-pmalani@chromium.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7054018786413699406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Prashant,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on chrome-platform-linux/for-next]
[also build test WARNING on linux/master linus/master v5.5 next-20200207]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Prashant-Malani/platform-c=
hrome-Add-Type-C-connector-class-driver/20200206-225838
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/lin=
ux.git for-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-159-g100509c0-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/platform/chrome/cros_ec_typec.c:28:5: sparse: sparse: symbol 'cr=
os_typec_parse_port_props' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7054018786413699406==--

