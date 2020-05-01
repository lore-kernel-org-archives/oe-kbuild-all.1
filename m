Content-Type: multipart/mixed; boundary="===============7320024444814924797=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7 10/18] x86/paravirt: Add hypervisor specific hypercall for SEV live migration.
Date: Fri, 01 May 2020 19:00:36 +0800
Message-ID: <202005011844.3MBRacmG%lkp@intel.com>
In-Reply-To: <d0e5e3227e24272ec5f277e6732c5e0a1276d4e1.1588234824.git.ashish.kalra@amd.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7320024444814924797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ashish,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.7-rc3]
[cannot apply to kvm/linux-next tip/x86/mm tip/x86/core next-20200501]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Ashish-Kalra/Add-AMD-SEV-g=
uest-live-migration-support/20200430-202702
base:    6a8b55ed4056ea5559ebe4f6a4b247f627870d4c
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/x86/kernel/kvm.c:733:6: sparse: sparse: symbol 'kvm_sev_migration_h=
call' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7320024444814924797==--

