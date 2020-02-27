Content-Type: multipart/mixed; boundary="===============0841975227057417948=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 2/2] net: datagram: drop 'destructor' argument from several helpers
Date: Fri, 28 Feb 2020 06:19:39 +0800
Message-ID: <202002280625.J2ZRBDmx%lkp@intel.com>
In-Reply-To: <42639d3f3b1da6959ed42c683780c48a8fe08f4e.1582802470.git.pabeni@redhat.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0841975227057417948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master linus/master v5.6-rc3 next-20200227]
[cannot apply to ipvs/master sparc-next/master]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Paolo-Abeni/net-cleanup-da=
tagram-receive-helpers/20200227-214333
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
2b99e54b30ed56201dedd91e6049ed83aa9d2302
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> net/xfrm/espintcp.c:103:34: sparse: sparse: too many arguments for funct=
ion __skb_recv_datagram

vim +103 net/xfrm/espintcp.c

e27cca96cd68fa Sabrina Dubroca 2019-11-25   91  =

e27cca96cd68fa Sabrina Dubroca 2019-11-25   92  static int espintcp_recvmsg=
(struct sock *sk, struct msghdr *msg, size_t len,
e27cca96cd68fa Sabrina Dubroca 2019-11-25   93  			    int nonblock, int fl=
ags, int *addr_len)
e27cca96cd68fa Sabrina Dubroca 2019-11-25   94  {
e27cca96cd68fa Sabrina Dubroca 2019-11-25   95  	struct espintcp_ctx *ctx =
=3D espintcp_getctx(sk);
e27cca96cd68fa Sabrina Dubroca 2019-11-25   96  	struct sk_buff *skb;
e27cca96cd68fa Sabrina Dubroca 2019-11-25   97  	int err =3D 0;
e27cca96cd68fa Sabrina Dubroca 2019-11-25   98  	int copied;
e27cca96cd68fa Sabrina Dubroca 2019-11-25   99  	int off =3D 0;
e27cca96cd68fa Sabrina Dubroca 2019-11-25  100  =

e27cca96cd68fa Sabrina Dubroca 2019-11-25  101  	flags |=3D nonblock ? MSG_=
DONTWAIT : 0;
e27cca96cd68fa Sabrina Dubroca 2019-11-25  102  =

e27cca96cd68fa Sabrina Dubroca 2019-11-25 @103  	skb =3D __skb_recv_datagra=
m(sk, &ctx->ike_queue, flags, NULL, &off, &err);
e27cca96cd68fa Sabrina Dubroca 2019-11-25  104  	if (!skb)
e27cca96cd68fa Sabrina Dubroca 2019-11-25  105  		return err;
e27cca96cd68fa Sabrina Dubroca 2019-11-25  106  =

e27cca96cd68fa Sabrina Dubroca 2019-11-25  107  	copied =3D len;
e27cca96cd68fa Sabrina Dubroca 2019-11-25  108  	if (copied > skb->len)
e27cca96cd68fa Sabrina Dubroca 2019-11-25  109  		copied =3D skb->len;
e27cca96cd68fa Sabrina Dubroca 2019-11-25  110  	else if (copied < skb->len)
e27cca96cd68fa Sabrina Dubroca 2019-11-25  111  		msg->msg_flags |=3D MSG_T=
RUNC;
e27cca96cd68fa Sabrina Dubroca 2019-11-25  112  =

e27cca96cd68fa Sabrina Dubroca 2019-11-25  113  	err =3D skb_copy_datagram_=
msg(skb, 0, msg, copied);
e27cca96cd68fa Sabrina Dubroca 2019-11-25  114  	if (unlikely(err)) {
e27cca96cd68fa Sabrina Dubroca 2019-11-25  115  		kfree_skb(skb);
e27cca96cd68fa Sabrina Dubroca 2019-11-25  116  		return err;
e27cca96cd68fa Sabrina Dubroca 2019-11-25  117  	}
e27cca96cd68fa Sabrina Dubroca 2019-11-25  118  =

e27cca96cd68fa Sabrina Dubroca 2019-11-25  119  	if (flags & MSG_TRUNC)
e27cca96cd68fa Sabrina Dubroca 2019-11-25  120  		copied =3D skb->len;
e27cca96cd68fa Sabrina Dubroca 2019-11-25  121  	kfree_skb(skb);
e27cca96cd68fa Sabrina Dubroca 2019-11-25  122  	return copied;
e27cca96cd68fa Sabrina Dubroca 2019-11-25  123  }
e27cca96cd68fa Sabrina Dubroca 2019-11-25  124  =


:::::: The code at line 103 was first introduced by commit
:::::: e27cca96cd68fa2c6814c90f9a1cfd36bb68c593 xfrm: add espintcp (RFC 822=
9)

:::::: TO: Sabrina Dubroca <sd@queasysnail.net>
:::::: CC: Steffen Klassert <steffen.klassert@secunet.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0841975227057417948==--

