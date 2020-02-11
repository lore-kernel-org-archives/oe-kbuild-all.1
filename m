Content-Type: multipart/mixed; boundary="===============6138337438128510622=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [alibaba-cloud:ck-4.19.91 10623/10873] arch/x86/kernel/amd_nb.c:75:28: sparse: sparse: symbol 'hygon_nb_misc_ids' was not declared. Should it be static?
Date: Tue, 11 Feb 2020 22:28:53 +0800
Message-ID: <202002112238.ndaAotte%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6138337438128510622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/alibaba/cloud-kernel.git ck-4.19.91
head:   536f70b41d6fc5fc46f50c4caa012c4439160180
commit: 7e43e832788104df86f03ab6c2f4683f878cb904 [10623/10873] HYGON: x86/p=
ci, x86/amd_nb: Add Hygon Dhyana support to PCI and northbridge
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-166-g7e4a5b6f-dirty
        git checkout 7e43e832788104df86f03ab6c2f4683f878cb904
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/x86/kernel/amd_nb.c:75:28: sparse: sparse: symbol 'hygon_nb_misc_id=
s' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6138337438128510622==--

