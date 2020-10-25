Content-Type: multipart/mixed; boundary="===============3433898340414755900=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [mellanox:queue-next 2/2] drivers/vdpa/mlx5/net/mlx5_vnet.c:46:35: warning: 'struct mlx5_vdpa_net' declared inside parameter list will not be visible outside of this definition or declaration
Date: Sun, 25 Oct 2020 21:10:29 +0800
Message-ID: <202010252125.Zq2GCBBK-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3433898340414755900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux.git =
queue-next
head:   37eaca87fa33a2fc664f665575c3ea9d4eba4cbc
commit: 37eaca87fa33a2fc664f665575c3ea9d4eba4cbc [2/2] Merge branch 'testin=
g/rdma-next' into queue-next
config: i386-allyesconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux.gi=
t/commit/?id=3D37eaca87fa33a2fc664f665575c3ea9d4eba4cbc
        git remote add mellanox https://git.kernel.org/pub/scm/linux/kernel=
/git/mellanox/linux.git
        git fetch --no-tags mellanox queue-next
        git checkout 37eaca87fa33a2fc664f665575c3ea9d4eba4cbc
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:5,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/vdpa/mlx5/net/mlx5_vnet.c:4:
   include/vdso/bits.h:7:26: warning: left shift count >=3D width of type [=
-Wshift-count-overflow]
       7 | #define BIT(nr)   (UL(1) << (nr))
         |                          ^~
   include/linux/mlx5/mlx5_ifc.h:10666:46: note: in expansion of macro 'BIT'
   10666 |  MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER =3D BIT(0x20),
         |                                              ^~~
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:46:35: warning: 'struct mlx5_vdpa_net'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
      46 | static void free_resources(struct mlx5_vdpa_net *ndev);
         |                                   ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:47:30: warning: 'struct mlx5_vdpa_net'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
      47 | static void init_mvqs(struct mlx5_vdpa_net *ndev);
         |                              ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:48:32: warning: 'struct mlx5_vdpa_net'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
      48 | static int setup_driver(struct mlx5_vdpa_net *ndev);
         |                                ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:49:36: warning: 'struct mlx5_vdpa_net'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
      49 | static void teardown_driver(struct mlx5_vdpa_net *ndev);
         |                                    ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:142:30: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     142 | static int create_tis(struct mlx5_vdpa_net *ndev)
         |                              ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'create_tis':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:144:37: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     144 |  struct mlx5_vdpa_dev *mvdev =3D &ndev->mvdev;
         |                                     ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:158:32: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     158 | static void destroy_tis(struct mlx5_vdpa_net *ndev)
         |                                ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'destroy_tis':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:160:29: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     160 |  mlx5_vdpa_destroy_tis(&ndev->mvdev, ndev->res.tisn);
         |                             ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:166:65: warning: 'struct mlx5_vdpa_cq_=
buf' declared inside parameter list will not be visible outside of this def=
inition or declaration
     166 | static int cq_frag_buf_alloc(struct mlx5_vdpa_net *ndev, struct =
mlx5_vdpa_cq_buf *buf, int nent)
         |                                                                 =
