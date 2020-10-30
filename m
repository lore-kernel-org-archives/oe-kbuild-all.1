Content-Type: multipart/mixed; boundary="===============9031847687049494559=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/scsi/mvumi.c:407:40: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Sat, 31 Oct 2020 03:40:18 +0800
Message-ID: <202010310307.INCPoqmf-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9031847687049494559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   07e0887302450a62f51dba72df6afb5fabb23d1c
commit: 8f28ca6bd8211214faf717677bbffe375c2a6072 iomap: constify ioreadX() =
iomem argument (as in generic implementation)
date:   3 months ago
config: alpha-randconfig-s031-20201029 (attached as .config)
compiler: alpha-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-56-gc09e8239-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8f28ca6bd8211214faf717677bbffe375c2a6072
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8f28ca6bd8211214faf717677bbffe375c2a6072
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dalpha =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/scsi/mvumi.c:81:52: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] __iomem * @@    =
 got void * @@
   drivers/scsi/mvumi.c:81:52: sparse:     expected void [noderef] __iomem *
   drivers/scsi/mvumi.c:81:52: sparse:     got void *
   drivers/scsi/mvumi.c:90:39: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected void * @@     got void [noderef=
] __iomem * @@
   drivers/scsi/mvumi.c:90:39: sparse:     expected void *
   drivers/scsi/mvumi.c:90:39: sparse:     got void [noderef] __iomem *
   drivers/scsi/mvumi.c:210:34: sparse: sparse: incorrect type in assignmen=
t (different base types) @@     expected unsigned int [usertype] baseaddr_l=
 @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:210:34: sparse:     expected unsigned int [usertype=
] baseaddr_l
   drivers/scsi/mvumi.c:210:34: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:211:34: sparse: sparse: incorrect type in assignmen=
t (different base types) @@     expected unsigned int [usertype] baseaddr_h=
 @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:211:34: sparse:     expected unsigned int [usertype=
] baseaddr_h
   drivers/scsi/mvumi.c:211:34: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:213:17: sparse: sparse: invalid assignment: |=3D
   drivers/scsi/mvumi.c:213:17: sparse:    left side has type unsigned int
   drivers/scsi/mvumi.c:213:17: sparse:    right side has type restricted _=
_le32
   drivers/scsi/mvumi.c:213:17: sparse: sparse: incorrect type in assignmen=
t (different base types) @@     expected unsigned int [usertype] size @@   =
  got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:213:17: sparse:     expected unsigned int [usertype=
] size
   drivers/scsi/mvumi.c:213:17: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:242:26: sparse: sparse: incorrect type in assignmen=
t (different base types) @@     expected unsigned int [usertype] baseaddr_l=
 @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:242:26: sparse:     expected unsigned int [usertype=
] baseaddr_l
   drivers/scsi/mvumi.c:242:26: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:243:26: sparse: sparse: incorrect type in assignmen=
t (different base types) @@     expected unsigned int [usertype] baseaddr_h=
 @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:243:26: sparse:     expected unsigned int [usertype=
] baseaddr_h
   drivers/scsi/mvumi.c:243:26: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:245:9: sparse: sparse: invalid assignment: |=3D
   drivers/scsi/mvumi.c:245:9: sparse:    left side has type unsigned int
   drivers/scsi/mvumi.c:245:9: sparse:    right side has type restricted __=
le32
   drivers/scsi/mvumi.c:245:9: sparse: sparse: incorrect type in assignment=
 (different base types) @@     expected unsigned int [usertype] size @@    =
 got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:245:9: sparse:     expected unsigned int [usertype]=
 size
   drivers/scsi/mvumi.c:245:9: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/mvumi.c:407:40: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const [noderef] __iomem *=
addr @@     got void *inb_read_pointer @@
>> drivers/scsi/mvumi.c:407:40: sparse:     expected void const [noderef] _=
_iomem *addr
   drivers/scsi/mvumi.c:407:40: sparse:     got void *inb_read_pointer
>> drivers/scsi/mvumi.c:429:30: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const [noderef] __iomem *=
addr @@     got void *ib_shadow @@
   drivers/scsi/mvumi.c:429:30: sparse:     expected void const [noderef] _=
_iomem *addr
   drivers/scsi/mvumi.c:429:30: sparse:     got void *ib_shadow
   drivers/scsi/mvumi.c:458:31: sparse: sparse: incorrect type in argument =
2 (different address spaces) @@     expected void [noderef] __iomem *addr @=
@     got void *ib_shadow @@
   drivers/scsi/mvumi.c:458:31: sparse:     expected void [noderef] __iomem=
 *addr
   drivers/scsi/mvumi.c:458:31: sparse:     got void *ib_shadow
   drivers/scsi/mvumi.c:459:48: sparse: sparse: incorrect type in argument =
2 (different address spaces) @@     expected void [noderef] __iomem *addr @=
@     got void *inb_write_pointer @@
   drivers/scsi/mvumi.c:459:48: sparse:     expected void [noderef] __iomem=
 *addr
   drivers/scsi/mvumi.c:459:48: sparse:     got void *inb_write_pointer
>> drivers/scsi/mvumi.c:496:41: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const [noderef] __iomem *=
addr @@     got void *outb_copy_pointer @@
   drivers/scsi/mvumi.c:496:41: sparse:     expected void const [noderef] _=
_iomem *addr
   drivers/scsi/mvumi.c:496:41: sparse:     got void *outb_copy_pointer
>> drivers/scsi/mvumi.c:497:48: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const [noderef] __iomem *=
addr @@     got void *ob_shadow @@
   drivers/scsi/mvumi.c:497:48: sparse:     expected void const [noderef] _=
