Content-Type: multipart/mixed; boundary="===============1924530308708709246=="
MIME-Version: 1.0
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [kbuild] [dlech-linux:bone-counter 1/12] drivers/counter/microchip-tcb-capture.c:173 mchp_tc_count_action_read() warn: bitwise AND condition is false here
Date: Sun, 18 Oct 2020 13:07:34 -0400
Message-ID: <20201018170734.GB551872@shinobu>
In-Reply-To: <20201014144009.GW18329@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1924530308708709246==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 05:40:09PM +0300, Dan Carpenter wrote:
> tree:   https://github.com/dlech/linux  bone-counter
> head:   f8f0ad10f30b5c1bea1a22f5de5dc9f2c6b7db1a
> commit: 5251e7147d627fbe13308dc390347dc16efeb85b [1/12] counter: Internal=
ize sysfs interface code
> config: x86_64-randconfig-m001-20201014 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for pointing out these issues. I'll work to resolve them and
CC you in the next revision.

William Breathitt Gray

> =

> New smatch warnings:
> drivers/counter/microchip-tcb-capture.c:173 mchp_tc_count_action_read() w=
arn: bitwise AND condition is false here
> drivers/counter/counter-sysfs.c:109 counter_comp_u8_show() error: uniniti=
alized symbol 'err'.
> drivers/counter/counter-sysfs.c:114 counter_comp_u8_show() error: uniniti=
alized symbol 'data'.
> drivers/counter/counter-sysfs.c:233 counter_comp_u64_show() error: uninit=
ialized symbol 'err'.
> drivers/counter/counter-sysfs.c:236 counter_comp_u64_show() error: uninit=
ialized symbol 'data'.
> =

> Old smatch warnings:
> drivers/counter/counter-sysfs.c:116 counter_comp_u8_show() error: uniniti=
alized symbol 'data'.
> drivers/counter/counter-sysfs.c:118 counter_comp_u8_show() error: uniniti=
alized symbol 'data'.
> drivers/counter/counter-sysfs.c:120 counter_comp_u8_show() error: uniniti=
alized symbol 'data'.
> drivers/counter/counter-sysfs.c:122 counter_comp_u8_show() error: uniniti=
alized symbol 'data'.
> drivers/counter/counter-sysfs.c:124 counter_comp_u8_show() error: uniniti=
alized symbol 'data'.
> drivers/counter/counter-sysfs.c:126 counter_comp_u8_show() error: uniniti=
alized symbol 'data'.
> drivers/counter/counter-sysfs.c:131 counter_comp_u8_show() error: uniniti=
alized symbol 'data'.
> =

> vim +173 drivers/counter/microchip-tcb-capture.c
> =

> 5251e7147d627fb William Breathitt Gray 2020-09-26  161  static int mchp_t=
c_count_action_read(struct counter_device *counter,
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  162  				     struct c=
ounter_count *count,
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  163  				     struct c=
ounter_synapse *synapse,
> 5251e7147d627fb William Breathitt Gray 2020-09-26  164  				     u8 *acti=
on)
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  165  {
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  166  	struct mchp_tc_d=
ata *const priv =3D counter->priv;
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  167  	u32 cmr;
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  168  =

> 106b104137fd5f0 Kamel Bouhara          2020-07-06  169  	regmap_read(priv=
->regmap, ATMEL_TC_REG(priv->channel[0], CMR), &cmr);
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  170  =

> 5251e7147d627fb William Breathitt Gray 2020-09-26  171  	*action =3D COUN=
TER_SYNAPSE_ACTION_NONE;
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  172  =

> 106b104137fd5f0 Kamel Bouhara          2020-07-06 @173  	if (cmr & ATMEL_=
TC_ETRGEDG_NONE)
>                                                                     ^^^^^=
^^^^^^^^^^^^^^^^^^^^^^
> I'm guessing ATMEL_TC_ETRGEDG_NONE is zero and that's why Smatch thinks
> this can't possibly be true.
> =

> 5251e7147d627fb William Breathitt Gray 2020-09-26  174  		*action =3D COU=
NTER_SYNAPSE_ACTION_NONE;
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  175  	else if (cmr & A=
TMEL_TC_ETRGEDG_RISING)
> 5251e7147d627fb William Breathitt Gray 2020-09-26  176  		*action =3D COU=
NTER_SYNAPSE_ACTION_RISING_EDGE;
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  177  	else if (cmr & A=
TMEL_TC_ETRGEDG_FALLING)
> 5251e7147d627fb William Breathitt Gray 2020-09-26  178  		*action =3D COU=
NTER_SYNAPSE_ACTION_FALLING_EDGE;
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  179  	else if (cmr & A=
TMEL_TC_ETRGEDG_BOTH)
> 5251e7147d627fb William Breathitt Gray 2020-09-26  180  		*action =3D COU=
NTER_SYNAPSE_ACTION_BOTH_EDGES;
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  181  =

> 106b104137fd5f0 Kamel Bouhara          2020-07-06  182  	return 0;
> 106b104137fd5f0 Kamel Bouhara          2020-07-06  183  }
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =



