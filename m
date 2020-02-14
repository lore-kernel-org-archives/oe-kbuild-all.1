Content-Type: multipart/mixed; boundary="===============3328532633711683772=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [joro:sev-es-client-v5.6-rc1 63/63] arch/x86/kernel/sev-es.c:39:1: sparse: sparse: symbol '__pcpu_scope_sev_es_in_nmi' was not declared. Should it be static?
Date: Fri, 14 Feb 2020 08:03:44 +0800
Message-ID: <202002140844.zh7IfsiN%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3328532633711683772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git sev-=
es-client-v5.6-rc1
head:   c4e912b6ad8a3783c5913ea783cb63a8dbb7cba3
commit: c4e912b6ad8a3783c5913ea783cb63a8dbb7cba3 [63/63] x86/sev-es: Add NM=
I state tracking
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-166-g7e4a5b6f-dirty
        git checkout c4e912b6ad8a3783c5913ea783cb63a8dbb7cba3
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/x86/kernel/sev-es.c:39:1: sparse: sparse: symbol '__pcpu_scope_sev_=
es_in_nmi' was not declared. Should it be static?
   arch/x86/kernel/sev-es.c:272:20: sparse: sparse: incorrect type in assig=
nment (different address spaces)
   arch/x86/kernel/sev-es.c:272:20: sparse:    expected unsigned short [use=
rtype] *jump_table
   arch/x86/kernel/sev-es.c:272:20: sparse:    got void [noderef] <asn:2> *
   arch/x86/kernel/sev-es.c:279:17: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces)
   arch/x86/kernel/sev-es.c:279:17: sparse:    expected void volatile [node=
ref] <asn:2> *addr
   arch/x86/kernel/sev-es.c:279:17: sparse:    got unsigned short [usertype=
] *jump_table
   arch/x86/kernel/sev-es.c:360:6: sparse: sparse: symbol 'sev_es_play_dead=
' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3328532633711683772==--

