Content-Type: multipart/mixed; boundary="===============3328985278998339126=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/vhost/vdpa.c:361:13: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Fri, 15 Jan 2021 17:45:04 +0800
Message-ID: <202101151758.lPF0Ywnf-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3328985278998339126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5ee88057889bbca5f5bb96031b62b3756b33e164
commit: e5fc436f06eef54ef512ea55a9db8eb9f2e76959 sparse: use static inline =
for __chk_{user,io}_ptr()
date:   5 months ago
config: sh-randconfig-s032-20210115 (attached as .config)
compiler: sh4-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De5fc436f06eef54ef512ea55a9db8eb9f2e76959
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e5fc436f06eef54ef512ea55a9db8eb9f2e76959
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dsh =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/vhost/vdpa.c:361:13: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected unsigned int const *__gu_addr=
 @@     got unsigned int [noderef] [usertype] __user * @@
   drivers/vhost/vdpa.c:361:13: sparse:     expected unsigned int const *__=
gu_addr
   drivers/vhost/vdpa.c:361:13: sparse:     got unsigned int [noderef] [use=
rtype] __user *
>> drivers/vhost/vdpa.c:361:13: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const volatile [noderef] =
__user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/vhost/vdpa.c:361:13: sparse:     expected void const volatile [n=
oderef] __user *ptr
   drivers/vhost/vdpa.c:361:13: sparse:     got unsigned int const *__gu_ad=
dr
--
   drivers/net/ppp/pppoe.c:765:21: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected int const *__gu_addr @@   =
  got int [noderef] __user * @@
   drivers/net/ppp/pppoe.c:765:21: sparse:     expected int const *__gu_addr
   drivers/net/ppp/pppoe.c:765:21: sparse:     got int [noderef] __user *
>> drivers/net/ppp/pppoe.c:765:21: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/pppoe.c:765:21: sparse:     expected void const volatile=
 [noderef] __user *ptr
   drivers/net/ppp/pppoe.c:765:21: sparse:     got int const *__gu_addr
   drivers/net/ppp/pppoe.c:778:21: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected int const *__gu_addr @@   =
  got int [noderef] __user * @@
   drivers/net/ppp/pppoe.c:778:21: sparse:     expected int const *__gu_addr
   drivers/net/ppp/pppoe.c:778:21: sparse:     got int [noderef] __user *
   drivers/net/ppp/pppoe.c:778:21: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/pppoe.c:778:21: sparse:     expected void const volatile=
 [noderef] __user *ptr
   drivers/net/ppp/pppoe.c:778:21: sparse:     got int const *__gu_addr
--
   drivers/net/ppp/ppp_generic.c:925:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:925:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:925:21: sparse:     got int [noderef] __us=
er *p
>> drivers/net/ppp/ppp_generic.c:925:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:925:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:925:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:939:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:939:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:939:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:939:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:939:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:939:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:954:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:954:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:954:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:954:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:954:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:954:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:651:29: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:651:29: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:651:29: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:651:29: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:651:29: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:651:29: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:681:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:681:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:681:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:681:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:681:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:681:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:688:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:688:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:688:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:688:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:688:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:688:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:726:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:726:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:726:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:726:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:726:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:726:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:755:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:755:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:755:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:755:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:755:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:755:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:823:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:823:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:823:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:823:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:823:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:823:21: sparse:     got int const *__gu_ad=
dr
--
   net/atm/pppoatm.c:376:24: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user * @@
   net/atm/pppoatm.c:376:24: sparse:     expected int const *__gu_addr
   net/atm/pppoatm.c:376:24: sparse:     got int [noderef] __user *
>> net/atm/pppoatm.c:376:24: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
   net/atm/pppoatm.c:376:24: sparse:     expected void const volatile [node=
ref] __user *ptr
   net/atm/pppoatm.c:376:24: sparse:     got int const *__gu_addr
   net/atm/pppoatm.c:453:21: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected unsigned short const *__gu_addr =
@@     got unsigned short [noderef] [usertype] __user * @@
   net/atm/pppoatm.c:453:21: sparse:     expected unsigned short const *__g=
u_addr
   net/atm/pppoatm.c:453:21: sparse:     got unsigned short [noderef] [user=
type] __user *
>> net/atm/pppoatm.c:453:21: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got unsigned short const *__gu_addr @@
   net/atm/pppoatm.c:453:21: sparse:     expected void const volatile [node=
ref] __user *ptr
   net/atm/pppoatm.c:453:21: sparse:     got unsigned short const *__gu_addr
--
   net/packet/af_packet.c:3942:13: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected int const *__gu_addr @@   =
  got int [noderef] __user *optlen @@
   net/packet/af_packet.c:3942:13: sparse:     expected int const *__gu_addr
   net/packet/af_packet.c:3942:13: sparse:     got int [noderef] __user *op=