_iomem *addr
   drivers/scsi/mvumi.c:497:48: sparse:     got void *ob_shadow
>> drivers/scsi/mvumi.c:516:33: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const [noderef] __iomem *=
addr @@     got void *outb_read_pointer @@
   drivers/scsi/mvumi.c:516:33: sparse:     expected void const [noderef] _=
_iomem *addr
   drivers/scsi/mvumi.c:516:33: sparse:     got void *outb_read_pointer
   drivers/scsi/mvumi.c:517:33: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const [noderef] __iomem *=
addr @@     got void *outb_copy_pointer @@
   drivers/scsi/mvumi.c:517:33: sparse:     expected void const [noderef] _=
_iomem *addr
   drivers/scsi/mvumi.c:517:33: sparse:     got void *outb_copy_pointer
   drivers/scsi/mvumi.c:578:42: sparse: sparse: incorrect type in argument =
2 (different address spaces) @@     expected void [noderef] __iomem *addr @=
@     got void *outb_read_pointer @@
   drivers/scsi/mvumi.c:578:42: sparse:     expected void [noderef] __iomem=
 *addr
   drivers/scsi/mvumi.c:578:42: sparse:     got void *outb_read_pointer
   drivers/scsi/mvumi.c:585:26: sparse: sparse: incorrect type in argument =
2 (different address spaces) @@     expected void [noderef] __iomem *addr @=
@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:585:26: sparse:     expected void [noderef] __iomem=
 *addr
   drivers/scsi/mvumi.c:585:26: sparse:     got void *enpointa_mask_reg
>> drivers/scsi/mvumi.c:586:26: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const [noderef] __iomem *=
addr @@     got void *arm_to_pciea_msg1 @@
   drivers/scsi/mvumi.c:586:26: sparse:     expected void const [noderef] _=
_iomem *addr
   drivers/scsi/mvumi.c:586:26: sparse:     got void *arm_to_pciea_msg1
   drivers/scsi/mvumi.c:589:40: sparse: sparse: incorrect type in argument =
2 (different address spaces) @@     expected void [noderef] __iomem *addr @=
@     got void *pciea_to_arm_drbl_reg @@
   drivers/scsi/mvumi.c:589:40: sparse:     expected void [noderef] __iomem=
 *addr
   drivers/scsi/mvumi.c:589:40: sparse:     got void *pciea_to_arm_drbl_reg
>> drivers/scsi/mvumi.c:1281:28: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *arm_to_pciea_drbl_reg @@
   drivers/scsi/mvumi.c:1281:28: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1281:28: sparse:     got void *arm_to_pciea_drbl_reg
   drivers/scsi/mvumi.c:1282:28: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *arm_to_pciea_drbl_reg @@
   drivers/scsi/mvumi.c:1282:28: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1282:28: sparse:     got void *arm_to_pciea_drbl_reg
   drivers/scsi/mvumi.c:1284:48: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *arm_to_pciea_mask_reg @@
   drivers/scsi/mvumi.c:1284:48: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1284:48: sparse:     got void *arm_to_pciea_mask_reg
>> drivers/scsi/mvumi.c:1285:28: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1285:28: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1285:28: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:1286:28: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1286:28: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1286:28: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:612:26: sparse: sparse: incorrect type in argument =
2 (different address spaces) @@     expected void [noderef] __iomem *addr @=
@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:612:26: sparse:     expected void [noderef] __iomem=
 *addr
   drivers/scsi/mvumi.c:612:26: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:613:28: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const [noderef] __iomem *=
addr @@     got void *arm_to_pciea_msg1 @@
   drivers/scsi/mvumi.c:613:28: sparse:     expected void const [noderef] _=
_iomem *addr
   drivers/scsi/mvumi.c:613:28: sparse:     got void *arm_to_pciea_msg1
   drivers/scsi/mvumi.c:615:46: sparse: sparse: incorrect type in argument =
2 (different address spaces) @@     expected void [noderef] __iomem *addr @=
@     got void *pciea_to_arm_drbl_reg @@
   drivers/scsi/mvumi.c:615:46: sparse:     expected void [noderef] __iomem=
 *addr
   drivers/scsi/mvumi.c:615:46: sparse:     got void *pciea_to_arm_drbl_reg
   drivers/scsi/mvumi.c:624:36: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const [noderef] __iomem *=
addr @@     got void *arm_to_pciea_msg1 @@
   drivers/scsi/mvumi.c:624:36: sparse:     expected void const [noderef] _=
_iomem *addr
   drivers/scsi/mvumi.c:624:36: sparse:     got void *arm_to_pciea_msg1
   drivers/scsi/mvumi.c:670:32: sparse: sparse: incorrect type in argument =
2 (different address spaces) @@     expected void [noderef] __iomem *addr @=
@     got void *reset_enable @@
   drivers/scsi/mvumi.c:670:32: sparse:     expected void [noderef] __iomem=
 *addr
   drivers/scsi/mvumi.c:670:32: sparse:     got void *reset_enable
   drivers/scsi/mvumi.c:671:34: sparse: sparse: incorrect type in argument =
2 (different address spaces) @@     expected void [noderef] __iomem *addr @=
@     got void *reset_request @@
   drivers/scsi/mvumi.c:671:34: sparse:     expected void [noderef] __iomem=
 *addr
   drivers/scsi/mvumi.c:671:34: sparse:     got void *reset_request
   drivers/scsi/mvumi.c:673:35: sparse: sparse: incorrect type in argument =
2 (different address spaces) @@     expected void [noderef] __iomem *addr @=
@     got void *reset_enable @@
   drivers/scsi/mvumi.c:673:35: sparse:     expected void [noderef] __iomem=
 *addr
   drivers/scsi/mvumi.c:673:35: sparse:     got void *reset_enable
   drivers/scsi/mvumi.c:674:35: sparse: sparse: incorrect type in argument =
