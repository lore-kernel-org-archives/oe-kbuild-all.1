Content-Type: multipart/mixed; boundary="===============2840836545250033517=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 788/14131] net/bluetooth/l2cap_sock.c:676:21: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Sun, 31 May 2020 08:14:31 +0800
Message-ID: <202005310829.up1UybHX%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2840836545250033517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e7b08814b16b80a0bf76eeca16317f8c2ed23b8c
commit: 3ee7b7cd83900bb711efadbf16fa096a615a1566 [788/14131] Bluetooth: Add=
 BT_MODE socket option
config: m68k-randconfig-s032-20200531 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-243-gc100a7ab-dirty
        git checkout 3ee7b7cd83900bb711efadbf16fa096a615a1566
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Dm68k CF=3D'-fdiagnostic-prefix -D__CHECK_EN=
DIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   net/bluetooth/l2cap_sock.c:428:13: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:428:13: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:428:13: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:428:13: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void const * @@     got =
int [noderef] <asn:1> *optlen @@
   net/bluetooth/l2cap_sock.c:428:13: sparse:     expected void const *
   net/bluetooth/l2cap_sock.c:428:13: sparse:     got int [noderef] <asn:1>=
 *optlen
   net/bluetooth/l2cap_sock.c:503:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:503:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:503:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:503:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void * @@     got unsign=
ed int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:503:21: sparse:     expected void *
   net/bluetooth/l2cap_sock.c:503:21: sparse:     got unsigned int [noderef=
] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:553:13: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:553:13: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:553:13: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:553:13: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void const * @@     got =
int [noderef] <asn:1> *optlen @@
   net/bluetooth/l2cap_sock.c:553:13: sparse:     expected void const *
   net/bluetooth/l2cap_sock.c:553:13: sparse:     got int [noderef] <asn:1>=
 *optlen
   net/bluetooth/l2cap_sock.c:589:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:589:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:589:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:589:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void * @@     got unsign=
