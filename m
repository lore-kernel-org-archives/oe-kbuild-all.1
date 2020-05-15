Content-Type: multipart/mixed; boundary="===============0427354899139120795=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 812/9362] net/bluetooth/l2cap_sock.c:1084:21: sparse: sparse: incorrect type in initializer (different address spaces)
Date: Fri, 15 May 2020 13:19:18 +0800
Message-ID: <202005151316.Ov8OaM6P%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0427354899139120795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   c9529331c7a22b8eb7eb03e1e0e221d0f58b43de
commit: 3ee7b7cd83900bb711efadbf16fa096a615a1566 [812/9362] Bluetooth: Add =
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

   net/bluetooth/l2cap_sock.c:428:13: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected void const *__gu_ptr @@ =
   got int [noderevoid const *__gu_ptr @@
   net/bluetooth/l2cap_sock.c:428:13: sparse:    expected void const *__gu_=
ptr
   net/bluetooth/l2cap_sock.c:428:13: sparse:    got int [noderef] <asn:1> =
*optlen
   net/bluetooth/l2cap_sock.c:553:13: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected void const *__gu_ptr @@ =
   got int [noderevoid const *__gu_ptr @@
   net/bluetooth/l2cap_sock.c:553:13: sparse:    expected void const *__gu_=
ptr
   net/bluetooth/l2cap_sock.c:553:13: sparse:    got int [noderef] <asn:1> =
*optlen
   net/bluetooth/l2cap_sock.c:785:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected void const *__gu_ptr @@ =
   got unsigned int [noderef] [usertypvoid const *__gu_ptr @@
   net/bluetooth/l2cap_sock.c:785:21: sparse:    expected void const *__gu_=
ptr
   net/bluetooth/l2cap_sock.c:785:21: sparse:    got unsigned int [noderef]=
 [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:942:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected void const *__gu_ptr @@ =
   got unsigned int [noderef] [usertypvoid const *__gu_ptr @@
   net/bluetooth/l2cap_sock.c:942:21: sparse:    expected void const *__gu_=
ptr
   net/bluetooth/l2cap_sock.c:942:21: sparse:    got unsigned int [noderef]=
 [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:957:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@    expected void const *__gu_ptr @@ =
   got unsigned int [noderef] [usertypvoid const *__gu_ptr @@
   net/bluetooth/l2cap_sock.c:957:21: sparse:    expected void const *__gu_=
ptr
   net/bluetooth/l2cap_sock.c:957:21: sparse:    got unsigned int [noderef]=
 [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:1005:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@    expected void const *__gu_ptr @@=
    got unsigned int [noderef] [usertypvoid const *__gu_ptr @@
   net/bluetooth/l2cap_sock.c:1005:21: sparse:    expected void const *__gu=
_ptr
   net/bluetooth/l2cap_sock.c:1005:21: sparse:    got unsigned int [noderef=
] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:1053:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@    expected void const *__gu_ptr @@=
    got unsigned short [noderef] [usertypvoid const *__gu_ptr @@
   net/bluetooth/l2cap_sock.c:1053:21: sparse:    expected void const *__gu=
_ptr
   net/bluetooth/l2cap_sock.c:1053:21: sparse:    got unsigned short [noder=
ef] [usertype] <asn:1> *
>> net/bluetooth/l2cap_sock.c:1084:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@    expected void const *__gu_ptr @@=
    got unsigned char [noderef] [usertypvoid const *__gu_ptr @@
   net/bluetooth/l2cap_sock.c:1084:21: sparse:    expected void const *__gu=
_ptr
>> net/bluetooth/l2cap_sock.c:1084:21: sparse:    got unsigned char [nodere=
f] [usertype] <asn:1> *

vim +1084 net/bluetooth/l2cap_sock.c

   860	=

   861	static int l2cap_sock_setsockopt(struct socket *sock, int level, int=
 optname,
   862					 char __user *optval, unsigned int optlen)
   863	{
   864		struct sock *sk =3D sock->sk;
   865		struct l2cap_chan *chan =3D l2cap_pi(sk)->chan;
   866		struct bt_security sec;
   867		struct bt_power pwr;
   868		struct l2cap_conn *conn;
   869		int len, err =3D 0;
   870		u32 opt;
   871	=

   872		BT_DBG("sk %p", sk);
   873	=

   874		if (level =3D=3D SOL_L2CAP)
   875			return l2cap_sock_setsockopt_old(sock, optname, optval, optlen);
   876	=

   877		if (level !=3D SOL_BLUETOOTH)
   878			return -ENOPROTOOPT;
   879	=

   880		lock_sock(sk);
   881	=

   882		switch (optname) {
   883		case BT_SECURITY:
   884			if (chan->chan_type !=3D L2CAP_CHAN_CONN_ORIENTED &&
   885			    chan->chan_type !=3D L2CAP_CHAN_FIXED &&
   886			    chan->chan_type !=3D L2CAP_CHAN_RAW) {
   887				err =3D -EINVAL;
   888				break;
   889			}
   890	=

   891			sec.level =3D BT_SECURITY_LOW;
   892	=

   893			len =3D min_t(unsigned int, sizeof(sec), optlen);
   894			if (copy_from_user((char *) &sec, optval, len)) {
   895				err =3D -EFAULT;
   896				break;
   897			}
   898	=

   899			if (sec.level < BT_SECURITY_LOW ||
   900			    sec.level > BT_SECURITY_FIPS) {
   901				err =3D -EINVAL;
   902				break;
   903			}
   904	=

   905			chan->sec_level =3D sec.level;
   906	=

   907			if (!chan->conn)
   908				break;
   909	=

   910			conn =3D chan->conn;
   911	=

   912			/* change security for LE channels */
   913			if (chan->scid =3D=3D L2CAP_CID_ATT) {
   914				if (smp_conn_security(conn->hcon, sec.level)) {
   915					err =3D -EINVAL;
   916					break;
   917				}
   918	=

   919				set_bit(FLAG_PENDING_SECURITY, &chan->flags);
   920				sk->sk_state =3D BT_CONFIG;
   921				chan->state =3D BT_CONFIG;
   922	=

   923			/* or for ACL link */
   924			} else if ((sk->sk_state =3D=3D BT_CONNECT2 &&
   925				    test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags)) ||
   926				   sk->sk_state =3D=3D BT_CONNECTED) {
   927				if (!l2cap_chan_check_security(chan, true))
   928					set_bit(BT_SK_SUSPEND, &bt_sk(sk)->flags);
   929				else
   930					sk->sk_state_change(sk);
   931			} else {
   932				err =3D -EINVAL;
   933			}
   934			break;
   935	=

   936		case BT_DEFER_SETUP:
   937			if (sk->sk_state !=3D BT_BOUND && sk->sk_state !=3D BT_LISTEN) {
   938				err =3D -EINVAL;
   939				break;
   940			}
   941	=

   942			if (get_user(opt, (u32 __user *) optval)) {
   943				err =3D -EFAULT;
   944				break;
   945			}
   946	=

   947			if (opt) {
   948				set_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags);
   949				set_bit(FLAG_DEFER_SETUP, &chan->flags);
   950			} else {
   951				clear_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags);
   952				clear_bit(FLAG_DEFER_SETUP, &chan->flags);
   953			}
   954			break;
   955	=

   956		case BT_FLUSHABLE:
 > 957			if (get_user(opt, (u32 __user *) optval)) {
   958				err =3D -EFAULT;
   959				break;
   960			}
   961	=

   962			if (opt > BT_FLUSHABLE_ON) {
   963				err =3D -EINVAL;
   964				break;
   965			}
   966	=

   967			if (opt =3D=3D BT_FLUSHABLE_OFF) {
   968				conn =3D chan->conn;
   969				/* proceed further only when we have l2cap_conn and
   970				   No Flush support in the LM */
   971				if (!conn || !lmp_no_flush_capable(conn->hcon->hdev)) {
   972					err =3D -EINVAL;
   973					break;
   974				}
   975			}
   976	=

   977			if (opt)
   978				set_bit(FLAG_FLUSHABLE, &chan->flags);
   979			else
   980				clear_bit(FLAG_FLUSHABLE, &chan->flags);
   981			break;
   982	=

   983		case BT_POWER:
   984			if (chan->chan_type !=3D L2CAP_CHAN_CONN_ORIENTED &&
   985			    chan->chan_type !=3D L2CAP_CHAN_RAW) {
   986				err =3D -EINVAL;
   987				break;
   988			}
   989	=

   990			pwr.force_active =3D BT_POWER_FORCE_ACTIVE_ON;
   991	=

   992			len =3D min_t(unsigned int, sizeof(pwr), optlen);
   993			if (copy_from_user((char *) &pwr, optval, len)) {
   994				err =3D -EFAULT;
   995				break;
   996			}
   997	=

   998			if (pwr.force_active)
   999				set_bit(FLAG_FORCE_ACTIVE, &chan->flags);
  1000			else
  1001				clear_bit(FLAG_FORCE_ACTIVE, &chan->flags);
  1002			break;
  1003	=

  1004		case BT_CHANNEL_POLICY:
  1005			if (get_user(opt, (u32 __user *) optval)) {
  1006				err =3D -EFAULT;
  1007				break;
  1008			}
  1009	=

  1010			if (opt > BT_CHANNEL_POLICY_AMP_PREFERRED) {
  1011				err =3D -EINVAL;
  1012				break;
  1013			}
  1014	=

  1015			if (chan->mode !=3D L2CAP_MODE_ERTM &&
  1016			    chan->mode !=3D L2CAP_MODE_STREAMING) {
  1017				err =3D -EOPNOTSUPP;
  1018				break;
  1019			}
  1020	=

  1021			chan->chan_policy =3D (u8) opt;
  1022	=

  1023			if (sk->sk_state =3D=3D BT_CONNECTED &&
  1024			    chan->move_role =3D=3D L2CAP_MOVE_ROLE_NONE)
  1025				l2cap_move_start(chan);
  1026	=

  1027			break;
  1028	=

  1029		case BT_SNDMTU:
  1030			if (!bdaddr_type_is_le(chan->src_type)) {
  1031				err =3D -EINVAL;
  1032				break;
  1033			}
  1034	=

  1035			/* Setting is not supported as it's the remote side that
  1036			 * decides this.
  1037			 */
  1038			err =3D -EPERM;
  1039			break;
  1040	=

  1041		case BT_RCVMTU:
  1042			if (!bdaddr_type_is_le(chan->src_type)) {
  1043				err =3D -EINVAL;
  1044				break;
  1045			}
  1046	=

  1047			if (chan->mode =3D=3D L2CAP_MODE_LE_FLOWCTL &&
  1048			    sk->sk_state =3D=3D BT_CONNECTED) {
  1049				err =3D -EISCONN;
  1050				break;
  1051			}
  1052	=

  1053			if (get_user(opt, (u16 __user *) optval)) {
  1054				err =3D -EFAULT;
  1055				break;
  1056			}
  1057	=

  1058			if (chan->mode =3D=3D L2CAP_MODE_EXT_FLOWCTL &&
  1059			    sk->sk_state =3D=3D BT_CONNECTED)
  1060				err =3D l2cap_chan_reconfigure(chan, opt);
  1061			else
  1062				chan->imtu =3D opt;
  1063	=

  1064			break;
  1065	=

  1066		case BT_MODE:
  1067			if (!enable_ecred) {
  1068				err =3D -ENOPROTOOPT;
  1069				break;
  1070			}
  1071	=

  1072			BT_DBG("sk->sk_state %u", sk->sk_state);
  1073	=

  1074			if (sk->sk_state !=3D BT_BOUND) {
  1075				err =3D -EINVAL;
  1076				break;
  1077			}
  1078	=

  1079			if (chan->chan_type !=3D L2CAP_CHAN_CONN_ORIENTED) {
  1080				err =3D -EINVAL;
  1081				break;
  1082			}
  1083	=

> 1084			if (get_user(opt, (u8 __user *) optval)) {
  1085				err =3D -EFAULT;
  1086				break;
  1087			}
  1088	=

  1089			BT_DBG("opt %u", opt);
  1090	=

  1091			err =3D l2cap_set_mode(chan, opt);
  1092			if (err)
  1093				break;
  1094	=

  1095			BT_DBG("mode 0x%2.2x", chan->mode);
  1096	=

  1097			break;
  1098	=

  1099		default:
  1100			err =3D -ENOPROTOOPT;
  1101			break;
  1102		}
  1103	=

  1104		release_sock(sk);
  1105		return err;
  1106	}
  1107	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0427354899139120795==--

