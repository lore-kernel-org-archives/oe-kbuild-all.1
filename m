Content-Type: multipart/mixed; boundary="===============4724736979844941145=="
MIME-Version: 1.0
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [mkl-can-next:testing 8/17] net/can/isotp.c:1159 isotp_setsockopt() warn: unsigned 'optlen' is never less than zero.
Date: Wed, 07 Oct 2020 11:31:18 +0200
Message-ID: <90c721a4-c6d1-ebba-ca85-61c9a259aa34@pengutronix.de>
In-Reply-To: <202010071741.TLRnFYRU-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4724736979844941145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/7/20 11:23 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-nex=
t.git testing
> head:   6a89c9390e62e16ede591ae920b38e276207f1a4
> commit: 99b153b74559d9e3a6456ea5f0eaae03c8dcad79 [8/17] can: add ISO 1576=
5-2:2016 transport protocol
> config: x86_64-randconfig-m001-20201005 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> smatch warnings:
> net/can/isotp.c:1159 isotp_setsockopt() warn: unsigned 'optlen' is never =
less than zero.
> =

> vim +/optlen +1159 net/can/isotp.c
> =

>   1149	=

>   1150	static int isotp_setsockopt(struct socket *sock, int level, int op=
tname,
>   1151				    sockptr_t optval, unsigned int optlen)
>   1152	{
>   1153		struct sock *sk =3D sock->sk;
>   1154		struct isotp_sock *so =3D isotp_sk(sk);
>   1155		int ret =3D 0;
>   1156	=

>   1157		if (level !=3D SOL_CAN_ISOTP)
>   1158			return -EINVAL;
>> 1159		if (optlen < 0)
>   1160			return -EINVAL;

I'll just delete that line.

Marc

-- =

Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--===============4724736979844941145==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ2dBZEZpRUVLM2tJV0p0OXlU
WU1QM2VocWNsYWl2cnQ3NmtGQWw5OWl1WUFDZ2tRcWNsYWl2cnQKNzZsdXR3ZitONkw2WUtzY2tB
MDhrOTFBemo3MGdNenlTd2d2SmtuMi9HRXpKVXcrU3FFamcvRjIwMHFVYldacgphNERGdmMzNCsy
TXZhbWdDRThBb0NlUllrYWJoMTM0WVlibnhiRnhNS3FCWTd2c2J6S0xvdWs4L2VXQjh0WVBpClRI
bE0wbmYycE9tSHJhVy9IaWFLb3llSFRaKzRJZFQ5Z1U2eWV5NDRHSjhvaEVtUSs0Mmtad0xjN3NB
ME00LzUKRDh4LzlYZ3AxT1U1Z0ZyWUYrM2VGdlU1czdqbkYvbmVIbkdqc0NMc0M1eWVkdG5Cby9x
L3p3WFFDV093eTloMgpWMUR6TmQxM005Ym0weXFXZEx4QVhZMzZJV2FudDhvT3RqekxwMmEwV3hy
b0s1UHppd3N2ZHZFdzNsOE5UZ1VlCnV3MzloOWpUMXlsWEd5azVMNFFEMVZHRk9kZkkrdz09Cj0y
bi85Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============4724736979844941145==--

