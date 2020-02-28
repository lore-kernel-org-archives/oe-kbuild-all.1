Content-Type: multipart/mixed; boundary="===============0629711016667689077=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [riscv:for-next 5/7] arch/riscv/kernel/stacktrace.c:78:8: error: 'sp_in_global' undeclared; did you mean 'spin_lock'?
Date: Fri, 28 Feb 2020 20:57:31 +0800
Message-ID: <202002282029.RgUZwLR0%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0629711016667689077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for=
-next
head:   4aa8ab7e6967b7dc92ca78f4c9ab026abfa1f3ea
commit: 133f73bb8319d6683c924dabddb25b953878cbc2 [5/7] RISC-V: Stop relying=
 on GCC's register allocator's hueristics
config: riscv-allnoconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 133f73bb8319d6683c924dabddb25b953878cbc2
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Driscv =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/riscv/kernel/stacktrace.c: In function 'walk_stackframe':
>> arch/riscv/kernel/stacktrace.c:78:8: error: 'sp_in_global' undeclared (f=
irst use in this function); did you mean 'spin_lock'?
      sp =3D sp_in_global;
           ^~~~~~~~~~~~
           spin_lock
   arch/riscv/kernel/stacktrace.c:78:8: note: each undeclared identifier is=
 reported only once for each function it appears in

vim +78 arch/riscv/kernel/stacktrace.c

    67	=

    68	static void notrace walk_stackframe(struct task_struct *task,
    69		struct pt_regs *regs, bool (*fn)(unsigned long, void *), void *arg)
    70	{
    71		unsigned long sp, pc;
    72		unsigned long *ksp;
    73	=

    74		if (regs) {
    75			sp =3D user_stack_pointer(regs);
    76			pc =3D instruction_pointer(regs);
    77		} else if (task =3D=3D NULL || task =3D=3D current) {
  > 78			sp =3D sp_in_global;
    79			pc =3D (unsigned long)walk_stackframe;
    80		} else {
    81			/* task blocked in __switch_to */
    82			sp =3D task->thread.sp;
    83			pc =3D task->thread.ra;
    84		}
    85	=

    86		if (unlikely(sp & 0x7))
    87			return;
    88	=

    89		ksp =3D (unsigned long *)sp;
    90		while (!kstack_end(ksp)) {
    91			if (__kernel_text_address(pc) && unlikely(fn(pc, arg)))
    92				break;
    93			pc =3D (*ksp++) - 0x4;
    94		}
    95	}
    96	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0629711016667689077==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0629711016667689077==--