^~~~~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:166:37: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     166 | static int cq_frag_buf_alloc(struct mlx5_vdpa_net *ndev, struct =
mlx5_vdpa_cq_buf *buf, int nent)
         |                                     ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'cq_frag_buf_alloc':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:168:39: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_cq_buf'
     168 |  struct mlx5_frag_buf *frag_buf =3D &buf->frag_buf;
         |                                       ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:173:37: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     173 |  err =3D mlx5_frag_buf_alloc_node(ndev->mvdev.mdev, nent * MLX5_=
VDPA_CQE_SIZE, frag_buf,
         |                                     ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:186:67: warning: 'struct mlx5_vdpa_ume=
m' declared inside parameter list will not be visible outside of this defin=
ition or declaration
     186 | static int umem_frag_buf_alloc(struct mlx5_vdpa_net *ndev, struc=
t mlx5_vdpa_umem *umem, int size)
         |                                                                 =
  ^~~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:186:39: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     186 | static int umem_frag_buf_alloc(struct mlx5_vdpa_net *ndev, struc=
t mlx5_vdpa_umem *umem, int size)
         |                                       ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'umem_frag_buf_alloc':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:188:40: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_umem'
     188 |  struct mlx5_frag_buf *frag_buf =3D &umem->frag_buf;
         |                                        ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:190:38: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     190 |  return mlx5_frag_buf_alloc_node(ndev->mvdev.mdev, size, frag_bu=
f,
         |                                      ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:194:65: warning: 'struct mlx5_vdpa_cq_=
buf' declared inside parameter list will not be visible outside of this def=
inition or declaration
     194 | static void cq_frag_buf_free(struct mlx5_vdpa_net *ndev, struct =
mlx5_vdpa_cq_buf *buf)
         |                                                                 =
^~~~~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:194:37: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     194 | static void cq_frag_buf_free(struct mlx5_vdpa_net *ndev, struct =
mlx5_vdpa_cq_buf *buf)
         |                                     ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'cq_frag_buf_free':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:196:25: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     196 |  mlx5_frag_buf_free(ndev->mvdev.mdev, &buf->frag_buf);
         |                         ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:196:43: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_cq_buf'
     196 |  mlx5_frag_buf_free(ndev->mvdev.mdev, &buf->frag_buf);
         |                                           ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:199:29: warning: 'struct mlx5_vdpa_cq'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
     199 | static void *get_cqe(struct mlx5_vdpa_cq *vcq, int n)
         |                             ^~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'get_cqe':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:201:35: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_cq'
     201 |  return mlx5_frag_buf_get_wqe(&vcq->buf.fbc, n);
         |                                   ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:204:63: warning: 'struct mlx5_vdpa_cq_=
buf' declared inside parameter list will not be visible outside of this def=
inition or declaration
     204 | static void cq_frag_buf_init(struct mlx5_vdpa_cq *vcq, struct ml=
x5_vdpa_cq_buf *buf)
         |                                                               ^~=
~~~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:204:37: warning: 'struct mlx5_vdpa_cq'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
     204 | static void cq_frag_buf_init(struct mlx5_vdpa_cq *vcq, struct ml=
x5_vdpa_cq_buf *buf)
         |                                     ^~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'cq_frag_buf_init':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:210:21: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_cq_buf'
     210 |  for (i =3D 0; i < buf->nent; i++) {
         |                     ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:211:17: error: passing argument 1 of '=
get_cqe' from incompatible pointer type [-Werror=3Dincompatible-pointer-typ=
es]
     211 |   cqe =3D get_cqe(vcq, i);
         |                 ^~~
         |                 |
         |                 struct mlx5_vdpa_cq *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:199:43: note: expected 'struct mlx5_vd=
pa_cq *' but argument is of type 'struct mlx5_vdpa_cq *'
     199 | static void *get_cqe(struct mlx5_vdpa_cq *vcq, int n)
         |                      ~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:217:32: warning: 'struct mlx5_vdpa_cq'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
     217 | static void *get_sw_cqe(struct mlx5_vdpa_cq *cq, int n)
         |                                ^~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'get_sw_cqe':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:219:48: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_cq'
     219 |  struct mlx5_cqe64 *cqe64 =3D get_cqe(cq, n & (cq->cqe - 1));
         |                                                ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:219:37: error: passing argument 1 of '=
get_cqe' from incompatible pointer type [-Werror=3Dincompatible-pointer-typ=
es]
     219 |  struct mlx5_cqe64 *cqe64 =3D get_cqe(cq, n & (cq->cqe - 1));
         |                                     ^~
         |                                     |
         |                                     struct mlx5_vdpa_cq *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:199:43: note: expected 'struct mlx5_vd=
pa_cq *' but argument is of type 'struct mlx5_vdpa_cq *'
     199 | static void *get_cqe(struct mlx5_vdpa_cq *vcq, int n)
         |                      ~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:228:28: warning: 'struct mlx5_vdpa_qp'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
     228 | static void rx_post(struct mlx5_vdpa_qp *vqp, int n)
         |                            ^~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'rx_post':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:230:5: error: dereferencing pointer to=
 incomplete type 'struct mlx5_vdpa_qp'
     230 |  vqp->head +=3D n;
         |     ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:235:17: warning: 'struct mlx5_vdpa_vir=
tqueue' declared inside parameter list will not be visible outside of this =
definition or declaration
     235 |          struct mlx5_vdpa_virtqueue *mvq, u32 num_ent)
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:234:31: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     234 | static void qp_prepare(struct mlx5_vdpa_net *ndev, bool fw, void=
 *in,
         |                               ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'qp_prepare':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:241:17: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_virtqueue'
     241 |  vqp =3D fw ? &mvq->fwqp : &mvq->vqqp;
         |                 ^~
   In file included from include/linux/mlx5/driver.h:53,
                    from include/linux/mlx5/cq.h:36,
                    from drivers/vdpa/mlx5/net/mlx5_vnet.c:11:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:242:38: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     242 |  MLX5_SET(create_qp_in, in, uid, ndev->mvdev.res.uid);
         |                                      ^~
   include/linux/mlx5/device.h:74:11: note: in definition of macro 'MLX5_SE=
T'
      74 |  u32 _v =3D v; \
         |           ^
   drivers/vdpa/mlx5/net/mlx5_vnet.c:244:9: error: dereferencing pointer to=
 incomplete type 'struct mlx5_vdpa_qp'
     244 |  if (vqp->fw) {
         |         ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:268:60: warning: 'struct mlx5_vdpa_qp'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
     268 | static int rq_buf_alloc(struct mlx5_vdpa_net *ndev, struct mlx5_=
vdpa_qp *vqp, u32 num_ent)
         |                                                            ^~~~~=
~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:268:32: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     268 | static int rq_buf_alloc(struct mlx5_vdpa_net *ndev, struct mlx5_=
vdpa_qp *vqp, u32 num_ent)
         |                                ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'rq_buf_alloc':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:270:38: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     270 |  return mlx5_frag_buf_alloc_node(ndev->mvdev.mdev,
         |                                      ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:271:54: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_qp'
     271 |      num_ent * sizeof(struct mlx5_wqe_data_seg), &vqp->frag_buf,
         |                                                      ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:275:60: warning: 'struct mlx5_vdpa_qp'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
     275 | static void rq_buf_free(struct mlx5_vdpa_net *ndev, struct mlx5_=
vdpa_qp *vqp)
         |                                                            ^~~~~=
~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:275:32: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     275 | static void rq_buf_free(struct mlx5_vdpa_net *ndev, struct mlx5_=
vdpa_qp *vqp)
         |                                ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'rq_buf_free':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:277:25: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     277 |  mlx5_frag_buf_free(ndev->mvdev.mdev, &vqp->frag_buf);
         |                         ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:277:43: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_qp'
     277 |  mlx5_frag_buf_free(ndev->mvdev.mdev, &vqp->frag_buf);
         |                                           ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:281:15: warning: 'struct mlx5_vdpa_qp'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
     281 |        struct mlx5_vdpa_qp *vqp)
         |               ^~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:280:57: warning: 'struct mlx5_vdpa_vir=
tqueue' declared inside parameter list will not be visible outside of this =
definition or declaration
     280 | static int qp_create(struct mlx5_vdpa_net *ndev, struct mlx5_vdp=
a_virtqueue *mvq,
         |                                                         ^~~~~~~~=
~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:280:29: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     280 | static int qp_create(struct mlx5_vdpa_net *ndev, struct mlx5_vdp=
a_virtqueue *mvq,
         |                             ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'qp_create':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:283:35: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     283 |  struct mlx5_core_dev *mdev =3D ndev->mvdev.mdev;
         |                                   ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:290:10: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_qp'
     290 |  if (!vqp->fw) {
         |          ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:291:13: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_virtqueue'
     291 |   vqp =3D &mvq->vqqp;
         |             ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:292:22: error: passing argument 1 of '=
rq_buf_alloc' from incompatible pointer type [-Werror=3Dincompatible-pointe=
r-types]
     292 |   err =3D rq_buf_alloc(ndev, vqp, mvq->num_ent);
         |                      ^~~~
         |                      |
         |                      struct mlx5_vdpa_net *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:268:47: note: expected 'struct mlx5_vd=
pa_net *' but argument is of type 'struct mlx5_vdpa_net *'
     268 | static int rq_buf_alloc(struct mlx5_vdpa_net *ndev, struct mlx5_=
vdpa_qp *vqp, u32 num_ent)
         |                         ~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:292:28: error: passing argument 2 of '=
rq_buf_alloc' from incompatible pointer type [-Werror=3Dincompatible-pointe=
r-types]
     292 |   err =3D rq_buf_alloc(ndev, vqp, mvq->num_ent);
         |                            ^~~
         |                            |
         |                            struct mlx5_vdpa_qp *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:268:74: note: expected 'struct mlx5_vd=
pa_qp *' but argument is of type 'struct mlx5_vdpa_qp *'
     268 | static int rq_buf_alloc(struct mlx5_vdpa_net *ndev, struct mlx5_=
vdpa_qp *vqp, u32 num_ent)
         |                                                     ~~~~~~~~~~~~=
~~~~~~~~~^~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:308:13: error: passing argument 1 of '=
qp_prepare' from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]
     308 |  qp_prepare(ndev, vqp->fw, in, mvq, mvq->num_ent);
         |             ^~~~
         |             |
         |             struct mlx5_vdpa_net *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:234:46: note: expected 'struct mlx5_vd=
pa_net *' but argument is of type 'struct mlx5_vdpa_net *'
     234 | static void qp_prepare(struct mlx5_vdpa_net *ndev, bool fw, void=
 *in,
         |                        ~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:308:32: error: passing argument 4 of '=
qp_prepare' from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]
     308 |  qp_prepare(ndev, vqp->fw, in, mvq, mvq->num_ent);
         |                                ^~~
         |                                |
         |                                struct mlx5_vdpa_virtqueue *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:235:38: note: expected 'struct mlx5_vd=
pa_virtqueue *' but argument is of type 'struct mlx5_vdpa_virtqueue *'
     235 |          struct mlx5_vdpa_virtqueue *mvq, u32 num_ent)
--
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:372:49: warning: 'struct mlx5_vdpa_vir=
tqueue' declared inside parameter list will not be visible outside of this =
definition or declaration
     372 | static void mlx5_vdpa_handle_completions(struct mlx5_vdpa_virtqu=
eue *mvq, int num)
         |                                                 ^~~~~~~~~~~~~~~~=
~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'mlx5_vdpa_handle_complet=
ions':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:374:21: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_virtqueue'
     374 |  mlx5_cq_set_ci(&mvq->cq.mcq);
         |                     ^~
   In file included from <command-line>:
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'mlx5_vdpa_cq_comp':
   include/linux/kernel.h:853:51: error: dereferencing pointer to incomplet=
e type 'struct mlx5_vdpa_virtqueue'
     853 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                                   ^~
   include/linux/compiler_types.h:299:9: note: in definition of macro '__co=
mpiletime_assert'
     299 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:319:2: note: in expansion of macro '_comp=
iletime_assert'
     319 |  _compiletime_assert(condition, msg, __compiletime_assert_, __CO=
UNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:853:2: note: in expansion of macro 'BUILD_BUG_ON_=
MSG'
     853 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:853:20: note: in expansion of macro '__same_type'
     853 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:382:36: note: in expansion of macro 'c=
ontainer_of'
     382 |  struct mlx5_vdpa_virtqueue *mvq =3D container_of(mcq, struct ml=
x5_vdpa_virtqueue, cq.mcq);
         |                                    ^~~~~~~~~~~~
   include/linux/compiler_types.h:135:35: error: invalid use of undefined t=
ype 'struct mlx5_vdpa_virtqueue'
     135 | #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_of=
fsetof'
      17 | #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:856:21: note: in expansion of macro 'offsetof'
     856 |  ((type *)(__mptr - offsetof(type, member))); })
         |                     ^~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:382:36: note: in expansion of macro 'c=
ontainer_of'
     382 |  struct mlx5_vdpa_virtqueue *mvq =3D container_of(mcq, struct ml=
x5_vdpa_virtqueue, cq.mcq);
         |                                    ^~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:384:31: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     384 |  void __iomem *uar_page =3D ndev->mvdev.res.uar->map;
         |                               ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:396:33: error: passing argument 1 of '=
mlx5_vdpa_handle_completions' from incompatible pointer type [-Werror=3Dinc=
ompatible-pointer-types]
     396 |    mlx5_vdpa_handle_completions(mvq, num);
         |                                 ^~~
         |                                 |
         |                                 struct mlx5_vdpa_virtqueue *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:372:70: note: expected 'struct mlx5_vd=
pa_virtqueue *' but argument is of type 'struct mlx5_vdpa_virtqueue *'
     372 | static void mlx5_vdpa_handle_completions(struct mlx5_vdpa_virtqu=
eue *mvq, int num)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~^~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:402:32: error: passing argument 1 of '=
mlx5_vdpa_handle_completions' from incompatible pointer type [-Werror=3Dinc=
ompatible-pointer-types]
     402 |   mlx5_vdpa_handle_completions(mvq, num);
         |                                ^~~
         |                                |
         |                                struct mlx5_vdpa_virtqueue *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:372:70: note: expected 'struct mlx5_vd=
