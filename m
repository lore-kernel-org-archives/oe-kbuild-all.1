Content-Type: multipart/mixed; boundary="===============5717007890579293684=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [vfs:untested.uaccess 18/22] arch/x86/kernel/signal.c:309:51: error: macro "unsafe_put_user" requires 3 arguments, but only 2 given
Date: Mon, 17 Feb 2020 06:35:07 +0800
Message-ID: <202002170605.k2OSCkAE%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5717007890579293684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git untest=
ed.uaccess
head:   094cadd628e4f679e8d2a5edbf9564ac1ec5bb03
commit: c6bab75849c01b2ea5ce1ac94a1c26db84efce6c [18/22] x86: __setup_frame=
(): consolidate uaccess areas
config: i386-alldefconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-4) 7.5.0
reproduce:
        git checkout c6bab75849c01b2ea5ce1ac94a1c26db84efce6c
        # save the attached .config to linux build tree
        make ARCH=3Di386 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/signal.c: In function '__setup_frame':
>> arch/x86/kernel/signal.c:309:51: error: macro "unsafe_put_user" requires=
 3 arguments, but only 2 given
     unsafe_put_user(set->sig[1], &frame->extramask[0]), Efault)
                                                      ^
>> arch/x86/kernel/signal.c:309:2: error: 'unsafe_put_user' undeclared (fir=
st use in this function)
     unsafe_put_user(set->sig[1], &frame->extramask[0]), Efault)
     ^~~~~~~~~~~~~~~
   arch/x86/kernel/signal.c:309:2: note: each undeclared identifier is repo=
rted only once for each function it appears in
>> arch/x86/kernel/signal.c:309:54: error: 'Efault' undeclared (first use i=
n this function)
     unsafe_put_user(set->sig[1], &frame->extramask[0]), Efault)
                                                         ^~~~~~
   arch/x86/kernel/signal.c:309:52: warning: left-hand operand of comma exp=
ression has no effect [-Wunused-value]
     unsafe_put_user(set->sig[1], &frame->extramask[0]), Efault)
                                                       ^
>> arch/x86/kernel/signal.c:309:60: error: expected ';' before ')' token
     unsafe_put_user(set->sig[1], &frame->extramask[0]), Efault)
                                                               ^
>> arch/x86/kernel/signal.c:309:60: error: expected statement before ')' to=
ken
   arch/x86/kernel/signal.c:298:6: warning: unused variable 'err' [-Wunused=
-variable]
     int err =3D 0;
         ^~~
   arch/x86/kernel/signal.c: In function 'x32_setup_rt_frame':
   arch/x86/kernel/signal.c:580:1: warning: label 'Efault' defined but not =
used [-Wunused-label]
    Efault:
    ^~~~~~

vim +/unsafe_put_user +309 arch/x86/kernel/signal.c

   291	=

   292	static int
   293	__setup_frame(int sig, struct ksignal *ksig, sigset_t *set,
   294		      struct pt_regs *regs)
   295	{
   296		struct sigframe __user *frame;
   297		void __user *restorer;
   298		int err =3D 0;
   299		void __user *fpstate =3D NULL;
   300	=

   301		frame =3D get_sigframe(&ksig->ka, regs, sizeof(*frame), &fpstate);
   302	=

   303		if (!user_access_begin(frame, sizeof(*frame)))
   304			return -EFAULT;
   305	=

   306		unsafe_put_user(sig, &frame->sig, Efault);
   307		if (setup_sigcontext(&frame->sc, fpstate, regs, set->sig[0]))
   308			goto Efault;
 > 309		unsafe_put_user(set->sig[1], &frame->extramask[0]), Efault)
   310		if (current->mm->context.vdso)
   311			restorer =3D current->mm->context.vdso +
   312				vdso_image_32.sym___kernel_sigreturn;
   313		else
   314			restorer =3D &frame->retcode;
   315		if (ksig->ka.sa.sa_flags & SA_RESTORER)
   316			restorer =3D ksig->ka.sa.sa_restorer;
   317	=

   318		/* Set up to return from userspace.  */
   319		unsafe_put_user(restorer, &frame->pretcode, Efault);
   320	=

   321		/*
   322		 * This is popl %eax ; movl $__NR_sigreturn, %eax ; int $0x80
   323		 *
   324		 * WE DO NOT USE IT ANY MORE! It's only left here for historical
   325		 * reasons and because gdb uses it as a signature to notice
   326		 * signal handler stack frames.
   327		 */
   328		unsafe_put_user(*((u64 *)&retcode), (u64 *)frame->retcode, Efault);
   329		user_access_end();
   330	=

   331		/* Set up registers for signal handler */
   332		regs->sp =3D (unsigned long)frame;
   333		regs->ip =3D (unsigned long)ksig->ka.sa.sa_handler;
   334		regs->ax =3D (unsigned long)sig;
   335		regs->dx =3D 0;
   336		regs->cx =3D 0;
   337	=

   338		regs->ds =3D __USER_DS;
   339		regs->es =3D __USER_DS;
   340		regs->ss =3D __USER_DS;
   341		regs->cs =3D __USER_CS;
   342	=

   343		return 0;
   344	=

   345	Efault:
   346		user_access_end();
   347		return -EFAULT;
   348	}
   349	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5717007890579293684==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
vCLsFk0lJIOkkUf64Nrq2eq0Qvs/fL36S8CdAAA=
--===============5717007890579293684==--

