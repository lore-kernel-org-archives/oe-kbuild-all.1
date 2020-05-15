Content-Type: multipart/mixed; boundary="===============1386872247613761193=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 812/9662] net/bluetooth/l2cap_sock.c:676:21: sparse: sparse: incorrect type in initializer (different address spaces)
Date: Sat, 16 May 2020 06:59:14 +0800
Message-ID: <202005160611.4ao7oDgR%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1386872247613761193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   bdecf38f228bcca73b31ada98b5b7ba1215eb9c9
commit: 3ee7b7cd83900bb711efadbf16fa096a615a1566 [812/9662] Bluetooth: Add =
BT_MODE socket option
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout 3ee7b7cd83900bb711efadbf16fa096a615a1566
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   ./arch/xtensa/include/generated/uapi/asm/unistd_32.h:393:41: sparse: spa=
rse: no newline at end of file
   net/bluetooth/l2cap_sock.c:428:13: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected int const *__gu_addr @@ =
   got int [noderefint const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:428:13: sparse:    expected int const *__gu_a=
ddr
   net/bluetooth/l2cap_sock.c:428:13: sparse:    got int [noderef] <asn:1> =
*optlen
   net/bluetooth/l2cap_sock.c:428:13: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@    expected void const [noderef] <asn=
:1> *from @@    got ] <asn:1> *from @@
   net/bluetooth/l2cap_sock.c:428:13: sparse:    expected void const [noder=
ef] <asn:1> *from
   net/bluetooth/l2cap_sock.c:428:13: sparse:    got int const *__gu_addr
   net/bluetooth/l2cap_sock.c:503:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected unsigned int *__pu_addr =
