Content-Type: multipart/mixed; boundary="===============1433884342783905973=="
MIME-Version: 1.0
From: Guenter Roeck <groeck@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [chrome-os:chromeos-4.4 6/7] ld.lld: error: failed to open net/core/built-in.o: Cannot allocate memory
Date: Sat, 16 May 2020 07:37:49 -0700
Message-ID: <CABXOdTcgeHkJVF__dAuUZs0ckFfjPeWfZJiTpC9Yxjh92e3ZQQ@mail.gmail.com>
In-Reply-To: <20200516105649.GA6306@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1433884342783905973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2020 at 3:58 AM Philip Li <philip.li@intel.com> wrote:
>
> On Sat, May 16, 2020 at 04:12:20PM +0800, kbuild test robot wrote:
> > tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel=
 chromeos-4.4
> > head:   d1974a0cf5157a22d0e7eaba08dff5500e37032a
> > commit: 9e1905b2a89a9b80b8b4c647c413e7259c9ae671 [6/7] UPSTREAM: drm: e=
nsure atomic messages consistently include the name of the component
> > config: x86_64-randconfig-a016-20200515 (attached as .config)
> > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project b3=
1cb3aa5ee7ea92d830b06a0a7e42c7f2791dd4)
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         git checkout 9e1905b2a89a9b80b8b4c647c413e7259c9ae671
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dx86_64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > terminate called after throwing an instance of 'std::system_error'
> > what():  Resource temporarily unavailable
> > PLEASE submit a bug report to https://bugs.llvm.org/ and include the cr=
ash backtrace.
> sorry, kindly ignore this report, it should only be sent to clang list.
>
No worries.

Guenter

> > >> ld.lld: error: failed to open net/core/built-in.o: Cannot allocate m=
emory
> > #0 0x000056360e88735a llvm::sys::PrintStackTrace(llvm::raw_ostream&) (/=
opt/cross/clang-b31cb3aa5e/bin/lld+0x8a335a)
> > #1 0x000056360e885295 llvm::sys::RunSignalHandlers() (/opt/cross/clang-=
b31cb3aa5e/bin/lld+0x8a1295)
> > #2 0x000056360e8853b2 SignalHandler(int) (/opt/cross/clang-b31cb3aa5e/b=
in/lld+0x8a13b2)
> > #3 0x00007fcbb88dc110 __restore_rt (/lib/x86_64-linux-gnu/libpthread.so=
.0+0x14110)
> > #4 0x00007fcbb8402781 raise (/lib/x86_64-linux-gnu/libc.so.6+0x3b781)
> > #5 0x00007fcbb83ec55b abort (/lib/x86_64-linux-gnu/libc.so.6+0x2555b)
> > #6 0x00007fcbb878580c (/usr/lib/x86_64-linux-gnu/libstdc++.so.6+0x9a80c)
> > #7 0x00007fcbb87908f6 (/usr/lib/x86_64-linux-gnu/libstdc++.so.6+0xa58f6)
> > #8 0x00007fcbb8790961 (/usr/lib/x86_64-linux-gnu/libstdc++.so.6+0xa5961)
> > #9 0x00007fcbb8790bf5 (/usr/lib/x86_64-linux-gnu/libstdc++.so.6+0xa5bf5)
> > #10 0x00007fcbb8788478 std::__throw_system_error(int) (/usr/lib/x86_64-=
linux-gnu/libstdc++.so.6+0x9d478)
> > #11 0x00007fcbb87b9e69 (/usr/lib/x86_64-linux-gnu/libstdc++.so.6+0xcee6=
9)
> > #12 0x000056361114d734 std::thread::_State_impl<std::_Bind_simple<llvm:=
:parallel::detail::(anonymous namespace)::ThreadPoolExecutor::ThreadPoolExe=
cutor(llvm::ThreadPoolStrategy)::'lambda'() ()> >::_M_run() (/opt/cross/cla=
ng-b31cb3aa5e/bin/lld+0x3169734)
> > #13 0x00007fcbb87b9be0 (/usr/lib/x86_64-linux-gnu/libstdc++.so.6+0xcebe=
0)
> > #14 0x00007fcbb88d0f27 start_thread (/lib/x86_64-linux-gnu/libpthread.s=
o.0+0x8f27)
> > #15 0x00007fcbb84c431f clone (/lib/x86_64-linux-gnu/libc.so.6+0xfd31f)
> > /bin/bash: line 1: 58610 Aborted                 ld.lld -z max-page-siz=
e=3D0x200000 -r -o net/core/built-in.o net/core/sock.o net/core/request_soc=
k.o net/core/skbuff.o net/core/datagram.o net/core/stream.o net/core/scm.o =
net/core/gen_stats.o net/core/gen_estimator.o net/core/net_namespace.o net/=
core/secure_seq.o net/core/flow_dissector.o net/core/sysctl_net_core.o net/=
core/dev.o net/core/ethtool.o net/core/dev_addr_lists.o net/core/dst.o net/=
core/netevent.o net/core/neighbour.o net/core/rtnetlink.o net/core/utils.o =
net/core/link_watch.o net/core/filter.o net/core/sock_diag.o net/core/dev_i=
octl.o net/core/tso.o net/core/flow.o net/core/net-sysfs.o net/core/net-pro=
cfs.o net/core/fib_rules.o net/core/net-traces.o net/core/lwtunnel.o net/co=
re/dst_cache.o
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
>
> > _______________________________________________
> > kbuild-all mailing list -- kbuild-all(a)lists.01.org
> > To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
>
--===============1433884342783905973==--