2 (different address spaces) @@     expected void [noderef] __iomem *addr @=
@     got void *reset_request @@
   drivers/scsi/mvumi.c:674:35: sparse:     expected void [noderef] __iomem=
 *addr
   drivers/scsi/mvumi.c:674:35: sparse:     got void *reset_request
>> drivers/scsi/mvumi.c:1100:36: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *arm_to_pciea_msg0 @@
   drivers/scsi/mvumi.c:1100:36: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1100:36: sparse:     got void *arm_to_pciea_msg0
   drivers/scsi/mvumi.c:1115:52: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *pciea_to_arm_msg1 @@
   drivers/scsi/mvumi.c:1115:52: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1115:52: sparse:     got void *pciea_to_arm_msg1
   drivers/scsi/mvumi.c:1116:39: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *pciea_to_arm_msg0 @@
   drivers/scsi/mvumi.c:1116:39: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1116:39: sparse:     got void *pciea_to_arm_msg0
   drivers/scsi/mvumi.c:1117:47: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *pciea_to_arm_drbl_reg @@
   drivers/scsi/mvumi.c:1117:47: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1117:47: sparse:     got void *pciea_to_arm_drbl_reg
   drivers/scsi/mvumi.c:1122:45: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *pciea_to_arm_msg1 @@
   drivers/scsi/mvumi.c:1122:45: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1122:45: sparse:     got void *pciea_to_arm_msg1
   drivers/scsi/mvumi.c:1124:45: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *arm_to_pciea_msg1 @@
   drivers/scsi/mvumi.c:1124:45: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1124:45: sparse:     got void *arm_to_pciea_msg1
   drivers/scsi/mvumi.c:1127:39: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *pciea_to_arm_msg0 @@
   drivers/scsi/mvumi.c:1127:39: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1127:39: sparse:     got void *pciea_to_arm_msg0
   drivers/scsi/mvumi.c:1128:47: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *pciea_to_arm_drbl_reg @@
   drivers/scsi/mvumi.c:1128:47: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1128:47: sparse:     got void *pciea_to_arm_drbl_reg
   drivers/scsi/mvumi.c:1168:39: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *pciea_to_arm_msg0 @@
   drivers/scsi/mvumi.c:1168:39: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1168:39: sparse:     got void *pciea_to_arm_msg0
   drivers/scsi/mvumi.c:1169:47: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *pciea_to_arm_drbl_reg @@
   drivers/scsi/mvumi.c:1169:47: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1169:47: sparse:     got void *pciea_to_arm_drbl_reg
   drivers/scsi/mvumi.c:1174:36: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1174:36: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1174:36: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:1176:36: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1176:36: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1176:36: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:1177:50: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *ib_shadow @@
   drivers/scsi/mvumi.c:1177:50: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1177:50: sparse:     got void *ib_shadow
   drivers/scsi/mvumi.c:1180:45: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *inb_aval_count_basel @@
   drivers/scsi/mvumi.c:1180:45: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1180:45: sparse:     got void *inb_aval_count_basel
   drivers/scsi/mvumi.c:1182:45: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *inb_aval_count_baseh @@
   drivers/scsi/mvumi.c:1182:45: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1182:45: sparse:     got void *inb_aval_count_baseh
   drivers/scsi/mvumi.c:1188:61: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *ob_shadow @@
   drivers/scsi/mvumi.c:1188:61: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1188:61: sparse:     got void *ob_shadow
   drivers/scsi/mvumi.c:1190:61: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *outb_copy_basel @@
   drivers/scsi/mvumi.c:1190:61: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1190:61: sparse:     got void *outb_copy_basel
   drivers/scsi/mvumi.c:1192:61: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *outb_copy_baseh @@
   drivers/scsi/mvumi.c:1192:61: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1192:61: sparse:     got void *outb_copy_baseh
   drivers/scsi/mvumi.c:1244:34: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *arm_to_pciea_msg1 @@
   drivers/scsi/mvumi.c:1244:34: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1244:34: sparse:     got void *arm_to_pciea_msg1
   drivers/scsi/mvumi.c:1248:51: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *pciea_to_arm_drbl_reg @@
   drivers/scsi/mvumi.c:1248:51: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1248:51: sparse:     got void *pciea_to_arm_drbl_reg
   drivers/scsi/mvumi.c:1256:42: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *arm_to_pciea_msg1 @@
   drivers/scsi/mvumi.c:1256:42: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1256:42: sparse:     got void *arm_to_pciea_msg1
   drivers/scsi/mvumi.c:1849:35: sparse: sparse: incorrect type in assignme=
nt (different base types) @@     expected unsigned int [usertype] src_low_a=
ddr @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:1849:35: sparse:     expected unsigned int [usertyp=
e] src_low_addr
   drivers/scsi/mvumi.c:1849:35: sparse:     got restricted __le32 [usertyp=
e]
   drivers/scsi/mvumi.c:1851:36: sparse: sparse: incorrect type in assignme=
nt (different base types) @@     expected unsigned int [usertype] src_high_=
addr @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:1851:36: sparse:     expected unsigned int [usertyp=
e] src_high_addr
   drivers/scsi/mvumi.c:1851:36: sparse:     got restricted __le32 [usertyp=
e]
   drivers/scsi/mvumi.c:1903:48: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *arm_to_pciea_mask_reg @@
   drivers/scsi/mvumi.c:1903:48: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1903:48: sparse:     got void *arm_to_pciea_mask_reg
   drivers/scsi/mvumi.c:1904:29: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1904:29: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1904:29: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:1906:29: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1906:29: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1906:29: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:1918:26: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *arm_to_pciea_mask_reg @@
   drivers/scsi/mvumi.c:1918:26: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1918:26: sparse:     got void *arm_to_pciea_mask_reg
   drivers/scsi/mvumi.c:1919:29: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1919:29: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1919:29: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:1922:29: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1922:29: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1922:29: sparse:     got void *enpointa_mask_reg
