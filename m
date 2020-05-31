Content-Type: multipart/mixed; boundary="===============3796162054836716978=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 10517/14131] net/atm/ioctl.c:180:29: sparse: sparse: incorrect type in argument 2 (different address spaces)
Date: Sun, 31 May 2020 11:07:56 +0800
Message-ID: <202005311155.t4XPSTvd%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3796162054836716978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e7b08814b16b80a0bf76eeca16317f8c2ed23b8c
commit: a3929484af75ee524419edbbc4e9ce012c3d67c9 [10517/14131] atm: move co=
pyin from atm_getnames() into the caller
config: m68k-randconfig-s032-20200531 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-243-gc100a7ab-dirty
        git checkout a3929484af75ee524419edbbc4e9ce012c3d67c9
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Dm68k CF=3D'-fdiagnostic-prefix -D__CHECK_EN=
DIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   net/atm/ioctl.c:70:25: sparse: sparse: cast removes address space '<asn:=
1>' of expression
   net/atm/ioctl.c:70:25: sparse: sparse: cast removes address space '<asn:=
1>' of expression
   net/atm/ioctl.c:70:25: sparse: sparse: cast removes address space '<asn:=
1>' of expression
   net/atm/ioctl.c:70:25: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected void * @@     got int [noderef] <asn=
:1> * @@
   net/atm/ioctl.c:70:25: sparse:     expected void *
   net/atm/ioctl.c:70:25: sparse:     got int [noderef] <asn:1> *
   net/atm/ioctl.c:82:25: sparse: sparse: cast removes address space '<asn:=
1>' of expression
   net/atm/ioctl.c:82:25: sparse: sparse: cast removes address space '<asn:=
1>' of expression
   net/atm/ioctl.c:82:25: sparse: sparse: cast removes address space '<asn:=
1>' of expression
   net/atm/ioctl.c:82:25: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected void * @@     got int [noderef] <asn=
:1> * @@
   net/atm/ioctl.c:82:25: sparse:     expected void *
   net/atm/ioctl.c:82:25: sparse:     got int [noderef] <asn:1> *
   net/atm/ioctl.c:125:25: sparse: sparse: cast removes address space '<asn=
:1>' of expression
   net/atm/ioctl.c:125:25: sparse: sparse: cast removes address space '<asn=
:1>' of expression
   net/atm/ioctl.c:125:25: sparse: sparse: cast removes address space '<asn=
:1>' of expression
   net/atm/ioctl.c:125:25: sparse: sparse: incorrect type in argument 2 (di=
fferent address spaces) @@     expected void const * @@     got unsigned sh=
ort [noderef] [usertype] <asn:1> * @@
   net/atm/ioctl.c:125:25: sparse:     expected void const *
   net/atm/ioctl.c:125:25: sparse:     got unsigned short [noderef] [userty=
pe] <asn:1> *
   net/atm/ioctl.c:180:29: sparse: sparse: cast removes address space '<asn=
:1>' of expression
   net/atm/ioctl.c:180:29: sparse: sparse: cast removes address space '<asn=
:1>' of expression
   net/atm/ioctl.c:180:29: sparse: sparse: cast removes address space '<asn=
:1>' of expression
>> net/atm/ioctl.c:180:29: sparse: sparse: incorrect type in argument 2 (di=
fferent address spaces) @@     expected void const * @@     got void [noder=
ef] <asn:1> *[noderef] <asn:1> * @@
   net/atm/ioctl.c:180:29: sparse:     expected void const *
   net/atm/ioctl.c:180:29: sparse:     got void [noderef] <asn:1> *[noderef=
] <asn:1> *
--
   net/atm/resources.c:203:13: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:203:13: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:203:13: sparse: sparse: cast removes address space '=
<asn:1>' of expression
>> net/atm/resources.c:203:13: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void const * @@     got int [no=
deref] <asn:1> *iobuf_len @@
   net/atm/resources.c:203:13: sparse:     expected void const *
   net/atm/resources.c:203:13: sparse:     got int [noderef] <asn:1> *iobuf=
_len
   net/atm/resources.c:224:18: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:224:18: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:224:18: sparse: sparse: cast removes address space '=
<asn:1>' of expression
>> net/atm/resources.c:224:18: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void * @@     got int [noderef]=
 <asn:1> *iobuf_len @@
   net/atm/resources.c:224:18: sparse:     expected void *
   net/atm/resources.c:224:18: sparse:     got int [noderef] <asn:1> *iobuf=
_len
   net/atm/resources.c:256:21: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:256:21: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:256:21: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:256:21: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void const * @@     got void [n=
oderef] <asn:1> *[noderef] <asn:1> * @@
   net/atm/resources.c:256:21: sparse:     expected void const *
   net/atm/resources.c:256:21: sparse:     got void [noderef] <asn:1> *[nod=
eref] <asn:1> *
   net/atm/resources.c:258:21: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:258:21: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:258:21: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:258:21: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void const * @@     got int [no=
deref] <asn:1> * @@
   net/atm/resources.c:258:21: sparse:     expected void const *
   net/atm/resources.c:258:21: sparse:     got int [noderef] <asn:1> *
   net/atm/resources.c:260:21: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:260:21: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:260:21: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:260:21: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void const * @@     got int [no=
deref] <asn:1> * @@
   net/atm/resources.c:260:21: sparse:     expected void const *
   net/atm/resources.c:260:21: sparse:     got int [noderef] <asn:1> *
   net/atm/resources.c:380:25: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:380:25: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:380:25: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:380:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void * @@     got int [noderef]=
 <asn:1> *[assigned] sioc_len @@
   net/atm/resources.c:380:25: sparse:     expected void *
   net/atm/resources.c:380:25: sparse:     got int [noderef] <asn:1> *[assi=
gned] sioc_len
   net/atm/resources.c:423:25: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:423:25: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:423:25: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/atm/resources.c:423:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void * @@     got int [noderef]=
 <asn:1> *[assigned] sioc_len @@
   net/atm/resources.c:423:25: sparse:     expected void *
   net/atm/resources.c:423:25: sparse:     got int [noderef] <asn:1> *[assi=
gned] sioc_len