tlen
>> net/packet/af_packet.c:3942:13: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got int const *__gu_addr @@
   net/packet/af_packet.c:3942:13: sparse:     expected void const volatile=
 [noderef] __user *ptr
   net/packet/af_packet.c:3942:13: sparse:     got int const *__gu_addr
   net/packet/af_packet.c:1008:13: sparse: sparse: context imbalance in '__=
packet_lookup_frame_in_block' - different lock contexts for basic block
   net/packet/af_packet.c:2402:17: sparse: sparse: context imbalance in 'tp=
acket_rcv' - unexpected unlock
--
   net/xdp/xsk.c:835:13: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int const *__gu_addr @@     got int =
[noderef] __user *optlen @@
   net/xdp/xsk.c:835:13: sparse:     expected int const *__gu_addr
   net/xdp/xsk.c:835:13: sparse:     got int [noderef] __user *optlen
>> net/xdp/xsk.c:835:13: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected void const volatile [noderef] __user =
*ptr @@     got int const *__gu_addr @@
   net/xdp/xsk.c:835:13: sparse:     expected void const volatile [noderef]=
 __user *ptr
   net/xdp/xsk.c:835:13: sparse:     got int const *__gu_addr

vim +361 drivers/vhost/vdpa.c

2cf1ba9a4d15cb78 Zhu Lingshan 2020-07-31  346  =