> _______________________________________________
> kbuild mailing list -- kbuild(a)lists.01.org
> To unsubscribe send an email to kbuild-leave(a)lists.01.org


--===============1924530308708709246==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUFCQ2dBZEZpRUVrNUk0UERKMncx
Y0RmL2JnaHZwSU5kbTdWSklGQWwrTWRsVUFDZ2tRaHZwSU5kbTcKVkpMUDRBLy9SOWd6WHpBcWNx
NkhLUVhQY2ZaT2xsRGFwazJCaVNJNENXUi96VUp4K2xveTFTOTBZb0pTejIyawoxTXhUMUhRYXdh
djl3bW11Yjh2Z25lQ242dFg3ekJxOUhpVGdrYktQTnlBN3dMSHBoWWZlQncxZGI5OGlpTi9qCm01
ZG9mYWNPMEQyNE9jQkVINThyQjJ0b3JCb1dVeU9lWTRZellQUS9CYVRCMDMxSzdRMFFyQThIR3p6
MVJKUFQKRHpwSzVweGRIVHdQZzZwZUF1KzlpampOM2F4d3JTcjdIUDVGUmovRjNZenBoOGlMdTF1
SEQyV2ZOeEJJVml6WQovWTRyc0JCaHdkR3JCUCt2OFZ6VTNPNzdKVDBHVXZEbzk2b0ltbzE2Q2NO
S3hGdTNGWTBvQk9RNDlobkN4TDh6CkM4dmpuOUlRVEFCdU5sbXkycGtnQ1lNOGJMcXBObjI1NWNp
dGdrdkZuNnovYlVodnVjMXQ4Zm9QM3M5U096NWQKK1YxaDNFY3dHS0RhTWx2R1dCN3dQU0tEZGdB
Y1hsWEoyRGcwRkUrN0RDVCtWQUM3VE93bjVtYXAwRVRKaW9xMApvNlRwRVB6YjBFRjQxL3h5Skd0
YkVNYXlsRFFzcVFFN3ZuRmk0aGt6UGxiR0FTNG1aczFYT2NCWmZTdWx2VXh0CmhTYVJNaS9oTi9s
azhRSlphZFlCcUszVVFxUEoveVdUb3NpVFNHWS85NFRxUXNMbWV2aExhNEFPZUl4WjhtVlYKT3Vh
WmlZcXdCdXJSK1Y1akZDSGlMR1Fwcnp4akhGZXBYeTc4aXMwaE9pL0ZLNE9LenhVc0pLV0lhTW95
N1JVWgp1S3Z0NDlzNGN5dzNQZTJSRnVyQnZDR1FQNlFraXlwYzFwQ3pWSXdxTG5WRElZdVgzUkE9
Cj03Z0NDCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1924530308708709246==--