vim +180 net/atm/ioctl.c

    50	=

    51	static int do_vcc_ioctl(struct socket *sock, unsigned int cmd,
    52				unsigned long arg, int compat)
    53	{
    54		struct sock *sk =3D sock->sk;
    55		struct atm_vcc *vcc;
    56		int error;
    57		struct list_head *pos;
    58		void __user *argp =3D (void __user *)arg;
    59		void __user *buf;
    60		int __user *len;
    61	=

    62		vcc =3D ATM_SD(sock);
    63		switch (cmd) {
    64		case SIOCOUTQ:
    65			if (sock->state !=3D SS_CONNECTED ||
    66			    !test_bit(ATM_VF_READY, &vcc->flags)) {
    67				error =3D  -EINVAL;
    68				goto done;
    69			}
    70			error =3D put_user(sk->sk_sndbuf - sk_wmem_alloc_get(sk),
    71					 (int __user *)argp) ? -EFAULT : 0;
    72			goto done;
    73		case SIOCINQ:
    74		{
    75			struct sk_buff *skb;
    76	=

    77			if (sock->state !=3D SS_CONNECTED) {
    78				error =3D -EINVAL;
    79				goto done;
    80			}
    81			skb =3D skb_peek(&sk->sk_receive_queue);
    82			error =3D put_user(skb ? skb->len : 0,
    83					 (int __user *)argp) ? -EFAULT : 0;
    84			goto done;
    85		}
    86		case ATM_SETSC:
    87			net_warn_ratelimited("ATM_SETSC is obsolete; used by %s:%d\n",
    88					     current->comm, task_pid_nr(current));
    89			error =3D 0;
    90			goto done;
    91		case ATMSIGD_CTRL:
    92			if (!capable(CAP_NET_ADMIN)) {
    93				error =3D -EPERM;
    94				goto done;
    95			}
    96			/*
    97			 * The user/kernel protocol for exchanging signalling
    98			 * info uses kernel pointers as opaque references,
    99			 * so the holder of the file descriptor can scribble
   100			 * on the kernel... so we should make sure that we
   101			 * have the same privileges that /proc/kcore needs
   102			 */
   103			if (!capable(CAP_SYS_RAWIO)) {
   104				error =3D -EPERM;
   105				goto done;
   106			}
   107	#ifdef CONFIG_COMPAT
   108			/* WTF? I don't even want to _think_ about making this
   109			   work for 32-bit userspace. TBH I don't really want
   110			   to think about it at all. dwmw2. */
   111			if (compat) {
   112				net_warn_ratelimited("32-bit task cannot be atmsigd\n");
   113				error =3D -EINVAL;
   114				goto done;
   115			}
   116	#endif
   117			error =3D sigd_attach(vcc);
   118			if (!error)
   119				sock->state =3D SS_CONNECTED;
   120			goto done;
   121		case ATM_SETBACKEND:
   122		case ATM_NEWBACKENDIF:
   123		{
   124			atm_backend_t backend;
   125			error =3D get_user(backend, (atm_backend_t __user *)argp);
   126			if (error)
   127				goto done;
   128			switch (backend) {
   129			case ATM_BACKEND_PPP:
   130				request_module("pppoatm");
   131				break;
   132			case ATM_BACKEND_BR2684:
   133				request_module("br2684");
   134				break;
   135			}
   136			break;
   137		}
   138		case ATMMPC_CTRL:
   139		case ATMMPC_DATA:
   140			request_module("mpoa");
   141			break;
   142		case ATMARPD_CTRL:
   143			request_module("clip");
   144			break;
   145		case ATMLEC_CTRL:
   146			request_module("lec");
   147			break;
   148		}
   149	=

   150		error =3D -ENOIOCTLCMD;
   151	=

   152		mutex_lock(&ioctl_mutex);
   153		list_for_each(pos, &ioctl_list) {
   154			struct atm_ioctl *ic =3D list_entry(pos, struct atm_ioctl, list);
   155			if (try_module_get(ic->owner)) {
   156				error =3D ic->ioctl(sock, cmd, arg);
   157				module_put(ic->owner);
   158				if (error !=3D -ENOIOCTLCMD)
   159					break;
   160			}
   161		}
   162		mutex_unlock(&ioctl_mutex);
   163	=

   164		if (error !=3D -ENOIOCTLCMD)
   165			goto done;
   166	=

   167		if (cmd =3D=3D ATM_GETNAMES) {
   168			if (IS_ENABLED(CONFIG_COMPAT) && compat) {
   169	#ifdef CONFIG_COMPAT
   170				struct compat_atm_iobuf __user *ciobuf =3D argp;
   171				compat_uptr_t cbuf;
   172				len =3D &ciobuf->length;
   173				if (get_user(cbuf, &ciobuf->buffer))
   174					return -EFAULT;
   175				buf =3D compat_ptr(cbuf);
   176	#endif
   177			} else {
   178				struct atm_iobuf __user *iobuf =3D argp;
   179				len =3D &iobuf->length;
 > 180				if (get_user(buf, &iobuf->buffer))
   181					return -EFAULT;
   182			}
   183			error =3D atm_getnames(buf, len);
   184		} else {
   185			error =3D atm_dev_ioctl(cmd, argp, compat);
   186		}
   187	=

   188	done:
   189		return error;
   190	}
   191	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3796162054836716978==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3796162054836716978==--

