Content-Type: multipart/mixed; boundary="===============5837158068321009918=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [rcu:tglx.2020.05.05a 48/140] arch/um/include/asm/irqflags.h:5: Error: no such instruction: `extern int get_signals(void)'
Date: Wed, 06 May 2020 09:57:25 +0800
Message-ID: <202005060909.cmc31JbI%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5837158068321009918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.g=
it tglx.2020.05.05a
head:   e6d36eed49b863bbe393e3c07cae737cd9c475e3
commit: 1af1a839cb2f00c8d7533102ece276ac315ecef2 [48/140] x86/entry/64: Che=
ck IF in __preempt_enable_notrace() thunk
config: um-x86_64_defconfig (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        git checkout 1af1a839cb2f00c8d7533102ece276ac315ecef2
        # save the attached .config to linux build tree
        make ARCH=3Dum SUBARCH=3Dx86_64

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/um/include/asm/irqflags.h: Assembler messages:
>> arch/um/include/asm/irqflags.h:5: Error: no such instruction: `extern in=
t get_signals(void)'
>> arch/um/include/asm/irqflags.h:6: Error: no such instruction: `extern in=
t set_signals(int enable)'
>> arch/um/include/asm/irqflags.h:7: Error: no such instruction: `extern vo=
id block_signals(void)'
>> arch/um/include/asm/irqflags.h:8: Error: no such instruction: `extern vo=
id unblock_signals(void)'
>> arch/um/include/asm/irqflags.h:11: Error: no such instruction: `static i=
nline unsigned long arch_local_save_flags(void)'
>> arch/um/include/asm/irqflags.h:12: Error: no such instruction: `{'
>> arch/um/include/asm/irqflags.h:13: Error: no such instruction: `return g=
et_signals()'
>> arch/um/include/asm/irqflags.h:14: Error: junk at end of line, first unr=
ecognized character is `}'
>> arch/um/include/asm/irqflags.h:17: Error: no such instruction: `static i=
nline void arch_local_irq_restore(unsigned long flags)'
   arch/um/include/asm/irqflags.h:18: Error: no such instruction: `{'
>> arch/um/include/asm/irqflags.h:19: Error: invalid character '(' in mnemo=
nic
   arch/um/include/asm/irqflags.h:20: Error: junk at end of line, first unr=
ecognized character is `}'
>> arch/um/include/asm/irqflags.h:23: Error: no such instruction: `static i=
nline void arch_local_irq_enable(void)'
   arch/um/include/asm/irqflags.h:24: Error: no such instruction: `{'
   arch/um/include/asm/irqflags.h:25: Error: invalid character '(' in mnemo=
nic
   arch/um/include/asm/irqflags.h:26: Error: junk at end of line, first unr=
ecognized character is `}'
>> arch/um/include/asm/irqflags.h:29: Error: no such instruction: `static i=
nline void arch_local_irq_disable(void)'
   arch/um/include/asm/irqflags.h:30: Error: no such instruction: `{'
   arch/um/include/asm/irqflags.h:31: Error: invalid character '(' in mnemo=
nic
   arch/um/include/asm/irqflags.h:32: Error: junk at end of line, first unr=
ecognized character is `}'
>> include/asm-generic/irqflags.h:26: Error: no such instruction: `static i=
nline unsigned long arch_local_irq_save(void)'
>> include/asm-generic/irqflags.h:27: Error: no such instruction: `{'
>> include/asm-generic/irqflags.h:28: Error: no such instruction: `unsigned=
 long flags'
>> include/asm-generic/irqflags.h:29: Error: junk at end of line, first unr=
ecognized character is `('
>> include/asm-generic/irqflags.h:30: Error: no such instruction: `arch_loc=
al_irq_restore(0)'
>> include/asm-generic/irqflags.h:31: Error: no such instruction: `return f=
lags'
>> include/asm-generic/irqflags.h:32: Error: junk at end of line, first unr=
ecognized character is `}'
>> include/asm-generic/irqflags.h:37: Error: no such instruction: `static i=
nline int arch_irqs_disabled_flags(unsigned long flags)'
   include/asm-generic/irqflags.h:38: Error: no such instruction: `{'
   include/asm-generic/irqflags.h:39: Error: no such instruction: `return f=
lags=3D=3D0'
   include/asm-generic/irqflags.h:40: Error: junk at end of line, first unr=
ecognized character is `}'
   include/asm-generic/irqflags.h:61: Error: no such instruction: `static i=
nline int arch_irqs_disabled(void)'
   include/asm-generic/irqflags.h:62: Error: no such instruction: `{'
   include/asm-generic/irqflags.h:63: Error: no such instruction: `return a=
rch_irqs_disabled_flags(arch_local_save_flags())'
   include/asm-generic/irqflags.h:64: Error: junk at end of line, first unr=
ecognized character is `}'

vim +5 arch/um/include/asm/irqflags.h

65e62974a8a615 include/asm-um/irqflags.h      Jeff Dike     2006-06-04   4  =

a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  @5 =
 extern int get_signals(void);
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  @6 =
 extern int set_signals(int enable);
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  @7 =
 extern void block_signals(void);
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  @8 =
 extern void unblock_signals(void);
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18   9  =

3e938957357459 arch/um/include/asm/irqflags.h Daniel Wagner 2016-06-12  10 =
 #define arch_local_save_flags arch_local_save_flags
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18 @11 =
 static inline unsigned long arch_local_save_flags(void)
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18 @12 =
 {
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18 @13 =
 	return get_signals();
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18 @14 =
 }
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  15  =

3e938957357459 arch/um/include/asm/irqflags.h Daniel Wagner 2016-06-12  16 =
 #define arch_local_irq_restore arch_local_irq_restore
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18 @17 =
 static inline void arch_local_irq_restore(unsigned long flags)
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  18 =
 {
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18 @19 =
 	set_signals(flags);
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  20 =
 }
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  21  =

3e938957357459 arch/um/include/asm/irqflags.h Daniel Wagner 2016-06-12  22 =
 #define arch_local_irq_enable arch_local_irq_enable
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18 @23 =
 static inline void arch_local_irq_enable(void)
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  24 =
 {
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  25 =
 	unblock_signals();
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  26 =
 }
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  27  =

3e938957357459 arch/um/include/asm/irqflags.h Daniel Wagner 2016-06-12  28 =
 #define arch_local_irq_disable arch_local_irq_disable
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18 @29 =
 static inline void arch_local_irq_disable(void)
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  30 =
 {
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  31 =
 	block_signals();
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  32 =
 }
a34978cbd977ab arch/um/include/asm/irqflags.h Al Viro       2011-08-18  33  =


:::::: The code at line 5 was first introduced by commit
:::::: a34978cbd977ab62c744f63daacd9dc1474482be um: kill system-um.h

:::::: TO: Al Viro <viro@ftp.linux.org.uk>
:::::: CC: Richard Weinberger <richard@nod.at>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5837158068321009918==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
G150ymj6Pxtm6OK1gwAA
--===============5837158068321009918==--

