Content-Type: multipart/mixed; boundary="===============8837893714340237436=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCHv4 5/6] ext4: Move ext4_fiemap to use iomap framework.
Date: Fri, 28 Feb 2020 03:18:48 +0800
Message-ID: <202002280303.ERVhiFtH%lkp@intel.com>
In-Reply-To: <2341a116e39ff0934b1f90aee8f4e10ac0371648.1582800839.git.riteshh@linux.ibm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8837893714340237436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ritesh,

I love your patch! Perhaps something to improve:

[auto build test WARNING on ext4/dev]
[also build test WARNING on linus/master v5.6-rc3 next-20200227]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Ritesh-Harjani/ext4-bmap-f=
iemap-conversion-to-use-iomap/20200227-204414
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/ext4/extents.c:4918:24: sparse: sparse: symbol 'ext4_iomap_xattr_ops'=
 was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8837893714340237436==--

