Content-Type: multipart/mixed; boundary="===============5109122143681147954=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/vhost/vhost.c:1603:13: sparse: sparse: incorrect type in initializer (different address spaces)
Date: Wed, 20 May 2020 00:57:31 +0800
Message-ID: <202005200022.yczjkPeJ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5109122143681147954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   642b151f45dd54809ea00ecd3976a56c1ec9b53d
commit: 20c384f1ea1a0bc7320bc445c72dd02d2970d594 vhost: refine vhost and vr=
ingh kconfig
date:   7 weeks ago
config: m68k-randconfig-s001-20200519 (attached as .config)
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout 20c384f1ea1a0bc7320bc445c72dd02d2970d594
        # save the attached .config to linux build tree
        make C=3D1 ARCH=3Dm68k CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/vhost/vhost.c:1603:13: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@    expected void const *__gu_ptr @@    g=
ot unsigned int [noderef] [usertypvoid const *__gu_ptr @@
>> drivers/vhost/vhost.c:1603:13: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:1603:13: sparse:    got unsigned int [noderef] [us=
ertype] <asn:1> *idxp
>> drivers/vhost/vhost.c:1800:21: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@    expected void const *__gu_ptr @@    g=
ot int [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:1800:21: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:1800:21: sparse:    got int [noderef] <asn:1> *
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
   drivers/vhost/vhost.c:937:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void *addr @@    got restricte=
d __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:937:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:937:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void [noderef] <asn:1> *addr @=
@    got n:1> *addr @@
   drivers/vhost/vhost.c:900:42: sparse:    expected void [noderef] <asn:1>=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:    got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
   drivers/vhost/vhost.c:922:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void *addr @@    got restricte=
d __virtio16 [noderef] [usertype] <asvoid *addr @@
   drivers/vhost/vhost.c:922:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:922:16: sparse:    got restricted __virtio16 [node=
ref] [usertype] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void [noderef] <asn:1> *addr @=
@    got n:1> *addr @@
   drivers/vhost/vhost.c:900:42: sparse:    expected void [noderef] <asn:1>=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:    got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
>> drivers/vhost/vhost.c:1014:16: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@    expected void const *__gu_ptr @@    g=
ot restricted __virtio16 [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:1014:16: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:1014:16: sparse:    got restricted __virtio16 [nod=
eref] <asn:1> *
   drivers/vhost/vhost.c:1014:16: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@    expected void *addr @@    got restrict=
ed __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:1014:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:1014:16: sparse:    got restricted __virtio16 [nod=
eref] <asn:1> *
>> drivers/vhost/vhost.c:1014:16: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@    expected void const *__gu_ptr @@    g=
ot restricted __virtio16 [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:1014:16: sparse:    expected void const *__gu_ptr
>> drivers/vhost/vhost.c:1014:16: sparse:    got restricted __virtio16 [nod=
eref] <asn:1> *from
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void [noderef] <asn:1> *addr @=
@    got n:1> *addr @@
   drivers/vhost/vhost.c:900:42: sparse:    expected void [noderef] <asn:1>=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:    got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@    expected void const *__gu_ptr @@    go=
t restricted __virtio16 [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:989:16: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:989:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void *addr @@    got restricte=
d __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:989:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@    expected void const *__gu_ptr @@    go=
t restricted __virtio16 [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:989:16: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:989:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *from
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void [noderef] <asn:1> *addr @=
@    got n:1> *addr @@
   drivers/vhost/vhost.c:900:42: sparse:    expected void [noderef] <asn:1>=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:    got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
   drivers/vhost/vhost.c:995:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@    expected void const *__gu_ptr @@    go=
t restricted __virtio16 [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:995:16: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:995:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:995:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void *addr @@    got restricte=
d __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:995:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:995:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:995:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@    expected void const *__gu_ptr @@    go=
t restricted __virtio16 [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:995:16: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:995:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *from
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void [noderef] <asn:1> *addr @=
@    got n:1> *addr @@
   drivers/vhost/vhost.c:900:42: sparse:    expected void [noderef] <asn:1>=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:    got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
   drivers/vhost/vhost.c:944:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void *addr @@    got restricte=
d __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:944:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:944:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void [noderef] <asn:1> *addr @=
@    got n:1> *addr @@
   drivers/vhost/vhost.c:900:42: sparse:    expected void [noderef] <asn:1>=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:    got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
   drivers/vhost/vhost.c:1002:16: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@    expected void const *__gu_ptr @@    g=
ot restricted __virtio16 [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:1002:16: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:1002:16: sparse:    got restricted __virtio16 [nod=
eref] <asn:1> *
   drivers/vhost/vhost.c:1002:16: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@    expected void *addr @@    got restrict=
ed __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:1002:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:1002:16: sparse:    got restricted __virtio16 [nod=
eref] <asn:1> *
   drivers/vhost/vhost.c:1002:16: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@    expected void const *__gu_ptr @@    g=
ot restricted __virtio16 [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:1002:16: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:1002:16: sparse:    got restricted __virtio16 [nod=
eref] <asn:1> *from
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void [noderef] <asn:1> *addr @=
@    got n:1> *addr @@
   drivers/vhost/vhost.c:900:42: sparse:    expected void [noderef] <asn:1>=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:    got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
>> drivers/vhost/vhost.c:1008:16: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@    expected void const *__gu_ptr @@    g=
ot restricted __virtio16 [noderef] [usertypvoid const *__gu_ptr @@
   drivers/vhost/vhost.c:1008:16: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:1008:16: sparse:    got restricted __virtio16 [nod=
eref] [usertype] <asn:1> *
   drivers/vhost/vhost.c:1008:16: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@    expected void *addr @@    got restrict=
ed __virtio16 [noderef] [usertype] <asvoid *addr @@
   drivers/vhost/vhost.c:1008:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:1008:16: sparse:    got restricted __virtio16 [nod=
eref] [usertype] <asn:1> *
>> drivers/vhost/vhost.c:1008:16: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@    expected void const *__gu_ptr @@    g=
ot restricted __virtio16 [noderef] [usertypvoid const *__gu_ptr @@
   drivers/vhost/vhost.c:1008:16: sparse:    expected void const *__gu_ptr
>> drivers/vhost/vhost.c:1008:16: sparse:    got restricted __virtio16 [nod=
eref] [usertype] <asn:1> *from
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void [noderef] <asn:1> *addr @=
@    got n:1> *addr @@
   drivers/vhost/vhost.c:900:42: sparse:    expected void [noderef] <asn:1>=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:    got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@    expected void const *__gu_ptr @@    go=
t restricted __virtio16 [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:989:16: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:989:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void *addr @@    got restricte=
d __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:989:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@    expected void const *__gu_ptr @@    go=
t restricted __virtio16 [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:989:16: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:989:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *from
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void [noderef] <asn:1> *addr @=
@    got n:1> *addr @@
   drivers/vhost/vhost.c:900:42: sparse:    expected void [noderef] <asn:1>=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:    got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@    expected void const *__gu_ptr @@    go=
t restricted __virtio16 [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:989:16: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:989:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void *addr @@    got restricte=
d __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:989:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@    expected void const *__gu_ptr @@    go=
t restricted __virtio16 [noderevoid const *__gu_ptr @@
   drivers/vhost/vhost.c:989:16: sparse:    expected void const *__gu_ptr
   drivers/vhost/vhost.c:989:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *from
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void [noderef] <asn:1> *addr @=
@    got n:1> *addr @@
   drivers/vhost/vhost.c:900:42: sparse:    expected void [noderef] <asn:1>=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:    got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected void [noderef] <asn:1> =
* @@    got n:1> * @@
   drivers/vhost/vhost.c:753:17: sparse:    expected void [noderef] <asn:1>=
 *
   drivers/vhost/vhost.c:753:17: sparse:    got void *
--
   drivers/vhost/scsi.c:1218:30: sparse: sparse: restricted __virtio32 degr=
ades to integer
   drivers/vhost/scsi.c:1218:30: sparse: sparse: restricted __virtio32 degr=
ades to integer
>> drivers/vhost/scsi.c:1697:21: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@    expected void const *__gu_ptr @@    go=
t unsigned int [noderef] [usertypvoid const *__gu_ptr @@
>> drivers/vhost/scsi.c:1697:21: sparse:    expected void const *__gu_ptr
   drivers/vhost/scsi.c:1697:21: sparse:    got unsigned int [noderef] [use=
rtype] <asn:1> *eventsp

vim +1603 drivers/vhost/vhost.c

feebcaeac79ad86 Jason Wang         2019-05-24  1566  =

feebcaeac79ad86 Jason Wang         2019-05-24  1567  static long vhost_vrin=
g_set_num_addr(struct vhost_dev *d,
feebcaeac79ad86 Jason Wang         2019-05-24  1568  				     struct vhost_=
virtqueue *vq,
feebcaeac79ad86 Jason Wang         2019-05-24  1569  				     unsigned int =
ioctl,
feebcaeac79ad86 Jason Wang         2019-05-24  1570  				     void __user *=
argp)
feebcaeac79ad86 Jason Wang         2019-05-24  1571  {
feebcaeac79ad86 Jason Wang         2019-05-24  1572  	long r;
feebcaeac79ad86 Jason Wang         2019-05-24  1573  =

feebcaeac79ad86 Jason Wang         2019-05-24  1574  	mutex_lock(&vq->mutex=
);
feebcaeac79ad86 Jason Wang         2019-05-24  1575  =

feebcaeac79ad86 Jason Wang         2019-05-24  1576  	switch (ioctl) {
feebcaeac79ad86 Jason Wang         2019-05-24  1577  	case VHOST_SET_VRING_=
NUM:
feebcaeac79ad86 Jason Wang         2019-05-24  1578  		r =3D vhost_vring_se=
t_num(d, vq, argp);
feebcaeac79ad86 Jason Wang         2019-05-24  1579  		break;
feebcaeac79ad86 Jason Wang         2019-05-24  1580  	case VHOST_SET_VRING_=
ADDR:
feebcaeac79ad86 Jason Wang         2019-05-24  1581  		r =3D vhost_vring_se=
t_addr(d, vq, argp);
feebcaeac79ad86 Jason Wang         2019-05-24  1582  		break;
feebcaeac79ad86 Jason Wang         2019-05-24  1583  	default:
feebcaeac79ad86 Jason Wang         2019-05-24  1584  		BUG();
feebcaeac79ad86 Jason Wang         2019-05-24  1585  	}
feebcaeac79ad86 Jason Wang         2019-05-24  1586  =

feebcaeac79ad86 Jason Wang         2019-05-24  1587  	mutex_unlock(&vq->mut=
ex);
feebcaeac79ad86 Jason Wang         2019-05-24  1588  =

feebcaeac79ad86 Jason Wang         2019-05-24  1589  	return r;
feebcaeac79ad86 Jason Wang         2019-05-24  1590  }
26b36604523f4a6 Sonny Rao          2018-03-14  1591  long vhost_vring_ioctl=
(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1592  {
cecb46f194460d2 Al Viro            2012-08-27  1593  	struct file *eventfp,=
 *filep =3D NULL;
cecb46f194460d2 Al Viro            2012-08-27  1594  	bool pollstart =3D fa=
lse, pollstop =3D false;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1595  	struct eventfd_ctx *c=
tx =3D NULL;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1596  	u32 __user *idxp =3D =
argp;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1597  	struct vhost_virtqueu=
e *vq;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1598  	struct vhost_vring_st=
ate s;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1599  	struct vhost_vring_fi=
le f;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1600  	u32 idx;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1601  	long r;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1602  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14 @1603  	r =3D get_user(idx, i=
dxp);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1604  	if (r < 0)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1605  		return r;
0f3d9a17469d71b Krishna Kumar      2010-05-25  1606  	if (idx >=3D d->nvqs)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1607  		return -ENOBUFS;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1608  =

ff002269a4ee9c7 Jason Wang         2018-10-30  1609  	idx =3D array_index_n=
ospec(idx, d->nvqs);
3ab2e420ec1caf4 Asias He           2013-04-27  1610  	vq =3D d->vqs[idx];
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1611  =

feebcaeac79ad86 Jason Wang         2019-05-24  1612  	if (ioctl =3D=3D VHOS=
T_SET_VRING_NUM ||
feebcaeac79ad86 Jason Wang         2019-05-24  1613  	    ioctl =3D=3D VHOS=
T_SET_VRING_ADDR) {
feebcaeac79ad86 Jason Wang         2019-05-24  1614  		return vhost_vring_s=
et_num_addr(d, vq, ioctl, argp);
feebcaeac79ad86 Jason Wang         2019-05-24  1615  	}
feebcaeac79ad86 Jason Wang         2019-05-24  1616  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1617  	mutex_lock(&vq->mutex=
);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1618  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1619  	switch (ioctl) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1620  	case VHOST_SET_VRING_=
BASE:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1621  		/* Moving base with =
an active backend?
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1622  		 * You don't want to=
 do that. */
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1623  		if (vq->private_data=
) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1624  			r =3D -EBUSY;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1625  			break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1626  		}
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1627  		if (copy_from_user(&=
s, argp, sizeof s)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1628  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1629  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1630  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1631  		if (s.num > 0xffff) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1632  			r =3D -EINVAL;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1633  			break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1634  		}
8d65843c44269c2 Jason Wang         2017-07-27  1635  		vq->last_avail_idx =
=3D s.num;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1636  		/* Forget the cached=
 index value. */
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1637  		vq->avail_idx =3D vq=
->last_avail_idx;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1638  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1639  	case VHOST_GET_VRING_=
BASE:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1640  		s.index =3D idx;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1641  		s.num =3D vq->last_a=
vail_idx;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1642  		if (copy_to_user(arg=
p, &s, sizeof s))
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1643  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1644  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1645  	case VHOST_SET_VRING_=
KICK:
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1646  		if (copy_from_user(&=
f, argp, sizeof f)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1647  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1648  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1649  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1650  		eventfp =3D f.fd =3D=
=3D -1 ? NULL : eventfd_fget(f.fd);
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1651  		if (IS_ERR(eventfp))=
 {
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1652  			r =3D PTR_ERR(event=
fp);
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1653  			break;
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1654  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1655  		if (eventfp !=3D vq-=
>kick) {
cecb46f194460d2 Al Viro            2012-08-27  1656  			pollstop =3D (filep=
 =3D vq->kick) !=3D NULL;
cecb46f194460d2 Al Viro            2012-08-27  1657  			pollstart =3D (vq->=
kick =3D eventfp) !=3D NULL;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1658  		} else
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1659  			filep =3D eventfp;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1660  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1661  	case VHOST_SET_VRING_=
CALL:
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1662  		if (copy_from_user(&=
f, argp, sizeof f)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1663  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1664  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1665  		}
e050c7d93f4adb2 Eric Biggers       2018-01-06  1666  		ctx =3D f.fd =3D=3D =
-1 ? NULL : eventfd_ctx_fdget(f.fd);
e050c7d93f4adb2 Eric Biggers       2018-01-06  1667  		if (IS_ERR(ctx)) {
e050c7d93f4adb2 Eric Biggers       2018-01-06  1668  			r =3D PTR_ERR(ctx);
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1669  			break;
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1670  		}
e050c7d93f4adb2 Eric Biggers       2018-01-06  1671  		swap(ctx, vq->call_c=
tx);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1672  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1673  	case VHOST_SET_VRING_=
ERR:
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1674  		if (copy_from_user(&=
f, argp, sizeof f)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1675  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1676  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1677  		}
09f332a589232f5 Eric Biggers       2018-01-06  1678  		ctx =3D f.fd =3D=3D =
-1 ? NULL : eventfd_ctx_fdget(f.fd);
09f332a589232f5 Eric Biggers       2018-01-06  1679  		if (IS_ERR(ctx)) {
09f332a589232f5 Eric Biggers       2018-01-06  1680  			r =3D PTR_ERR(ctx);
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1681  			break;
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1682  		}
09f332a589232f5 Eric Biggers       2018-01-06  1683  		swap(ctx, vq->error_=
ctx);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1684  		break;
2751c9882b94729 Greg Kurz          2015-04-24  1685  	case VHOST_SET_VRING_=
ENDIAN:
2751c9882b94729 Greg Kurz          2015-04-24  1686  		r =3D vhost_set_vrin=
g_endian(vq, argp);
2751c9882b94729 Greg Kurz          2015-04-24  1687  		break;
2751c9882b94729 Greg Kurz          2015-04-24  1688  	case VHOST_GET_VRING_=
ENDIAN:
2751c9882b94729 Greg Kurz          2015-04-24  1689  		r =3D vhost_get_vrin=
g_endian(vq, idx, argp);
2751c9882b94729 Greg Kurz          2015-04-24  1690  		break;
030881372460654 Jason Wang         2016-03-04  1691  	case VHOST_SET_VRING_=
BUSYLOOP_TIMEOUT:
030881372460654 Jason Wang         2016-03-04  1692  		if (copy_from_user(&=
s, argp, sizeof(s))) {
030881372460654 Jason Wang         2016-03-04  1693  			r =3D -EFAULT;
030881372460654 Jason Wang         2016-03-04  1694  			break;
030881372460654 Jason Wang         2016-03-04  1695  		}
030881372460654 Jason Wang         2016-03-04  1696  		vq->busyloop_timeout=
 =3D s.num;
030881372460654 Jason Wang         2016-03-04  1697  		break;
030881372460654 Jason Wang         2016-03-04  1698  	case VHOST_GET_VRING_=
BUSYLOOP_TIMEOUT:
030881372460654 Jason Wang         2016-03-04  1699  		s.index =3D idx;
030881372460654 Jason Wang         2016-03-04  1700  		s.num =3D vq->busylo=
op_timeout;
030881372460654 Jason Wang         2016-03-04  1701  		if (copy_to_user(arg=
p, &s, sizeof(s)))
030881372460654 Jason Wang         2016-03-04  1702  			r =3D -EFAULT;
030881372460654 Jason Wang         2016-03-04  1703  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1704  	default:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1705  		r =3D -ENOIOCTLCMD;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1706  	}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1707  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1708  	if (pollstop && vq->h=
andle_kick)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1709  		vhost_poll_stop(&vq-=
>poll);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1710  =

e050c7d93f4adb2 Eric Biggers       2018-01-06  1711  	if (!IS_ERR_OR_NULL(c=
tx))
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1712  		eventfd_ctx_put(ctx);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1713  	if (filep)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1714  		fput(filep);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1715  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1716  	if (pollstart && vq->=
handle_kick)
2b8b328b61c7999 Jason Wang         2013-01-28  1717  		r =3D vhost_poll_sta=
rt(&vq->poll, vq->kick);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1718  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1719  	mutex_unlock(&vq->mut=
ex);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1720  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1721  	if (pollstop && vq->h=
andle_kick)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1722  		vhost_poll_flush(&vq=
->poll);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1723  	return r;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1724  }
6ac1afbf6132df0 Asias He           2013-05-06  1725  EXPORT_SYMBOL_GPL(vhos=
t_vring_ioctl);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1726  =

6b1e6cc7855b09a Jason Wang         2016-06-23  1727  int vhost_init_device_=
iotlb(struct vhost_dev *d, bool enabled)
6b1e6cc7855b09a Jason Wang         2016-06-23  1728  {
6b1e6cc7855b09a Jason Wang         2016-06-23  1729  	struct vhost_umem *ni=
otlb, *oiotlb;
6b1e6cc7855b09a Jason Wang         2016-06-23  1730  	int i;
6b1e6cc7855b09a Jason Wang         2016-06-23  1731  =

6b1e6cc7855b09a Jason Wang         2016-06-23  1732  	niotlb =3D vhost_umem=
_alloc();
6b1e6cc7855b09a Jason Wang         2016-06-23  1733  	if (!niotlb)
6b1e6cc7855b09a Jason Wang         2016-06-23  1734  		return -ENOMEM;
6b1e6cc7855b09a Jason Wang         2016-06-23  1735  =

6b1e6cc7855b09a Jason Wang         2016-06-23  1736  	oiotlb =3D d->iotlb;
6b1e6cc7855b09a Jason Wang         2016-06-23  1737  	d->iotlb =3D niotlb;
6b1e6cc7855b09a Jason Wang         2016-06-23  1738  =

6b1e6cc7855b09a Jason Wang         2016-06-23  1739  	for (i =3D 0; i < d->=
nvqs; ++i) {
b13f9c6364373a1 Jason Wang         2018-08-08  1740  		struct vhost_virtque=
ue *vq =3D d->vqs[i];
b13f9c6364373a1 Jason Wang         2018-08-08  1741  =

b13f9c6364373a1 Jason Wang         2018-08-08  1742  		mutex_lock(&vq->mute=
x);
b13f9c6364373a1 Jason Wang         2018-08-08  1743  		vq->iotlb =3D niotlb;
b13f9c6364373a1 Jason Wang         2018-08-08  1744  		__vhost_vq_meta_rese=
t(vq);
b13f9c6364373a1 Jason Wang         2018-08-08  1745  		mutex_unlock(&vq->mu=
tex);
6b1e6cc7855b09a Jason Wang         2016-06-23  1746  	}
6b1e6cc7855b09a Jason Wang         2016-06-23  1747  =

6b1e6cc7855b09a Jason Wang         2016-06-23  1748  	vhost_umem_clean(oiot=
lb);
6b1e6cc7855b09a Jason Wang         2016-06-23  1749  =

6b1e6cc7855b09a Jason Wang         2016-06-23  1750  	return 0;
6b1e6cc7855b09a Jason Wang         2016-06-23  1751  }
6b1e6cc7855b09a Jason Wang         2016-06-23  1752  EXPORT_SYMBOL_GPL(vhos=
t_init_device_iotlb);
6b1e6cc7855b09a Jason Wang         2016-06-23  1753  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1754  /* Caller must have de=
vice mutex */
935cdee7ee15956 Michael S. Tsirkin 2012-12-06  1755  long vhost_dev_ioctl(s=
truct vhost_dev *d, unsigned int ioctl, void __user *argp)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1756  {
d25cc43c6775bff Eric Biggers       2018-01-06  1757  	struct eventfd_ctx *c=
tx;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1758  	u64 p;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1759  	long r;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1760  	int i, fd;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1761  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1762  	/* If you are not the=
 owner, you can become one */
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1763  	if (ioctl =3D=3D VHOS=
T_SET_OWNER) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1764  		r =3D vhost_dev_set_=
owner(d);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1765  		goto done;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1766  	}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1767  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1768  	/* You must be the ow=
ner to do anything else */
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1769  	r =3D vhost_dev_check=
_owner(d);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1770  	if (r)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1771  		goto done;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1772  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1773  	switch (ioctl) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1774  	case VHOST_SET_MEM_TA=
BLE:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1775  		r =3D vhost_set_memo=
ry(d, argp);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1776  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1777  	case VHOST_SET_LOG_BA=
SE:
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1778  		if (copy_from_user(&=
p, argp, sizeof p)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1779  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1780  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1781  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1782  		if ((u64)(unsigned l=
ong)p !=3D p) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1783  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1784  			break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1785  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1786  		for (i =3D 0; i < d-=
>nvqs; ++i) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1787  			struct vhost_virtqu=
eue *vq;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1788  			void __user *base =
=3D (void __user *)(unsigned long)p;
3ab2e420ec1caf4 Asias He           2013-04-27  1789  			vq =3D d->vqs[i];
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1790  			mutex_lock(&vq->mut=
ex);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1791  			/* If ring is inact=
ive, will check when it's enabled. */
ea16c51433510f7 Michael S. Tsirkin 2014-06-05  1792  			if (vq->private_dat=
a && !vq_log_access_ok(vq, base))
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1793  				r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1794  			else
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1795  				vq->log_base =3D b=
ase;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1796  			mutex_unlock(&vq->m=
utex);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1797  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1798  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1799  	case VHOST_SET_LOG_FD:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14 @1800  		r =3D get_user(fd, (=
int __user *)argp);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1801  		if (r < 0)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1802  			break;
d25cc43c6775bff Eric Biggers       2018-01-06  1803  		ctx =3D fd =3D=3D -1=
 ? NULL : eventfd_ctx_fdget(fd);
d25cc43c6775bff Eric Biggers       2018-01-06  1804  		if (IS_ERR(ctx)) {
d25cc43c6775bff Eric Biggers       2018-01-06  1805  			r =3D PTR_ERR(ctx);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1806  			break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1807  		}
d25cc43c6775bff Eric Biggers       2018-01-06  1808  		swap(ctx, d->log_ctx=
);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1809  		for (i =3D 0; i < d-=
>nvqs; ++i) {
3ab2e420ec1caf4 Asias He           2013-04-27  1810  			mutex_lock(&d->vqs[=
i]->mutex);
3ab2e420ec1caf4 Asias He           2013-04-27  1811  			d->vqs[i]->log_ctx =
=3D d->log_ctx;
3ab2e420ec1caf4 Asias He           2013-04-27  1812  			mutex_unlock(&d->vq=
s[i]->mutex);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1813  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1814  		if (ctx)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1815  			eventfd_ctx_put(ctx=
);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1816  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1817  	default:
935cdee7ee15956 Michael S. Tsirkin 2012-12-06  1818  		r =3D -ENOIOCTLCMD;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1819  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1820  	}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1821  done:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1822  	return r;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1823  }
6ac1afbf6132df0 Asias He           2013-05-06  1824  EXPORT_SYMBOL_GPL(vhos=
t_dev_ioctl);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1825  =


:::::: The code at line 1603 was first introduced by commit
:::::: 3a4d5c94e959359ece6d6b55045c3f046677f55c vhost_net: a kernel-level v=
irtio server

:::::: TO: Michael S. Tsirkin <mst@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5109122143681147954==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5109122143681147954==--

