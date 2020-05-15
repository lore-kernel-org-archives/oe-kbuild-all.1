Content-Type: multipart/mixed; boundary="===============4989274265714310135=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/vhost/vhost.c:1014:16: sparse: sparse: cast to restricted __virtio16
Date: Fri, 15 May 2020 13:33:20 +0800
Message-ID: <202005151312.W9HdqsHa%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4989274265714310135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jason,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1ae7efb388540adc1653a51a3bc3b2c9cef5ec1a
commit: 20c384f1ea1a0bc7320bc445c72dd02d2970d594 vhost: refine vhost and vr=
ingh kconfig
date:   6 weeks ago
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout 20c384f1ea1a0bc7320bc445c72dd02d2970d594
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

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
>> drivers/vhost/vhost.c:1014:16: sparse: sparse: cast to restricted __virt=
io16
   drivers/vhost/vhost.c:1014:16: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@    expected void *addr @@    got restrict=
ed __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:1014:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:1014:16: sparse:    got restricted __virtio16 [nod=
eref] <asn:1> *
>> drivers/vhost/vhost.c:1014:16: sparse: sparse: cast to restricted __virt=
io16
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
   drivers/vhost/vhost.c:989:16: sparse: sparse: cast to restricted __virti=
o16
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void *addr @@    got restricte=
d __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:989:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:989:16: sparse: sparse: cast to restricted __virti=
o16
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
   drivers/vhost/vhost.c:995:16: sparse: sparse: cast to restricted __virti=
o16
   drivers/vhost/vhost.c:995:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void *addr @@    got restricte=
d __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:995:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:995:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:995:16: sparse: sparse: cast to restricted __virti=
o16
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
   drivers/vhost/vhost.c:1002:16: sparse: sparse: cast to restricted __virt=
io16
   drivers/vhost/vhost.c:1002:16: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@    expected void *addr @@    got restrict=
ed __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:1002:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:1002:16: sparse:    got restricted __virtio16 [nod=
eref] <asn:1> *
   drivers/vhost/vhost.c:1002:16: sparse: sparse: cast to restricted __virt=
io16
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
   drivers/vhost/vhost.c:1008:16: sparse: sparse: cast to restricted __virt=
io16
   drivers/vhost/vhost.c:1008:16: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@    expected void *addr @@    got restrict=
ed __virtio16 [noderef] [usertype] <asvoid *addr @@
   drivers/vhost/vhost.c:1008:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:1008:16: sparse:    got restricted __virtio16 [nod=
eref] [usertype] <asn:1> *
   drivers/vhost/vhost.c:1008:16: sparse: sparse: cast to restricted __virt=
io16
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
   drivers/vhost/vhost.c:989:16: sparse: sparse: cast to restricted __virti=
o16
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void *addr @@    got restricte=
d __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:989:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:989:16: sparse: sparse: cast to restricted __virti=
o16
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
   drivers/vhost/vhost.c:989:16: sparse: sparse: cast to restricted __virti=
o16
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected void *addr @@    got restricte=
d __virtio16 [noderef] <asvoid *addr @@
   drivers/vhost/vhost.c:989:16: sparse:    expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:    got restricted __virtio16 [node=
ref] <asn:1> *
   drivers/vhost/vhost.c:989:16: sparse: sparse: cast to restricted __virti=
o16
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

vim +1014 drivers/vhost/vhost.c

7b5d753ebc22c5 Jason Wang 2019-05-24  1010  =

7b5d753ebc22c5 Jason Wang 2019-05-24  1011  static inline int vhost_get_use=
d_idx(struct vhost_virtqueue *vq,
7b5d753ebc22c5 Jason Wang 2019-05-24  1012  				     __virtio16 *idx)
7b5d753ebc22c5 Jason Wang 2019-05-24  1013  {
7b5d753ebc22c5 Jason Wang 2019-05-24 @1014  	return vhost_get_used(vq, *idx=
, &vq->used->idx);
7b5d753ebc22c5 Jason Wang 2019-05-24  1015  }
7b5d753ebc22c5 Jason Wang 2019-05-24  1016  =


:::::: The code at line 1014 was first introduced by commit
:::::: 7b5d753ebc22c5b6935a70ce9a857dc6220784f8 vhost: fine grain userspace=
 memory accessors

:::::: TO: Jason Wang <jasowang@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4989274265714310135==--