pa_virtqueue *' but argument is of type 'struct mlx5_vdpa_virtqueue *'
     372 | static void mlx5_vdpa_handle_completions(struct mlx5_vdpa_virtqu=
eue *mvq, int num)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~^~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:407:29: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     407 | static int cq_create(struct mlx5_vdpa_net *ndev, u16 idx, u32 nu=
m_ent)
         |                             ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'cq_create':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:409:41: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     409 |  struct mlx5_vdpa_virtqueue *mvq =3D &ndev->vqs[idx];
         |                                         ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:413:33: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_virtqueue'
     413 |  struct mlx5_vdpa_cq *vcq =3D &mvq->cq;
         |                                 ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:422:32: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_cq'
     422 |  err =3D mlx5_db_alloc(mdev, &vcq->db);
         |                                ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:430:26: error: passing argument 1 of '=
cq_frag_buf_alloc' from incompatible pointer type [-Werror=3Dincompatible-p=
ointer-types]
     430 |  err =3D cq_frag_buf_alloc(ndev, &vcq->buf, num_ent);
         |                          ^~~~
         |                          |
         |                          struct mlx5_vdpa_net *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:166:52: note: expected 'struct mlx5_vd=
pa_net *' but argument is of type 'struct mlx5_vdpa_net *'
     166 | static int cq_frag_buf_alloc(struct mlx5_vdpa_net *ndev, struct =
mlx5_vdpa_cq_buf *buf, int nent)
         |                              ~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:434:19: error: passing argument 1 of '=
cq_frag_buf_init' from incompatible pointer type [-Werror=3Dincompatible-po=
inter-types]
     434 |  cq_frag_buf_init(vcq, &vcq->buf);
         |                   ^~~
         |                   |
         |                   struct mlx5_vdpa_cq *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:204:51: note: expected 'struct mlx5_vd=
pa_cq *' but argument is of type 'struct mlx5_vdpa_cq *'
     204 | static void cq_frag_buf_init(struct mlx5_vdpa_cq *vcq, struct ml=
x5_vdpa_cq_buf *buf)
         |                              ~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:479:19: error: passing argument 1 of '=
cq_frag_buf_free' from incompatible pointer type [-Werror=3Dincompatible-po=
inter-types]
     479 |  cq_frag_buf_free(ndev, &vcq->buf);
         |                   ^~~~
         |                   |
         |                   struct mlx5_vdpa_net *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:194:52: note: expected 'struct mlx5_vd=
pa_net *' but argument is of type 'struct mlx5_vdpa_net *'
     194 | static void cq_frag_buf_free(struct mlx5_vdpa_net *ndev, struct =
mlx5_vdpa_cq_buf *buf)
         |                              ~~~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:407:54: warning: parameter 'idx' set b=
ut not used [-Wunused-but-set-parameter]
     407 | static int cq_create(struct mlx5_vdpa_net *ndev, u16 idx, u32 nu=
m_ent)
         |                                                  ~~~~^~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:485:31: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     485 | static void cq_destroy(struct mlx5_vdpa_net *ndev, u16 idx)
         |                               ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'cq_destroy':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:487:41: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     487 |  struct mlx5_vdpa_virtqueue *mvq =3D &ndev->vqs[idx];
         |                                         ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:489:33: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_virtqueue'
     489 |  struct mlx5_vdpa_cq *vcq =3D &mvq->cq;
         |                                 ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:491:37: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_cq'
     491 |  if (mlx5_core_destroy_cq(mdev, &vcq->mcq)) {
         |                                     ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:495:19: error: passing argument 1 of '=
cq_frag_buf_free' from incompatible pointer type [-Werror=3Dincompatible-po=
inter-types]
     495 |  cq_frag_buf_free(ndev, &vcq->buf);
         |                   ^~~~
         |                   |
         |                   struct mlx5_vdpa_net *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:194:52: note: expected 'struct mlx5_vd=
pa_net *' but argument is of type 'struct mlx5_vdpa_net *'
     194 | static void cq_frag_buf_free(struct mlx5_vdpa_net *ndev, struct =
mlx5_vdpa_cq_buf *buf)
         |                              ~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:485:56: warning: parameter 'idx' set b=
ut not used [-Wunused-but-set-parameter]
     485 | static void cq_destroy(struct mlx5_vdpa_net *ndev, u16 idx)
         |                                                    ~~~~^~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:500:15: warning: 'struct mlx5_vdpa_ume=