ed int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:589:21: sparse:     expected void *
   net/bluetooth/l2cap_sock.c:589:21: sparse:     got unsigned int [noderef=
] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:596:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:596:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:596:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:596:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void * @@     got unsign=
ed int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:596:21: sparse:     expected void *
   net/bluetooth/l2cap_sock.c:596:21: sparse:     got unsigned int [noderef=
] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:618:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:618:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:618:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:618:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void * @@     got unsign=
ed int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:618:21: sparse:     expected void *
   net/bluetooth/l2cap_sock.c:618:21: sparse:     got unsigned int [noderef=
] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:633:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:633:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:633:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:633:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void * @@     got unsign=
ed short [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:633:21: sparse:     expected void *
   net/bluetooth/l2cap_sock.c:633:21: sparse:     got unsigned short [noder=
ef] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:643:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:643:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:643:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:643:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void * @@     got unsign=
ed short [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:643:21: sparse:     expected void *
   net/bluetooth/l2cap_sock.c:643:21: sparse:     got unsigned short [noder=
ef] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:655:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:655:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:655:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:655:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void * @@     got unsign=
ed int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:655:21: sparse:     expected void *
   net/bluetooth/l2cap_sock.c:655:21: sparse:     got unsigned int [noderef=
] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:676:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:676:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:676:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
>> net/bluetooth/l2cap_sock.c:676:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void * @@     got unsign=
ed char [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:676:21: sparse:     expected void *
   net/bluetooth/l2cap_sock.c:676:21: sparse:     got unsigned char [nodere=
f] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:785:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:785:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:785:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:785:21: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void const * @@     got =
unsigned int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:785:21: sparse:     expected void const *
   net/bluetooth/l2cap_sock.c:785:21: sparse:     got unsigned int [noderef=
] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:942:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:942:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:942:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:942:21: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void const * @@     got =
unsigned int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:942:21: sparse:     expected void const *
   net/bluetooth/l2cap_sock.c:942:21: sparse:     got unsigned int [noderef=
] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:957:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:957:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:957:21: sparse: sparse: cast removes address =
space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:957:21: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void const * @@     got =
unsigned int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:957:21: sparse:     expected void const *
   net/bluetooth/l2cap_sock.c:957:21: sparse:     got unsigned int [noderef=
] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:1005:21: sparse: sparse: cast removes address=
 space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:1005:21: sparse: sparse: cast removes address=
 space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:1005:21: sparse: sparse: cast removes address=
 space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:1005:21: sparse: sparse: incorrect type in ar=
gument 2 (different address spaces) @@     expected void const * @@     got=
 unsigned int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:1005:21: sparse:     expected void const *
   net/bluetooth/l2cap_sock.c:1005:21: sparse:     got unsigned int [nodere=
f] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:1053:21: sparse: sparse: cast removes address=
 space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:1053:21: sparse: sparse: cast removes address=
 space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:1053:21: sparse: sparse: cast removes address=
 space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:1053:21: sparse: sparse: incorrect type in ar=
gument 2 (different address spaces) @@     expected void const * @@     got=
 unsigned short [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:1053:21: sparse:     expected void const *
   net/bluetooth/l2cap_sock.c:1053:21: sparse:     got unsigned short [node=
ref] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:1084:21: sparse: sparse: cast removes address=
 space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:1084:21: sparse: sparse: cast removes address=
 space '<asn:1>' of expression
   net/bluetooth/l2cap_sock.c:1084:21: sparse: sparse: cast removes address=
 space '<asn:1>' of expression
>> net/bluetooth/l2cap_sock.c:1084:21: sparse: sparse: incorrect type in ar=
gument 2 (different address spaces) @@     expected void const * @@     got=
 unsigned char [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:1084:21: sparse:     expected void const *
   net/bluetooth/l2cap_sock.c:1084:21: sparse:     got unsigned char [noder=
ef] [usertype] <asn:1> *

vim +676 net/bluetooth/l2cap_sock.c

   534	=

   535	static int l2cap_sock_getsockopt(struct socket *sock, int level, int=
 optname,
   536					 char __user *optval, int __user *optlen)
   537	{
   538		struct sock *sk =3D sock->sk;
   539		struct l2cap_chan *chan =3D l2cap_pi(sk)->chan;
   540		struct bt_security sec;
   541		struct bt_power pwr;
   542		u32 phys;
   543		int len, mode, err =3D 0;
   544	=

   545		BT_DBG("sk %p", sk);
   546	=

   547		if (level =3D=3D SOL_L2CAP)
   548			return l2cap_sock_getsockopt_old(sock, optname, optval, optlen);
   549	=

   550		if (level !=3D SOL_BLUETOOTH)
   551			return -ENOPROTOOPT;
   552	=

   553		if (get_user(len, optlen))
   554			return -EFAULT;
   555	=

   556		lock_sock(sk);
   557	=

   558		switch (optname) {
   559		case BT_SECURITY:
   560			if (chan->chan_type !=3D L2CAP_CHAN_CONN_ORIENTED &&
   561			    chan->chan_type !=3D L2CAP_CHAN_FIXED &&
   562			    chan->chan_type !=3D L2CAP_CHAN_RAW) {
   563				err =3D -EINVAL;
   564				break;
   565			}
   566	=

   567			memset(&sec, 0, sizeof(sec));
   568			if (chan->conn) {
   569				sec.level =3D chan->conn->hcon->sec_level;
   570	=

   571				if (sk->sk_state =3D=3D BT_CONNECTED)
   572					sec.key_size =3D chan->conn->hcon->enc_key_size;
   573			} else {
   574				sec.level =3D chan->sec_level;
   575			}
   576	=

   577			len =3D min_t(unsigned int, len, sizeof(sec));
   578			if (copy_to_user(optval, (char *) &sec, len))
   579				err =3D -EFAULT;
   580	=

   581			break;
   582	=

   583		case BT_DEFER_SETUP:
   584			if (sk->sk_state !=3D BT_BOUND && sk->sk_state !=3D BT_LISTEN) {
   585				err =3D -EINVAL;
   586				break;
   587			}
   588	=

   589			if (put_user(test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags),
   590				     (u32 __user *) optval))
   591				err =3D -EFAULT;
   592	=

   593			break;
   594	=

   595		case BT_FLUSHABLE:
   596			if (put_user(test_bit(FLAG_FLUSHABLE, &chan->flags),
   597				     (u32 __user *) optval))
   598				err =3D -EFAULT;
   599	=

   600			break;
   601	=

   602		case BT_POWER:
   603			if (sk->sk_type !=3D SOCK_SEQPACKET && sk->sk_type !=3D SOCK_STREAM
   604			    && sk->sk_type !=3D SOCK_RAW) {
   605				err =3D -EINVAL;
   606				break;
   607			}
   608	=

   609			pwr.force_active =3D test_bit(FLAG_FORCE_ACTIVE, &chan->flags);
   610	=

   611			len =3D min_t(unsigned int, len, sizeof(pwr));
   612			if (copy_to_user(optval, (char *) &pwr, len))
   613				err =3D -EFAULT;
   614	=

   615			break;
   616	=

   617		case BT_CHANNEL_POLICY:
   618			if (put_user(chan->chan_policy, (u32 __user *) optval))
   619				err =3D -EFAULT;
   620			break;
   621	=

   622		case BT_SNDMTU:
   623			if (!bdaddr_type_is_le(chan->src_type)) {
   624				err =3D -EINVAL;
   625				break;
   626			}
   627	=

   628			if (sk->sk_state !=3D BT_CONNECTED) {
   629				err =3D -ENOTCONN;
   630				break;
   631			}
   632	=

   633			if (put_user(chan->omtu, (u16 __user *) optval))
   634				err =3D -EFAULT;
   635			break;
   636	=

   637		case BT_RCVMTU:
   638			if (!bdaddr_type_is_le(chan->src_type)) {
   639				err =3D -EINVAL;
   640				break;
   641			}
   642	=

   643			if (put_user(chan->imtu, (u16 __user *) optval))
   644				err =3D -EFAULT;
   645			break;
   646	=

   647		case BT_PHY:
   648			if (sk->sk_state !=3D BT_CONNECTED) {
   649				err =3D -ENOTCONN;
   650				break;
   651			}
   652	=

   653			phys =3D hci_conn_get_phy(chan->conn->hcon);
   654	=

   655			if (put_user(phys, (u32 __user *) optval))
   656				err =3D -EFAULT;
   657			break;
   658	=

   659		case BT_MODE:
   660			if (!enable_ecred) {
   661				err =3D -ENOPROTOOPT;
   662				break;
   663			}
   664	=

   665			if (chan->chan_type !=3D L2CAP_CHAN_CONN_ORIENTED) {
   666				err =3D -EINVAL;
   667				break;
   668			}
   669	=

   670			mode =3D l2cap_get_mode(chan);
   671			if (mode < 0) {
   672				err =3D mode;
   673				break;
   674			}
   675	=

 > 676			if (put_user(mode, (u8 __user *) optval))
   677				err =3D -EFAULT;
   678			break;
   679	=

   680		default:
   681			err =3D -ENOPROTOOPT;
   682			break;
   683		}
   684	=

   685		release_sock(sk);
   686		return err;
   687	}
   688	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2840836545250033517==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2840836545250033517==--

