Content-Type: multipart/mixed; boundary="===============3156857464899325974=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC 02/20] ext4: Introduce percpu seq counter for freeing blocks(PA) to avoid ENOSPC err
Date: Sat, 02 May 2020 02:07:23 +0800
Message-ID: <202005020212.ystene6Q%lkp@intel.com>
In-Reply-To: <65959db57fa53e5d3d63099b0d5c039ab1154253.1588313626.git.riteshh@linux.ibm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3156857464899325974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ritesh,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on ext4/dev]
[also build test WARNING on tip/perf/core ext3/for_next v5.7-rc3 next-20200=
501]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Ritesh-Harjani/ext4-Fix-EN=
OSPC-error-improve-mballoc-dbg-other-cleanups/20200501-155110
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/ext4/mballoc.c:378:1: sparse: sparse: symbol '__pcpu_scope_discard_pa=
_seq' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3156857464899325974==--