m' declared inside parameter list will not be visible outside of this defin=
ition or declaration
     500 |        struct mlx5_vdpa_umem **umemp)
         |               ^~~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:499:57: warning: 'struct mlx5_vdpa_vir=
tqueue' declared inside parameter list will not be visible outside of this =
definition or declaration
     499 | static int umem_size(struct mlx5_vdpa_net *ndev, struct mlx5_vdp=
a_virtqueue *mvq, int num,
         |                                                         ^~~~~~~~=
~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:499:29: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     499 | static int umem_size(struct mlx5_vdpa_net *ndev, struct mlx5_vdp=
a_virtqueue *mvq, int num,
         |                             ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'umem_size':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:502:35: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     502 |  struct mlx5_core_dev *mdev =3D ndev->mvdev.mdev;
         |                                   ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:510:16: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_virtqueue'
     510 |   *umemp =3D &mvq->umem1;
         |                ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:526:67: warning: 'struct mlx5_vdpa_ume=
m' declared inside parameter list will not be visible outside of this defin=
ition or declaration
     526 | static void umem_frag_buf_free(struct mlx5_vdpa_net *ndev, struc=
t mlx5_vdpa_umem *umem)
         |                                                                 =
  ^~~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:526:39: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     526 | static void umem_frag_buf_free(struct mlx5_vdpa_net *ndev, struc=
t mlx5_vdpa_umem *umem)
         |                                       ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'umem_frag_buf_free':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:528:25: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_net'
     528 |  mlx5_frag_buf_free(ndev->mvdev.mdev, &umem->frag_buf);
         |                         ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:528:44: error: dereferencing pointer t=
o incomplete type 'struct mlx5_vdpa_umem'
     528 |  mlx5_frag_buf_free(ndev->mvdev.mdev, &umem->frag_buf);
         |                                            ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: At top level:
   drivers/vdpa/mlx5/net/mlx5_vnet.c:531:59: warning: 'struct mlx5_vdpa_vir=
tqueue' declared inside parameter list will not be visible outside of this =
definition or declaration
     531 | static int create_umem(struct mlx5_vdpa_net *ndev, struct mlx5_v=
dpa_virtqueue *mvq, int num)
         |                                                           ^~~~~~=
~~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:531:31: warning: 'struct mlx5_vdpa_net=
' declared inside parameter list will not be visible outside of this defini=
tion or declaration
     531 | static int create_umem(struct mlx5_vdpa_net *ndev, struct mlx5_v=
dpa_virtqueue *mvq, int num)
         |                               ^~~~~~~~~~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c: In function 'create_umem':
   drivers/vdpa/mlx5/net/mlx5_vnet.c:542:19: error: passing argument 1 of '=
umem_size' from incompatible pointer type [-Werror=3Dincompatible-pointer-t=
ypes]
     542 |  size =3D umem_size(ndev, mvq, num, &umem);
         |                   ^~~~
         |                   |
         |                   struct mlx5_vdpa_net *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:499:44: note: expected 'struct mlx5_vd=
pa_net *' but argument is of type 'struct mlx5_vdpa_net *'
     499 | static int umem_size(struct mlx5_vdpa_net *ndev, struct mlx5_vdp=
a_virtqueue *mvq, int num,
         |                      ~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:542:25: error: passing argument 2 of '=
umem_size' from incompatible pointer type [-Werror=3Dincompatible-pointer-t=
ypes]
     542 |  size =3D umem_size(ndev, mvq, num, &umem);
         |                         ^~~
         |                         |
         |                         struct mlx5_vdpa_virtqueue *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:499:78: note: expected 'struct mlx5_vd=
pa_virtqueue *' but argument is of type 'struct mlx5_vdpa_virtqueue *'
     499 | static int umem_size(struct mlx5_vdpa_net *ndev, struct mlx5_vdp=
a_virtqueue *mvq, int num,
         |                                                  ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~^~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:542:35: error: passing argument 4 of '=
umem_size' from incompatible pointer type [-Werror=3Dincompatible-pointer-t=
ypes]
     542 |  size =3D umem_size(ndev, mvq, num, &umem);
         |                                   ^~~~~
         |                                   |
         |                                   struct mlx5_vdpa_umem **
   drivers/vdpa/mlx5/net/mlx5_vnet.c:500:32: note: expected 'struct mlx5_vd=
pa_umem **' but argument is of type 'struct mlx5_vdpa_umem **'
     500 |        struct mlx5_vdpa_umem **umemp)
         |        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:546:6: error: dereferencing pointer to=
 incomplete type 'struct mlx5_vdpa_umem'
     546 |  umem->size =3D size;
         |      ^~
   drivers/vdpa/mlx5/net/mlx5_vnet.c:547:28: error: passing argument 1 of '=
umem_frag_buf_alloc' from incompatible pointer type [-Werror=3Dincompatible=
-pointer-types]
     547 |  err =3D umem_frag_buf_alloc(ndev, umem, size);
         |                            ^~~~
         |                            |
         |                            struct mlx5_vdpa_net *
   drivers/vdpa/mlx5/net/mlx5_vnet.c:186:54: note: expected 'struct mlx5_vd=
pa_net *' but argument is of type 'struct mlx5_vdpa_net *'
     186 | static int umem_frag_buf_alloc(struct mlx5_vdpa_net *ndev, struc=
t mlx5_vdpa_umem *umem, int size)
..

vim +46 drivers/vdpa/mlx5/net/mlx5_vnet.c

1a86b377aa2147a Eli Cohen         2020-08-04   26  =

1a86b377aa2147a Eli Cohen         2020-08-04   27  #define VALID_FEATURES_M=
ASK                                                                        \
cbb523594eb7189 Nathan Chancellor 2020-08-21   28  	(BIT_ULL(VIRTIO_NET_F_C=
SUM) | BIT_ULL(VIRTIO_NET_F_GUEST_CSUM) |                                  =
 \
cbb523594eb7189 Nathan Chancellor 2020-08-21   29  	 BIT_ULL(VIRTIO_NET_F_C=
TRL_GUEST_OFFLOADS) | BIT_ULL(VIRTIO_NET_F_MTU) | BIT_ULL(VIRTIO_NET_F_MAC)=
 |   \
cbb523594eb7189 Nathan Chancellor 2020-08-21   30  	 BIT_ULL(VIRTIO_NET_F_G=
UEST_TSO4) | BIT_ULL(VIRTIO_NET_F_GUEST_TSO6) |                            =
 \
cbb523594eb7189 Nathan Chancellor 2020-08-21   31  	 BIT_ULL(VIRTIO_NET_F_G=
UEST_ECN) | BIT_ULL(VIRTIO_NET_F_GUEST_UFO) | BIT_ULL(VIRTIO_NET_F_HOST_TSO=
4) | \
cbb523594eb7189 Nathan Chancellor 2020-08-21   32  	 BIT_ULL(VIRTIO_NET_F_H=
OST_TSO6) | BIT_ULL(VIRTIO_NET_F_HOST_ECN) | BIT_ULL(VIRTIO_NET_F_HOST_UFO)=
 |   \
cbb523594eb7189 Nathan Chancellor 2020-08-21   33  	 BIT_ULL(VIRTIO_NET_F_M=
RG_RXBUF) | BIT_ULL(VIRTIO_NET_F_STATUS) | BIT_ULL(VIRTIO_NET_F_CTRL_VQ) | =
     \
cbb523594eb7189 Nathan Chancellor 2020-08-21   34  	 BIT_ULL(VIRTIO_NET_F_C=
TRL_RX) | BIT_ULL(VIRTIO_NET_F_CTRL_VLAN) |                                =
 \
cbb523594eb7189 Nathan Chancellor 2020-08-21   35  	 BIT_ULL(VIRTIO_NET_F_C=
TRL_RX_EXTRA) | BIT_ULL(VIRTIO_NET_F_GUEST_ANNOUNCE) |                     =
 \
cbb523594eb7189 Nathan Chancellor 2020-08-21   36  	 BIT_ULL(VIRTIO_NET_F_M=
Q) | BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) | BIT_ULL(VIRTIO_NET_F_HASH_REPORT=
) |  \
cbb523594eb7189 Nathan Chancellor 2020-08-21   37  	 BIT_ULL(VIRTIO_NET_F_R=
SS) | BIT_ULL(VIRTIO_NET_F_RSC_EXT) | BIT_ULL(VIRTIO_NET_F_STANDBY) |      =
     \
