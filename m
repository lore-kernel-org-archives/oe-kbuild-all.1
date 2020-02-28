Content-Type: multipart/mixed; boundary="===============2179852569159112963=="
MIME-Version: 1.0
From: Suren Baghdasaryan <surenb@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v6 2/7] mm: introduce external memory hinting API
Date: Fri, 28 Feb 2020 14:14:56 -0800
Message-ID: <CAJuCfpEJCJR-N9bKBPMVqC3NgEXJYF3RG46cG9Y_3MEXq4F1tQ@mail.gmail.com>
In-Reply-To: <20200220212135.GB226145@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2179852569159112963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 1:21 PM Minchan Kim <minchan@kernel.org> wrote:
>
> Hi Andrew,
>
> I submit the fix with inlining here thread but if you prefer submitting
> new v7 revision with more inputs, please tell me.
> I am happy to resend whole patchset.
>
> Thanks.
>
> On Thu, Feb 20, 2020 at 01:15:10PM -0800, Minchan Kim wrote:
> > On Fri, Feb 21, 2020 at 03:13:49AM +0800, kbuild test robot wrote:
> > > Hi Minchan,
> > >
> > > I love your patch! Perhaps something to improve:
> > >
> > > [auto build test WARNING on m68k/for-next]
> > > [also build test WARNING on powerpc/next s390/features linus/master v=
5.6-rc2 next-20200220]
> > > [cannot apply to arm64/for-next/core tip/x86/asm arm/for-next hp-pari=
sc/for-next]
> > > [if your patch is applied to the wrong git tree, please drop us a not=
e to help
> > > improve the system. BTW, we also suggest to use '--base' option to sp=
ecify the
> > > base tree in git format-patch, please see https://stackoverflow.com/a=
/37406982]
> > >
> > > url:    https://github.com/0day-ci/linux/commits/Minchan-Kim/introduc=
e-memory-hinting-API-for-external-process/20200220-225155
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m=
68k.git for-next
> > > config: nds32-randconfig-a001-20200220 (attached as .config)
> > > compiler: nds32le-linux-gcc (GCC) 9.2.0
> > > reproduce:
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # save the attached .config to linux build tree
> > >         GCC_VERSION=3D9.2.0 make.cross ARCH=3Dnds32
> > >
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >    In file included from arch/nds32/include/uapi/asm/unistd.h:10,
> > >                     from arch/nds32/include/asm/unistd.h:6,
> > >                     from arch/nds32/kernel/vdso/sigreturn.S:6:
> > > >> include/uapi/asm-generic/unistd.h:858: warning: "__NR_pidfd_getfd"=
 redefined
> > >      858 | #define __NR_pidfd_getfd 439
> > >          |
> > >    include/uapi/asm-generic/unistd.h:856: note: this is the location =
of the previous definition
> > >      856 | #define __NR_pidfd_getfd 438
> > >          |
> > > --
> > >    In file included from arch/nds32/include/uapi/asm/unistd.h:10,
> > >                     from arch/nds32/include/asm/unistd.h:6,
> > >                     from <stdin>:2:
> > > >> include/uapi/asm-generic/unistd.h:858: warning: "__NR_pidfd_getfd"=
 redefined
> > >      858 | #define __NR_pidfd_getfd 439
> > >          |
> > >    include/uapi/asm-generic/unistd.h:856: note: this is the location =
of the previous definition
> > >      856 | #define __NR_pidfd_getfd 438
> > >          |
> > >    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
> > > >> <stdin>:1520:2: warning: #warning syscall process_madvise not impl=
emented [-Wcpp]
> > > --
> > >    In file included from arch/nds32/include/uapi/asm/unistd.h:10,
> > >                     from arch/nds32/include/asm/unistd.h:6,
> > >                     from <stdin>:2:
> > > >> include/uapi/asm-generic/unistd.h:858: warning: "__NR_pidfd_getfd"=
 redefined
