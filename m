Content-Type: multipart/mixed; boundary="===============4448493862587744056=="
MIME-Version: 1.0
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: net/can/isotp.c:1240:13: sparse: sparse: incorrect type in initializer (different address spaces)
Date: Mon, 04 Jan 2021 10:11:52 +0100
Message-ID: <3aee710f-b092-82e3-1a0d-1af3f153c00b@pengutronix.de>
In-Reply-To: <202012270307.H8cY6ALL-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4448493862587744056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/26/20 8:29 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   f838f8d2b694cf9d524dc4423e9dd2db13892f3f
> commit: e057dd3fc20ffb3d7f150af46542a51b59b90127 can: add ISO 15765-2:201=
6 transport protocol
> date:   3 months ago
> config: sh-randconfig-s032-20201225 (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-184-g1b896707-dirty
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
>    net/can/isotp.c:1240:13: sparse:     expected int const *__gu_addr
>    net/can/isotp.c:1240:13: sparse:     got int [noderef] __user *optlen
>>> net/can/isotp.c:1240:13: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
>    net/can/isotp.c:1240:13: sparse:     expected void const volatile [nod=
eref] __user *ptr
>    net/can/isotp.c:1240:13: sparse:     got int const *__gu_addr

>From my point of view, it looks like the get_user() on the sh platform is
somehow different to the other platform, which all accept a __user pointer.=
 IMHO
this should be fixed in sh.

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

regards,
Marc

-- =

Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--===============4448493862587744056==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ2dBZEZpRUVLM2tJV0p0OXlU
WU1QM2VocWNsYWl2cnQ3NmtGQWwveTI5Z0FDZ2tRcWNsYWl2cnQKNzZtckVRZ0FxU1hhYmtNQ3Fn
Y1hTNWtFRFFuNm9sS2U0clgwMUM1dit1cXlXcFZuSEg4Q0hYcjQxZ0FPY0hxaQpCQW1BZTFJOVBT
WTd6Z2dwSkpRUFNKNm1RUDNuUm9DenZXdHBqOWNob2FzRUhES0hHeWc4WHBPRHhWMDNydGx2Ckpp
VFZDMW04YlNIeTJBcS9ZSkVvcHVIS2FLVE8ySnQ2WE52eEc2MEx5V2oyTFVGSkZWcVpHeURMSmE3
UHFLU2IKOFlVUGNMQ0N0NlkydWxQWmJGMk1TTERwZUsrZEtXSDhsQXdQcXBqRGs1RUJ3cE05RzBx
emdhTGY2SFVTUDl6TQpmM0tPWElVWWpiOExmT1BMTFE1d3FZa2hWS05jK3RJcnd6MjkwOEMxZjZR
NUJMNFRTdmNLM0plU1dJQjA5c0ZiCk4zZXc3VG9XMUtrMXk0bVVRQUZmN2dDeTl3RjZpQT09Cj10
NlpVCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============4448493862587744056==--