cbb523594eb7189 Nathan Chancellor 2020-08-21   38  	 BIT_ULL(VIRTIO_NET_F_S=
PEED_DUPLEX) | BIT_ULL(VIRTIO_F_NOTIFY_ON_EMPTY) |                         =
 \
cbb523594eb7189 Nathan Chancellor 2020-08-21   39  	 BIT_ULL(VIRTIO_F_ANY_L=
AYOUT) | BIT_ULL(VIRTIO_F_VERSION_1) | BIT_ULL(VIRTIO_F_ACCESS_PLATFORM) | =
     \
cbb523594eb7189 Nathan Chancellor 2020-08-21   40  	 BIT_ULL(VIRTIO_F_RING_=
PACKED) | BIT_ULL(VIRTIO_F_ORDER_PLATFORM) | BIT_ULL(VIRTIO_F_SR_IOV))
1a86b377aa2147a Eli Cohen         2020-08-04   41  =

1a86b377aa2147a Eli Cohen         2020-08-04   42  #define VALID_STATUS_MAS=
K                                                                          \
1a86b377aa2147a Eli Cohen         2020-08-04   43  	(VIRTIO_CONFIG_S_ACKNOW=
LEDGE | VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_DRIVER_OK |        \
1a86b377aa2147a Eli Cohen         2020-08-04   44  	 VIRTIO_CONFIG_S_FEATUR=
ES_OK | VIRTIO_CONFIG_S_NEEDS_RESET | VIRTIO_CONFIG_S_FAILED)
1a86b377aa2147a Eli Cohen         2020-08-04   45  =

1a86b377aa2147a Eli Cohen         2020-08-04  @46  static void free_resourc=
es(struct mlx5_vdpa_net *ndev);
1a86b377aa2147a Eli Cohen         2020-08-04  @47  static void init_mvqs(st=
ruct mlx5_vdpa_net *ndev);
1a86b377aa2147a Eli Cohen         2020-08-04  @48  static int setup_driver(=
struct mlx5_vdpa_net *ndev);
1a86b377aa2147a Eli Cohen         2020-08-04  @49  static void teardown_dri=
ver(struct mlx5_vdpa_net *ndev);
1a86b377aa2147a Eli Cohen         2020-08-04   50  =

1a86b377aa2147a Eli Cohen         2020-08-04   51  static bool mlx5_vdpa_de=
bug;
1a86b377aa2147a Eli Cohen         2020-08-04   52  =

