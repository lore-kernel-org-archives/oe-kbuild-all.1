Content-Type: multipart/mixed; boundary="===============4753634784619373030=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/scsi/mvumi.c:407:40: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Tue, 25 May 2021 00:27:22 +0800
Message-ID: <202105250009.b8pXBDNq-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4753634784619373030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c4681547bcce777daf576925a966ffa824edd09d
commit: 8f28ca6bd8211214faf717677bbffe375c2a6072 iomap: constify ioreadX() =
iomem argument (as in generic implementation)
date:   9 months ago
config: alpha-randconfig-s032-20210524 (attached as .config)
compiler: alpha-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8f28ca6bd8211214faf717677bbffe375c2a6072
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8f28ca6bd8211214faf717677bbffe375c2a6072
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Dalpha =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
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
   drivers/scsi/mvumi.c:407:40: sparse:     expected void const [noderef] _=
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

vim +407 drivers/scsi/mvumi.c

f0c568a478f035 Jianyun Li 2011-05-11  401  =

bd756ddea18e02 Shun Fu    2012-09-23  402  static unsigned int mvumi_check_=
ib_list_9143(struct mvumi_hba *mhba)
f0c568a478f035 Jianyun Li 2011-05-11  403  {
bd756ddea18e02 Shun Fu    2012-09-23  404  	unsigned int ib_rp_reg;
bd756ddea18e02 Shun Fu    2012-09-23  405  	struct mvumi_hw_regs *regs =3D =
mhba->regs;
bd756ddea18e02 Shun Fu    2012-09-23  406  =

bd756ddea18e02 Shun Fu    2012-09-23 @407  	ib_rp_reg =3D ioread32(mhba->re=
gs->inb_read_pointer);
f0c568a478f035 Jianyun Li 2011-05-11  408  =

bd756ddea18e02 Shun Fu    2012-09-23  409  	if (unlikely(((ib_rp_reg & regs=
->cl_slot_num_mask) =3D=3D
bd756ddea18e02 Shun Fu    2012-09-23  410  			(mhba->ib_cur_slot & regs->cl=
_slot_num_mask)) &&
bd756ddea18e02 Shun Fu    2012-09-23  411  			((ib_rp_reg & regs->cl_pointe=
r_toggle)
bd756ddea18e02 Shun Fu    2012-09-23  412  			 !=3D (mhba->ib_cur_slot & re=
gs->cl_pointer_toggle)))) {
bd756ddea18e02 Shun Fu    2012-09-23  413  		dev_warn(&mhba->pdev->dev, "no=
 free slot to use.\n");
bd756ddea18e02 Shun Fu    2012-09-23  414  		return 0;
bd756ddea18e02 Shun Fu    2012-09-23  415  	}
f0c568a478f035 Jianyun Li 2011-05-11  416  	if (atomic_read(&mhba->fw_outst=
anding) >=3D mhba->max_io) {
f0c568a478f035 Jianyun Li 2011-05-11  417  		dev_warn(&mhba->pdev->dev, "fi=
rmware io overflow.\n");
bd756ddea18e02 Shun Fu    2012-09-23  418  		return 0;
bd756ddea18e02 Shun Fu    2012-09-23  419  	} else {
bd756ddea18e02 Shun Fu    2012-09-23  420  		return mhba->max_io - atomic_r=
ead(&mhba->fw_outstanding);
bd756ddea18e02 Shun Fu    2012-09-23  421  	}
f0c568a478f035 Jianyun Li 2011-05-11  422  }
f0c568a478f035 Jianyun Li 2011-05-11  423  =

bd756ddea18e02 Shun Fu    2012-09-23  424  static unsigned int mvumi_check_=
ib_list_9580(struct mvumi_hba *mhba)
bd756ddea18e02 Shun Fu    2012-09-23  425  {
bd756ddea18e02 Shun Fu    2012-09-23  426  	unsigned int count;
bd756ddea18e02 Shun Fu    2012-09-23  427  	if (atomic_read(&mhba->fw_outst=
anding) >=3D (mhba->max_io - 1))
bd756ddea18e02 Shun Fu    2012-09-23  428  		return 0;
bd756ddea18e02 Shun Fu    2012-09-23 @429  	count =3D ioread32(mhba->ib_sha=
dow);
bd756ddea18e02 Shun Fu    2012-09-23  430  	if (count =3D=3D 0xffff)
bd756ddea18e02 Shun Fu    2012-09-23  431  		return 0;
bd756ddea18e02 Shun Fu    2012-09-23  432  	return count;
f0c568a478f035 Jianyun Li 2011-05-11  433  }
f0c568a478f035 Jianyun Li 2011-05-11  434  =

bd756ddea18e02 Shun Fu    2012-09-23  435  static void mvumi_get_ib_list_en=
try(struct mvumi_hba *mhba, void **ib_entry)
bd756ddea18e02 Shun Fu    2012-09-23  436  {
bd756ddea18e02 Shun Fu    2012-09-23  437  	unsigned int cur_ib_entry;
bd756ddea18e02 Shun Fu    2012-09-23  438  =

bd756ddea18e02 Shun Fu    2012-09-23  439  	cur_ib_entry =3D mhba->ib_cur_s=
lot & mhba->regs->cl_slot_num_mask;
f0c568a478f035 Jianyun Li 2011-05-11  440  	cur_ib_entry++;
f0c568a478f035 Jianyun Li 2011-05-11  441  	if (cur_ib_entry >=3D mhba->lis=
t_num_io) {
f0c568a478f035 Jianyun Li 2011-05-11  442  		cur_ib_entry -=3D mhba->list_n=
um_io;
bd756ddea18e02 Shun Fu    2012-09-23  443  		mhba->ib_cur_slot ^=3D mhba->r=
egs->cl_pointer_toggle;
f0c568a478f035 Jianyun Li 2011-05-11  444  	}
bd756ddea18e02 Shun Fu    2012-09-23  445  	mhba->ib_cur_slot &=3D ~mhba->r=
egs->cl_slot_num_mask;
bd756ddea18e02 Shun Fu    2012-09-23  446  	mhba->ib_cur_slot |=3D (cur_ib_=
entry & mhba->regs->cl_slot_num_mask);
bd756ddea18e02 Shun Fu    2012-09-23  447  	if (mhba->hba_capability & HS_C=
APABILITY_SUPPORT_DYN_SRC) {
bd756ddea18e02 Shun Fu    2012-09-23  448  		*ib_entry =3D mhba->ib_list + =
cur_ib_entry *
bd756ddea18e02 Shun Fu    2012-09-23  449  				sizeof(struct mvumi_dyn_list=
_entry);
bd756ddea18e02 Shun Fu    2012-09-23  450  	} else {
f0c568a478f035 Jianyun Li 2011-05-11  451  		*ib_entry =3D mhba->ib_list + =
cur_ib_entry * mhba->ib_max_size;
bd756ddea18e02 Shun Fu    2012-09-23  452  	}
f0c568a478f035 Jianyun Li 2011-05-11  453  	atomic_inc(&mhba->fw_outstandin=
g);
f0c568a478f035 Jianyun Li 2011-05-11  454  }
f0c568a478f035 Jianyun Li 2011-05-11  455  =

f0c568a478f035 Jianyun Li 2011-05-11  456  static void mvumi_send_ib_list_e=
ntry(struct mvumi_hba *mhba)
f0c568a478f035 Jianyun Li 2011-05-11  457  {
bd756ddea18e02 Shun Fu    2012-09-23  458  	iowrite32(0xffff, mhba->ib_shad=
ow);
bd756ddea18e02 Shun Fu    2012-09-23  459  	iowrite32(mhba->ib_cur_slot, mh=
ba->regs->inb_write_pointer);
f0c568a478f035 Jianyun Li 2011-05-11  460  }
f0c568a478f035 Jianyun Li 2011-05-11  461  =

f0c568a478f035 Jianyun Li 2011-05-11  462  static char mvumi_check_ob_frame=
(struct mvumi_hba *mhba,
f0c568a478f035 Jianyun Li 2011-05-11  463  		unsigned int cur_obf, struct m=
vumi_rsp_frame *p_outb_frame)
f0c568a478f035 Jianyun Li 2011-05-11  464  {
f0c568a478f035 Jianyun Li 2011-05-11  465  	unsigned short tag, request_id;
f0c568a478f035 Jianyun Li 2011-05-11  466  =

f0c568a478f035 Jianyun Li 2011-05-11  467  	udelay(1);
f0c568a478f035 Jianyun Li 2011-05-11  468  	p_outb_frame =3D mhba->ob_list =
+ cur_obf * mhba->ob_max_size;
f0c568a478f035 Jianyun Li 2011-05-11  469  	request_id =3D p_outb_frame->re=
quest_id;
f0c568a478f035 Jianyun Li 2011-05-11  470  	tag =3D p_outb_frame->tag;
f0c568a478f035 Jianyun Li 2011-05-11  471  	if (tag > mhba->tag_pool.size) {
f0c568a478f035 Jianyun Li 2011-05-11  472  		dev_err(&mhba->pdev->dev, "ob =
frame data error\n");
f0c568a478f035 Jianyun Li 2011-05-11  473  		return -1;
f0c568a478f035 Jianyun Li 2011-05-11  474  	}
f0c568a478f035 Jianyun Li 2011-05-11  475  	if (mhba->tag_cmd[tag] =3D=3D N=
ULL) {
f0c568a478f035 Jianyun Li 2011-05-11  476  		dev_err(&mhba->pdev->dev, "tag=
[0x%x] with NO command\n", tag);
f0c568a478f035 Jianyun Li 2011-05-11  477  		return -1;
f0c568a478f035 Jianyun Li 2011-05-11  478  	} else if (mhba->tag_cmd[tag]->=
request_id !=3D request_id &&
f0c568a478f035 Jianyun Li 2011-05-11  479  						mhba->request_id_enabled) {
f0c568a478f035 Jianyun Li 2011-05-11  480  			dev_err(&mhba->pdev->dev, "re=
quest ID from FW:0x%x,"
f0c568a478f035 Jianyun Li 2011-05-11  481  					"cmd request ID:0x%x\n", re=
quest_id,
f0c568a478f035 Jianyun Li 2011-05-11  482  					mhba->tag_cmd[tag]->request=
_id);
f0c568a478f035 Jianyun Li 2011-05-11  483  			return -1;
f0c568a478f035 Jianyun Li 2011-05-11  484  	}
f0c568a478f035 Jianyun Li 2011-05-11  485  =

f0c568a478f035 Jianyun Li 2011-05-11  486  	return 0;
f0c568a478f035 Jianyun Li 2011-05-11  487  }
f0c568a478f035 Jianyun Li 2011-05-11  488  =

bd756ddea18e02 Shun Fu    2012-09-23  489  static int mvumi_check_ob_list_9=
143(struct mvumi_hba *mhba,
bd756ddea18e02 Shun Fu    2012-09-23  490  			unsigned int *cur_obf, unsign=
ed int *assign_obf_end)
f0c568a478f035 Jianyun Li 2011-05-11  491  {
bd756ddea18e02 Shun Fu    2012-09-23  492  	unsigned int ob_write, ob_write=
_shadow;
bd756ddea18e02 Shun Fu    2012-09-23  493  	struct mvumi_hw_regs *regs =3D =
mhba->regs;
f0c568a478f035 Jianyun Li 2011-05-11  494  =

f0c568a478f035 Jianyun Li 2011-05-11  495  	do {
bd756ddea18e02 Shun Fu    2012-09-23 @496  		ob_write =3D ioread32(regs->ou=
tb_copy_pointer);
bd756ddea18e02 Shun Fu    2012-09-23 @497  		ob_write_shadow =3D ioread32(m=
hba->ob_shadow);
bd756ddea18e02 Shun Fu    2012-09-23  498  	} while ((ob_write & regs->cl_s=
lot_num_mask) !=3D ob_write_shadow);
f0c568a478f035 Jianyun Li 2011-05-11  499  =

bd756ddea18e02 Shun Fu    2012-09-23  500  	*cur_obf =3D mhba->ob_cur_slot =
& mhba->regs->cl_slot_num_mask;
bd756ddea18e02 Shun Fu    2012-09-23  501  	*assign_obf_end =3D ob_write & =
mhba->regs->cl_slot_num_mask;
f0c568a478f035 Jianyun Li 2011-05-11  502  =

bd756ddea18e02 Shun Fu    2012-09-23  503  	if ((ob_write & regs->cl_pointe=
r_toggle) !=3D
bd756ddea18e02 Shun Fu    2012-09-23  504  			(mhba->ob_cur_slot & regs->cl=
_pointer_toggle)) {
bd756ddea18e02 Shun Fu    2012-09-23  505  		*assign_obf_end +=3D mhba->lis=
t_num_io;
bd756ddea18e02 Shun Fu    2012-09-23  506  	}
bd756ddea18e02 Shun Fu    2012-09-23  507  	return 0;
f0c568a478f035 Jianyun Li 2011-05-11  508  }
f0c568a478f035 Jianyun Li 2011-05-11  509  =

bd756ddea18e02 Shun Fu    2012-09-23  510  static int mvumi_check_ob_list_9=
580(struct mvumi_hba *mhba,
bd756ddea18e02 Shun Fu    2012-09-23  511  			unsigned int *cur_obf, unsign=
ed int *assign_obf_end)
bd756ddea18e02 Shun Fu    2012-09-23  512  {
bd756ddea18e02 Shun Fu    2012-09-23  513  	unsigned int ob_write;
bd756ddea18e02 Shun Fu    2012-09-23  514  	struct mvumi_hw_regs *regs =3D =
mhba->regs;
bd756ddea18e02 Shun Fu    2012-09-23  515  =

bd756ddea18e02 Shun Fu    2012-09-23 @516  	ob_write =3D ioread32(regs->out=
b_read_pointer);
bd756ddea18e02 Shun Fu    2012-09-23  517  	ob_write =3D ioread32(regs->out=
b_copy_pointer);
bd756ddea18e02 Shun Fu    2012-09-23  518  	*cur_obf =3D mhba->ob_cur_slot =
& mhba->regs->cl_slot_num_mask;
bd756ddea18e02 Shun Fu    2012-09-23  519  	*assign_obf_end =3D ob_write & =
mhba->regs->cl_slot_num_mask;
bd756ddea18e02 Shun Fu    2012-09-23  520  	if (*assign_obf_end < *cur_obf)
bd756ddea18e02 Shun Fu    2012-09-23  521  		*assign_obf_end +=3D mhba->lis=
t_num_io;
bd756ddea18e02 Shun Fu    2012-09-23  522  	else if (*assign_obf_end =3D=3D=
 *cur_obf)
bd756ddea18e02 Shun Fu    2012-09-23  523  		return -1;
bd756ddea18e02 Shun Fu    2012-09-23  524  	return 0;
bd756ddea18e02 Shun Fu    2012-09-23  525  }
bd756ddea18e02 Shun Fu    2012-09-23  526  =

bd756ddea18e02 Shun Fu    2012-09-23  527  static void mvumi_receive_ob_lis=
t_entry(struct mvumi_hba *mhba)
bd756ddea18e02 Shun Fu    2012-09-23  528  {
bd756ddea18e02 Shun Fu    2012-09-23  529  	unsigned int cur_obf, assign_ob=
f_end, i;
bd756ddea18e02 Shun Fu    2012-09-23  530  	struct mvumi_ob_data *ob_data;
bd756ddea18e02 Shun Fu    2012-09-23  531  	struct mvumi_rsp_frame *p_outb_=
frame;
bd756ddea18e02 Shun Fu    2012-09-23  532  	struct mvumi_hw_regs *regs =3D =
mhba->regs;
bd756ddea18e02 Shun Fu    2012-09-23  533  =

bd756ddea18e02 Shun Fu    2012-09-23  534  	if (mhba->instancet->check_ob_l=
ist(mhba, &cur_obf, &assign_obf_end))
bd756ddea18e02 Shun Fu    2012-09-23  535  		return;
bd756ddea18e02 Shun Fu    2012-09-23  536  =

f0c568a478f035 Jianyun Li 2011-05-11  537  	for (i =3D (assign_obf_end - cu=
r_obf); i !=3D 0; i--) {
f0c568a478f035 Jianyun Li 2011-05-11  538  		cur_obf++;
f0c568a478f035 Jianyun Li 2011-05-11  539  		if (cur_obf >=3D mhba->list_nu=
m_io) {
f0c568a478f035 Jianyun Li 2011-05-11  540  			cur_obf -=3D mhba->list_num_i=
o;
bd756ddea18e02 Shun Fu    2012-09-23  541  			mhba->ob_cur_slot ^=3D regs->=
cl_pointer_toggle;
f0c568a478f035 Jianyun Li 2011-05-11  542  		}
f0c568a478f035 Jianyun Li 2011-05-11  543  =

f0c568a478f035 Jianyun Li 2011-05-11  544  		p_outb_frame =3D mhba->ob_list=
 + cur_obf * mhba->ob_max_size;
f0c568a478f035 Jianyun Li 2011-05-11  545  =

f0c568a478f035 Jianyun Li 2011-05-11  546  		/* Copy pointer may point to e=
ntry in outbound list
f0c568a478f035 Jianyun Li 2011-05-11  547  		*  before entry has valid data
f0c568a478f035 Jianyun Li 2011-05-11  548  		*/
f0c568a478f035 Jianyun Li 2011-05-11  549  		if (unlikely(p_outb_frame->tag=
 > mhba->tag_pool.size ||
f0c568a478f035 Jianyun Li 2011-05-11  550  			mhba->tag_cmd[p_outb_frame->t=
ag] =3D=3D NULL ||
f0c568a478f035 Jianyun Li 2011-05-11  551  			p_outb_frame->request_id !=3D
f0c568a478f035 Jianyun Li 2011-05-11  552  				mhba->tag_cmd[p_outb_frame->=
tag]->request_id))
f0c568a478f035 Jianyun Li 2011-05-11  553  			if (mvumi_check_ob_frame(mhba=
, cur_obf, p_outb_frame))
f0c568a478f035 Jianyun Li 2011-05-11  554  				continue;
f0c568a478f035 Jianyun Li 2011-05-11  555  =

f0c568a478f035 Jianyun Li 2011-05-11  556  		if (!list_empty(&mhba->ob_data=
_list)) {
f0c568a478f035 Jianyun Li 2011-05-11  557  			ob_data =3D (struct mvumi_ob_=
data *)
f0c568a478f035 Jianyun Li 2011-05-11  558  				list_first_entry(&mhba->ob_d=
ata_list,
f0c568a478f035 Jianyun Li 2011-05-11  559  					struct mvumi_ob_data, list);
f0c568a478f035 Jianyun Li 2011-05-11  560  			list_del_init(&ob_data->list);
f0c568a478f035 Jianyun Li 2011-05-11  561  		} else {
f0c568a478f035 Jianyun Li 2011-05-11  562  			ob_data =3D NULL;
f0c568a478f035 Jianyun Li 2011-05-11  563  			if (cur_obf =3D=3D 0) {
f0c568a478f035 Jianyun Li 2011-05-11  564  				cur_obf =3D mhba->list_num_i=
o - 1;
bd756ddea18e02 Shun Fu    2012-09-23  565  				mhba->ob_cur_slot ^=3D regs-=
>cl_pointer_toggle;
f0c568a478f035 Jianyun Li 2011-05-11  566  			} else
f0c568a478f035 Jianyun Li 2011-05-11  567  				cur_obf -=3D 1;
f0c568a478f035 Jianyun Li 2011-05-11  568  			break;
f0c568a478f035 Jianyun Li 2011-05-11  569  		}
f0c568a478f035 Jianyun Li 2011-05-11  570  =

f0c568a478f035 Jianyun Li 2011-05-11  571  		memcpy(ob_data->data, p_outb_f=
rame, mhba->ob_max_size);
f0c568a478f035 Jianyun Li 2011-05-11  572  		p_outb_frame->tag =3D 0xff;
f0c568a478f035 Jianyun Li 2011-05-11  573  =

f0c568a478f035 Jianyun Li 2011-05-11  574  		list_add_tail(&ob_data->list, =
&mhba->free_ob_list);
f0c568a478f035 Jianyun Li 2011-05-11  575  	}
bd756ddea18e02 Shun Fu    2012-09-23  576  	mhba->ob_cur_slot &=3D ~regs->c=
l_slot_num_mask;
bd756ddea18e02 Shun Fu    2012-09-23  577  	mhba->ob_cur_slot |=3D (cur_obf=
 & regs->cl_slot_num_mask);
bd756ddea18e02 Shun Fu    2012-09-23  578  	iowrite32(mhba->ob_cur_slot, re=
gs->outb_read_pointer);
f0c568a478f035 Jianyun Li 2011-05-11  579  }
f0c568a478f035 Jianyun Li 2011-05-11  580  =

bd756ddea18e02 Shun Fu    2012-09-23  581  static void mvumi_reset(struct m=
vumi_hba *mhba)
f0c568a478f035 Jianyun Li 2011-05-11  582  {
bd756ddea18e02 Shun Fu    2012-09-23  583  	struct mvumi_hw_regs *regs =3D =
mhba->regs;
bd756ddea18e02 Shun Fu    2012-09-23  584  =

bd756ddea18e02 Shun Fu    2012-09-23  585  	iowrite32(0, regs->enpointa_mas=
k_reg);
bd756ddea18e02 Shun Fu    2012-09-23 @586  	if (ioread32(regs->arm_to_pciea=
_msg1) !=3D HANDSHAKE_DONESTATE)
f0c568a478f035 Jianyun Li 2011-05-11  587  		return;
f0c568a478f035 Jianyun Li 2011-05-11  588  =

bd756ddea18e02 Shun Fu    2012-09-23  589  	iowrite32(DRBL_SOFT_RESET, regs=
->pciea_to_arm_drbl_reg);
f0c568a478f035 Jianyun Li 2011-05-11  590  }
f0c568a478f035 Jianyun Li 2011-05-11  591  =


:::::: The code at line 407 was first introduced by commit
:::::: bd756ddea18e02ccea8b29496b2fe3bd91af8eb7 [SCSI] mvumi: Add support f=
or Marvell SAS/SATA RAID-on-Chip(ROC) 88RC9580

:::::: TO: Shun Fu <fushun@gmail.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4753634784619373030==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4753634784619373030==--

