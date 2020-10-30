Content-Type: multipart/mixed; boundary="===============7116373020093257275=="
MIME-Version: 1.0
From: Oliver Hartkopp <socketcan@hartkopp.net>
To: kbuild-all@lists.01.org
Subject: Re: net/can/isotp.c:1240:13: sparse: sparse: incorrect type in initializer (different address spaces)
Date: Fri, 30 Oct 2020 19:55:41 +0100
Message-ID: <4d092e3f-052d-7593-131c-a9629136f07f@hartkopp.net>
In-Reply-To: <146bb489-abaf-c763-44b2-ac1200560885@pengutronix.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7116373020093257275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

On 29.10.20 08:33, Marc Kleine-Budde wrote:
> Hello,
> =

> looks like sh is missing the some __user annotations so that sparse spwes=
 these
> warnings. Adding sh maintainers to Cc.
> =

> regards,
> Marc
> =

> On 10/29/20 12:01 AM, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
>> head:   23859ae44402f4d935b9ee548135dd1e65e2cbf4
>> commit: e057dd3fc20ffb3d7f150af46542a51b59b90127 can: add ISO 15765-2:20=
16 transport protocol
>> date:   3 weeks ago
>> config: sh-randconfig-s031-20201028 (attached as .config)
>> compiler: sh4-linux-gcc (GCC) 9.3.0
>> reproduce:
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # apt-get install sparse
>>          # sparse version: v0.6.3-56-gc09e8239-dirty
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3De057dd3fc20ffb3d7f150af46542a51b59b90127
>>          git remote add linus https://git.kernel.org/pub/scm/linux/kerne=
l/git/torvalds/linux.git
>>          git fetch --no-tags linus master
>>          git checkout e057dd3fc20ffb3d7f150af46542a51b59b90127
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dsh
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>>
>> "sparse warnings: (new ones prefixed by >>)"
>>>> net/can/isotp.c:1240:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *optlen @@
>>>> net/can/isotp.c:1240:13: sparse:     expected int const *__gu_addr
>>>> net/can/isotp.c:1240:13: sparse:     got int [noderef] __user *optlen
>>>> net/can/isotp.c:1240:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
>>>> net/can/isotp.c:1240:13: sparse:     expected void const volatile [nod=
eref] __user *ptr
>>>> net/can/isotp.c:1240:13: sparse:     got int const *__gu_addr
>>
>> vim +1240 net/can/isotp.c
>>
>>    1229	=

>>    1230	static int isotp_getsockopt(struct socket *sock, int level, int =
optname,
>>    1231				    char __user *optval, int __user *optlen)
>>    1232	{
>>    1233		struct sock *sk =3D sock->sk;
>>    1234		struct isotp_sock *so =3D isotp_sk(sk);
>>    1235		int len;
>>    1236		void *val;
>>    1237	=

>>    1238		if (level !=3D SOL_CAN_ISOTP)
>>    1239			return -EINVAL;
>>> 1240		if (get_user(len, optlen))
>>    1241			return -EFAULT;
>>    1242		if (len < 0)
>>    1243			return -EINVAL;
>>    1244	=


Sorry but there are tons of identical items in the networking subsystem =

in getsockopt functions.

And I don't get the sparse warning with make C=3D1 for none of the =

occurrences of

if (get_user(len, optlen))
     return -EFAULT;

So why did this show up here?

Thanks for your work & best regards,
Oliver

ps. Using sparse 0.6.2 (Debian: 0.6.2-2) here.


>>    1245		switch (optname) {
>>    1246		case CAN_ISOTP_OPTS:
>>    1247			len =3D min_t(int, len, sizeof(struct can_isotp_options));
>>    1248			val =3D &so->opt;
>>    1249			break;
>>    1250	=

>>    1251		case CAN_ISOTP_RECV_FC:
>>    1252			len =3D min_t(int, len, sizeof(struct can_isotp_fc_options));
>>    1253			val =3D &so->rxfc;
>>    1254			break;
>>    1255	=

>>    1256		case CAN_ISOTP_TX_STMIN:
>>    1257			len =3D min_t(int, len, sizeof(u32));
>>    1258			val =3D &so->force_tx_stmin;
>>    1259			break;
>>    1260	=

>>    1261		case CAN_ISOTP_RX_STMIN:
>>    1262			len =3D min_t(int, len, sizeof(u32));
>>    1263			val =3D &so->force_rx_stmin;
>>    1264			break;
>>    1265	=

>>    1266		case CAN_ISOTP_LL_OPTS:
>>    1267			len =3D min_t(int, len, sizeof(struct can_isotp_ll_options));
>>    1268			val =3D &so->ll;
>>    1269			break;
>>    1270	=

>>    1271		default:
>>    1272			return -ENOPROTOOPT;
>>    1273		}
>>    1274	=

>>    1275		if (put_user(len, optlen))
>>    1276			return -EFAULT;
>>    1277		if (copy_to_user(optval, val, len))
>>    1278			return -EFAULT;
>>    1279		return 0;
>>    1280	}
>>    1281	=

>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>>
> =

>=20
--===============7116373020093257275==--