1a86b377aa2147a Eli Cohen         2020-08-04   53  #define MLX5_LOG_VIO_FLA=
G(_feature)                                                                \
1a86b377aa2147a Eli Cohen         2020-08-04   54  	do {                   =
                                                                    \
cbb523594eb7189 Nathan Chancellor 2020-08-21   55  		if (features & BIT_ULL=
(_feature))                                                  \
1a86b377aa2147a Eli Cohen         2020-08-04   56  			mlx5_vdpa_info(mvdev,=
 "%s\n", #_feature);                                  \
1a86b377aa2147a Eli Cohen         2020-08-04   57  	} while (0)
1a86b377aa2147a Eli Cohen         2020-08-04   58  =

1a86b377aa2147a Eli Cohen         2020-08-04   59  #define MLX5_LOG_VIO_STA=
T(_status)                                                                 \
1a86b377aa2147a Eli Cohen         2020-08-04   60  	do {                   =
                                                                    \
1a86b377aa2147a Eli Cohen         2020-08-04   61  		if (status & (_status)=
)                                                            \
1a86b377aa2147a Eli Cohen         2020-08-04   62  			mlx5_vdpa_info(mvdev,=
 "%s\n", #_status);                                   \
1a86b377aa2147a Eli Cohen         2020-08-04   63  	} while (0)
1a86b377aa2147a Eli Cohen         2020-08-04   64  =

a98a6bc96f057a8 Leon Romanovsky   2020-10-04   65  static inline u32 mlx5_v=
dpa_max_qps(int max_vqs)
a98a6bc96f057a8 Leon Romanovsky   2020-10-04   66  {
a98a6bc96f057a8 Leon Romanovsky   2020-10-04   67  	return max_vqs / 2;
a98a6bc96f057a8 Leon Romanovsky   2020-10-04   68  }
a98a6bc96f057a8 Leon Romanovsky   2020-10-04   69  =

1a86b377aa2147a Eli Cohen         2020-08-04   70  static void print_status=
(struct mlx5_vdpa_dev *mvdev, u8 status, bool set)
1a86b377aa2147a Eli Cohen         2020-08-04   71  {
1a86b377aa2147a Eli Cohen         2020-08-04   72  	if (status & ~VALID_STA=
TUS_MASK)
1a86b377aa2147a Eli Cohen         2020-08-04   73  		mlx5_vdpa_warn(mvdev, =
"Warning: there are invalid status bits 0x%x\n",
1a86b377aa2147a Eli Cohen         2020-08-04   74  			       status & ~VALI=
D_STATUS_MASK);
1a86b377aa2147a Eli Cohen         2020-08-04   75  =

1a86b377aa2147a Eli Cohen         2020-08-04   76  	if (!mlx5_vdpa_debug)
1a86b377aa2147a Eli Cohen         2020-08-04   77  		return;
1a86b377aa2147a Eli Cohen         2020-08-04   78  =

1a86b377aa2147a Eli Cohen         2020-08-04   79  	mlx5_vdpa_info(mvdev, "=
driver status %s", set ? "set" : "get");
1a86b377aa2147a Eli Cohen         2020-08-04   80  	if (set && !status) {
1a86b377aa2147a Eli Cohen         2020-08-04   81  		mlx5_vdpa_info(mvdev, =
"driver resets the device\n");
1a86b377aa2147a Eli Cohen         2020-08-04   82  		return;
1a86b377aa2147a Eli Cohen         2020-08-04   83  	}
1a86b377aa2147a Eli Cohen         2020-08-04   84  =

1a86b377aa2147a Eli Cohen         2020-08-04   85  	MLX5_LOG_VIO_STAT(VIRTI=
O_CONFIG_S_ACKNOWLEDGE);
1a86b377aa2147a Eli Cohen         2020-08-04   86  	MLX5_LOG_VIO_STAT(VIRTI=
O_CONFIG_S_DRIVER);
1a86b377aa2147a Eli Cohen         2020-08-04   87  	MLX5_LOG_VIO_STAT(VIRTI=
O_CONFIG_S_DRIVER_OK);
1a86b377aa2147a Eli Cohen         2020-08-04   88  	MLX5_LOG_VIO_STAT(VIRTI=
O_CONFIG_S_FEATURES_OK);
1a86b377aa2147a Eli Cohen         2020-08-04   89  	MLX5_LOG_VIO_STAT(VIRTI=
O_CONFIG_S_NEEDS_RESET);
1a86b377aa2147a Eli Cohen         2020-08-04   90  	MLX5_LOG_VIO_STAT(VIRTI=
O_CONFIG_S_FAILED);
1a86b377aa2147a Eli Cohen         2020-08-04   91  }
1a86b377aa2147a Eli Cohen         2020-08-04   92  =

1a86b377aa2147a Eli Cohen         2020-08-04   93  static void print_featur=
es(struct mlx5_vdpa_dev *mvdev, u64 features, bool set)
1a86b377aa2147a Eli Cohen         2020-08-04   94  {
1a86b377aa2147a Eli Cohen         2020-08-04   95  	if (features & ~VALID_F=
EATURES_MASK)
1a86b377aa2147a Eli Cohen         2020-08-04   96  		mlx5_vdpa_warn(mvdev, =
"There are invalid feature bits 0x%llx\n",
1a86b377aa2147a Eli Cohen         2020-08-04   97  			       features & ~VA=
LID_FEATURES_MASK);
1a86b377aa2147a Eli Cohen         2020-08-04   98  =

1a86b377aa2147a Eli Cohen         2020-08-04   99  	if (!mlx5_vdpa_debug)
1a86b377aa2147a Eli Cohen         2020-08-04  100  		return;
1a86b377aa2147a Eli Cohen         2020-08-04  101  =

1a86b377aa2147a Eli Cohen         2020-08-04  102  	mlx5_vdpa_info(mvdev, "=
driver %s feature bits:\n", set ? "sets" : "reads");
1a86b377aa2147a Eli Cohen         2020-08-04  103  	if (!features)
1a86b377aa2147a Eli Cohen         2020-08-04  104  		mlx5_vdpa_info(mvdev, =
"all feature bits are cleared\n");
1a86b377aa2147a Eli Cohen         2020-08-04  105  =

1a86b377aa2147a Eli Cohen         2020-08-04  106  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_CSUM);
1a86b377aa2147a Eli Cohen         2020-08-04  107  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_GUEST_CSUM);
1a86b377aa2147a Eli Cohen         2020-08-04  108  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_CTRL_GUEST_OFFLOADS);
1a86b377aa2147a Eli Cohen         2020-08-04  109  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_MTU);
1a86b377aa2147a Eli Cohen         2020-08-04  110  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_MAC);
1a86b377aa2147a Eli Cohen         2020-08-04  111  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_GUEST_TSO4);
1a86b377aa2147a Eli Cohen         2020-08-04  112  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_GUEST_TSO6);
1a86b377aa2147a Eli Cohen         2020-08-04  113  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_GUEST_ECN);
1a86b377aa2147a Eli Cohen         2020-08-04  114  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_GUEST_UFO);
1a86b377aa2147a Eli Cohen         2020-08-04  115  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_HOST_TSO4);
1a86b377aa2147a Eli Cohen         2020-08-04  116  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_HOST_TSO6);
1a86b377aa2147a Eli Cohen         2020-08-04  117  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_HOST_ECN);
1a86b377aa2147a Eli Cohen         2020-08-04  118  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_HOST_UFO);
1a86b377aa2147a Eli Cohen         2020-08-04  119  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_MRG_RXBUF);
1a86b377aa2147a Eli Cohen         2020-08-04  120  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_STATUS);
1a86b377aa2147a Eli Cohen         2020-08-04  121  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_CTRL_VQ);
1a86b377aa2147a Eli Cohen         2020-08-04  122  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_CTRL_RX);
1a86b377aa2147a Eli Cohen         2020-08-04  123  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_CTRL_VLAN);
1a86b377aa2147a Eli Cohen         2020-08-04  124  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_CTRL_RX_EXTRA);
1a86b377aa2147a Eli Cohen         2020-08-04  125  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_GUEST_ANNOUNCE);
1a86b377aa2147a Eli Cohen         2020-08-04  126  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_MQ);
1a86b377aa2147a Eli Cohen         2020-08-04  127  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_CTRL_MAC_ADDR);
1a86b377aa2147a Eli Cohen         2020-08-04  128  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_HASH_REPORT);
1a86b377aa2147a Eli Cohen         2020-08-04  129  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_RSS);
1a86b377aa2147a Eli Cohen         2020-08-04  130  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_RSC_EXT);
1a86b377aa2147a Eli Cohen         2020-08-04  131  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_STANDBY);
1a86b377aa2147a Eli Cohen         2020-08-04  132  	MLX5_LOG_VIO_FLAG(VIRTI=
O_NET_F_SPEED_DUPLEX);
1a86b377aa2147a Eli Cohen         2020-08-04  133  	MLX5_LOG_VIO_FLAG(VIRTI=
O_F_NOTIFY_ON_EMPTY);
1a86b377aa2147a Eli Cohen         2020-08-04  134  	MLX5_LOG_VIO_FLAG(VIRTI=
O_F_ANY_LAYOUT);
1a86b377aa2147a Eli Cohen         2020-08-04  135  	MLX5_LOG_VIO_FLAG(VIRTI=
O_F_VERSION_1);
1a86b377aa2147a Eli Cohen         2020-08-04  136  	MLX5_LOG_VIO_FLAG(VIRTI=
O_F_ACCESS_PLATFORM);
1a86b377aa2147a Eli Cohen         2020-08-04  137  	MLX5_LOG_VIO_FLAG(VIRTI=
O_F_RING_PACKED);
1a86b377aa2147a Eli Cohen         2020-08-04  138  	MLX5_LOG_VIO_FLAG(VIRTI=
O_F_ORDER_PLATFORM);
1a86b377aa2147a Eli Cohen         2020-08-04  139  	MLX5_LOG_VIO_FLAG(VIRTI=
O_F_SR_IOV);
1a86b377aa2147a Eli Cohen         2020-08-04  140  }
1a86b377aa2147a Eli Cohen         2020-08-04  141  =

