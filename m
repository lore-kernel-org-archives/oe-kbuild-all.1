Content-Type: multipart/mixed; boundary="===============2427173017555129113=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RPC PATCH bpf-next] bpf: implement new BPF_CGROUP_INET_SOCK_POST_CONNECT
Date: Fri, 15 Jan 2021 21:38:05 +0800
Message-ID: <202101152127.O4aQh67z-lkp@intel.com>
In-Reply-To: <1627e0f688c7de7fe291b09c524c7fbb55cfe367.1610669653.git.sdf@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2427173017555129113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Stanislav,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Stanislav-Fomichev/bpf-imp=
lement-new-BPF_CGROUP_INET_SOCK_POST_CONNECT/20210115-112524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
config: powerpc64-randconfig-r021-20210115 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 5b42fd=
8dd4e7e29125a09a41a33af7c9cb57d144)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://github.com/0day-ci/linux/commit/342141c74fe4ece77f9d97539=
18a77e66d9d3316
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stanislav-Fomichev/bpf-implement-n=
ew-BPF_CGROUP_INET_SOCK_POST_CONNECT/20210115-112524
        git checkout 342141c74fe4ece77f9d9753918a77e66d9d3316
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   __do_insb
   ^
   arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do_in=
sb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/ipv4/af_inet.c:81:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:100:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_in=
sw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/ipv4/af_inet.c:81:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:102:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/ipv4/af_inet.c:81:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:104:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/ipv4/af_inet.c:81:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:106:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/ipv4/af_inet.c:81:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:108:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> net/ipv4/af_inet.c:579:9: error: implicit declaration of function 'BPF_C=
GROUP_RUN_PROG_INET_SOCK_POST_CONNECT_LOCKED' [-Werror,-Wimplicit-function-=
declaration]
                   err =3D BPF_CGROUP_RUN_PROG_INET_SOCK_POST_CONNECT_LOCKE=
D(sk);
                         ^
>> net/ipv4/af_inet.c:730:9: error: implicit declaration of function 'BPF_C=
GROUP_RUN_PROG_INET_SOCK_POST_CONNECT' [-Werror,-Wimplicit-function-declara=
tion]
                   err =3D BPF_CGROUP_RUN_PROG_INET_SOCK_POST_CONNECT(sock-=
>sk);
                         ^
   6 warnings and 2 errors generated.


