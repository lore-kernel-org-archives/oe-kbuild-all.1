Content-Type: multipart/mixed; boundary="===============8735644315463305542=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/2] KVM: CPUID: Enable supervisor XSAVE states in CPUID enumeration and XSS
Date: Thu, 13 Feb 2020 18:09:23 +0800
Message-ID: <202002131802.aTLUxkLL%lkp@intel.com>
In-Reply-To: <20200211065706.3462-1-weijiang.yang@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8735644315463305542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yang,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on vhost/linux-next]
[cannot apply to kvm/linux-next v5.6-rc1 next-20200213]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Yang-Weijiang/KVM-CPUID-En=
able-supervisor-XSAVE-states-in-CPUID-enumeration-and-XSS/20200213-113112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux=
-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-166-g7e4a5b6f-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/x86/kvm/cpuid.c:66:5: sparse: sparse: symbol 'kvm_supported_xss' wa=
s not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8735644315463305542==--

