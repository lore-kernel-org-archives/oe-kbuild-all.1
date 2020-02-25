Content-Type: multipart/mixed; boundary="===============4207001902448666607=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:locking/task_work 2/32] arch/arm64/include/asm/hardirq.h:50:23: error: '__cnt' undeclared; did you mean '___cnt'?
Date: Tue, 25 Feb 2020 09:21:21 +0800
Message-ID: <202002250909.3GVfOT50%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4207001902448666607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/task_work
head:   2899263c702a7af75558cabcc456675e79e8f62c
commit: c2bf6aaf3b9fa7ef6c871b16f2a8a61bc0f0b955 [2/32] hardirq/nmi: Allow =
nested nmi_enter()
config: arm64-alldefconfig (attached as .config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout c2bf6aaf3b9fa7ef6c871b16f2a8a61bc0f0b955
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Darm64 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/hardirq.h:9:0,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from arch/arm64/kernel/irq.c:13:
   arch/arm64/kernel/irq.c: In function 'asm_nmi_enter':
>> arch/arm64/include/asm/hardirq.h:50:23: error: '__cnt' undeclared (first=
 use in this function); did you mean '___cnt'?
     if (!(___cnt & 1) && __cnt) {     \
                          ^
>> include/linux/hardirq.h:73:3: note: in expansion of macro 'arch_nmi_ente=
r'
      arch_nmi_enter();    \
      ^~~~~~~~~~~~~~
>> arch/arm64/kernel/irq.c:85:2: note: in expansion of macro 'nmi_enter'
     nmi_enter();
     ^~~~~~~~~
   arch/arm64/include/asm/hardirq.h:50:23: note: each undeclared identifier=
 is reported only once for each function it appears in
     if (!(___cnt & 1) && __cnt) {     \
                          ^
>> include/linux/hardirq.h:73:3: note: in expansion of macro 'arch_nmi_ente=
r'
      arch_nmi_enter();    \
      ^~~~~~~~~~~~~~
>> arch/arm64/kernel/irq.c:85:2: note: in expansion of macro 'nmi_enter'
     nmi_enter();
     ^~~~~~~~~
--
   In file included from include/linux/hardirq.h:9:0,
                    from arch/arm64/kernel/traps.c:17:
   arch/arm64/kernel/traps.c: In function 'do_serror':
>> arch/arm64/include/asm/hardirq.h:50:23: error: '__cnt' undeclared (first=
 use in this function); did you mean '___cnt'?
     if (!(___cnt & 1) && __cnt) {     \
                          ^
>> include/linux/hardirq.h:73:3: note: in expansion of macro 'arch_nmi_ente=
r'
      arch_nmi_enter();    \
      ^~~~~~~~~~~~~~
>> arch/arm64/kernel/traps.c:909:2: note: in expansion of macro 'nmi_enter'
     nmi_enter();
     ^~~~~~~~~
   arch/arm64/include/asm/hardirq.h:50:23: note: each undeclared identifier=
 is reported only once for each function it appears in
     if (!(___cnt & 1) && __cnt) {     \
                          ^
>> include/linux/hardirq.h:73:3: note: in expansion of macro 'arch_nmi_ente=
r'
      arch_nmi_enter();    \
      ^~~~~~~~~~~~~~
>> arch/arm64/kernel/traps.c:909:2: note: in expansion of macro 'nmi_enter'
     nmi_enter();
     ^~~~~~~~~
--
   In file included from include/linux/hardirq.h:9:0,
                    from include/linux/interrupt.h:11,
                    from drivers/irqchip/irq-gic-v3.c:13:
   drivers/irqchip/irq-gic-v3.c: In function 'gic_handle_nmi':
>> arch/arm64/include/asm/hardirq.h:50:23: error: '__cnt' undeclared (first=
 use in this function); did you mean '___cnt'?
     if (!(___cnt & 1) && __cnt) {     \
                          ^
>> include/linux/hardirq.h:73:3: note: in expansion of macro 'arch_nmi_ente=
r'
      arch_nmi_enter();    \
      ^~~~~~~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:609:3: note: in expansion of macro 'nmi_ent=
er'
      nmi_enter();
      ^~~~~~~~~
   arch/arm64/include/asm/hardirq.h:50:23: note: each undeclared identifier=
 is reported only once for each function it appears in
     if (!(___cnt & 1) && __cnt) {     \
                          ^
>> include/linux/hardirq.h:73:3: note: in expansion of macro 'arch_nmi_ente=
r'
      arch_nmi_enter();    \
      ^~~~~~~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:609:3: note: in expansion of macro 'nmi_ent=
er'
      nmi_enter();
      ^~~~~~~~~
--
   In file included from include/linux/hardirq.h:9:0,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from arch/arm64//kernel/irq.c:13:
   arch/arm64//kernel/irq.c: In function 'asm_nmi_enter':
>> arch/arm64/include/asm/hardirq.h:50:23: error: '__cnt' undeclared (first=
 use in this function); did you mean '___cnt'?
     if (!(___cnt & 1) && __cnt) {     \
                          ^
>> include/linux/hardirq.h:73:3: note: in expansion of macro 'arch_nmi_ente=
r'
      arch_nmi_enter();    \
      ^~~~~~~~~~~~~~
   arch/arm64//kernel/irq.c:85:2: note: in expansion of macro 'nmi_enter'
     nmi_enter();
     ^~~~~~~~~
   arch/arm64/include/asm/hardirq.h:50:23: note: each undeclared identifier=
 is reported only once for each function it appears in
     if (!(___cnt & 1) && __cnt) {     \
                          ^
>> include/linux/hardirq.h:73:3: note: in expansion of macro 'arch_nmi_ente=
r'
      arch_nmi_enter();    \
      ^~~~~~~~~~~~~~
   arch/arm64//kernel/irq.c:85:2: note: in expansion of macro 'nmi_enter'
     nmi_enter();
     ^~~~~~~~~
--
   In file included from include/linux/hardirq.h:9:0,
                    from arch/arm64//kernel/traps.c:17:
   arch/arm64//kernel/traps.c: In function 'do_serror':
>> arch/arm64/include/asm/hardirq.h:50:23: error: '__cnt' undeclared (first=
 use in this function); did you mean '___cnt'?
     if (!(___cnt & 1) && __cnt) {     \
                          ^
>> include/linux/hardirq.h:73:3: note: in expansion of macro 'arch_nmi_ente=
r'
      arch_nmi_enter();    \
      ^~~~~~~~~~~~~~
   arch/arm64//kernel/traps.c:909:2: note: in expansion of macro 'nmi_enter'
     nmi_enter();
     ^~~~~~~~~
   arch/arm64/include/asm/hardirq.h:50:23: note: each undeclared identifier=
 is reported only once for each function it appears in
     if (!(___cnt & 1) && __cnt) {     \
                          ^
>> include/linux/hardirq.h:73:3: note: in expansion of macro 'arch_nmi_ente=
r'
      arch_nmi_enter();    \
      ^~~~~~~~~~~~~~
   arch/arm64//kernel/traps.c:909:2: note: in expansion of macro 'nmi_enter'
     nmi_enter();
     ^~~~~~~~~
--
   In file included from include/linux/hardirq.h:9:0,
                    from include/linux/interrupt.h:11,
                    from drivers//irqchip/irq-gic-v3.c:13:
   drivers//irqchip/irq-gic-v3.c: In function 'gic_handle_nmi':
>> arch/arm64/include/asm/hardirq.h:50:23: error: '__cnt' undeclared (first=
 use in this function); did you mean '___cnt'?
     if (!(___cnt & 1) && __cnt) {     \
                          ^
>> include/linux/hardirq.h:73:3: note: in expansion of macro 'arch_nmi_ente=
r'
      arch_nmi_enter();    \
      ^~~~~~~~~~~~~~
   drivers//irqchip/irq-gic-v3.c:609:3: note: in expansion of macro 'nmi_en=
ter'
      nmi_enter();
      ^~~~~~~~~
   arch/arm64/include/asm/hardirq.h:50:23: note: each undeclared identifier=
 is reported only once for each function it appears in
     if (!(___cnt & 1) && __cnt) {     \
                          ^
>> include/linux/hardirq.h:73:3: note: in expansion of macro 'arch_nmi_ente=
r'
      arch_nmi_enter();    \
      ^~~~~~~~~~~~~~
   drivers//irqchip/irq-gic-v3.c:609:3: note: in expansion of macro 'nmi_en=
ter'
      nmi_enter();
      ^~~~~~~~~

vim +50 arch/arm64/include/asm/hardirq.h

    39	=

    40	#define arch_nmi_enter()						\
    41	do {									\
    42		struct nmi_ctx *___ctx;						\
    43		unsigned int ___cnt;						\
    44										\
    45		if (!is_kernel_in_hyp_mode() || in_nmi())			\
    46			break;							\
    47										\
    48		___ctx =3D this_cpu_ptr(&nmi_contexts);				\
    49		___cnt =3D ___ctx->cnt;						\
  > 50		if (!(___cnt & 1) && __cnt) {					\
    51			___ctx->cnt +=3D 2;					\
    52			break;							\
    53		}								\
    54										\
    55		___ctx->cnt |=3D 1;						\
    56		barrier();							\
    57		___ctx->hcr =3D read_sysreg(hcr_el2);				\
    58		if (!(___ctx->hcr & HCR_TGE)) {				\
    59			write_sysreg(___ctx->hcr | HCR_TGE, hcr_el2);		\
    60			isb();							\
    61		}								\
    62		barrier();							\
    63		if (!(___cnt & 1))						\
    64			___ctx->cnt++;						\
    65	} while (0)
    66	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4207001902448666607==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4207001902448666607==--