4c8cf31885f69e86 Tiwei Bie    2020-03-26  347  static long vhost_vdpa_vring=
_ioctl(struct vhost_vdpa *v, unsigned int cmd,
4c8cf31885f69e86 Tiwei Bie    2020-03-26  348  				   void __user *argp)
4c8cf31885f69e86 Tiwei Bie    2020-03-26  349  {
4c8cf31885f69e86 Tiwei Bie    2020-03-26  350  	struct vdpa_device *vdpa =
=3D v->vdpa;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  351  	const struct vdpa_config_op=
s *ops =3D vdpa->config;
aac50c0bd434794b Eli Cohen    2020-08-04  352  	struct vdpa_vq_state vq_sta=
te;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  353  	struct vdpa_callback cb;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  354  	struct vhost_virtqueue *vq;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  355  	struct vhost_vring_state s;
653055b9acd45d60 Jason Wang   2020-08-04  356  	u64 __user *featurep =3D ar=
gp;
653055b9acd45d60 Jason Wang   2020-08-04  357  	u64 features;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  358  	u32 idx;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  359  	long r;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  360  =

4c8cf31885f69e86 Tiwei Bie    2020-03-26 @361  	r =3D get_user(idx, (u32 __=
user *)argp);
4c8cf31885f69e86 Tiwei Bie    2020-03-26  362  	if (r < 0)
4c8cf31885f69e86 Tiwei Bie    2020-03-26  363  		return r;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  364  =

4c8cf31885f69e86 Tiwei Bie    2020-03-26  365  	if (idx >=3D v->nvqs)
4c8cf31885f69e86 Tiwei Bie    2020-03-26  366  		return -ENOBUFS;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  367  =

4c8cf31885f69e86 Tiwei Bie    2020-03-26  368  	idx =3D array_index_nospec(=
idx, v->nvqs);
4c8cf31885f69e86 Tiwei Bie    2020-03-26  369  	vq =3D &v->vqs[idx];
4c8cf31885f69e86 Tiwei Bie    2020-03-26  370  =

b0bd82bf729dbd05 Jason Wang   2020-08-04  371  	switch (cmd) {
b0bd82bf729dbd05 Jason Wang   2020-08-04  372  	case VHOST_VDPA_SET_VRING_E=
NABLE:
4c8cf31885f69e86 Tiwei Bie    2020-03-26  373  		if (copy_from_user(&s, arg=
p, sizeof(s)))
4c8cf31885f69e86 Tiwei Bie    2020-03-26  374  			return -EFAULT;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  375  		ops->set_vq_ready(vdpa, id=
x, s.num);
4c8cf31885f69e86 Tiwei Bie    2020-03-26  376  		return 0;
b0bd82bf729dbd05 Jason Wang   2020-08-04  377  	case VHOST_GET_VRING_BASE:
23750e39d57433d0 Eli Cohen    2020-08-04  378  		r =3D ops->get_vq_state(v-=
>vdpa, idx, &vq_state);
23750e39d57433d0 Eli Cohen    2020-08-04  379  		if (r)
23750e39d57433d0 Eli Cohen    2020-08-04  380  			return r;
23750e39d57433d0 Eli Cohen    2020-08-04  381  =

aac50c0bd434794b Eli Cohen    2020-08-04  382  		vq->last_avail_idx =3D vq_=
state.avail_index;
b0bd82bf729dbd05 Jason Wang   2020-08-04  383  		break;
653055b9acd45d60 Jason Wang   2020-08-04  384  	case VHOST_GET_BACKEND_FEAT=
URES:
653055b9acd45d60 Jason Wang   2020-08-04  385  		features =3D VHOST_VDPA_BA=
CKEND_FEATURES;
653055b9acd45d60 Jason Wang   2020-08-04  386  		if (copy_to_user(featurep,=
 &features, sizeof(features)))
653055b9acd45d60 Jason Wang   2020-08-04  387  			return -EFAULT;
653055b9acd45d60 Jason Wang   2020-08-04  388  		return 0;
653055b9acd45d60 Jason Wang   2020-08-04  389  	case VHOST_SET_BACKEND_FEAT=
URES:
653055b9acd45d60 Jason Wang   2020-08-04  390  		if (copy_from_user(&featur=
es, featurep, sizeof(features)))
653055b9acd45d60 Jason Wang   2020-08-04  391  			return -EFAULT;
653055b9acd45d60 Jason Wang   2020-08-04  392  		if (features & ~VHOST_VDPA=
_BACKEND_FEATURES)
653055b9acd45d60 Jason Wang   2020-08-04  393  			return -EOPNOTSUPP;
653055b9acd45d60 Jason Wang   2020-08-04  394  		vhost_set_backend_features=
(&v->vdev, features);
653055b9acd45d60 Jason Wang   2020-08-04  395  		return 0;
b0bd82bf729dbd05 Jason Wang   2020-08-04  396  	}
4c8cf31885f69e86 Tiwei Bie    2020-03-26  397  =

4c8cf31885f69e86 Tiwei Bie    2020-03-26  398  	r =3D vhost_vring_ioctl(&v-=
>vdev, cmd, argp);
4c8cf31885f69e86 Tiwei Bie    2020-03-26  399  	if (r)
4c8cf31885f69e86 Tiwei Bie    2020-03-26  400  		return r;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  401  =

4c8cf31885f69e86 Tiwei Bie    2020-03-26  402  	switch (cmd) {
4c8cf31885f69e86 Tiwei Bie    2020-03-26  403  	case VHOST_SET_VRING_ADDR:
4c8cf31885f69e86 Tiwei Bie    2020-03-26  404  		if (ops->set_vq_address(vd=
pa, idx,
4c8cf31885f69e86 Tiwei Bie    2020-03-26  405  					(u64)(uintptr_t)vq->des=
c,
4c8cf31885f69e86 Tiwei Bie    2020-03-26  406  					(u64)(uintptr_t)vq->ava=
il,
4c8cf31885f69e86 Tiwei Bie    2020-03-26  407  					(u64)(uintptr_t)vq->use=
d))
4c8cf31885f69e86 Tiwei Bie    2020-03-26  408  			r =3D -EINVAL;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  409  		break;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  410  =

4c8cf31885f69e86 Tiwei Bie    2020-03-26  411  	case VHOST_SET_VRING_BASE:
aac50c0bd434794b Eli Cohen    2020-08-04  412  		vq_state.avail_index =3D v=
q->last_avail_idx;
aac50c0bd434794b Eli Cohen    2020-08-04  413  		if (ops->set_vq_state(vdpa=
, idx, &vq_state))
4c8cf31885f69e86 Tiwei Bie    2020-03-26  414  			r =3D -EINVAL;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  415  		break;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  416  =

4c8cf31885f69e86 Tiwei Bie    2020-03-26  417  	case VHOST_SET_VRING_CALL:
265a0ad8731dc04f Zhu Lingshan 2020-07-31  418  		if (vq->call_ctx.ctx) {
4c8cf31885f69e86 Tiwei Bie    2020-03-26  419  			cb.callback =3D vhost_vdp=
a_virtqueue_cb;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  420  			cb.private =3D vq;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  421  		} else {
4c8cf31885f69e86 Tiwei Bie    2020-03-26  422  			cb.callback =3D NULL;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  423  			cb.private =3D NULL;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  424  		}
4c8cf31885f69e86 Tiwei Bie    2020-03-26  425  		ops->set_vq_cb(vdpa, idx, =
&cb);
2cf1ba9a4d15cb78 Zhu Lingshan 2020-07-31  426  		vhost_vdpa_setup_vq_irq(v,=
 idx);
4c8cf31885f69e86 Tiwei Bie    2020-03-26  427  		break;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  428  =

4c8cf31885f69e86 Tiwei Bie    2020-03-26  429  	case VHOST_SET_VRING_NUM:
4c8cf31885f69e86 Tiwei Bie    2020-03-26  430  		ops->set_vq_num(vdpa, idx,=
 vq->num);
4c8cf31885f69e86 Tiwei Bie    2020-03-26  431  		break;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  432  	}
4c8cf31885f69e86 Tiwei Bie    2020-03-26  433  =

4c8cf31885f69e86 Tiwei Bie    2020-03-26  434  	return r;
4c8cf31885f69e86 Tiwei Bie    2020-03-26  435  }
4c8cf31885f69e86 Tiwei Bie    2020-03-26  436  =


:::::: The code at line 361 was first introduced by commit
:::::: 4c8cf31885f69e86be0b5b9e6677a26797365e1d vhost: introduce vDPA-based=
 backend

:::::: TO: Tiwei Bie <tiwei.bie@intel.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3328985278998339126==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
J9QvAzNg1vX35qxPsp+dJ/A/Q3eczPEvAQA=
--===============3328985278998339126==--