>> drivers/scsi/mvumi.c:1931:31: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *main_int_cause_reg @@
   drivers/scsi/mvumi.c:1931:31: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1931:31: sparse:     got void *main_int_cause_reg
>> drivers/scsi/mvumi.c:1935:36: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *outb_isr_cause @@
   drivers/scsi/mvumi.c:1935:36: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1935:36: sparse:     got void *outb_isr_cause
   drivers/scsi/mvumi.c:1939:61: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *outb_isr_cause @@
   drivers/scsi/mvumi.c:1939:61: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1939:61: sparse:     got void *outb_isr_cause
   drivers/scsi/mvumi.c:1945:53: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *outb_isr_cause @@
   drivers/scsi/mvumi.c:1945:53: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1945:53: sparse:     got void *outb_isr_cause
   drivers/scsi/mvumi.c:1951:36: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *outb_isr_cause @@
   drivers/scsi/mvumi.c:1951:36: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1951:36: sparse:     got void *outb_isr_cause
   drivers/scsi/mvumi.c:1953:61: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *outb_isr_cause @@
   drivers/scsi/mvumi.c:1953:61: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1953:61: sparse:     got void *outb_isr_cause
   drivers/scsi/mvumi.c:1956:43: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *arm_to_pciea_drbl_reg @@
   drivers/scsi/mvumi.c:1956:43: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1956:43: sparse:     got void *arm_to_pciea_drbl_reg
   drivers/scsi/mvumi.c:1958:51: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *arm_to_pciea_drbl_reg @@
   drivers/scsi/mvumi.c:1958:51: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1958:51: sparse:     got void *arm_to_pciea_drbl_reg
   drivers/scsi/mvumi.c:1975:37: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void *arm_to_pciea_drbl_reg @@
   drivers/scsi/mvumi.c:1975:37: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/scsi/mvumi.c:1975:37: sparse:     got void *arm_to_pciea_drbl_reg
   drivers/scsi/mvumi.c:1977:45: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void *arm_to_pciea_drbl_reg @@
   drivers/scsi/mvumi.c:1977:45: sparse:     expected void [noderef] __iome=
m *addr
   drivers/scsi/mvumi.c:1977:45: sparse:     got void *arm_to_pciea_drbl_reg
--
   drivers/uio/uio_aec.c:44:49: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected void [noderef] __iomem *int_f=
lag @@     got void * @@
   drivers/uio/uio_aec.c:44:49: sparse:     expected void [noderef] __iomem=
 *int_flag
   drivers/uio/uio_aec.c:44:49: sparse:     got void *
>> drivers/uio/uio_aec.c:50:49: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const [noderef] __iomem *=
addr @@     got void * @@
   drivers/uio/uio_aec.c:50:49: sparse:     expected void const [noderef] _=
_iomem *addr
   drivers/uio/uio_aec.c:50:49: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const [noderef] __iomem *a=
ddr @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const [noderef] __=
iomem *addr
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const [noderef] __iomem *a=
ddr @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const [noderef] __=
iomem *addr
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const [noderef] __iomem *a=
ddr @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const [noderef] __=
iomem *addr
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const [noderef] __iomem *a=
ddr @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const [noderef] __=
iomem *addr
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const [noderef] __iomem *a=
ddr @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const [noderef] __=
iomem *addr
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const [noderef] __iomem *a=
ddr @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const [noderef] __=
iomem *addr
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:88:20: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected void *priv @@     got void [no=
deref] __iomem * @@
   drivers/uio/uio_aec.c:88:20: sparse:     expected void *priv
   drivers/uio/uio_aec.c:88:20: sparse:     got void [noderef] __iomem *
   drivers/uio/uio_aec.c:104:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void * @@
   drivers/uio/uio_aec.c:104:42: sparse:     expected void [noderef] __iome=
m *addr
   drivers/uio/uio_aec.c:104:42: sparse:     got void *
   drivers/uio/uio_aec.c:105:43: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void * @@
   drivers/uio/uio_aec.c:105:43: sparse:     expected void [noderef] __iome=
m *addr
   drivers/uio/uio_aec.c:105:43: sparse:     got void *
   drivers/uio/uio_aec.c:106:34: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void * @@
   drivers/uio/uio_aec.c:106:34: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/uio/uio_aec.c:106:34: sparse:     got void *
   drivers/uio/uio_aec.c:115:31: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem * @@  =
   got void *priv @@
   drivers/uio/uio_aec.c:115:31: sparse:     expected void [noderef] __iome=
m *
   drivers/uio/uio_aec.c:115:31: sparse:     got void *priv
   drivers/uio/uio_aec.c:130:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void * @@
   drivers/uio/uio_aec.c:130:42: sparse:     expected void [noderef] __iome=
m *addr
   drivers/uio/uio_aec.c:130:42: sparse:     got void *
   drivers/uio/uio_aec.c:131:43: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __iomem *addr =
@@     got void * @@
   drivers/uio/uio_aec.c:131:43: sparse:     expected void [noderef] __iome=
m *addr
   drivers/uio/uio_aec.c:131:43: sparse:     got void *
   drivers/uio/uio_aec.c:133:28: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const [noderef] __iomem =
*addr @@     got void * @@
   drivers/uio/uio_aec.c:133:28: sparse:     expected void const [noderef] =
