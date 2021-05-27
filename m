Content-Type: multipart/mixed; boundary="===============3389951042365939140=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: [kvm:master 128/130] Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' differs from latest version at 'arch/x86/include/uapi/asm/kvm.h': 408> #define KVM_X86_QUIRK_TSC_HOST_ACCESS (1 << 5)
Date: Thu, 27 May 2021 11:08:41 +0800
Message-ID: <20210527030841.GX2687475@shao2-debian>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3389951042365939140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git master
head:   f7d7a93c553f6242b1732b64edc8120c7a061b78
commit: 37a3ce1ca196ed06edcef4fe20bd19a05af7d56c [128/130] KVM: x86: introd=
uce KVM_X86_QUIRK_TSC_HOST_ACCESS
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  408> #defi=
ne KVM_X86_QUIRK_TSC_HOST_ACCESS      (1 << 5)
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version@'arch/x86/include/uapi/asm/kvm.h':  440> =

   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  441> 	__u1=
6 pad;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3389951042365939140==--