@@    got unsigned int [noderef] [usertunsigned int *__pu_addr @@
   net/bluetooth/l2cap_sock.c:503:21: sparse:    expected unsigned int *__p=
u_addr
   net/bluetooth/l2cap_sock.c:503:21: sparse:    got unsigned int [noderef]=
 [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:503:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@    expected void [noderef] <asn:1> *t=
o @@    got ref] <asn:1> *to @@
   net/bluetooth/l2cap_sock.c:503:21: sparse:    expected void [noderef] <a=
sn:1> *to
   net/bluetooth/l2cap_sock.c:503:21: sparse:    got unsigned int *__pu_addr
   net/bluetooth/l2cap_sock.c:553:13: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected int const *__gu_addr @@ =
   got int [noderefint const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:553:13: sparse:    expected int const *__gu_a=
ddr
   net/bluetooth/l2cap_sock.c:553:13: sparse:    got int [noderef] <asn:1> =
*optlen
   net/bluetooth/l2cap_sock.c:553:13: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@    expected void const [noderef] <asn=
:1> *from @@    got ] <asn:1> *from @@
   net/bluetooth/l2cap_sock.c:553:13: sparse:    expected void const [noder=
ef] <asn:1> *from
   net/bluetooth/l2cap_sock.c:553:13: sparse:    got int const *__gu_addr
   net/bluetooth/l2cap_sock.c:589:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected unsigned int *__pu_addr =
@@    got unsigned int [noderef] [usertunsigned int *__pu_addr @@
   net/bluetooth/l2cap_sock.c:589:21: sparse:    expected unsigned int *__p=
u_addr
   net/bluetooth/l2cap_sock.c:589:21: sparse:    got unsigned int [noderef]=
 [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:589:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@    expected void [noderef] <asn:1> *t=
o @@    got ref] <asn:1> *to @@
   net/bluetooth/l2cap_sock.c:589:21: sparse:    expected void [noderef] <a=
sn:1> *to
   net/bluetooth/l2cap_sock.c:589:21: sparse:    got unsigned int *__pu_addr
   net/bluetooth/l2cap_sock.c:596:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected unsigned int *__pu_addr =
@@    got unsigned int [noderef] [usertunsigned int *__pu_addr @@
   net/bluetooth/l2cap_sock.c:596:21: sparse:    expected unsigned int *__p=
u_addr
   net/bluetooth/l2cap_sock.c:596:21: sparse:    got unsigned int [noderef]=
 [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:596:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@    expected void [noderef] <asn:1> *t=
o @@    got ref] <asn:1> *to @@
   net/bluetooth/l2cap_sock.c:596:21: sparse:    expected void [noderef] <a=
sn:1> *to
   net/bluetooth/l2cap_sock.c:596:21: sparse:    got unsigned int *__pu_addr
   net/bluetooth/l2cap_sock.c:618:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected unsigned int *__pu_addr =
@@    got unsigned int [noderef] [usertunsigned int *__pu_addr @@
   net/bluetooth/l2cap_sock.c:618:21: sparse:    expected unsigned int *__p=
u_addr
   net/bluetooth/l2cap_sock.c:618:21: sparse:    got unsigned int [noderef]=
 [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:618:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@    expected void [noderef] <asn:1> *t=
o @@    got ref] <asn:1> *to @@
   net/bluetooth/l2cap_sock.c:618:21: sparse:    expected void [noderef] <a=
sn:1> *to
   net/bluetooth/l2cap_sock.c:618:21: sparse:    got unsigned int *__pu_addr
   net/bluetooth/l2cap_sock.c:633:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected unsigned short *__pu_add=
r @@    got unsigned short [noderef] [useunsigned short *__pu_addr @@
   net/bluetooth/l2cap_sock.c:633:21: sparse:    expected unsigned short *_=
_pu_addr
   net/bluetooth/l2cap_sock.c:633:21: sparse:    got unsigned short [nodere=
f] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:633:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@    expected void [noderef] <asn:1> *t=
o @@    got deref] <asn:1> *to @@
   net/bluetooth/l2cap_sock.c:633:21: sparse:    expected void [noderef] <a=
sn:1> *to
   net/bluetooth/l2cap_sock.c:633:21: sparse:    got unsigned short *__pu_a=
ddr
   net/bluetooth/l2cap_sock.c:643:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected unsigned short *__pu_add=
r @@    got unsigned short [noderef] [useunsigned short *__pu_addr @@
   net/bluetooth/l2cap_sock.c:643:21: sparse:    expected unsigned short *_=
_pu_addr
   net/bluetooth/l2cap_sock.c:643:21: sparse:    got unsigned short [nodere=
f] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:643:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@    expected void [noderef] <asn:1> *t=
o @@    got deref] <asn:1> *to @@
   net/bluetooth/l2cap_sock.c:643:21: sparse:    expected void [noderef] <a=
sn:1> *to
   net/bluetooth/l2cap_sock.c:643:21: sparse:    got unsigned short *__pu_a=
ddr
   net/bluetooth/l2cap_sock.c:655:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected unsigned int *__pu_addr =
@@    got unsigned int [noderef] [usertunsigned int *__pu_addr @@
   net/bluetooth/l2cap_sock.c:655:21: sparse:    expected unsigned int *__p=
u_addr
   net/bluetooth/l2cap_sock.c:655:21: sparse:    got unsigned int [noderef]=
 [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:655:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@    expected void [noderef] <asn:1> *t=
o @@    got ref] <asn:1> *to @@
   net/bluetooth/l2cap_sock.c:655:21: sparse:    expected void [noderef] <a=
sn:1> *to
   net/bluetooth/l2cap_sock.c:655:21: sparse:    got unsigned int *__pu_addr
>> net/bluetooth/l2cap_sock.c:676:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected unsigned char *__pu_addr=
 @@    got unsigned char [noderef] [userunsigned char *__pu_addr @@
>> net/bluetooth/l2cap_sock.c:676:21: sparse:    expected unsigned char *__=
pu_addr
   net/bluetooth/l2cap_sock.c:676:21: sparse:    got unsigned char [noderef=
] [usertype] <asn:1> *
>> net/bluetooth/l2cap_sock.c:676:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@    expected void [noderef] <asn:1> *t=
o @@    got eref] <asn:1> *to @@
   net/bluetooth/l2cap_sock.c:676:21: sparse:    expected void [noderef] <a=
sn:1> *to
>> net/bluetooth/l2cap_sock.c:676:21: sparse:    got unsigned char *__pu_ad=
dr
   net/bluetooth/l2cap_sock.c:785:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected unsigned int const *__gu=
_addr @@    got unsigned int [noderef] unsigned int const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:785:21: sparse:    expected unsigned int cons=
t *__gu_addr
   net/bluetooth/l2cap_sock.c:785:21: sparse:    got unsigned int [noderef]=
 [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:785:21: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@    expected void const [noderef] <asn=
:1> *from @@    got  [noderef] <asn:1> *from @@
   net/bluetooth/l2cap_sock.c:785:21: sparse:    expected void const [noder=
ef] <asn:1> *from
   net/bluetooth/l2cap_sock.c:785:21: sparse:    got unsigned int const *__=
gu_addr
   net/bluetooth/l2cap_sock.c:942:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected unsigned int const *__gu=
_addr @@    got unsigned int [noderef] unsigned int const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:942:21: sparse:    expected unsigned int cons=
t *__gu_addr
   net/bluetooth/l2cap_sock.c:942:21: sparse:    got unsigned int [noderef]=
 [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:942:21: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@    expected void const [noderef] <asn=
:1> *from @@    got  [noderef] <asn:1> *from @@
   net/bluetooth/l2cap_sock.c:942:21: sparse:    expected void const [noder=
ef] <asn:1> *from
   net/bluetooth/l2cap_sock.c:942:21: sparse:    got unsigned int const *__=
gu_addr
   net/bluetooth/l2cap_sock.c:957:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected unsigned int const *__gu=
_addr @@    got unsigned int [noderef] unsigned int const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:957:21: sparse:    expected unsigned int cons=
t *__gu_addr
   net/bluetooth/l2cap_sock.c:957:21: sparse:    got unsigned int [noderef]=
 [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:957:21: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@    expected void const [noderef] <asn=
:1> *from @@    got  [noderef] <asn:1> *from @@
   net/bluetooth/l2cap_sock.c:957:21: sparse:    expected void const [noder=
ef] <asn:1> *from
   net/bluetooth/l2cap_sock.c:957:21: sparse:    got unsigned int const *__=
gu_addr
   net/bluetooth/l2cap_sock.c:1005:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@    expected unsigned int const *__g=
u_addr @@    got unsigned int [noderef] unsigned int const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:1005:21: sparse:    expected unsigned int con=
st *__gu_addr
   net/bluetooth/l2cap_sock.c:1005:21: sparse:    got unsigned int [noderef=
] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:1005:21: sparse: sparse: incorrect type in ar=
gument 2 (different address spaces) @@    expected void const [noderef] <as=
n:1> *from @@    got  [noderef] <asn:1> *from @@
   net/bluetooth/l2cap_sock.c:1005:21: sparse:    expected void const [node=
ref] <asn:1> *from
   net/bluetooth/l2cap_sock.c:1005:21: sparse:    got unsigned int const *_=
_gu_addr
   net/bluetooth/l2cap_sock.c:1053:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@    expected unsigned short const *_=
_gu_addr @@    got unsigned short [noderefunsigned short const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:1053:21: sparse:    expected unsigned short c=
onst *__gu_addr
   net/bluetooth/l2cap_sock.c:1053:21: sparse:    got unsigned short [noder=
ef] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:1053:21: sparse: sparse: incorrect type in ar=
gument 2 (different address spaces) @@    expected void const [noderef] <as=
n:1> *from @@    got st [noderef] <asn:1> *from @@
   net/bluetooth/l2cap_sock.c:1053:21: sparse:    expected void const [node=
ref] <asn:1> *from
   net/bluetooth/l2cap_sock.c:1053:21: sparse:    got unsigned short const =
*__gu_addr
>> net/bluetooth/l2cap_sock.c:1084:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@    expected unsigned char const *__=
gu_addr @@    got unsigned char [noderef]unsigned char const *__gu_addr @@
>> net/bluetooth/l2cap_sock.c:1084:21: sparse:    expected unsigned char co=
nst *__gu_addr
   net/bluetooth/l2cap_sock.c:1084:21: sparse:    got unsigned char [nodere=
f] [usertype] <asn:1> *
>> net/bluetooth/l2cap_sock.c:1084:21: sparse: sparse: incorrect type in ar=
gument 2 (different address spaces) @@    expected void const [noderef] <as=
n:1> *from @@    got t [noderef] <asn:1> *from @@
   net/bluetooth/l2cap_sock.c:1084:21: sparse:    expected void const [node=
ref] <asn:1> *from
>> net/bluetooth/l2cap_sock.c:1084:21: sparse:    got unsigned char const *=
__gu_addr

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
--===============1386872247613761193==--

