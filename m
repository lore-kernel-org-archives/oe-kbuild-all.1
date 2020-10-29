Content-Type: multipart/mixed; boundary="===============4514062485428527603=="
MIME-Version: 1.0
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: net/can/isotp.c:1240:13: sparse: sparse: incorrect type in initializer (different address spaces)
Date: Thu, 29 Oct 2020 08:33:26 +0100
Message-ID: <146bb489-abaf-c763-44b2-ac1200560885@pengutronix.de>
In-Reply-To: <202010290720.uQ3pTGrT-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4514062485428527603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

looks like sh is missing the some __user annotations so that sparse spwes t=
hese
warnings. Adding sh maintainers to Cc.

regards,
Marc

On 10/29/20 12:01 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   23859ae44402f4d935b9ee548135dd1e65e2cbf4
> commit: e057dd3fc20ffb3d7f150af46542a51b59b90127 can: add ISO 15765-2:201=
6 transport protocol
> date:   3 weeks ago
> config: sh-randconfig-s031-20201028 (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-56-gc09e8239-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3De057dd3fc20ffb3d7f150af46542a51b59b90127
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout e057dd3fc20ffb3d7f150af46542a51b59b90127
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dsh =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> "sparse warnings: (new ones prefixed by >>)"
>>> net/can/isotp.c:1240:13: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user *optlen @@
>>> net/can/isotp.c:1240:13: sparse:     expected int const *__gu_addr
>>> net/can/isotp.c:1240:13: sparse:     got int [noderef] __user *optlen
>>> net/can/isotp.c:1240:13: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
>>> net/can/isotp.c:1240:13: sparse:     expected void const volatile [node=
ref] __user *ptr
>>> net/can/isotp.c:1240:13: sparse:     got int const *__gu_addr
> =

> vim +1240 net/can/isotp.c
> =

>   1229	=

>   1230	static int isotp_getsockopt(struct socket *sock, int level, int op=
tname,
>   1231				    char __user *optval, int __user *optlen)
>   1232	{
>   1233		struct sock *sk =3D sock->sk;
>   1234		struct isotp_sock *so =3D isotp_sk(sk);
>   1235		int len;
>   1236		void *val;
>   1237	=

>   1238		if (level !=3D SOL_CAN_ISOTP)
>   1239			return -EINVAL;
>> 1240		if (get_user(len, optlen))
>   1241			return -EFAULT;
>   1242		if (len < 0)
>   1243			return -EINVAL;
>   1244	=

>   1245		switch (optname) {
>   1246		case CAN_ISOTP_OPTS:
>   1247			len =3D min_t(int, len, sizeof(struct can_isotp_options));
>   1248			val =3D &so->opt;
>   1249			break;
>   1250	=

>   1251		case CAN_ISOTP_RECV_FC:
>   1252			len =3D min_t(int, len, sizeof(struct can_isotp_fc_options));
>   1253			val =3D &so->rxfc;
>   1254			break;
>   1255	=

>   1256		case CAN_ISOTP_TX_STMIN:
>   1257			len =3D min_t(int, len, sizeof(u32));
>   1258			val =3D &so->force_tx_stmin;
>   1259			break;
>   1260	=

>   1261		case CAN_ISOTP_RX_STMIN:
>   1262			len =3D min_t(int, len, sizeof(u32));
>   1263			val =3D &so->force_rx_stmin;
>   1264			break;
>   1265	=

>   1266		case CAN_ISOTP_LL_OPTS:
>   1267			len =3D min_t(int, len, sizeof(struct can_isotp_ll_options));
>   1268			val =3D &so->ll;
>   1269			break;
>   1270	=

>   1271		default:
>   1272			return -ENOPROTOOPT;
>   1273		}
>   1274	=

>   1275		if (put_user(len, optlen))
>   1276			return -EFAULT;
>   1277		if (copy_to_user(optval, val, len))
>   1278			return -EFAULT;
>   1279		return 0;
>   1280	}
>   1281	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =



-- =

Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--===============4514062485428527603==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ2dBZEZpRUVLM2tJV0p0OXlU
WU1QM2VocWNsYWl2cnQ3NmtGQWwrYWNFWUFDZ2tRcWNsYWl2cnQKNzZtTnBBZjlGQkJMTTRFWHVJ
R1RnTEVBaE5nNTZaTTVGVW0wS0RZSFBCS296S3NTVEZ2WklnTGFXU0MzektkZAorNnpjTEJJOVZC
bzZpazB2eHF6Rlp0NXRHZkZRd2tvcTJ5Z1JGZHBBOFdwekdKV1BRb1FmNi9IWXJJc0lRejZmCmFr
MWdMTUVUYlhqSmVrMWp6TlBhdkFtOERUUngwUjlEdnZMRDgvNUI1WUI3MS9mcVpid3BrcFQ1QWFQ
VDVLclIKRGF1aE9abmRsUWp0WnB6R0N2djY2cU5EUjZHaWlNWDVIQVQvTkFWODVUdGdBM2s2VWYy
YXliOUZzb01zRG9hdgpiWmIrOEVYbm9qejZLb05aMy9ha2tySDdZcHRyYzk3RzgvamxabkNQYVBV
VUFyVWZNcHljOGlVRlEzYWdtZHdYCmJPT2JvOXMydXFpYWsrOHgydzN6UkxSVE5IbHI4dz09Cj1N
OTVoCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============4514062485428527603==--