> > >      858 | #define __NR_pidfd_getfd 439
> > >          |
> > >    include/uapi/asm-generic/unistd.h:856: note: this is the location =
of the previous definition
> > >      856 | #define __NR_pidfd_getfd 438
> > >          |
> > >    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
> > > >> <stdin>:1520:2: warning: #warning syscall process_madvise not impl=
emented [-Wcpp]
> > >    16 real  2 user  4 sys  39.01% cpu       make modules_prepare
> > > --
> > >    In file included from arch/nds32/include/uapi/asm/unistd.h:10,
> > >                     from arch/nds32/include/asm/unistd.h:6,
> > >                     from <stdin>:2:
> > > >> include/uapi/asm-generic/unistd.h:858: warning: "__NR_pidfd_getfd"=
 redefined
> > >      858 | #define __NR_pidfd_getfd 439
> > >          |
> > >    include/uapi/asm-generic/unistd.h:856: note: this is the location =
of the previous definition
> > >      856 | #define __NR_pidfd_getfd 438
> > >          |
> > >    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
> > > >> <stdin>:1520:2: warning: #warning syscall process_madvise not impl=
emented [-Wcpp]
> > >    In file included from arch/nds32/include/uapi/asm/unistd.h:10,
> > >                     from arch/nds32/include/asm/unistd.h:6,
> > >                     from arch/nds32/kernel/vdso/sigreturn.S:6:
> > > >> include/uapi/asm-generic/unistd.h:858: warning: "__NR_pidfd_getfd"=
 redefined
> > >      858 | #define __NR_pidfd_getfd 439
> > >          |
> > >    include/uapi/asm-generic/unistd.h:856: note: this is the location =
of the previous definition
> > >      856 | #define __NR_pidfd_getfd 438
> > >          |
> > >    In file included from arch/nds32/include/uapi/asm/unistd.h:10,
> > >                     from arch/nds32/include/asm/unistd.h:6,
> > >                     from arch/nds32/kernel/vdso/gettimeofday.c:11:
> > > >> include/uapi/asm-generic/unistd.h:858: warning: "__NR_pidfd_getfd"=
 redefined
> > >      858 | #define __NR_pidfd_getfd 439
> > >          |
> > >    include/uapi/asm-generic/unistd.h:856: note: this is the location =
of the previous definition
> > >      856 | #define __NR_pidfd_getfd 438
> > >          |
> > >    17 real  4 user  6 sys  59.28% cpu       make prepare
> > >
> > > vim +/__NR_pidfd_getfd +858 include/uapi/asm-generic/unistd.h
> > >
> > >    853
> > >    854      #define __NR_openat2 437
> > >    855      __SYSCALL(__NR_openat2, sys_openat2)
> > >    856      #define __NR_pidfd_getfd 438
> > >    857      __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
> > >  > 858      #define __NR_pidfd_getfd 439
> > >    859      __SYSCALL(__NR_process_madvise, sys_process_madvise)
> > >    860
> > >
> > > ---
> > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> >
> >
> > Hi 0-Day,
> >
> > Thanks for catching this. Here the fix goes.
> >
> > From ff74a830277d880716fa0f69c80e9ec9337303d5 Mon Sep 17 00:00:00 2001
> > From: Minchan Kim <minchan@kernel.org>
> > Date: Fri, 14 Feb 2020 07:42:03 -0800
> > Subject: [PATCH v6 2/8] mm: introduce external memory hinting API
> >
> > There is usecase that System Management Software(SMS) want to give
> > a memory hint like MADV_[COLD|PAGEEOUT] to other processes and
> > in the case of Android, it is the ActivityManagerService.
> >
> > It's similar in spirit to madvise(MADV_WONTNEED), but the information
> > required to make the reclaim decision is not known to the app. Instead,
> > it is known to the centralized userspace daemon(ActivityManagerService),
> > and that daemon must be able to initiate reclaim on its own without
> > any app involvement.
> >
> > To solve the issue, this patch introduces a new syscall process_madvise=
(2).
> > It uses pidfd of an external process to give the hint.
> >
> >  int process_madvise(int pidfd, void *addr, size_t length, int advise,
> >                       unsigned long flag);
> >
> > Since it could affect other process's address range, only privileged
> > process(CAP_SYS_PTRACE) or something else(e.g., being the same UID)
> > gives it the right to ptrace the process could use it successfully.
> > The flag argument is reserved for future use if we need to extend the
> > API.
> >
> > I think supporting all hints madvise has/will supported/support to
> > process_madvise is rather risky. Because we are not sure all hints make
> > sense from external process and implementation for the hint may rely on
> > the caller being in the current context so it could be error-prone.
> > Thus, I just limited hints as MADV_[COLD|PAGEOUT] in this patch.
> >
> > If someone want to add other hints, we could hear hear the usecase and
> > review it for each hint. It's safer for maintenance rather than
> > introducing a buggy syscall but hard to fix it later.
> >
> > Q.1 - Why does any external entity have better knowledge?
> >
> > Quote from Sandeep
> > "For Android, every application (including the special SystemServer) ar=
e forked
> > from Zygote. The reason of course is to share as many libraries and cla=
sses between
> > the two as possible to benefit from the preloading during boot.
> >
> > After applications start, (almost) all of the APIs  end up calling into=
 this
