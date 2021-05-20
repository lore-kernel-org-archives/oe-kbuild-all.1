Content-Type: multipart/mixed; boundary="===============9050651653920969975=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [freescale-fslc:pr/344 9435/18956] drivers/virtio/virtio_ivshmem.c:119:55: sparse: sparse: restricted __le32 degrades to integer
Date: Thu, 20 May 2021 19:01:09 +0800
Message-ID: <202105201904.1RphAtNt-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9050651653920969975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/Freescale/linux-fslc pr/344
head:   2cbb55e591febb414b623269d61d4444113c285f
commit: 3ea2de8648ea6ecd86e527bdd5993740e8bc7cef [9435/18956] virtio: Add v=
irtio-over-ivshmem transport driver
config: ia64-randconfig-s032-20210520 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/Freescale/linux-fslc/commit/3ea2de8648ea6ecd86=
e527bdd5993740e8bc7cef
        git remote add freescale-fslc https://github.com/Freescale/linux-fs=
lc
        git fetch --no-tags freescale-fslc pr/344
        git checkout 3ea2de8648ea6ecd86e527bdd5993740e8bc7cef
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Dia64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_ivshmem.c:119:55: sparse: sparse: restricted __le3=
2 degrades to integer
>> drivers/virtio/virtio_ivshmem.c:140:42: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned short [usertyp=
e] @@     got restricted __le16 [usertype] @@
   drivers/virtio/virtio_ivshmem.c:140:42: sparse:     expected unsigned sh=
ort [usertype]
   drivers/virtio/virtio_ivshmem.c:140:42: sparse:     got restricted __le1=
6 [usertype]
>> drivers/virtio/virtio_ivshmem.c:142:42: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 @@     got restricted __le32 [usertype] @@
   drivers/virtio/virtio_ivshmem.c:142:42: sparse:     expected unsigned in=
t [usertype]
   drivers/virtio/virtio_ivshmem.c:142:42: sparse:     got restricted __le3=
2 [usertype]
>> drivers/virtio/virtio_ivshmem.c:144:42: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned long long [use=
rtype] @@     got restricted __le64 [usertype] @@
   drivers/virtio/virtio_ivshmem.c:144:42: sparse:     expected unsigned lo=
ng long [usertype]
   drivers/virtio/virtio_ivshmem.c:144:42: sparse:     got restricted __le6=
4 [usertype]
>> drivers/virtio/virtio_ivshmem.c:188:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected restricted __le16 [user=
type] w @@     got unsigned short [usertype] @@
   drivers/virtio/virtio_ivshmem.c:188:19: sparse:     expected restricted =
__le16 [usertype] w
   drivers/virtio/virtio_ivshmem.c:188:19: sparse:     got unsigned short [=
usertype]
>> drivers/virtio/virtio_ivshmem.c:192:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected restricted __le32 [user=
type] l @@     got unsigned int [usertype] @@
   drivers/virtio/virtio_ivshmem.c:192:19: sparse:     expected restricted =
__le32 [usertype] l
   drivers/virtio/virtio_ivshmem.c:192:19: sparse:     got unsigned int [us=
ertype]
>> drivers/virtio/virtio_ivshmem.c:196:19: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected restricted __le64 [user=
type] q @@     got unsigned long long [usertype] @@
   drivers/virtio/virtio_ivshmem.c:196:19: sparse:     expected restricted =
__le64 [usertype] q
   drivers/virtio/virtio_ivshmem.c:196:19: sparse:     got unsigned long lo=
ng [usertype]
>> drivers/virtio/virtio_ivshmem.c:233:20: sparse: sparse: incorrect type i=
n initializer (different base types) @@     expected unsigned int [usertype=
] gen @@     got restricted __le32 [addressable] __val @@
   drivers/virtio/virtio_ivshmem.c:233:20: sparse:     expected unsigned in=
t [usertype] gen
   drivers/virtio/virtio_ivshmem.c:233:20: sparse:     got restricted __le3=