1a86b377aa2147a Eli Cohen         2020-08-04  142  static int create_tis(st=
ruct mlx5_vdpa_net *ndev)
1a86b377aa2147a Eli Cohen         2020-08-04  143  {
1a86b377aa2147a Eli Cohen         2020-08-04  144  	struct mlx5_vdpa_dev *m=
vdev =3D &ndev->mvdev;
1a86b377aa2147a Eli Cohen         2020-08-04  145  	u32 in[MLX5_ST_SZ_DW(cr=
eate_tis_in)] =3D {};
1a86b377aa2147a Eli Cohen         2020-08-04  146  	void *tisc;
1a86b377aa2147a Eli Cohen         2020-08-04  147  	int err;
1a86b377aa2147a Eli Cohen         2020-08-04  148  =

1a86b377aa2147a Eli Cohen         2020-08-04  149  	tisc =3D MLX5_ADDR_OF(c=
reate_tis_in, in, ctx);
1a86b377aa2147a Eli Cohen         2020-08-04  150  	MLX5_SET(tisc, tisc, tr=
ansport_domain, ndev->res.tdn);
1a86b377aa2147a Eli Cohen         2020-08-04  151  	err =3D mlx5_vdpa_creat=
e_tis(mvdev, in, &ndev->res.tisn);
1a86b377aa2147a Eli Cohen         2020-08-04  152  	if (err)
1a86b377aa2147a Eli Cohen         2020-08-04  153  		mlx5_vdpa_warn(mvdev, =
"create TIS (%d)\n", err);
1a86b377aa2147a Eli Cohen         2020-08-04  154  =

1a86b377aa2147a Eli Cohen         2020-08-04  155  	return err;
1a86b377aa2147a Eli Cohen         2020-08-04  156  }
1a86b377aa2147a Eli Cohen         2020-08-04  157  =

1a86b377aa2147a Eli Cohen         2020-08-04  158  static void destroy_tis(=
struct mlx5_vdpa_net *ndev)
1a86b377aa2147a Eli Cohen         2020-08-04  159  {
1a86b377aa2147a Eli Cohen         2020-08-04  160  	mlx5_vdpa_destroy_tis(&=
ndev->mvdev, ndev->res.tisn);
1a86b377aa2147a Eli Cohen         2020-08-04  161  }
1a86b377aa2147a Eli Cohen         2020-08-04  162  =

1a86b377aa2147a Eli Cohen         2020-08-04  163  #define MLX5_VDPA_CQE_SI=
ZE 64
1a86b377aa2147a Eli Cohen         2020-08-04  164  #define MLX5_VDPA_LOG_CQ=
E_SIZE ilog2(MLX5_VDPA_CQE_SIZE)
1a86b377aa2147a Eli Cohen         2020-08-04  165  =

1a86b377aa2147a Eli Cohen         2020-08-04 @166  static int cq_frag_buf_a=
lloc(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_cq_buf *buf, int nent)
1a86b377aa2147a Eli Cohen         2020-08-04  167  {
1a86b377aa2147a Eli Cohen         2020-08-04  168  	struct mlx5_frag_buf *f=
rag_buf =3D &buf->frag_buf;
1a86b377aa2147a Eli Cohen         2020-08-04  169  	u8 log_wq_stride =3D ML=
X5_VDPA_LOG_CQE_SIZE;
1a86b377aa2147a Eli Cohen         2020-08-04  170  	u8 log_wq_sz =3D MLX5_V=
DPA_LOG_CQE_SIZE;
1a86b377aa2147a Eli Cohen         2020-08-04  171  	int err;
1a86b377aa2147a Eli Cohen         2020-08-04  172  =

1a86b377aa2147a Eli Cohen         2020-08-04  173  	err =3D mlx5_frag_buf_a=
lloc_node(ndev->mvdev.mdev, nent * MLX5_VDPA_CQE_SIZE, frag_buf,
1a86b377aa2147a Eli Cohen         2020-08-04  174  				       ndev->mvdev.m=
dev->priv.numa_node);
1a86b377aa2147a Eli Cohen         2020-08-04  175  	if (err)
1a86b377aa2147a Eli Cohen         2020-08-04  176  		return err;
1a86b377aa2147a Eli Cohen         2020-08-04  177  =

1a86b377aa2147a Eli Cohen         2020-08-04  178  	mlx5_init_fbc(frag_buf-=
>frags, log_wq_stride, log_wq_sz, &buf->fbc);
1a86b377aa2147a Eli Cohen         2020-08-04  179  =

1a86b377aa2147a Eli Cohen         2020-08-04  180  	buf->cqe_size =3D MLX5_=
VDPA_CQE_SIZE;
1a86b377aa2147a Eli Cohen         2020-08-04  181  	buf->nent =3D nent;
1a86b377aa2147a Eli Cohen         2020-08-04  182  =

1a86b377aa2147a Eli Cohen         2020-08-04  183  	return 0;
1a86b377aa2147a Eli Cohen         2020-08-04  184  }
1a86b377aa2147a Eli Cohen         2020-08-04  185  =

1a86b377aa2147a Eli Cohen         2020-08-04 @186  static int umem_frag_buf=
_alloc(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_umem *umem, int size)
1a86b377aa2147a Eli Cohen         2020-08-04  187  {
1a86b377aa2147a Eli Cohen         2020-08-04  188  	struct mlx5_frag_buf *f=
rag_buf =3D &umem->frag_buf;
1a86b377aa2147a Eli Cohen         2020-08-04  189  =

1a86b377aa2147a Eli Cohen         2020-08-04  190  	return mlx5_frag_buf_al=
loc_node(ndev->mvdev.mdev, size, frag_buf,
1a86b377aa2147a Eli Cohen         2020-08-04  191  					ndev->mvdev.mdev->p=
riv.numa_node);
1a86b377aa2147a Eli Cohen         2020-08-04  192  }
1a86b377aa2147a Eli Cohen         2020-08-04  193  =

1a86b377aa2147a Eli Cohen         2020-08-04  194  static void cq_frag_buf_=
free(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_cq_buf *buf)
1a86b377aa2147a Eli Cohen         2020-08-04  195  {
1a86b377aa2147a Eli Cohen         2020-08-04  196  	mlx5_frag_buf_free(ndev=
->mvdev.mdev, &buf->frag_buf);
1a86b377aa2147a Eli Cohen         2020-08-04  197  }
1a86b377aa2147a Eli Cohen         2020-08-04  198  =

1a86b377aa2147a Eli Cohen         2020-08-04 @199  static void *get_cqe(str=
uct mlx5_vdpa_cq *vcq, int n)
1a86b377aa2147a Eli Cohen         2020-08-04  200  {
1a86b377aa2147a Eli Cohen         2020-08-04  201  	return mlx5_frag_buf_ge=
t_wqe(&vcq->buf.fbc, n);
1a86b377aa2147a Eli Cohen         2020-08-04  202  }
1a86b377aa2147a Eli Cohen         2020-08-04  203  =

1a86b377aa2147a Eli Cohen         2020-08-04  204  static void cq_frag_buf_=
init(struct mlx5_vdpa_cq *vcq, struct mlx5_vdpa_cq_buf *buf)
1a86b377aa2147a Eli Cohen         2020-08-04  205  {
1a86b377aa2147a Eli Cohen         2020-08-04  206  	struct mlx5_cqe64 *cqe6=
4;
1a86b377aa2147a Eli Cohen         2020-08-04  207  	void *cqe;
1a86b377aa2147a Eli Cohen         2020-08-04  208  	int i;
1a86b377aa2147a Eli Cohen         2020-08-04  209  =

1a86b377aa2147a Eli Cohen         2020-08-04  210  	for (i =3D 0; i < buf->=
nent; i++) {
1a86b377aa2147a Eli Cohen         2020-08-04  211  		cqe =3D get_cqe(vcq, i=
);
1a86b377aa2147a Eli Cohen         2020-08-04  212  		cqe64 =3D cqe;
1a86b377aa2147a Eli Cohen         2020-08-04  213  		cqe64->op_own =3D MLX5=
_CQE_INVALID << 4;
1a86b377aa2147a Eli Cohen         2020-08-04  214  	}
1a86b377aa2147a Eli Cohen         2020-08-04  215  }
1a86b377aa2147a Eli Cohen         2020-08-04  216  =