> > SystemServer process over IPC (binder) and back to the application.
> >
> > In a fully running system, the SystemServer monitors every single proce=
ss
> > periodically to calculate their PSS / RSS and also decides which proces=
s is
> > "important" to the user for interactivity.
> >
> > So, because of how these processes start _and_ the fact that the System=
Server
> > is looping to monitor each process, it does tend to *know* which address
> > range of the application is not used / useful.
> >
> > Besides, we can never rely on applications to clean things up themselve=
s.
> > We've had the "hey app1, the system is low on memory, please trim your
> > memory usage down" notifications for a long time[1]. They rely on
> > applications honoring the broadcasts and very few do.
> >
> > So, if we want to avoid the inevitable killing of the application and
> > restarting it, some way to be able to tell the OS about unimportant mem=
ory in
> > these applications will be useful.
> >
> > - ssp
> >
> > Q.2 - How to guarantee the race(i.e., object validation) between when g=
iving a
> > hint from an external process and get the hint from the target process?
> >
> > process_madvise operates on the target process's address space as it ex=
ists
> > at the instant that process_madvise is called. If the space target proc=
ess
> > can run between the time the process_madvise process inspects the target
> > process address space and the time that process_madvise is actually cal=
led,
> > process_madvise may operate on memory regions that the calling process =
does
> > not expect. It's the responsibility of the process calling process_madv=
ise
> > to close this race condition. For example, the calling process can susp=
end
> > the target process with ptrace, SIGSTOP, or the freezer cgroup so that =
it
> > doesn't have an opportunity to change its own address space before
> > process_madvise is called. Another option is to operate on memory regio=
ns
> > that the caller knows a priori will be unchanged in the target process.
> > Yet another option is to accept the race for certain process_madvise ca=
lls
> > after reasoning that mistargeting will do no harm. The suggested API it=
self
> > does not provide synchronization. It also apply other APIs like move_pa=
ges,
> > process_vm_write.
> >
> > The race isn't really a problem though. Why is it so wrong to require
> > that callers do their own synchronization in some manner? Nobody objects
> > to write(2) merely because it's possible for two processes to open the =
same
> > file and clobber each other's writes --- instead, we tell people to use
> > flock or something. Think about mmap. It never guarantees newly allocat=
ed
> > address space is still valid when the user tries to access it because o=
ther
> > threads could unmap the memory right before. That's where we need
> > synchronization by using other API or design from userside. It shouldn't
> > be part of API itself. If someone needs more fine-grained synchronizati=
on
> > rather than process level, there were two ideas suggested - cookie[2] a=
nd
> > anon-fd[3]. Both are applicable via using last reserved argument of the=
 API
