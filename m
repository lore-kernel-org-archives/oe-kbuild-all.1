Content-Type: multipart/mixed; boundary="===============7628307026053461804=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 5639/6402] net/ipv4/tcp_output.c:188:3: warning: result of comparison of constant -1 with expression of type 'u8' (aka 'unsigned char') is always false
Date: Tue, 19 May 2020 23:50:06 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E6624952648AE3@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <20200519195214.GA1958892@ubuntu-s3-xlarge-x86>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7628307026053461804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: Re: [linux-next:master 5639/6402] net/ipv4/tcp_output.c:188:3: w=
arning:
> result of comparison of constant -1 with expression of type 'u8' (aka 'un=
signed
> char') is always false
> =

> On Wed, May 20, 2020 at 12:09:47AM +0800, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   dfd71d381f7e1aa118e0368774aa05f5c4a48870
> > commit: 2b195850128f5bafde177b12489d9fa27962cc1e [5639/6402] tcp: add t=
p-
> >dup_ack_counter
> > config: x86_64-randconfig-r012-20200519 (attached as .config)
> > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project
> 135b877874fae96b4372c8a3fbfaa8ff44ff86e3)
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-
> tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         git checkout 2b195850128f5bafde177b12489d9fa27962cc1e
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang
> make.cross ARCH=3Dx86_64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> net/ipv4/tcp_output.c:188:3: warning: result of comparison of consta=
nt -1 with
> expression of type 'u8' (aka 'unsigned char') is always false [-Wtautolog=
ical-
> constant-out-of-range-compare]
> > NET_ADD_STATS(sock_net(sk), LINUX_MIB_TCPACKCOMPRESSED,
> > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > include/net/ip.h:293:41: note: expanded from macro 'NET_ADD_STATS'
> > #define NET_ADD_STATS(net, field, adnd) SNMP_ADD_STATS((net)-
> >mib.net_statistics, field, adnd)
> > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > include/net/snmp.h:143:4: note: expanded from macro 'SNMP_ADD_STATS'
> > this_cpu_add(mib->mibs[field], addend)
> > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu=
_add'
> > #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_,=
 pcp, val)
> > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see
> all)
> > <scratch space>:292:1: note: expanded from here
> > this_cpu_add_8
> > ^
> > arch/x86/include/asm/percpu.h:492:35: note: expanded from macro
> 'this_cpu_add_8'
> > #define this_cpu_add_8(pcp, val)                percpu_add_op(volatile,=
 (pcp), val)
> > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > arch/x86/include/asm/percpu.h:131:31: note: expanded from macro
> 'percpu_add_op'
> > ((val) =3D=3D 1 || (val) =3D=3D -1)) ?                                 =
                           ~~~~~ ^  ~~
> > 1 warning generated.
> =

> This warning is supposed to be disabled under a regular build, is W=3D1
> being turned on (see scripts/Makefile.extrawarn)?
Yes, this is turned on. Do you have any suggestion/comments for this, we can
further tune the make command?

> =

> Cheers,
> Nathan

--===============7628307026053461804==--