__iomem *addr
   drivers/uio/uio_aec.c:133:28: sparse:     got void *
   drivers/uio/uio_aec.c:138:21: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void volatile [noderef] __iom=
em *addr @@     got void *priv @@
   drivers/uio/uio_aec.c:138:21: sparse:     expected void volatile [nodere=
f] __iomem *addr
   drivers/uio/uio_aec.c:138:21: sparse:     got void *priv

vim +407 drivers/scsi/mvumi.c

f0c568a478f0353 Jianyun Li 2011-05-11  401  =

bd756ddea18e02c Shun Fu    2012-09-23  402  static unsigned int mvumi_check=
_ib_list_9143(struct mvumi_hba *mhba)
f0c568a478f0353 Jianyun Li 2011-05-11  403  {
bd756ddea18e02c Shun Fu    2012-09-23  404  	unsigned int ib_rp_reg;
bd756ddea18e02c Shun Fu    2012-09-23  405  	struct mvumi_hw_regs *regs =3D=
 mhba->regs;
bd756ddea18e02c Shun Fu    2012-09-23  406  =

bd756ddea18e02c Shun Fu    2012-09-23 @407  	ib_rp_reg =3D ioread32(mhba->r=
egs->inb_read_pointer);
f0c568a478f0353 Jianyun Li 2011-05-11  408  =

bd756ddea18e02c Shun Fu    2012-09-23  409  	if (unlikely(((ib_rp_reg & reg=
s->cl_slot_num_mask) =3D=3D
bd756ddea18e02c Shun Fu    2012-09-23  410  			(mhba->ib_cur_slot & regs->c=
l_slot_num_mask)) &&
bd756ddea18e02c Shun Fu    2012-09-23  411  			((ib_rp_reg & regs->cl_point=
er_toggle)
bd756ddea18e02c Shun Fu    2012-09-23  412  			 !=3D (mhba->ib_cur_slot & r=
egs->cl_pointer_toggle)))) {
bd756ddea18e02c Shun Fu    2012-09-23  413  		dev_warn(&mhba->pdev->dev, "n=
o free slot to use.\n");
bd756ddea18e02c Shun Fu    2012-09-23  414  		return 0;
bd756ddea18e02c Shun Fu    2012-09-23  415  	}
f0c568a478f0353 Jianyun Li 2011-05-11  416  	if (atomic_read(&mhba->fw_outs=
tanding) >=3D mhba->max_io) {
f0c568a478f0353 Jianyun Li 2011-05-11  417  		dev_warn(&mhba->pdev->dev, "f=
irmware io overflow.\n");
bd756ddea18e02c Shun Fu    2012-09-23  418  		return 0;
bd756ddea18e02c Shun Fu    2012-09-23  419  	} else {
bd756ddea18e02c Shun Fu    2012-09-23  420  		return mhba->max_io - atomic_=
read(&mhba->fw_outstanding);
bd756ddea18e02c Shun Fu    2012-09-23  421  	}
f0c568a478f0353 Jianyun Li 2011-05-11  422  }
f0c568a478f0353 Jianyun Li 2011-05-11  423  =

bd756ddea18e02c Shun Fu    2012-09-23  424  static unsigned int mvumi_check=
_ib_list_9580(struct mvumi_hba *mhba)
bd756ddea18e02c Shun Fu    2012-09-23  425  {
bd756ddea18e02c Shun Fu    2012-09-23  426  	unsigned int count;
bd756ddea18e02c Shun Fu    2012-09-23  427  	if (atomic_read(&mhba->fw_outs=
tanding) >=3D (mhba->max_io - 1))
bd756ddea18e02c Shun Fu    2012-09-23  428  		return 0;
bd756ddea18e02c Shun Fu    2012-09-23 @429  	count =3D ioread32(mhba->ib_sh=
adow);
bd756ddea18e02c Shun Fu    2012-09-23  430  	if (count =3D=3D 0xffff)
bd756ddea18e02c Shun Fu    2012-09-23  431  		return 0;
bd756ddea18e02c Shun Fu    2012-09-23  432  	return count;
f0c568a478f0353 Jianyun Li 2011-05-11  433  }
f0c568a478f0353 Jianyun Li 2011-05-11  434  =

bd756ddea18e02c Shun Fu    2012-09-23  435  static void mvumi_get_ib_list_e=
ntry(struct mvumi_hba *mhba, void **ib_entry)
bd756ddea18e02c Shun Fu    2012-09-23  436  {
bd756ddea18e02c Shun Fu    2012-09-23  437  	unsigned int cur_ib_entry;
bd756ddea18e02c Shun Fu    2012-09-23  438  =

bd756ddea18e02c Shun Fu    2012-09-23  439  	cur_ib_entry =3D mhba->ib_cur_=
slot & mhba->regs->cl_slot_num_mask;
f0c568a478f0353 Jianyun Li 2011-05-11  440  	cur_ib_entry++;
f0c568a478f0353 Jianyun Li 2011-05-11  441  	if (cur_ib_entry >=3D mhba->li=
st_num_io) {
f0c568a478f0353 Jianyun Li 2011-05-11  442  		cur_ib_entry -=3D mhba->list_=
num_io;
bd756ddea18e02c Shun Fu    2012-09-23  443  		mhba->ib_cur_slot ^=3D mhba->=
regs->cl_pointer_toggle;
f0c568a478f0353 Jianyun Li 2011-05-11  444  	}
bd756ddea18e02c Shun Fu    2012-09-23  445  	mhba->ib_cur_slot &=3D ~mhba->=
regs->cl_slot_num_mask;
bd756ddea18e02c Shun Fu    2012-09-23  446  	mhba->ib_cur_slot |=3D (cur_ib=
_entry & mhba->regs->cl_slot_num_mask);
bd756ddea18e02c Shun Fu    2012-09-23  447  	if (mhba->hba_capability & HS_=
CAPABILITY_SUPPORT_DYN_SRC) {
bd756ddea18e02c Shun Fu    2012-09-23  448  		*ib_entry =3D mhba->ib_list +=
 cur_ib_entry *
bd756ddea18e02c Shun Fu    2012-09-23  449  				sizeof(struct mvumi_dyn_lis=
t_entry);
bd756ddea18e02c Shun Fu    2012-09-23  450  	} else {
f0c568a478f0353 Jianyun Li 2011-05-11  451  		*ib_entry =3D mhba->ib_list +=
 cur_ib_entry * mhba->ib_max_size;
bd756ddea18e02c Shun Fu    2012-09-23  452  	}
f0c568a478f0353 Jianyun Li 2011-05-11  453  	atomic_inc(&mhba->fw_outstandi=
ng);
f0c568a478f0353 Jianyun Li 2011-05-11  454  }
f0c568a478f0353 Jianyun Li 2011-05-11  455  =

f0c568a478f0353 Jianyun Li 2011-05-11  456  static void mvumi_send_ib_list_=
entry(struct mvumi_hba *mhba)
f0c568a478f0353 Jianyun Li 2011-05-11  457  {
bd756ddea18e02c Shun Fu    2012-09-23  458  	iowrite32(0xffff, mhba->ib_sha=
dow);
bd756ddea18e02c Shun Fu    2012-09-23  459  	iowrite32(mhba->ib_cur_slot, m=
hba->regs->inb_write_pointer);
f0c568a478f0353 Jianyun Li 2011-05-11  460  }
f0c568a478f0353 Jianyun Li 2011-05-11  461  =

f0c568a478f0353 Jianyun Li 2011-05-11  462  static char mvumi_check_ob_fram=
e(struct mvumi_hba *mhba,
f0c568a478f0353 Jianyun Li 2011-05-11  463  		unsigned int cur_obf, struct =
mvumi_rsp_frame *p_outb_frame)
f0c568a478f0353 Jianyun Li 2011-05-11  464  {
f0c568a478f0353 Jianyun Li 2011-05-11  465  	unsigned short tag, request_id;
f0c568a478f0353 Jianyun Li 2011-05-11  466  =

f0c568a478f0353 Jianyun Li 2011-05-11  467  	udelay(1);
f0c568a478f0353 Jianyun Li 2011-05-11  468  	p_outb_frame =3D mhba->ob_list=
 + cur_obf * mhba->ob_max_size;
f0c568a478f0353 Jianyun Li 2011-05-11  469  	request_id =3D p_outb_frame->r=
equest_id;
f0c568a478f0353 Jianyun Li 2011-05-11  470  	tag =3D p_outb_frame->tag;
f0c568a478f0353 Jianyun Li 2011-05-11  471  	if (tag > mhba->tag_pool.size)=
 {
f0c568a478f0353 Jianyun Li 2011-05-11  472  		dev_err(&mhba->pdev->dev, "ob=
 frame data error\n");
f0c568a478f0353 Jianyun Li 2011-05-11  473  		return -1;
f0c568a478f0353 Jianyun Li 2011-05-11  474  	}
f0c568a478f0353 Jianyun Li 2011-05-11  475  	if (mhba->tag_cmd[tag] =3D=3D =
NULL) {
f0c568a478f0353 Jianyun Li 2011-05-11  476  		dev_err(&mhba->pdev->dev, "ta=
g[0x%x] with NO command\n", tag);
f0c568a478f0353 Jianyun Li 2011-05-11  477  		return -1;
f0c568a478f0353 Jianyun Li 2011-05-11  478  	} else if (mhba->tag_cmd[tag]-=
>request_id !=3D request_id &&
f0c568a478f0353 Jianyun Li 2011-05-11  479  						mhba->request_id_enabled)=
 {
f0c568a478f0353 Jianyun Li 2011-05-11  480  			dev_err(&mhba->pdev->dev, "r=
equest ID from FW:0x%x,"
f0c568a478f0353 Jianyun Li 2011-05-11  481  					"cmd request ID:0x%x\n", r=
equest_id,
f0c568a478f0353 Jianyun Li 2011-05-11  482  					mhba->tag_cmd[tag]->reques=
t_id);
f0c568a478f0353 Jianyun Li 2011-05-11  483  			return -1;
f0c568a478f0353 Jianyun Li 2011-05-11  484  	}
f0c568a478f0353 Jianyun Li 2011-05-11  485  =

f0c568a478f0353 Jianyun Li 2011-05-11  486  	return 0;
f0c568a478f0353 Jianyun Li 2011-05-11  487  }
f0c568a478f0353 Jianyun Li 2011-05-11  488  =

bd756ddea18e02c Shun Fu    2012-09-23  489  static int mvumi_check_ob_list_=
9143(struct mvumi_hba *mhba,
bd756ddea18e02c Shun Fu    2012-09-23  490  			unsigned int *cur_obf, unsig=
ned int *assign_obf_end)
f0c568a478f0353 Jianyun Li 2011-05-11  491  {
bd756ddea18e02c Shun Fu    2012-09-23  492  	unsigned int ob_write, ob_writ=
e_shadow;
bd756ddea18e02c Shun Fu    2012-09-23  493  	struct mvumi_hw_regs *regs =3D=
 mhba->regs;
f0c568a478f0353 Jianyun Li 2011-05-11  494  =

f0c568a478f0353 Jianyun Li 2011-05-11  495  	do {
bd756ddea18e02c Shun Fu    2012-09-23 @496  		ob_write =3D ioread32(regs->o=
utb_copy_pointer);
bd756ddea18e02c Shun Fu    2012-09-23 @497  		ob_write_shadow =3D ioread32(=
mhba->ob_shadow);
bd756ddea18e02c Shun Fu    2012-09-23  498  	} while ((ob_write & regs->cl_=
slot_num_mask) !=3D ob_write_shadow);
f0c568a478f0353 Jianyun Li 2011-05-11  499  =

bd756ddea18e02c Shun Fu    2012-09-23  500  	*cur_obf =3D mhba->ob_cur_slot=
 & mhba->regs->cl_slot_num_mask;
bd756ddea18e02c Shun Fu    2012-09-23  501  	*assign_obf_end =3D ob_write &=
 mhba->regs->cl_slot_num_mask;
f0c568a478f0353 Jianyun Li 2011-05-11  502  =

bd756ddea18e02c Shun Fu    2012-09-23  503  	if ((ob_write & regs->cl_point=
er_toggle) !=3D
bd756ddea18e02c Shun Fu    2012-09-23  504  			(mhba->ob_cur_slot & regs->c=
l_pointer_toggle)) {
bd756ddea18e02c Shun Fu    2012-09-23  505  		*assign_obf_end +=3D mhba->li=
st_num_io;
bd756ddea18e02c Shun Fu    2012-09-23  506  	}
bd756ddea18e02c Shun Fu    2012-09-23  507  	return 0;
f0c568a478f0353 Jianyun Li 2011-05-11  508  }
f0c568a478f0353 Jianyun Li 2011-05-11  509  =

bd756ddea18e02c Shun Fu    2012-09-23  510  static int mvumi_check_ob_list_=
9580(struct mvumi_hba *mhba,
bd756ddea18e02c Shun Fu    2012-09-23  511  			unsigned int *cur_obf, unsig=
ned int *assign_obf_end)
bd756ddea18e02c Shun Fu    2012-09-23  512  {
bd756ddea18e02c Shun Fu    2012-09-23  513  	unsigned int ob_write;
bd756ddea18e02c Shun Fu    2012-09-23  514  	struct mvumi_hw_regs *regs =3D=
 mhba->regs;
bd756ddea18e02c Shun Fu    2012-09-23  515  =

bd756ddea18e02c Shun Fu    2012-09-23 @516  	ob_write =3D ioread32(regs->ou=
tb_read_pointer);
bd756ddea18e02c Shun Fu    2012-09-23  517  	ob_write =3D ioread32(regs->ou=
tb_copy_pointer);
bd756ddea18e02c Shun Fu    2012-09-23  518  	*cur_obf =3D mhba->ob_cur_slot=
 & mhba->regs->cl_slot_num_mask;
bd756ddea18e02c Shun Fu    2012-09-23  519  	*assign_obf_end =3D ob_write &=
 mhba->regs->cl_slot_num_mask;
bd756ddea18e02c Shun Fu    2012-09-23  520  	if (*assign_obf_end < *cur_obf)
bd756ddea18e02c Shun Fu    2012-09-23  521  		*assign_obf_end +=3D mhba->li=
st_num_io;
bd756ddea18e02c Shun Fu    2012-09-23  522  	else if (*assign_obf_end =3D=
=3D *cur_obf)
bd756ddea18e02c Shun Fu    2012-09-23  523  		return -1;
bd756ddea18e02c Shun Fu    2012-09-23  524  	return 0;
bd756ddea18e02c Shun Fu    2012-09-23  525  }
bd756ddea18e02c Shun Fu    2012-09-23  526  =

bd756ddea18e02c Shun Fu    2012-09-23  527  static void mvumi_receive_ob_li=
st_entry(struct mvumi_hba *mhba)
bd756ddea18e02c Shun Fu    2012-09-23  528  {
bd756ddea18e02c Shun Fu    2012-09-23  529  	unsigned int cur_obf, assign_o=
bf_end, i;
bd756ddea18e02c Shun Fu    2012-09-23  530  	struct mvumi_ob_data *ob_data;
bd756ddea18e02c Shun Fu    2012-09-23  531  	struct mvumi_rsp_frame *p_outb=
_frame;
bd756ddea18e02c Shun Fu    2012-09-23  532  	struct mvumi_hw_regs *regs =3D=
 mhba->regs;
bd756ddea18e02c Shun Fu    2012-09-23  533  =

bd756ddea18e02c Shun Fu    2012-09-23  534  	if (mhba->instancet->check_ob_=
list(mhba, &cur_obf, &assign_obf_end))
bd756ddea18e02c Shun Fu    2012-09-23  535  		return;
bd756ddea18e02c Shun Fu    2012-09-23  536  =

f0c568a478f0353 Jianyun Li 2011-05-11  537  	for (i =3D (assign_obf_end - c=
ur_obf); i !=3D 0; i--) {
f0c568a478f0353 Jianyun Li 2011-05-11  538  		cur_obf++;
f0c568a478f0353 Jianyun Li 2011-05-11  539  		if (cur_obf >=3D mhba->list_n=
um_io) {
f0c568a478f0353 Jianyun Li 2011-05-11  540  			cur_obf -=3D mhba->list_num_=
io;
bd756ddea18e02c Shun Fu    2012-09-23  541  			mhba->ob_cur_slot ^=3D regs-=
>cl_pointer_toggle;
f0c568a478f0353 Jianyun Li 2011-05-11  542  		}
f0c568a478f0353 Jianyun Li 2011-05-11  543  =

f0c568a478f0353 Jianyun Li 2011-05-11  544  		p_outb_frame =3D mhba->ob_lis=
t + cur_obf * mhba->ob_max_size;
f0c568a478f0353 Jianyun Li 2011-05-11  545  =

f0c568a478f0353 Jianyun Li 2011-05-11  546  		/* Copy pointer may point to =
entry in outbound list
f0c568a478f0353 Jianyun Li 2011-05-11  547  		*  before entry has valid data
f0c568a478f0353 Jianyun Li 2011-05-11  548  		*/
f0c568a478f0353 Jianyun Li 2011-05-11  549  		if (unlikely(p_outb_frame->ta=
g > mhba->tag_pool.size ||
f0c568a478f0353 Jianyun Li 2011-05-11  550  			mhba->tag_cmd[p_outb_frame->=
tag] =3D=3D NULL ||
f0c568a478f0353 Jianyun Li 2011-05-11  551  			p_outb_frame->request_id !=
=3D
f0c568a478f0353 Jianyun Li 2011-05-11  552  				mhba->tag_cmd[p_outb_frame-=
>tag]->request_id))
f0c568a478f0353 Jianyun Li 2011-05-11  553  			if (mvumi_check_ob_frame(mhb=
a, cur_obf, p_outb_frame))
f0c568a478f0353 Jianyun Li 2011-05-11  554  				continue;
f0c568a478f0353 Jianyun Li 2011-05-11  555  =

f0c568a478f0353 Jianyun Li 2011-05-11  556  		if (!list_empty(&mhba->ob_dat=
a_list)) {
f0c568a478f0353 Jianyun Li 2011-05-11  557  			ob_data =3D (struct mvumi_ob=
_data *)
f0c568a478f0353 Jianyun Li 2011-05-11  558  				list_first_entry(&mhba->ob_=
data_list,
f0c568a478f0353 Jianyun Li 2011-05-11  559  					struct mvumi_ob_data, list=
);
f0c568a478f0353 Jianyun Li 2011-05-11  560  			list_del_init(&ob_data->list=
);
f0c568a478f0353 Jianyun Li 2011-05-11  561  		} else {
f0c568a478f0353 Jianyun Li 2011-05-11  562  			ob_data =3D NULL;
f0c568a478f0353 Jianyun Li 2011-05-11  563  			if (cur_obf =3D=3D 0) {
f0c568a478f0353 Jianyun Li 2011-05-11  564  				cur_obf =3D mhba->list_num_=
io - 1;
bd756ddea18e02c Shun Fu    2012-09-23  565  				mhba->ob_cur_slot ^=3D regs=
->cl_pointer_toggle;
f0c568a478f0353 Jianyun Li 2011-05-11  566  			} else
f0c568a478f0353 Jianyun Li 2011-05-11  567  				cur_obf -=3D 1;
f0c568a478f0353 Jianyun Li 2011-05-11  568  			break;
f0c568a478f0353 Jianyun Li 2011-05-11  569  		}
f0c568a478f0353 Jianyun Li 2011-05-11  570  =

f0c568a478f0353 Jianyun Li 2011-05-11  571  		memcpy(ob_data->data, p_outb_=
frame, mhba->ob_max_size);
f0c568a478f0353 Jianyun Li 2011-05-11  572  		p_outb_frame->tag =3D 0xff;
f0c568a478f0353 Jianyun Li 2011-05-11  573  =

f0c568a478f0353 Jianyun Li 2011-05-11  574  		list_add_tail(&ob_data->list,=
 &mhba->free_ob_list);
f0c568a478f0353 Jianyun Li 2011-05-11  575  	}
bd756ddea18e02c Shun Fu    2012-09-23  576  	mhba->ob_cur_slot &=3D ~regs->=
cl_slot_num_mask;
bd756ddea18e02c Shun Fu    2012-09-23  577  	mhba->ob_cur_slot |=3D (cur_ob=
f & regs->cl_slot_num_mask);
bd756ddea18e02c Shun Fu    2012-09-23  578  	iowrite32(mhba->ob_cur_slot, r=
egs->outb_read_pointer);
f0c568a478f0353 Jianyun Li 2011-05-11  579  }
f0c568a478f0353 Jianyun Li 2011-05-11  580  =

bd756ddea18e02c Shun Fu    2012-09-23  581  static void mvumi_reset(struct =
mvumi_hba *mhba)
f0c568a478f0353 Jianyun Li 2011-05-11  582  {
bd756ddea18e02c Shun Fu    2012-09-23  583  	struct mvumi_hw_regs *regs =3D=
 mhba->regs;
bd756ddea18e02c Shun Fu    2012-09-23  584  =

bd756ddea18e02c Shun Fu    2012-09-23  585  	iowrite32(0, regs->enpointa_ma=
sk_reg);
bd756ddea18e02c Shun Fu    2012-09-23 @586  	if (ioread32(regs->arm_to_pcie=
a_msg1) !=3D HANDSHAKE_DONESTATE)
f0c568a478f0353 Jianyun Li 2011-05-11  587  		return;
f0c568a478f0353 Jianyun Li 2011-05-11  588  =

bd756ddea18e02c Shun Fu    2012-09-23  589  	iowrite32(DRBL_SOFT_RESET, reg=
s->pciea_to_arm_drbl_reg);
f0c568a478f0353 Jianyun Li 2011-05-11  590  }
f0c568a478f0353 Jianyun Li 2011-05-11  591  =


:::::: The code at line 407 was first introduced by commit
:::::: bd756ddea18e02ccea8b29496b2fe3bd91af8eb7 [SCSI] mvumi: Add support f=
or Marvell SAS/SATA RAID-on-Chip(ROC) 88RC9580

:::::: TO: Shun Fu <fushun@gmail.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9031847687049494559==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
w4w9p+8eJ0BdWRL/B8rssmHiqwEA
--===============9031847687049494559==--