> > but I don't think it's necessary right now since we have already ways to
> > prevent the race so don't want to add additional complexity with more
> > fine-grained optimization model.
> >
> > To make the API extend, it reserved an unsigned long as last argument
> > so we could support it in future if someone really needs it.
> >
> > Q.3 - Why doesn't ptrace work?
> >
> > Injecting an madvise in the target process using ptrace would not work =
for us
> > because such injected madvise would have to be executed by the target p=
rocess,
> > which means that process would have to be runnable and that creates the=
 risk
> > of the abovementioned race and hinting a wrong VMA. Furthermore, we wan=
t to
> > act the hint in caller's context, not calle because calle is usually li=
mited
> > in cpuset/cgroups or even freezed state so they can't act by themselves
> > quick enough, which causes more thrashing/kill. It doesn't work if the
> > target process are ptraced(e.g., strace, debugger, minidump) because  a
> > process can have at most one ptracer.
> >
> > [1] https://developer.android.com/topic/performance/memory"
> > [2] process_getinfo for getting the cookie which is updated whenever
> >     vma of process address layout are changed - Daniel Colascione
> > - https://lore.kernel.org/lkml/20190520035254.57579-1-minchan(a)kernel.=
org/T/#m7694416fd179b2066a2c62b5b139b14e3894e224
> > [3] anonymous fd which is used for the object(i.e., address range)
> >     validation - Michal Hocko
> > - https://lore.kernel.org/lkml/20200120112722.GY18451(a)dhcp22.suse.cz/
> >
> > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > ---
> >  arch/alpha/kernel/syscalls/syscall.tbl      |  1 +
> >  arch/arm/tools/syscall.tbl                  |  1 +
> >  arch/arm64/include/asm/unistd.h             |  2 +-
> >  arch/arm64/include/asm/unistd32.h           |  2 +
> >  arch/ia64/kernel/syscalls/syscall.tbl       |  1 +
> >  arch/m68k/kernel/syscalls/syscall.tbl       |  1 +
> >  arch/microblaze/kernel/syscalls/syscall.tbl |  1 +
> >  arch/mips/kernel/syscalls/syscall_n32.tbl   |  1 +
> >  arch/mips/kernel/syscalls/syscall_n64.tbl   |  1 +
> >  arch/parisc/kernel/syscalls/syscall.tbl     |  1 +
> >  arch/powerpc/kernel/syscalls/syscall.tbl    |  1 +
> >  arch/s390/kernel/syscalls/syscall.tbl       |  1 +
> >  arch/sh/kernel/syscalls/syscall.tbl         |  1 +
> >  arch/sparc/kernel/syscalls/syscall.tbl      |  1 +
> >  arch/x86/entry/syscalls/syscall_32.tbl      |  1 +
> >  arch/x86/entry/syscalls/syscall_64.tbl      |  1 +
> >  arch/xtensa/kernel/syscalls/syscall.tbl     |  1 +
> >  include/linux/syscalls.h                    |  2 +
> >  include/uapi/asm-generic/unistd.h           |  4 +-
> >  kernel/sys_ni.c                             |  1 +
> >  mm/madvise.c                                | 64 +++++++++++++++++++++
> >  21 files changed, 88 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel=
/syscalls/syscall.tbl
> > index 36d42da7466a..c82952e6fb80 100644
> > --- a/arch/alpha/kernel/syscalls/syscall.tbl
> > +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> > @@ -477,3 +477,4 @@
> >  # 545 reserved for clone3
> >  547  common  openat2                         sys_openat2
> >  548  common  pidfd_getfd                     sys_pidfd_getfd
> > +549  common  process_madvise                 sys_process_madvise
> > diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
> > index 4d1cf74a2caa..54c2719fec46 100644
> > --- a/arch/arm/tools/syscall.tbl
> > +++ b/arch/arm/tools/syscall.tbl
> > @@ -451,3 +451,4 @@
> >  435  common  clone3                          sys_clone3
> >  437  common  openat2                         sys_openat2
> >  438  common  pidfd_getfd                     sys_pidfd_getfd
> > +439  common  process_madvise                 sys_process_madvise
> > diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/u=
nistd.h
> > index 1dd22da1c3a9..75f04a1023be 100644
> > --- a/arch/arm64/include/asm/unistd.h
> > +++ b/arch/arm64/include/asm/unistd.h
> > @@ -38,7 +38,7 @@
> >  #define __ARM_NR_compat_set_tls              (__ARM_NR_COMPAT_BASE + 5)
> >  #define __ARM_NR_COMPAT_END          (__ARM_NR_COMPAT_BASE + 0x800)
> >
> > -#define __NR_compat_syscalls         439
> > +#define __NR_compat_syscalls         440
> >  #endif
> >
> >  #define __ARCH_WANT_SYS_CLONE
> > diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm=
/unistd32.h
> > index c1c61635f89c..2a27be7a1f91 100644
> > --- a/arch/arm64/include/asm/unistd32.h
> > +++ b/arch/arm64/include/asm/unistd32.h
> > @@ -883,6 +883,8 @@ __SYSCALL(__NR_clone3, sys_clone3)
> >  __SYSCALL(__NR_openat2, sys_openat2)
> >  #define __NR_pidfd_getfd 438
> >  __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
> > +#define __NR_process_madvise 439
> > +__SYSCALL(__NR_process_madvise, process_madvise)
> >
> >  /*
> >   * Please add new compat syscalls above this comment and update
> > diff --git a/arch/ia64/kernel/syscalls/syscall.tbl b/arch/ia64/kernel/s=
yscalls/syscall.tbl
> > index 042911e670b8..9524af1c318c 100644
> > --- a/arch/ia64/kernel/syscalls/syscall.tbl
> > +++ b/arch/ia64/kernel/syscalls/syscall.tbl
> > @@ -358,3 +358,4 @@
> >  # 435 reserved for clone3
> >  437  common  openat2                         sys_openat2
> >  438  common  pidfd_getfd                     sys_pidfd_getfd
> > +439  common  process_madvise                 sys_process_madvise
> > diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/s=
yscalls/syscall.tbl
> > index f4f49fcb76d0..8197050c097c 100644
> > --- a/arch/m68k/kernel/syscalls/syscall.tbl
> > +++ b/arch/m68k/kernel/syscalls/syscall.tbl
> > @@ -437,3 +437,4 @@
> >  435  common  clone3                          __sys_clone3
> >  437  common  openat2                         sys_openat2
> >  438  common  pidfd_getfd                     sys_pidfd_getfd
> > +439  common  process_madvise                 sys_process_madvise
> > diff --git a/arch/microblaze/kernel/syscalls/syscall.tbl b/arch/microbl=
aze/kernel/syscalls/syscall.tbl
> > index 4c67b11f9c9e..c5b6c8afe445 100644
> > --- a/arch/microblaze/kernel/syscalls/syscall.tbl
> > +++ b/arch/microblaze/kernel/syscalls/syscall.tbl
> > @@ -443,3 +443,4 @@
> >  435  common  clone3                          sys_clone3
> >  437  common  openat2                         sys_openat2
> >  438  common  pidfd_getfd                     sys_pidfd_getfd
> > +439  common  process_madvise                 sys_process_madvise
> > diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kern=
el/syscalls/syscall_n32.tbl
> > index 1f9e8ad636cc..8ec8c558aa9c 100644
> > --- a/arch/mips/kernel/syscalls/syscall_n32.tbl
> > +++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
> > @@ -376,3 +376,4 @@
> >  435  n32     clone3                          __sys_clone3
> >  437  n32     openat2                         sys_openat2
> >  438  n32     pidfd_getfd                     sys_pidfd_getfd
> > +439  n32     process_madvise                 sys_process_madvise
> > diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kern=
el/syscalls/syscall_n64.tbl
> > index c0b9d802dbf6..0078f891bb92 100644
> > --- a/arch/mips/kernel/syscalls/syscall_n64.tbl
> > +++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
> > @@ -352,3 +352,4 @@
> >  435  n64     clone3                          __sys_clone3
> >  437  n64     openat2                         sys_openat2
> >  438  n64     pidfd_getfd                     sys_pidfd_getfd
> > +439  n64     process_madvise                 sys_process_madvise
> > diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kern=
el/syscalls/syscall.tbl
> > index 52a15f5cd130..09c3b5dc6855 100644
> > --- a/arch/parisc/kernel/syscalls/syscall.tbl
> > +++ b/arch/parisc/kernel/syscalls/syscall.tbl
> > @@ -435,3 +435,4 @@
> >  435  common  clone3                          sys_clone3_wrapper
> >  437  common  openat2                         sys_openat2
> >  438  common  pidfd_getfd                     sys_pidfd_getfd
> > +439  common  process_madvise                 sys_process_madvise
> > diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/ke=
rnel/syscalls/syscall.tbl
> > index 35b61bfc1b1a..97eac48c2937 100644
> > --- a/arch/powerpc/kernel/syscalls/syscall.tbl
> > +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
> > @@ -519,3 +519,4 @@
> >  435  nospu   clone3                          ppc_clone3
> >  437  common  openat2                         sys_openat2
> >  438  common  pidfd_getfd                     sys_pidfd_getfd
> > +439  common  process_madvise                 sys_process_madvise
> > diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/s=
yscalls/syscall.tbl
> > index bd7bd3581a0f..8dc8bfd958ea 100644
> > --- a/arch/s390/kernel/syscalls/syscall.tbl
> > +++ b/arch/s390/kernel/syscalls/syscall.tbl
> > @@ -440,3 +440,4 @@
> >  435  common  clone3                  sys_clone3                      s=
ys_clone3
> >  437  common  openat2                 sys_openat2                     s=
ys_openat2
> >  438  common  pidfd_getfd             sys_pidfd_getfd                 s=
ys_pidfd_getfd
> > +439  common  process_madvise         sys_process_madvise             s=
ys_process_madvise
> > diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/sysca=
lls/syscall.tbl
> > index c7a30fcd135f..e69d98040777 100644
> > --- a/arch/sh/kernel/syscalls/syscall.tbl
> > +++ b/arch/sh/kernel/syscalls/syscall.tbl
> > @@ -440,3 +440,4 @@
> >  # 435 reserved for clone3
> >  437  common  openat2                         sys_openat2
> >  438  common  pidfd_getfd                     sys_pidfd_getfd
> > +439  common  process_madvise                 sys_process_madvise
> > diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel=
/syscalls/syscall.tbl
> > index f13615ecdecc..6f6e66dd51f9 100644
> > --- a/arch/sparc/kernel/syscalls/syscall.tbl
> > +++ b/arch/sparc/kernel/syscalls/syscall.tbl
> > @@ -483,3 +483,4 @@
> >  # 435 reserved for clone3
> >  437  common  openat2                 sys_openat2
> >  438  common  pidfd_getfd                     sys_pidfd_getfd
> > +439  common  process_madvise                 sys_process_madvise
> > diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/sy=
scalls/syscall_32.tbl
> > index c17cb77eb150..1b2184549e27 100644
> > --- a/arch/x86/entry/syscalls/syscall_32.tbl
> > +++ b/arch/x86/entry/syscalls/syscall_32.tbl
> > @@ -442,3 +442,4 @@
> >  435  i386    clone3                  sys_clone3                      _=
_ia32_sys_clone3
> >  437  i386    openat2                 sys_openat2                     _=
_ia32_sys_openat2
> >  438  i386    pidfd_getfd             sys_pidfd_getfd                 _=
_ia32_sys_pidfd_getfd
> > +439  i386    process_madvise         sys_process_madvise             _=
_ia32_sys_process_madvise
> > diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/sy=
scalls/syscall_64.tbl
> > index 44d510bc9b78..82d60eb1e00d 100644
> > --- a/arch/x86/entry/syscalls/syscall_64.tbl
> > +++ b/arch/x86/entry/syscalls/syscall_64.tbl
> > @@ -359,6 +359,7 @@
> >  435  common  clone3                  __x64_sys_clone3/ptregs
> >  437  common  openat2                 __x64_sys_openat2
> >  438  common  pidfd_getfd             __x64_sys_pidfd_getfd
> > +439  common  process_madvise         __x64_sys_process_madvise
> >
> >  #
> >  # x32-specific system call numbers start at 512 to avoid cache impact
> > diff --git a/arch/xtensa/kernel/syscalls/syscall.tbl b/arch/xtensa/kern=
el/syscalls/syscall.tbl
> > index 85a9ab1bc04d..165cae047770 100644
> > --- a/arch/xtensa/kernel/syscalls/syscall.tbl
> > +++ b/arch/xtensa/kernel/syscalls/syscall.tbl
> > @@ -408,3 +408,4 @@
> >  435  common  clone3                          sys_clone3
> >  437  common  openat2                         sys_openat2
> >  438  common  pidfd_getfd                     sys_pidfd_getfd
> > +439  common  process_madvise                 sys_process_madvise
> > diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
> > index 1815065d52f3..e4cd2c2f8bb4 100644
> > --- a/include/linux/syscalls.h
> > +++ b/include/linux/syscalls.h
> > @@ -876,6 +876,8 @@ asmlinkage long sys_munlockall(void);
> >  asmlinkage long sys_mincore(unsigned long start, size_t len,
> >                               unsigned char __user * vec);
> >  asmlinkage long sys_madvise(unsigned long start, size_t len, int behav=
ior);
> > +asmlinkage long sys_process_madvise(int pidfd, unsigned long start,
> > +                     size_t len, int behavior, unsigned long flags);
> >  asmlinkage long sys_remap_file_pages(unsigned long start, unsigned lon=
g size,
> >                       unsigned long prot, unsigned long pgoff,
> >                       unsigned long flags);
> > diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-gener=
ic/unistd.h
> > index 3a3201e4618e..fa289b91410e 100644
> > --- a/include/uapi/asm-generic/unistd.h
> > +++ b/include/uapi/asm-generic/unistd.h
> > @@ -855,9 +855,11 @@ __SYSCALL(__NR_clone3, sys_clone3)
> >  __SYSCALL(__NR_openat2, sys_openat2)
> >  #define __NR_pidfd_getfd 438
> >  __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
> > +#define __NR_process_madvise 439
> > +__SYSCALL(__NR_process_madvise, sys_process_madvise)
> >
> >  #undef __NR_syscalls
> > -#define __NR_syscalls 439
> > +#define __NR_syscalls 440
> >
> >  /*
> >   * 32 bit systems traditionally used different
> > diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
> > index 3b69a560a7ac..6c7332776e8e 100644
> > --- a/kernel/sys_ni.c
> > +++ b/kernel/sys_ni.c
> > @@ -280,6 +280,7 @@ COND_SYSCALL(mlockall);
> >  COND_SYSCALL(munlockall);
> >  COND_SYSCALL(mincore);
> >  COND_SYSCALL(madvise);
> > +COND_SYSCALL(process_madvise);
> >  COND_SYSCALL(remap_file_pages);
> >  COND_SYSCALL(mbind);
> >  COND_SYSCALL_COMPAT(mbind);
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index f75c86b6c463..f29155b8185d 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/falloc.h>
> >  #include <linux/fadvise.h>
> >  #include <linux/sched.h>
> > +#include <linux/sched/mm.h>
> >  #include <linux/ksm.h>
> >  #include <linux/fs.h>
> >  #include <linux/file.h>
> > @@ -986,6 +987,18 @@ madvise_behavior_valid(int behavior)
> >       }
> >  }
> >
> > +static bool
> > +process_madvise_behavior_valid(int behavior)
> > +{
> > +     switch (behavior) {
> > +     case MADV_COLD:
> > +     case MADV_PAGEOUT:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> >  /*/
> >   * The madvise(2) system call.
> >   *
> > @@ -1033,6 +1046,11 @@ madvise_behavior_valid(int behavior)
> >   *  MADV_DONTDUMP - the application wants to prevent pages in the give=
n range
> >   *           from being included in its core dump.
> >   *  MADV_DODUMP - cancel MADV_DONTDUMP: no longer exclude from core du=
mp.
> > + *  MADV_COLD - the application uses the memory less so the kernel can

