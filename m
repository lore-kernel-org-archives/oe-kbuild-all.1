Content-Type: multipart/mixed; boundary="===============1276979903468737092=="
MIME-Version: 1.0
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: net/can/isotp.c:1240:13: sparse: sparse: incorrect type in initializer (different address spaces)
Date: Fri, 30 Oct 2020 20:14:45 +0100
Message-ID: <61008eb0-25f3-5986-b5f8-b9844a18dcef@pengutronix.de>
In-Reply-To: <4d092e3f-052d-7593-131c-a9629136f07f@hartkopp.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1276979903468737092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/30/20 7:55 PM, Oliver Hartkopp wrote:
>>>    1229	=

>>>    1230	static int isotp_getsockopt(struct socket *sock, int level, int=
 optname,
>>>    1231				    char __user *optval, int __user *optlen)
>>>    1232	{
>>>    1233		struct sock *sk =3D sock->sk;
>>>    1234		struct isotp_sock *so =3D isotp_sk(sk);
>>>    1235		int len;
>>>    1236		void *val;
>>>    1237	=

>>>    1238		if (level !=3D SOL_CAN_ISOTP)
>>>    1239			return -EINVAL;
>>>> 1240		if (get_user(len, optlen))
>>>    1241			return -EFAULT;
>>>    1242		if (len < 0)
>>>    1243			return -EINVAL;
>>>    1244	=

> =

> Sorry but there are tons of identical items in the networking subsystem =

> in getsockopt functions.
> =

> And I don't get the sparse warning with make C=3D1 for none of the =

> occurrences of

Due to ARCH=3Dsh

looks like sh is missing the some __user annotations so that sparse spwes t=
hese
warnings.

Marc

-- =

Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--===============1276979903468737092==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ2dBZEZpRUVLM2tJV0p0OXlU
WU1QM2VocWNsYWl2cnQ3NmtGQWwrY1ppVUFDZ2tRcWNsYWl2cnQKNzZsbVlRZ0FyY29jMm4yQUw4
aTFncyt1MXk0dzVacjFRUHE5c2NBQ21Qb2sxZlFRQUNiSGJnU1dvS09kM3RUVQpOOStvTm1UT2tp
S0gvRVppU1lRbWhndlZUVWtXTDRnM3pMYTMvY2k2SHhaVXJycGd5b1gvZXlNZS9BYllVdnZhCnFU
VUppOGRMVXJTV0ZRWVVkZ1BWRUlNRE5NWjRuMktuS3M2eGI5dG55WFhIMHA1cGsxcjNzdThkNEEx
UXdJdnUKV0lzOTdxZnM1K3RSSnkySmJCOVkrSzRHTW1mdmNueXFQWkZ3U1JTWG9wUFNSaitPNk83
NHdSeXdkMk1TTjRyZwpOSXVja1pCT3FCTXEvbW8yTHRGbWZTN04xQlo5dmIveHp0MVY3WG1RdlNY
cXc3THpHTGsza1dXVnppOVNSdUlHCnhlaEhpVUxjdE9NNUx3Y01OVXNIWEdaYTdDclhIZz09Cj0w
emNWCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1276979903468737092==--