2 [addressable] __val
   drivers/virtio/virtio_ivshmem.c:236:55: sparse: sparse: restricted __le3=
2 degrades to integer
>> drivers/virtio/virtio_ivshmem.c:243:21: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int [usertype]=
 gen @@     got restricted __le32 [addressable] __val @@
   drivers/virtio/virtio_ivshmem.c:243:21: sparse:     expected unsigned in=
t [usertype] gen
   drivers/virtio/virtio_ivshmem.c:243:21: sparse:     got restricted __le3=
2 [addressable] __val
   drivers/virtio/virtio_ivshmem.c:336:13: sparse: sparse: restricted __le3=
2 degrades to integer
>> drivers/virtio/virtio_ivshmem.c:405:14: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int size @@   =
  got restricted __le16 [usertype] queue_size @@
   drivers/virtio/virtio_ivshmem.c:405:14: sparse:     expected unsigned in=
t size
   drivers/virtio/virtio_ivshmem.c:405:14: sparse:     got restricted __le1=
6 [usertype] queue_size
>> drivers/virtio/virtio_ivshmem.c:411:29: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned int device_vec=
tor @@     got restricted __le16 [usertype] queue_device_vector @@
   drivers/virtio/virtio_ivshmem.c:411:29: sparse:     expected unsigned in=
t device_vector
   drivers/virtio/virtio_ivshmem.c:411:29: sparse:     got restricted __le1=
6 [usertype] queue_device_vector
   drivers/virtio/virtio_ivshmem.c:865:34: sparse: sparse: restricted __le3=
2 degrades to integer
>> drivers/virtio/virtio_ivshmem.c:889:63: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned long size @@  =
   got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_ivshmem.c:889:63: sparse:     expected unsigned lo=
ng size
   drivers/virtio/virtio_ivshmem.c:889:63: sparse:     got restricted __le3=
2 [usertype] size
   drivers/virtio/virtio_ivshmem.c:900:36: sparse: sparse: restricted __le3=
2 degrades to integer
>> drivers/virtio/virtio_ivshmem.c:908:16: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 value @@     got restricted __le32 [usertype] @@
   drivers/virtio/virtio_ivshmem.c:908:16: sparse:     expected unsigned in=
t [usertype] value
   drivers/virtio/virtio_ivshmem.c:908:16: sparse:     got restricted __le3=
2 [usertype]
   drivers/virtio/virtio_ivshmem.c: note: in included file (through arch/ia=
64/include/asm/io.h, arch/ia64/include/asm/smp.h, include/linux/smp.h, ...):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]