"kernel can" implies that kernel might not deactivate the pages, which
IIUC is not the case. Maybe rephrase as "MADV_COLD - the application
is not expected to use this memory soon, deactivate pages in this
range so that they can be reclaimed easily if memory pressure
happens.""

> > + *           deactivate the memory to evict them quickly when the memo=
ry
> > + *           pressure happen.
> > + *  MADV_PAGEOUT - the application uses the memroy very rarely so kern=
el can

s/memroy/memory

> > + *           page out the memory instantly.

same nit about the usage of "kernel can". Maybe rephrase as
"MADV_PAGEOUT - the application is not expected to use this memory
soon, page out the pages in this range immediately.""

> >   *
> >   * return values:
> >   *  zero    - success
> > @@ -1150,3 +1168,49 @@ SYSCALL_DEFINE3(madvise, unsigned long, start, s=
ize_t, len_in, int, behavior)
> >  {
> >       return do_madvise(current, current->mm, start, len_in, behavior);
> >  }
> > +
> > +SYSCALL_DEFINE5(process_madvise, int, pidfd, unsigned long, start,
> > +             size_t, len_in, int, behavior, unsigned long, flags)
> > +{
> > +     int ret;
> > +     struct fd f;
> > +     struct pid *pid;
> > +     struct task_struct *task;
> > +     struct mm_struct *mm;
> > +
> > +     if (flags !=3D 0)
> > +             return -EINVAL;
> > +
> > +     if (!process_madvise_behavior_valid(behavior))
> > +             return -EINVAL;
> > +
> > +     f =3D fdget(pidfd);
> > +     if (!f.file)
> > +             return -EBADF;
> > +
> > +     pid =3D pidfd_pid(f.file);
> > +     if (IS_ERR(pid)) {
> > +             ret =3D PTR_ERR(pid);
> > +             goto fdput;
> > +     }
> > +
> > +     task =3D get_pid_task(pid, PIDTYPE_PID);
> > +     if (!task) {
> > +             ret =3D -ESRCH;
> > +             goto fdput;
> > +     }
> > +
> > +     mm =3D mm_access(task, PTRACE_MODE_ATTACH_FSCREDS);
> > +     if (IS_ERR_OR_NULL(mm)) {
> > +             ret =3D IS_ERR(mm) ? PTR_ERR(mm) : -ESRCH;
> > +             goto release_task;
> > +     }
> > +
> > +     ret =3D do_madvise(task, mm, start, len_in, behavior);
> > +     mmput(mm);
> > +release_task:
> > +     put_task_struct(task);
> > +fdput:
> > +     fdput(f);
> > +     return ret;
> > +}
> > --
> > 2.25.0.265.gbab2e86ba0-goog
> >
>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>
--===============2179852569159112963==--

