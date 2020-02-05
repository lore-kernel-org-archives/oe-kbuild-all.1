Content-Type: multipart/mixed; boundary="===============8254515240524989089=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 6/8] ima: Allocate and initialize tfm for each PCR bank
Date: Thu, 06 Feb 2020 07:41:18 +0800
Message-ID: <202002060720.CVTYGnC7%lkp@intel.com>
In-Reply-To: <20200205103317.29356-7-roberto.sassu@huawei.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8254515240524989089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Roberto,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on integrity/next-integrity]
[also build test WARNING on jss-tpmdd/next v5.5 next-20200205]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Roberto-Sassu/ima-support-=
stronger-algorithms-for-attestation/20200205-233901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integri=
ty.git next-integrity
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> security/integrity/ima/ima_crypto.c:72:12: sparse: sparse: symbol 'ima_i=
nit_ima_crypto' was not declared. Should it be static?
   security/integrity/ima/ima_crypto.c:545:36: sparse: sparse: invalid assi=
gnment: |=3D
   security/integrity/ima/ima_crypto.c:545:36: sparse:    left side has typ=
e unsigned int
   security/integrity/ima/ima_crypto.c:545:36: sparse:    right side has ty=
pe restricted fmode_t
   security/integrity/ima/ima_crypto.c:565:28: sparse: sparse: invalid assi=
gnment: &=3D
   security/integrity/ima/ima_crypto.c:565:28: sparse:    left side has typ=
e unsigned int
   security/integrity/ima/ima_crypto.c:565:28: sparse:    right side has ty=
pe restricted fmode_t
   security/integrity/ima/ima_crypto.c:592:52: sparse: sparse: restricted _=
_le32 degrades to integer

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============8254515240524989089==--

