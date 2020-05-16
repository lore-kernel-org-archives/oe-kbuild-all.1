Content-Type: multipart/mixed; boundary="===============1968201516093884669=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 6701/9662] net/qrtr/qrtr.c:1119:22: sparse: sparse: incorrect type in initializer (different address spaces)
Date: Sat, 16 May 2020 08:50:47 +0800
Message-ID: <202005160842.lDxDJaYr%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1968201516093884669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Manivannan,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   bdecf38f228bcca73b31ada98b5b7ba1215eb9c9
commit: e42671084361302141a09284fde9bbc14fdd16bf [6701/9662] net: qrtr: Do =
not depend on ARCH_QCOM
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout e42671084361302141a09284fde9bbc14fdd16bf
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   net/qrtr/qrtr.c:185:23: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@    expected void const * @@    got void [noderev=
oid const * @@
   net/qrtr/qrtr.c:185:23: sparse:    expected void const *
   net/qrtr/qrtr.c:185:23: sparse:    got void [noderef] <asn:4> *
   net/qrtr/qrtr.c:356:25: sparse: sparse: incorrect type in assignment (di=
fferent base types) @@    expected restricted __le32 [usertype] confirm_rx =
@@    got e] confirm_rx @@
   net/qrtr/qrtr.c:356:25: sparse:    expected restricted __le32 [usertype]=
 confirm_rx
   net/qrtr/qrtr.c:356:25: sparse:    got int
   net/qrtr/qrtr.c:604:22: sparse: sparse: incorrect type in assignment (di=
fferent address spaces) @@    expected struct qrtr_tx_flow *flow @@    got =
voistruct qrtr_tx_flow *flow @@
   net/qrtr/qrtr.c:604:22: sparse:    expected struct qrtr_tx_flow *flow
   net/qrtr/qrtr.c:604:22: sparse:    got void [noderef] <asn:4> *
>> net/qrtr/qrtr.c:1119:22: sparse: sparse: incorrect type in initializer (=
different address spaces) @@    expected int *__pu_addr @@    got int [node=
ref] <asnint *__pu_addr @@
>> net/qrtr/qrtr.c:1119:22: sparse:    expected int *__pu_addr
>> net/qrtr/qrtr.c:1119:22: sparse:    got int [noderef] <asn:1> *
>> net/qrtr/qrtr.c:1119:22: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@    expected void [noderef] <asn:1> *to @@    go=
t :1> *to @@
>> net/qrtr/qrtr.c:1119:22: sparse:    expected void [noderef] <asn:1> *to
>> net/qrtr/qrtr.c:1119:22: sparse:    got int *__pu_addr
   net/qrtr/qrtr.c:1125:22: sparse: sparse: incorrect type in initializer (=
different address spaces) @@    expected int *__pu_addr @@    got int [node=
ref] <asnint *__pu_addr @@
   net/qrtr/qrtr.c:1125:22: sparse:    expected int *__pu_addr
   net/qrtr/qrtr.c:1125:22: sparse:    got int [noderef] <asn:1> *
   net/qrtr/qrtr.c:1125:22: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@    expected void [noderef] <asn:1> *to @@    go=
t :1> *to @@
   net/qrtr/qrtr.c:1125:22: sparse:    expected void [noderef] <asn:1> *to
   net/qrtr/qrtr.c:1125:22: sparse:    got int *__pu_addr

vim +1119 net/qrtr/qrtr.c

bdabad3e363d825 Courtney Cavin  2016-05-06  1100  =

