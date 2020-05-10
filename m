Content-Type: multipart/mixed; boundary="===============0315555401400941833=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v6 09/18] pstore/blk: Introduce backend for block devices
Date: Sun, 10 May 2020 19:12:35 +0800
Message-ID: <202005101917.Jz6QvoH2%lkp@intel.com>
In-Reply-To: <20200509234103.46544-10-keescook@chromium.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0315555401400941833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kees,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kees/for-next/pstore]
[also build test WARNING on next-20200508]
[cannot apply to ia64/next linus/master v5.7-rc4]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Kees-Cook/pstore-mtd-suppo=
rt-crash-log-to-block-and-mtd-device/20200510-074942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-=
next/pstore
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/pstore/blk.c:415:6: sparse: sparse: symbol '__unregister_pstore_blk' =
was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0315555401400941833==--

