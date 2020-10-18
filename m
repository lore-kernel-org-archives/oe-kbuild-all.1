Content-Type: multipart/mixed; boundary="===============0463078016315829885=="
MIME-Version: 1.0
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [dlech-linux:bone-counter 3/12] drivers/counter/counter-chrdev.c:189 counter_set_watch() warn: potential spectre issue 'counter->signals' (local cap)
Date: Sun, 18 Oct 2020 13:06:23 -0400
Message-ID: <20201018170623.GA551872@shinobu>
In-Reply-To: <20201014142234.GV1042@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0463078016315829885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 05:22:34PM +0300, Dan Carpenter wrote:
> tree:   https://github.com/dlech/linux bone-counter
> head:   f8f0ad10f30b5c1bea1a22f5de5dc9f2c6b7db1a
> commit: c4408f814b1a257c3854ec272e8348ef8fe55f48 [3/12] counter: Add char=
acter device interface
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

> smatch warnings:
> drivers/counter/counter-chrdev.c:189 counter_set_watch() warn: potential =
spectre issue 'counter->signals' [r] (local cap)
> drivers/counter/counter-chrdev.c:198 counter_set_watch() warn: potential =
spectre issue 'counter->counts' [r] (local cap)
> drivers/counter/counter-chrdev.c:242 counter_set_watch() warn: potential =
spectre issue 'ext' [r] (local cap)
> drivers/counter/counter-chrdev.c:247 counter_set_watch() warn: possible s=
pectre second half.  'comp_node.comp'
> =

> vim +189 drivers/counter/counter-chrdev.c
> =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  160  static int counte=
r_set_watch(struct counter_device *const counter,
> c4408f814b1a257 William Breathitt Gray 2020-09-26  161  			     const uns=
igned long arg)
> c4408f814b1a257 William Breathitt Gray 2020-09-26  162  {
> c4408f814b1a257 William Breathitt Gray 2020-09-26  163  	void __user *con=
st uwatch =3D (void __user *)arg;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  164  	struct counter_w=
atch watch;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  165  	struct counter_c=
omp_node comp_node;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  166  	size_t parent, i=
d;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  167  	struct counter_c=
omp *ext;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  168  	size_t num_ext;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  169  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  170  	if (copy_from_us=
er(&watch, uwatch, sizeof(watch)))
> c4408f814b1a257 William Breathitt Gray 2020-09-26  171  		return -EFAULT;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  172  	parent =3D watch=
.component.parent;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  173  	id =3D watch.com=
ponent.id;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  174  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  175  	/* Configure par=
ent component info for comp node */
> c4408f814b1a257 William Breathitt Gray 2020-09-26  176  	switch (watch.co=
mponent.scope) {
> c4408f814b1a257 William Breathitt Gray 2020-09-26  177  	case COUNTER_SCO=
PE_DEVICE:
> c4408f814b1a257 William Breathitt Gray 2020-09-26  178  		comp_node.paren=
t =3D NULL;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  179  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  180  		ext =3D counter=
->ext;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  181  		num_ext =3D cou=
nter->num_ext;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  182  		break;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  183  	case COUNTER_SCO=
PE_SIGNAL:
> c4408f814b1a257 William Breathitt Gray 2020-09-26  184  		if (counter->nu=
m_signals < parent + 1)
> =

> Smatch looks at these and complains about Spectre issues.  I'm not an
> expert at Spectre but that's probably a valid complaint and this code
> should be using array_index_nospec().
> =

> This code has some other bugs as well.
> =

> 1) "watch.component.parent" is a u64 but "parent" is a size_t so that's
> a potential problem on 32 bit systems.
> =

> 2) If "parent is ULONG_MAX then "parent + 1" will have an integer
>    overflow to zero leading to an out of bounds read.
> =

> The normal way to write these conditions is with the varable on the
> left and the limit on the right.  Use >=3D to avoid the integer overflow.
> So to solve all three bugs do:
> =

