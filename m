Content-Type: multipart/mixed; boundary="===============4551951469660177603=="
MIME-Version: 1.0
From: Oliver Hartkopp <socketcan@hartkopp.net>
To: kbuild-all@lists.01.org
Subject: Re: net/can/isotp.c:1240:13: sparse: sparse: incorrect type in initializer (different address spaces)
Date: Thu, 14 Jan 2021 19:22:09 +0100
Message-ID: <c179d70b-b09f-1f9f-04bc-007788c45722@hartkopp.net>
In-Reply-To: <202101141753.ropIZ9nh-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4551951469660177603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 14.01.21 10:47, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   65f0d2414b7079556fbbcc070b3d1c9f9587606d
> commit: e057dd3fc20ffb3d7f150af46542a51b59b90127 can: add ISO 15765-2:201=
6 transport protocol
> date:   3 months ago
> config: sh-randconfig-s032-20210114 (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # apt-get install sparse
>          # sparse version: v0.6.3-208-g46a52ca4-dirty
>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git/commit/?id=3De057dd3fc20ffb3d7f150af46542a51b59b90127
>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel=
/git/torvalds/linux.git
>          git fetch --no-tags linus master
>          git checkout e057dd3fc20ffb3d7f150af46542a51b59b90127
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dsh
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> "sparse warnings: (new ones prefixed by >>)"
>>> net/can/isotp.c:1240:13: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user *optlen @@
>     net/can/isotp.c:1240:13: sparse:     expected int const *__gu_addr
>     net/can/isotp.c:1240:13: sparse:     got int [noderef] __user *optlen
>>> net/can/isotp.c:1240:13: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
>     net/can/isotp.c:1240:13: sparse:     expected void const volatile [no=
deref] __user *ptr
>     net/can/isotp.c:1240:13: sparse:     got int const *__gu_addr
> =


This seems to be a problem with the sh4 arch and/or its cross =

compilation tools.

There are tons of similar code snippets in the kernel, e.g. in =

net/can/raw.c or net/bluetooth/hci_sock.c ...

And these code snippets do not trigger such sparse warnings?!?

Any idea?

Regards,
Oliver

> vim +1240 net/can/isotp.c
> =

>    1229	=

>    1230	static int isotp_getsockopt(struct socket *sock, int level, int o=
ptname,
>    1231				    char __user *optval, int __user *optlen)
>    1232	{
>    1233		struct sock *sk =3D sock->sk;
>    1234		struct isotp_sock *so =3D isotp_sk(sk);
>    1235		int len;
>    1236		void *val;
>    1237	=

>    1238		if (level !=3D SOL_CAN_ISOTP)
>    1239			return -EINVAL;
>> 1240		if (get_user(len, optlen))
>    1241			return -EFAULT;
>    1242		if (len < 0)
>    1243			return -EINVAL;
>    1244	=

>    1245		switch (optname) {
>    1246		case CAN_ISOTP_OPTS:
>    1247			len =3D min_t(int, len, sizeof(struct can_isotp_options));
>    1248			val =3D &so->opt;
>    1249			break;
>    1250	=

>    1251		case CAN_ISOTP_RECV_FC:
>    1252			len =3D min_t(int, len, sizeof(struct can_isotp_fc_options));
>    1253			val =3D &so->rxfc;
>    1254			break;
>    1255	=

>    1256		case CAN_ISOTP_TX_STMIN:
>    1257			len =3D min_t(int, len, sizeof(u32));
>    1258			val =3D &so->force_tx_stmin;
>    1259			break;
>    1260	=

>    1261		case CAN_ISOTP_RX_STMIN:
>    1262			len =3D min_t(int, len, sizeof(u32));
>    1263			val =3D &so->force_rx_stmin;
>    1264			break;
>    1265	=

>    1266		case CAN_ISOTP_LL_OPTS:
>    1267			len =3D min_t(int, len, sizeof(struct can_isotp_ll_options));
>    1268			val =3D &so->ll;
>    1269			break;
>    1270	=

>    1271		default:
>    1272			return -ENOPROTOOPT;
>    1273		}
>    1274	=

>    1275		if (put_user(len, optlen))
>    1276			return -EFAULT;
>    1277		if (copy_to_user(optval, val, len))
>    1278			return -EFAULT;
>    1279		return 0;
>    1280	}
>    1281	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20
--===============4551951469660177603==--