bdabad3e363d825 Courtney Cavin  2016-05-06  1101  static int qrtr_ioctl(str=
uct socket *sock, unsigned int cmd, unsigned long arg)
bdabad3e363d825 Courtney Cavin  2016-05-06  1102  {
bdabad3e363d825 Courtney Cavin  2016-05-06  1103  	void __user *argp =3D (v=
oid __user *)arg;
bdabad3e363d825 Courtney Cavin  2016-05-06  1104  	struct qrtr_sock *ipc =
=3D qrtr_sk(sock->sk);
bdabad3e363d825 Courtney Cavin  2016-05-06  1105  	struct sock *sk =3D sock=
->sk;
bdabad3e363d825 Courtney Cavin  2016-05-06  1106  	struct sockaddr_qrtr *sq;
bdabad3e363d825 Courtney Cavin  2016-05-06  1107  	struct sk_buff *skb;
bdabad3e363d825 Courtney Cavin  2016-05-06  1108  	struct ifreq ifr;
bdabad3e363d825 Courtney Cavin  2016-05-06  1109  	long len =3D 0;
bdabad3e363d825 Courtney Cavin  2016-05-06  1110  	int rc =3D 0;
bdabad3e363d825 Courtney Cavin  2016-05-06  1111  =

bdabad3e363d825 Courtney Cavin  2016-05-06  1112  	lock_sock(sk);
bdabad3e363d825 Courtney Cavin  2016-05-06  1113  =

bdabad3e363d825 Courtney Cavin  2016-05-06  1114  	switch (cmd) {
bdabad3e363d825 Courtney Cavin  2016-05-06  1115  	case TIOCOUTQ:
bdabad3e363d825 Courtney Cavin  2016-05-06  1116  		len =3D sk->sk_sndbuf -=
 sk_wmem_alloc_get(sk);
bdabad3e363d825 Courtney Cavin  2016-05-06  1117  		if (len < 0)
bdabad3e363d825 Courtney Cavin  2016-05-06  1118  			len =3D 0;
bdabad3e363d825 Courtney Cavin  2016-05-06 @1119  		rc =3D put_user(len, (i=
nt __user *)argp);
bdabad3e363d825 Courtney Cavin  2016-05-06  1120  		break;
bdabad3e363d825 Courtney Cavin  2016-05-06  1121  	case TIOCINQ:
bdabad3e363d825 Courtney Cavin  2016-05-06  1122  		skb =3D skb_peek(&sk->s=
k_receive_queue);
bdabad3e363d825 Courtney Cavin  2016-05-06  1123  		if (skb)
f507a9b6e63b9f4 Bjorn Andersson 2017-10-10  1124  			len =3D skb->len;
bdabad3e363d825 Courtney Cavin  2016-05-06  1125  		rc =3D put_user(len, (i=
nt __user *)argp);
bdabad3e363d825 Courtney Cavin  2016-05-06  1126  		break;
bdabad3e363d825 Courtney Cavin  2016-05-06  1127  	case SIOCGIFADDR:
bdabad3e363d825 Courtney Cavin  2016-05-06  1128  		if (copy_from_user(&ifr=
, argp, sizeof(ifr))) {
bdabad3e363d825 Courtney Cavin  2016-05-06  1129  			rc =3D -EFAULT;
bdabad3e363d825 Courtney Cavin  2016-05-06  1130  			break;
bdabad3e363d825 Courtney Cavin  2016-05-06  1131  		}
bdabad3e363d825 Courtney Cavin  2016-05-06  1132  =

bdabad3e363d825 Courtney Cavin  2016-05-06  1133  		sq =3D (struct sockaddr=
_qrtr *)&ifr.ifr_addr;
bdabad3e363d825 Courtney Cavin  2016-05-06  1134  		*sq =3D ipc->us;
bdabad3e363d825 Courtney Cavin  2016-05-06  1135  		if (copy_to_user(argp, =
&ifr, sizeof(ifr))) {
bdabad3e363d825 Courtney Cavin  2016-05-06  1136  			rc =3D -EFAULT;
bdabad3e363d825 Courtney Cavin  2016-05-06  1137  			break;
bdabad3e363d825 Courtney Cavin  2016-05-06  1138  		}
bdabad3e363d825 Courtney Cavin  2016-05-06  1139  		break;
bdabad3e363d825 Courtney Cavin  2016-05-06  1140  	case SIOCADDRT:
bdabad3e363d825 Courtney Cavin  2016-05-06  1141  	case SIOCDELRT:
bdabad3e363d825 Courtney Cavin  2016-05-06  1142  	case SIOCSIFADDR:
bdabad3e363d825 Courtney Cavin  2016-05-06  1143  	case SIOCGIFDSTADDR:
bdabad3e363d825 Courtney Cavin  2016-05-06  1144  	case SIOCSIFDSTADDR:
bdabad3e363d825 Courtney Cavin  2016-05-06  1145  	case SIOCGIFBRDADDR:
bdabad3e363d825 Courtney Cavin  2016-05-06  1146  	case SIOCSIFBRDADDR:
bdabad3e363d825 Courtney Cavin  2016-05-06  1147  	case SIOCGIFNETMASK:
bdabad3e363d825 Courtney Cavin  2016-05-06  1148  	case SIOCSIFNETMASK:
bdabad3e363d825 Courtney Cavin  2016-05-06  1149  		rc =3D -EINVAL;
bdabad3e363d825 Courtney Cavin  2016-05-06  1150  		break;
bdabad3e363d825 Courtney Cavin  2016-05-06  1151  	default:
bdabad3e363d825 Courtney Cavin  2016-05-06  1152  		rc =3D -ENOIOCTLCMD;
bdabad3e363d825 Courtney Cavin  2016-05-06  1153  		break;
bdabad3e363d825 Courtney Cavin  2016-05-06  1154  	}
bdabad3e363d825 Courtney Cavin  2016-05-06  1155  =

bdabad3e363d825 Courtney Cavin  2016-05-06  1156  	release_sock(sk);
bdabad3e363d825 Courtney Cavin  2016-05-06  1157  =

bdabad3e363d825 Courtney Cavin  2016-05-06  1158  	return rc;
bdabad3e363d825 Courtney Cavin  2016-05-06  1159  }
bdabad3e363d825 Courtney Cavin  2016-05-06  1160  =


:::::: The code at line 1119 was first introduced by commit
:::::: bdabad3e363d825ddf9679dd431cca0b2c30f881 net: Add Qualcomm IPC router

:::::: TO: Courtney Cavin <courtney.cavin@sonymobile.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1968201516093884669==--

