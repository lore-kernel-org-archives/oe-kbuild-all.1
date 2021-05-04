Content-Type: multipart/mixed; boundary="===============2080621890676688433=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [luto:x86/kentry 6/11] arch/x86/entry/common.c:114:7: warning: variable 'ret' set but not used
Date: Tue, 04 May 2021 09:55:17 +0800
Message-ID: <202105040914.ZN6Hkwbr-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2080621890676688433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/=
kentry
head:   e527b2f058012d5228c1215da0a7535e7c1bb923
commit: 4366c525ffe5fd27611ab5233e8e4cb6afa61f2b [6/11] kentry: Simplify th=
e common syscall API
config: i386-tinyconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git/co=
mmit/?id=3D4366c525ffe5fd27611ab5233e8e4cb6afa61f2b
        git remote add luto https://git.kernel.org/pub/scm/linux/kernel/git=
/luto/linux.git
        git fetch --no-tags luto x86/kentry
        git checkout 4366c525ffe5fd27611ab5233e8e4cb6afa61f2b
        # save the attached .config to linux build tree
        make W=3D1 W=3D1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/entry/common.c:89:24: warning: no previous prototype for 'do_in=
t80_syscall_32' [-Wmissing-prototypes]
      89 | __visible noinstr void do_int80_syscall_32(struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~~~~~~
   arch/x86/entry/common.c: In function '__do_fast_syscall_32':
>> arch/x86/entry/common.c:114:7: warning: variable 'ret' set but not used =
[-Wunused-but-set-variable]
     114 |  bool ret;
         |       ^~~
   arch/x86/entry/common.c: At top level:
   arch/x86/entry/common.c:158:24: warning: no previous prototype for 'do_f=
ast_syscall_32' [-Wmissing-prototypes]
     158 | __visible noinstr long do_fast_syscall_32(struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~~~~~
   arch/x86/entry/common.c:210:24: warning: no previous prototype for 'do_S=
YSENTER_32' [-Wmissing-prototypes]
     210 | __visible noinstr long do_SYSENTER_32(struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~


vim +/ret +114 arch/x86/entry/common.c

   110	=

   111	static noinstr bool __do_fast_syscall_32(struct pt_regs *regs)
   112	{
   113		unsigned int nr =3D syscall_32_enter(regs);
 > 114		bool ret;
   115		int res;
   116	=

   117		kentry_enter_from_user_mode(regs);
   118		instrumentation_begin();
   119		local_irq_enable();
   120	=

   121		/* Fetch EBP from where the vDSO stashed it. */
   122		if (IS_ENABLED(CONFIG_X86_64)) {
   123			/*
   124			 * Micro-optimization: the pointer we're following is
   125			 * explicitly 32 bits, so it can't be out of range.
   126			 */
   127			res =3D __get_user(*(u32 *)&regs->bp,
   128				 (u32 __user __force *)(unsigned long)(u32)regs->sp);
   129		} else {
   130			res =3D get_user(*(u32 *)&regs->bp,
   131			       (u32 __user __force *)(unsigned long)(u32)regs->sp);
   132		}
   133	=

   134		if (res) {
   135			/* User code screwed up. */
   136			regs->ax =3D -EFAULT;
   137			ret =3D false;
   138			goto out;
   139		}
   140	=

   141		/* The case truncates any ptrace induced syscall nr > 2^32 -1 */
   142		nr =3D (unsigned int)kentry_syscall_begin(regs, nr);
   143	=

   144		/* Now this is just like a normal syscall. */
   145		do_syscall_32_irqs_on(regs, nr);
   146	=

   147		kentry_syscall_end(regs);
   148		ret =3D true;
   149	=

   150	out:
   151		local_irq_disable();
   152		instrumentation_end();
   153		kentry_exit_to_user_mode(regs);
   154		return true;
   155	}
   156	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2080621890676688433==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2080621890676688433==--