vim +119 drivers/virtio/virtio_ivshmem.c

   115	=

   116	static bool vi_synchronize_reg_write(struct virtio_ivshmem_device *v=
i_dev)
   117	{
   118		while (READ_ONCE(vi_dev->virtio_header->write_transaction)) {
 > 119			if (READ_ONCE(*vi_dev->peer_state) !=3D VIRTIO_STATE_READY) {
   120				dev_err_ratelimited(&vi_dev->pci_dev->dev,
   121						    "backend failed!");
   122				return false;
   123			}
   124			cpu_relax();
   125		}
   126		return true;
   127	}
   128	=

   129	static bool vi_reg_write(struct virtio_ivshmem_device *vi_dev, unsig=
ned int reg,
   130				 u64 value, unsigned int size)
   131	{
   132		u8 *reg_area =3D (u8 *)vi_dev->virtio_header;
   133	=

   134		if (!vi_synchronize_reg_write(vi_dev))
   135			return false;
   136	=

   137		if (size =3D=3D 1)
   138			*(u8 *)(reg_area + reg) =3D (u8)value;
   139		else if (size =3D=3D 2)
 > 140			*(u16 *)(reg_area + reg) =3D cpu_to_le16((u16)value);
   141		else if (size =3D=3D 4)
 > 142			*(u32 *)(reg_area + reg) =3D cpu_to_le32((u32)value);
   143		else if (size =3D=3D 8)
 > 144			*(u64 *)(reg_area + reg) =3D cpu_to_le64(value);
   145		else
   146			BUG();
   147		virt_wmb();
   148	=

   149		vi_dev->virtio_header->write_transaction =3D cpu_to_le32(reg);
   150		virt_wmb();
   151	=

   152		writel((vi_dev->peer_id << 16), &vi_dev->ivshm_regs->doorbell);
   153	=

   154		return true;
   155	}
   156	=

   157	static bool vi_reg_write16(struct virtio_ivshmem_device *vi_dev,
   158				   unsigned int reg, u32 value)
   159	{
   160		return vi_reg_write(vi_dev, reg, value, 2);
   161	}
   162	=

   163	static bool vi_reg_write32(struct virtio_ivshmem_device *vi_dev,
   164				   unsigned int reg, u32 value)
   165	{
   166		return vi_reg_write(vi_dev, reg, value, 4);
   167	}
   168	=

   169	static bool vi_reg_write64(struct virtio_ivshmem_device *vi_dev,
   170				   unsigned int reg, u64 value)
   171	{
   172		return vi_reg_write(vi_dev, reg, value, 8);
   173	}
   174	=

   175	static void vi_get(struct virtio_device *vdev, unsigned offset,
   176			   void *buf, unsigned len)
   177	{
   178		struct virtio_ivshmem_device *vi_dev =3D to_virtio_ivshmem_device(v=
dev);
   179		__le16 w;
   180		__le32 l;
   181		__le64 q;
   182	=

   183		switch (len) {
   184		case 1:
   185			*(u8 *)buf =3D *(u8 *)(vi_dev->virtio_header->config + offset);
   186			break;
   187		case 2:
 > 188			w =3D *(u16 *)(vi_dev->virtio_header->config + offset);
   189			*(u16 *)buf =3D le16_to_cpu(w);
   190			break;
   191		case 4:
 > 192			l =3D *(u32 *)(vi_dev->virtio_header->config + offset);
   193			*(u32 *)buf =3D le32_to_cpu(l);
   194			break;
   195		case 8:
 > 196			q =3D *(u64 *)(vi_dev->virtio_header->config + offset);
   197			*(u64 *)buf =3D le64_to_cpu(q);
   198			break;
   199		default:
   200			BUG();
   201		}
   202	}
   203	=

   204	static void vi_set(struct virtio_device *vdev, unsigned offset,
   205			   const void *buf, unsigned len)
   206	{
   207		u64 value;
   208	=

   209		switch (len) {
   210		case 1:
   211			value =3D *(u8 *)buf;
   212			break;
   213		case 2:
   214			value =3D *(u16 *)buf;
   215			break;
   216		case 4:
   217			value =3D *(u32 *)buf;
   218			break;
   219		case 8:
   220			value =3D *(u64 *)buf;
   221			break;
   222		default:
   223			BUG();
   224		}
   225		vi_reg_write(to_virtio_ivshmem_device(vdev),
   226			     offsetof(struct virtio_ivshmem_header, config) + offset,
   227			     value, len);
   228	}
   229	=

   230	static u32 vi_generation(struct virtio_device *vdev)
   231	{
   232		struct virtio_ivshmem_device *vi_dev =3D to_virtio_ivshmem_device(v=
dev);
 > 233		u32 gen  =3D READ_ONCE(vi_dev->virtio_header->config_generation);
   234	=

   235		while (gen & 1) {
   236			if (READ_ONCE(*vi_dev->peer_state) !=3D VIRTIO_STATE_READY) {
   237				dev_err_ratelimited(&vi_dev->pci_dev->dev,
   238						    "backend failed!");
   239				return 0;
   240			}
   241			cpu_relax();
   242	=

 > 243			gen =3D READ_ONCE(vi_dev->virtio_header->config_generation);
   244		}
   245		return gen;
   246	}
   247	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9050651653920969975==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============9050651653920969975==--

