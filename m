Content-Type: multipart/mixed; boundary="===============9032694445881686858=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [brauner:do_fork_removal_sparc 2/3] arch/sparc/kernel/process.c:18:17: error: conflicting types for 'sparc_fork'
Date: Tue, 26 May 2020 21:48:03 +0800
Message-ID: <202005262100.pd5OU2a5%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9032694445881686858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git d=
o_fork_removal_sparc
head:   60adc9458a9bf6bcfe8a40f625f8199887a1125a
commit: b45a1967bd8264555d612f6c66eaeb6e0f176e42 [2/3] sparc: share process=
 creation helpers between sparc and sparc64
config: sparc-defconfig (attached as .config)
compiler: sparc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout b45a1967bd8264555d612f6c66eaeb6e0f176e42
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dsparc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> arch/sparc/kernel/process.c:18:17: error: conflicting types for 'sparc_f=
ork'
18 | asmlinkage long sparc_fork(struct pt_regs *regs)
|                 ^~~~~~~~~~
In file included from arch/sparc/kernel/process.c:16:
arch/sparc/kernel/kernel.h:158:16: note: previous declaration of 'sparc_for=
k' was here
158 | asmlinkage int sparc_fork(struct pt_regs *regs);
|                ^~~~~~~~~~
>> arch/sparc/kernel/process.c:41:17: error: conflicting types for 'sparc_v=
fork'
41 | asmlinkage long sparc_vfork(struct pt_regs *regs)
|                 ^~~~~~~~~~~
In file included from arch/sparc/kernel/process.c:16:
arch/sparc/kernel/kernel.h:159:16: note: previous declaration of 'sparc_vfo=
rk' was here
159 | asmlinkage int sparc_vfork(struct pt_regs *regs);
|                ^~~~~~~~~~~
>> arch/sparc/kernel/process.c:66:17: error: conflicting types for 'sparc_c=
lone'
66 | asmlinkage long sparc_clone(struct pt_regs *regs)
|                 ^~~~~~~~~~~
In file included from arch/sparc/kernel/process.c:16:
arch/sparc/kernel/kernel.h:157:16: note: previous declaration of 'sparc_clo=
ne' was here
157 | asmlinkage int sparc_clone(struct pt_regs *regs);
|                ^~~~~~~~~~~

vim +/sparc_fork +18 arch/sparc/kernel/process.c

    17	=

  > 18	asmlinkage long sparc_fork(struct pt_regs *regs)
    19	{
    20		unsigned long orig_i1 =3D regs->u_regs[UREG_I1];
    21		long ret;
    22		struct kernel_clone_args args =3D {
    23			.exit_signal	=3D SIGCHLD,
    24			/* Reuse the parent's stack for the child. */
    25			.stack		=3D regs->u_regs[UREG_FP],
    26		};
    27	=

    28		ret =3D _do_fork(&args);
    29	=

    30		/* If we get an error and potentially restart the system
    31		 * call, we're screwed because copy_thread_tls() clobbered
    32		 * the parent's %o1.  So detect that case and restore it
    33		 * here.
    34		 */
    35		if ((unsigned long)ret >=3D -ERESTART_RESTARTBLOCK)
    36			regs->u_regs[UREG_I1] =3D orig_i1;
    37	=

    38		return ret;
    39	}
    40	=

  > 41	asmlinkage long sparc_vfork(struct pt_regs *regs)
    42	{
    43		unsigned long orig_i1 =3D regs->u_regs[UREG_I1];
    44		long ret;
    45	=

    46		struct kernel_clone_args args =3D {
    47			.flags		=3D CLONE_VFORK | CLONE_VM,
    48			.exit_signal	=3D SIGCHLD,
    49			/* Reuse the parent's stack for the child. */
    50			.stack		=3D regs->u_regs[UREG_FP],
    51		};
    52	=

    53		ret =3D _do_fork(&args);
    54	=

    55		/* If we get an error and potentially restart the system
    56		 * call, we're screwed because copy_thread_tls() clobbered
    57		 * the parent's %o1.  So detect that case and restore it
    58		 * here.
    59		 */
    60		if ((unsigned long)ret >=3D -ERESTART_RESTARTBLOCK)
    61			regs->u_regs[UREG_I1] =3D orig_i1;
    62	=

    63		return ret;
    64	}
    65	=

  > 66	asmlinkage long sparc_clone(struct pt_regs *regs)
    67	{
    68		unsigned long orig_i1 =3D regs->u_regs[UREG_I1];
    69		unsigned int flags =3D lower_32_bits(regs->u_regs[UREG_I0]);
    70		long ret;
    71	=

    72		struct kernel_clone_args args =3D {
    73			.flags		=3D (flags & ~CSIGNAL),
    74			.exit_signal	=3D (flags & CSIGNAL),
    75			.tls		=3D regs->u_regs[UREG_I3],
    76		};
    77	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9032694445881686858==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
QWE9y0dkP9cvl7+lV8rOAAA=
--===============9032694445881686858==--