> 	u64 parent, id;
> =

> 	...
> =

> 	if (parent >=3D counter->num_signals)
> 		return -EINVAL;
> =

> 	parent =3D array_index_nospec(parent, counter->num_signals);
> =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  185  			return -EINVAL;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  186  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  187  		comp_node.paren=
t =3D counter->signals + parent;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  188  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26 @189  		ext =3D counter=
->signals[parent].ext;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  190  		num_ext =3D cou=
nter->signals[parent].num_ext;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  191  		break;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  192  	case COUNTER_SCO=
PE_COUNT:
> c4408f814b1a257 William Breathitt Gray 2020-09-26  193  		if (counter->nu=
m_counts < parent + 1)
> c4408f814b1a257 William Breathitt Gray 2020-09-26  194  			return -EINVAL;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  195  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  196  		comp_node.paren=
t =3D counter->counts + parent;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  197  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26 @198  		ext =3D counter=
->counts[parent].ext;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  199  		num_ext =3D cou=
nter->counts[parent].num_ext;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  200  		break;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  201  	default:
> c4408f814b1a257 William Breathitt Gray 2020-09-26  202  		return -EINVAL;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  203  	}
> c4408f814b1a257 William Breathitt Gray 2020-09-26  204  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  205  	/* Configure com=
ponent info for comp node */
> c4408f814b1a257 William Breathitt Gray 2020-09-26  206  	switch (watch.co=
mponent.type) {
> c4408f814b1a257 William Breathitt Gray 2020-09-26  207  	case COUNTER_COM=
PONENT_SIGNAL:
> c4408f814b1a257 William Breathitt Gray 2020-09-26  208  		if (watch.compo=
nent.scope !=3D COUNTER_SCOPE_SIGNAL)
> c4408f814b1a257 William Breathitt Gray 2020-09-26  209  			return -EINVAL;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  210  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  211  		comp_node.comp.=
type =3D COUNTER_COMP_SIGNAL_LEVEL;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  212  		comp_node.comp.=
signal_u8_read =3D counter->ops->signal_read;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  213  		break;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  214  	case COUNTER_COM=
PONENT_COUNT:
> c4408f814b1a257 William Breathitt Gray 2020-09-26  215  		if (watch.compo=
nent.scope !=3D COUNTER_SCOPE_COUNT)
> c4408f814b1a257 William Breathitt Gray 2020-09-26  216  			return -EINVAL;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  217  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  218  		comp_node.comp.=
type =3D COUNTER_COMP_U64;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  219  		comp_node.comp.=
count_u64_read =3D counter->ops->count_read;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  220  		break;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  221  	case COUNTER_COM=
PONENT_FUNCTION:
> c4408f814b1a257 William Breathitt Gray 2020-09-26  222  		if (watch.compo=
nent.scope !=3D COUNTER_SCOPE_COUNT)
> c4408f814b1a257 William Breathitt Gray 2020-09-26  223  			return -EINVAL;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  224  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  225  		comp_node.comp.=
type =3D COUNTER_COMP_FUNCTION;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  226  		comp_node.comp.=
count_u8_read =3D counter->ops->function_read;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  227  		break;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  228  	case COUNTER_COM=
PONENT_SYNAPSE_ACTION:
> c4408f814b1a257 William Breathitt Gray 2020-09-26  229  		if (watch.compo=
nent.scope !=3D COUNTER_SCOPE_COUNT)
> c4408f814b1a257 William Breathitt Gray 2020-09-26  230  			return -EINVAL;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  231  		if (counter->co=
unts[parent].num_synapses < id + 1)
> c4408f814b1a257 William Breathitt Gray 2020-09-26  232  			return -EINVAL;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  233  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  234  		comp_node.comp.=
type =3D COUNTER_COMP_SYNAPSE_ACTION;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  235  		comp_node.comp.=
action_read =3D counter->ops->action_read;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  236  		comp_node.comp.=
priv =3D counter->counts[parent].synapses + id;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  237  		break;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  238  	case COUNTER_COM=
PONENT_EXTENSION:
> c4408f814b1a257 William Breathitt Gray 2020-09-26  239  		if (num_ext < i=
d + 1)
> c4408f814b1a257 William Breathitt Gray 2020-09-26  240  			return -EINVAL;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  241  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26 @242  		comp_node.comp =
=3D ext[id];
> c4408f814b1a257 William Breathitt Gray 2020-09-26  243  		break;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  244  	default:
> c4408f814b1a257 William Breathitt Gray 2020-09-26  245  		return -EINVAL;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  246  	}
> c4408f814b1a257 William Breathitt Gray 2020-09-26 @247  	if (!comp_node.c=
omp.count_u8_read)
> c4408f814b1a257 William Breathitt Gray 2020-09-26  248  		return -EFAULT;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  249  	comp_node.compon=
ent =3D watch.component;
> c4408f814b1a257 William Breathitt Gray 2020-09-26  250  =