vim +/BPF_CGROUP_RUN_PROG_INET_SOCK_POST_CONNECT_LOCKED +579 net/ipv4/af_in=
et.c

   557	=

   558	int inet_dgram_connect(struct socket *sock, struct sockaddr *uaddr,
   559			       int addr_len, int flags)
   560	{
   561		struct sock *sk =3D sock->sk;
   562		int err;
   563	=

   564		if (addr_len < sizeof(uaddr->sa_family))
   565			return -EINVAL;
   566		if (uaddr->sa_family =3D=3D AF_UNSPEC)
   567			return sk->sk_prot->disconnect(sk, flags);
   568	=

   569		if (BPF_CGROUP_PRE_CONNECT_ENABLED(sk)) {
   570			err =3D sk->sk_prot->pre_connect(sk, uaddr, addr_len);
   571			if (err)
   572				return err;
   573		}
   574	=

   575		if (!inet_sk(sk)->inet_num && inet_autobind(sk))
   576			return -EAGAIN;
   577		err =3D sk->sk_prot->connect(sk, uaddr, addr_len);
   578		if (!err)
 > 579			err =3D BPF_CGROUP_RUN_PROG_INET_SOCK_POST_CONNECT_LOCKED(sk);
   580		return err;
   581	}
   582	EXPORT_SYMBOL(inet_dgram_connect);
   583	=

   584	static long inet_wait_for_connect(struct sock *sk, long timeo, int w=
ritebias)
   585	{
   586		DEFINE_WAIT_FUNC(wait, woken_wake_function);
   587	=

   588		add_wait_queue(sk_sleep(sk), &wait);
   589		sk->sk_write_pending +=3D writebias;
   590	=

   591		/* Basic assumption: if someone sets sk->sk_err, he _must_
   592		 * change state of the socket from TCP_SYN_*.
   593		 * Connect() does not allow to get error notifications
   594		 * without closing the socket.
   595		 */
   596		while ((1 << sk->sk_state) & (TCPF_SYN_SENT | TCPF_SYN_RECV)) {
   597			release_sock(sk);
   598			timeo =3D wait_woken(&wait, TASK_INTERRUPTIBLE, timeo);
   599			lock_sock(sk);
   600			if (signal_pending(current) || !timeo)
   601				break;
   602		}
   603		remove_wait_queue(sk_sleep(sk), &wait);
   604		sk->sk_write_pending -=3D writebias;
   605		return timeo;
   606	}
   607	=

   608	/*
   609	 *	Connect to a remote host. There is regrettably still a little
   610	 *	TCP 'magic' in here.
   611	 */
   612	int __inet_stream_connect(struct socket *sock, struct sockaddr *uadd=
r,
   613				  int addr_len, int flags, int is_sendmsg)
   614	{
   615		struct sock *sk =3D sock->sk;
   616		int err;
   617		long timeo;
   618	=

   619		/*
   620		 * uaddr can be NULL and addr_len can be 0 if:
   621		 * sk is a TCP fastopen active socket and
   622		 * TCP_FASTOPEN_CONNECT sockopt is set and
   623		 * we already have a valid cookie for this socket.
   624		 * In this case, user can call write() after connect().
   625		 * write() will invoke tcp_sendmsg_fastopen() which calls
   626		 * __inet_stream_connect().
   627		 */
   628		if (uaddr) {
   629			if (addr_len < sizeof(uaddr->sa_family))
   630				return -EINVAL;
   631	=

   632			if (uaddr->sa_family =3D=3D AF_UNSPEC) {
   633				err =3D sk->sk_prot->disconnect(sk, flags);
   634				sock->state =3D err ? SS_DISCONNECTING : SS_UNCONNECTED;
   635				goto out;
   636			}
   637		}
   638	=

   639		switch (sock->state) {
   640		default:
   641			err =3D -EINVAL;
   642			goto out;
   643		case SS_CONNECTED:
   644			err =3D -EISCONN;
   645			goto out;
   646		case SS_CONNECTING:
   647			if (inet_sk(sk)->defer_connect)
   648				err =3D is_sendmsg ? -EINPROGRESS : -EISCONN;
   649			else
   650				err =3D -EALREADY;
   651			/* Fall out of switch with err, set for this state */
   652			break;
   653		case SS_UNCONNECTED:
   654			err =3D -EISCONN;
   655			if (sk->sk_state !=3D TCP_CLOSE)
   656				goto out;
   657	=

   658			if (BPF_CGROUP_PRE_CONNECT_ENABLED(sk)) {
   659				err =3D sk->sk_prot->pre_connect(sk, uaddr, addr_len);
   660				if (err)
   661					goto out;
   662			}
   663	=

   664			err =3D sk->sk_prot->connect(sk, uaddr, addr_len);
   665			if (err < 0)
   666				goto out;
   667	=

   668			sock->state =3D SS_CONNECTING;
   669	=

   670			if (!err && inet_sk(sk)->defer_connect)
   671				goto out;
   672	=

   673			/* Just entered SS_CONNECTING state; the only
   674			 * difference is that return value in non-blocking
   675			 * case is EINPROGRESS, rather than EALREADY.
   676			 */
   677			err =3D -EINPROGRESS;
   678			break;
   679		}
   680	=

   681		timeo =3D sock_sndtimeo(sk, flags & O_NONBLOCK);
   682	=

   683		if ((1 << sk->sk_state) & (TCPF_SYN_SENT | TCPF_SYN_RECV)) {
   684			int writebias =3D (sk->sk_protocol =3D=3D IPPROTO_TCP) &&
   685					tcp_sk(sk)->fastopen_req &&
   686					tcp_sk(sk)->fastopen_req->data ? 1 : 0;
   687	=

   688			/* Error code is set above */
   689			if (!timeo || !inet_wait_for_connect(sk, timeo, writebias))
   690				goto out;
   691	=

   692			err =3D sock_intr_errno(timeo);
   693			if (signal_pending(current))
   694				goto out;
   695		}
   696	=

   697		/* Connection was closed by RST, timeout, ICMP error
   698		 * or another process disconnected us.
   699		 */
   700		if (sk->sk_state =3D=3D TCP_CLOSE)
   701			goto sock_error;
   702	=

   703		/* sk->sk_err may be not zero now, if RECVERR was ordered by user
   704		 * and error was received after socket entered established state.
   705		 * Hence, it is handled normally after connect() return successfull=
y.
   706		 */
   707	=

   708		sock->state =3D SS_CONNECTED;
   709		err =3D 0;
   710	out:
   711		return err;
   712	=

   713	sock_error:
   714		err =3D sock_error(sk) ? : -ECONNABORTED;
   715		sock->state =3D SS_UNCONNECTED;
   716		if (sk->sk_prot->disconnect(sk, flags))
   717			sock->state =3D SS_DISCONNECTING;
   718		goto out;
   719	}
   720	EXPORT_SYMBOL(__inet_stream_connect);
   721	=

   722	int inet_stream_connect(struct socket *sock, struct sockaddr *uaddr,
   723				int addr_len, int flags)
   724	{
   725		int err;
   726	=

   727		lock_sock(sock->sk);
   728		err =3D __inet_stream_connect(sock, uaddr, addr_len, flags, 0);
   729		if (!err)
 > 730			err =3D BPF_CGROUP_RUN_PROG_INET_SOCK_POST_CONNECT(sock->sk);
   731		release_sock(sock->sk);
   732		return err;
   733	}
   734	EXPORT_SYMBOL(inet_stream_connect);
   735	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2427173017555129113==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
oSHdipS4hG6sNlomvq5iaP0PbMauUsuFAQA=
--===============2427173017555129113==--