1a86b377aa2147a Eli Cohen         2020-08-04  217  static void *get_sw_cqe(=
struct mlx5_vdpa_cq *cq, int n)
1a86b377aa2147a Eli Cohen         2020-08-04  218  {
1a86b377aa2147a Eli Cohen         2020-08-04  219  	struct mlx5_cqe64 *cqe6=
4 =3D get_cqe(cq, n & (cq->cqe - 1));
1a86b377aa2147a Eli Cohen         2020-08-04  220  =

1a86b377aa2147a Eli Cohen         2020-08-04  221  	if (likely(get_cqe_opco=
de(cqe64) !=3D MLX5_CQE_INVALID) &&
1a86b377aa2147a Eli Cohen         2020-08-04  222  	    !((cqe64->op_own & =
MLX5_CQE_OWNER_MASK) ^ !!(n & cq->cqe)))
1a86b377aa2147a Eli Cohen         2020-08-04  223  		return cqe64;
1a86b377aa2147a Eli Cohen         2020-08-04  224  =

1a86b377aa2147a Eli Cohen         2020-08-04  225  	return NULL;
1a86b377aa2147a Eli Cohen         2020-08-04  226  }
1a86b377aa2147a Eli Cohen         2020-08-04  227  =

1a86b377aa2147a Eli Cohen         2020-08-04 @228  static void rx_post(stru=
ct mlx5_vdpa_qp *vqp, int n)
1a86b377aa2147a Eli Cohen         2020-08-04  229  {
1a86b377aa2147a Eli Cohen         2020-08-04  230  	vqp->head +=3D n;
1a86b377aa2147a Eli Cohen         2020-08-04  231  	vqp->db.db[0] =3D cpu_t=
o_be32(vqp->head);
1a86b377aa2147a Eli Cohen         2020-08-04  232  }
1a86b377aa2147a Eli Cohen         2020-08-04  233  =

1a86b377aa2147a Eli Cohen         2020-08-04  234  static void qp_prepare(s=
truct mlx5_vdpa_net *ndev, bool fw, void *in,
1a86b377aa2147a Eli Cohen         2020-08-04 @235  		       struct mlx5_vdp=
a_virtqueue *mvq, u32 num_ent)
1a86b377aa2147a Eli Cohen         2020-08-04  236  {
1a86b377aa2147a Eli Cohen         2020-08-04  237  	struct mlx5_vdpa_qp *vq=
p;
1a86b377aa2147a Eli Cohen         2020-08-04  238  	__be64 *pas;
1a86b377aa2147a Eli Cohen         2020-08-04  239  	void *qpc;
1a86b377aa2147a Eli Cohen         2020-08-04  240  =

1a86b377aa2147a Eli Cohen         2020-08-04  241  	vqp =3D fw ? &mvq->fwqp=
 : &mvq->vqqp;
1a86b377aa2147a Eli Cohen         2020-08-04  242  	MLX5_SET(create_qp_in, =
in, uid, ndev->mvdev.res.uid);
1a86b377aa2147a Eli Cohen         2020-08-04  243  	qpc =3D MLX5_ADDR_OF(cr=
eate_qp_in, in, qpc);
1a86b377aa2147a Eli Cohen         2020-08-04  244  	if (vqp->fw) {
1a86b377aa2147a Eli Cohen         2020-08-04  245  		/* Firmware QP is allo=
cated by the driver for the firmware's
1a86b377aa2147a Eli Cohen         2020-08-04  246  		 * use so we can skip =
part of the params as they will be chosen by firmware
1a86b377aa2147a Eli Cohen         2020-08-04  247  		 */
1a86b377aa2147a Eli Cohen         2020-08-04  248  		qpc =3D MLX5_ADDR_OF(c=
reate_qp_in, in, qpc);
1a86b377aa2147a Eli Cohen         2020-08-04  249  		MLX5_SET(qpc, qpc, rq_=
type, MLX5_ZERO_LEN_RQ);
1a86b377aa2147a Eli Cohen         2020-08-04  250  		MLX5_SET(qpc, qpc, no_=
sq, 1);
1a86b377aa2147a Eli Cohen         2020-08-04  251  		return;
1a86b377aa2147a Eli Cohen         2020-08-04  252  	}
1a86b377aa2147a Eli Cohen         2020-08-04  253  =

1a86b377aa2147a Eli Cohen         2020-08-04  254  	MLX5_SET(qpc, qpc, st, =
MLX5_QP_ST_RC);
1a86b377aa2147a Eli Cohen         2020-08-04  255  	MLX5_SET(qpc, qpc, pm_s=
tate, MLX5_QP_PM_MIGRATED);
1a86b377aa2147a Eli Cohen         2020-08-04  256  	MLX5_SET(qpc, qpc, pd, =
ndev->mvdev.res.pdn);
1a86b377aa2147a Eli Cohen         2020-08-04  257  	MLX5_SET(qpc, qpc, mtu,=
 MLX5_QPC_MTU_256_BYTES);
1a86b377aa2147a Eli Cohen         2020-08-04  258  	MLX5_SET(qpc, qpc, uar_=
page, ndev->mvdev.res.uar->index);
1a86b377aa2147a Eli Cohen         2020-08-04  259  	MLX5_SET(qpc, qpc, log_=
page_size, vqp->frag_buf.page_shift - MLX5_ADAPTER_PAGE_SHIFT);
1a86b377aa2147a Eli Cohen         2020-08-04  260  	MLX5_SET(qpc, qpc, no_s=
q, 1);
1a86b377aa2147a Eli Cohen         2020-08-04  261  	MLX5_SET(qpc, qpc, cqn_=
rcv, mvq->cq.mcq.cqn);
1a86b377aa2147a Eli Cohen         2020-08-04  262  	MLX5_SET(qpc, qpc, log_=
rq_size, ilog2(num_ent));
1a86b377aa2147a Eli Cohen         2020-08-04  263  	MLX5_SET(qpc, qpc, rq_t=
ype, MLX5_NON_ZERO_RQ);
1a86b377aa2147a Eli Cohen         2020-08-04  264  	pas =3D (__be64 *)MLX5_=
ADDR_OF(create_qp_in, in, pas);
1a86b377aa2147a Eli Cohen         2020-08-04  265  	mlx5_fill_page_frag_arr=
ay(&vqp->frag_buf, pas);
1a86b377aa2147a Eli Cohen         2020-08-04  266  }
1a86b377aa2147a Eli Cohen         2020-08-04  267  =


:::::: The code at line 46 was first introduced by commit
:::::: 1a86b377aa2147a7c866b03142e848c18e5f3cb8 vdpa/mlx5: Add VDPA driver =
for supported mlx5 devices

:::::: TO: Eli Cohen <eli@mellanox.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3433898340414755900==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AA==
--===============3433898340414755900==--