> c4408f814b1a257 William Breathitt Gray 2020-09-26  251  	return counter_s=
et_event_node(counter, &watch, &comp_node);
> c4408f814b1a257 William Breathitt Gray 2020-09-26  252  }
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



--===============0463078016315829885==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUFCQ2dBZEZpRUVrNUk0UERKMncx
Y0RmL2JnaHZwSU5kbTdWSklGQWwrTWRnOEFDZ2tRaHZwSU5kbTcKVkpKb254QUFrWHB1QWtPN09q
d0xpOWh2VEhoMmhMOGQrcFAzMFZpVVNyV2doRUN2N1RBbFppMjBUVkxveXNudgo1KzJtZGxHQ2Ra
cElMZzYvNUxNdHNTSTBTMjNtTzhsSVJkOGx4QXhGNjhsR0N4eHpvSDdqK2NNOUUrMVM0SmlZCnZ5
LzFuRTcrUmI0RWxuR1AvUkEwRlRtWDd2MGFhcFM5UnBGSFZIRTlZZENyMFRHeTdRaTZObEJyZUs1
SjUvSm4KMGhTZ1k1aUZDZ1cyS1R0eTlramRpVXZhTEVlZ2dNbXgzKzVDcXZjRmc0OHl0LzhWcVVB
eXRlRHlBWGpZQ2N3Ygo0b0ZkRHdRSzhiN0JZS1BZeG5rcWs4bWNxa0tCRUg2UU5KTWZmbmVUaEdV
NUJOTHFoSHdscmkreUNYZEcwbzR2CkFqL2dObFA5Rk5tUHM4WGFGcDVvNnhKZ2pDcXlSVDAvOFo5
MUtzVEJUaldINjgzQXdmZ0FlV09MK1psd0lETWEKcnlsaFRkcms5dEtjQ3JLR3ZVeUh6WnNOOUYv
ZzZqYUh3ZmpvNzU4cy9rR0xZY1J4Sy9mRjRhMGtIVkdjRnIyawo0REF3NnNseEY5cGM1WTM5eERX
WlB0Myt2ck11TmtOam9PYW9leDBCUnV5RVErblRIK1JtbmhGRDdQREtUUkhWCkpzanJLanVLaEIv
c1lkdU53MzdVaUJBeGRudEgxbUUxQ0pXRXRMT056Y2F5czR1N3IzVFI0SlZyRXlKWFVBdVcKOStP
TmZ4RGt0cjk3TVYvM2lDaFVqdll5SGpEekhrZ3Y5VkRJWFJiQzAyYTY3YTBzSUk5S3FlUE41MGY0
dlArNwpZRFVtWHN6OG1JZmFGU01rdWlJdHZzcVJPQzFnVWVDRlgwMkRyNmRMU2l4RmNZbE1nbUk9
Cj1PR0NGCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0463078016315829885==--

