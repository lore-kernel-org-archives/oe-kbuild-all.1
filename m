Content-Type: multipart/mixed; boundary="===============4539904534405006228=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: fs/fat/file.c:44:15: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Sun, 17 Jan 2021 18:51:42 +0800
Message-ID: <202101171829.zZfAp61A-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4539904534405006228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Luc,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0da0a8a0a0e1845f495431c3d8d733d2bbf9e9e5
commit: e5fc436f06eef54ef512ea55a9db8eb9f2e76959 sparse: use static inline =
for __chk_{user,io}_ptr()
date:   5 months ago
config: sh-randconfig-s031-20210117 (attached as .config)
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
   fs/fat/file.c:44:15: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected unsigned int const *__gu_addr @@     =
got unsigned int [noderef] [usertype] __user *user_attr @@
   fs/fat/file.c:44:15: sparse:     expected unsigned int const *__gu_addr
   fs/fat/file.c:44:15: sparse:     got unsigned int [noderef] [usertype] _=
_user *user_attr
>> fs/fat/file.c:44:15: sparse: sparse: incorrect type in argument 1 (diffe=
rent address spaces) @@     expected void const volatile [noderef] __user *=
ptr @@     got unsigned int const *__gu_addr @@
   fs/fat/file.c:44:15: sparse:     expected void const volatile [noderef] =
__user *ptr
   fs/fat/file.c:44:15: sparse:     got unsigned int const *__gu_addr
--
   fs/jfs/ioctl.c:83:21: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int const *__gu_addr @@     got int =
[noderef] __user * @@
   fs/jfs/ioctl.c:83:21: sparse:     expected int const *__gu_addr
   fs/jfs/ioctl.c:83:21: sparse:     got int [noderef] __user *
>> fs/jfs/ioctl.c:83:21: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected void const volatile [noderef] __user =
*ptr @@     got int const *__gu_addr @@
   fs/jfs/ioctl.c:83:21: sparse:     expected void const volatile [noderef]=
 __user *ptr
   fs/jfs/ioctl.c:83:21: sparse:     got int const *__gu_addr
--
   fs/xfs/xfs_ioctl.c:2257:21: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected unsigned int const *__gu_addr =
@@     got unsigned int [noderef] [usertype] __user * @@
   fs/xfs/xfs_ioctl.c:2257:21: sparse:     expected unsigned int const *__g=
u_addr
   fs/xfs/xfs_ioctl.c:2257:21: sparse:     got unsigned int [noderef] [user=
type] __user *
>> fs/xfs/xfs_ioctl.c:2257:21: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] _=
_user *ptr @@     got unsigned int const *__gu_addr @@
   fs/xfs/xfs_ioctl.c:2257:21: sparse:     expected void const volatile [no=
deref] __user *ptr
   fs/xfs/xfs_ioctl.c:2257:21: sparse:     got unsigned int const *__gu_addr
--
   fs/nilfs2/ioctl.c:138:13: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user * @@
   fs/nilfs2/ioctl.c:138:13: sparse:     expected int const *__gu_addr
   fs/nilfs2/ioctl.c:138:13: sparse:     got int [noderef] __user *
>> fs/nilfs2/ioctl.c:138:13: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
   fs/nilfs2/ioctl.c:138:13: sparse:     expected void const volatile [node=
ref] __user *ptr
   fs/nilfs2/ioctl.c:138:13: sparse:     got int const *__gu_addr
--
>> arch/sh/kernel/process_32.c:42:9: sparse: sparse: incorrect type in argu=
ment 1 (different base types) @@     expected void const volatile [noderef]=
 __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/process_32.c:42:9: sparse:     expected void const volati=
le [noderef] __iomem *ptr
   arch/sh/kernel/process_32.c:42:9: sparse:     got unsigned int
--
   arch/sh/mm/init.c: note: in included file (through arch/sh/include/asm/m=
mu_context.h):
>> arch/sh/include/asm/mmu_context_32.h:53:9: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected void const volatile =
[noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/mmu_context_32.h:53:9: sparse:     expected void con=
st volatile [noderef] __iomem *ptr
   arch/sh/include/asm/mmu_context_32.h:53:9: sparse:     got unsigned int
--
>> arch/sh/mm/tlbflush_32.c:134:9: sparse: sparse: incorrect type in argume=
nt 1 (different base types) @@     expected void const volatile [noderef] _=
_iomem *ptr @@     got unsigned int @@
   arch/sh/mm/tlbflush_32.c:134:9: sparse:     expected void const volatile=
 [noderef] __iomem *ptr
   arch/sh/mm/tlbflush_32.c:134:9: sparse:     got unsigned int
>> arch/sh/mm/tlbflush_32.c:134:9: sparse: sparse: incorrect type in argume=
nt 1 (different base types) @@     expected void const volatile [noderef] _=
_iomem *ptr @@     got unsigned int @@
   arch/sh/mm/tlbflush_32.c:134:9: sparse:     expected void const volatile=
 [noderef] __iomem *ptr
   arch/sh/mm/tlbflush_32.c:134:9: sparse:     got unsigned int
--
>> arch/sh/mm/tlb-sh3.c:41:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected void const volatile [noderef] __iome=
m *ptr @@     got unsigned int @@
   arch/sh/mm/tlb-sh3.c:41:9: sparse:     expected void const volatile [nod=
eref] __iomem *ptr
   arch/sh/mm/tlb-sh3.c:41:9: sparse:     got unsigned int
   arch/sh/mm/tlb-sh3.c:48:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected void const volatile [noderef] __iome=
m *ptr @@     got unsigned int @@
   arch/sh/mm/tlb-sh3.c:48:9: sparse:     expected void const volatile [nod=
eref] __iomem *ptr
   arch/sh/mm/tlb-sh3.c:48:9: sparse:     got unsigned int
>> arch/sh/mm/tlb-sh3.c:75:17: sparse: sparse: incorrect type in argument 1=
 (different base types) @@     expected void const volatile [noderef] __iom=
em *ptr @@     got unsigned long @@
   arch/sh/mm/tlb-sh3.c:75:17: sparse:     expected void const volatile [no=
deref] __iomem *ptr
   arch/sh/mm/tlb-sh3.c:75:17: sparse:     got unsigned long
   arch/sh/mm/tlb-sh3.c:90:18: sparse: sparse: incorrect type in argument 1=
 (different base types) @@     expected void const volatile [noderef] __iom=
em *ptr @@     got unsigned int @@
   arch/sh/mm/tlb-sh3.c:90:18: sparse:     expected void const volatile [no=
deref] __iomem *ptr
   arch/sh/mm/tlb-sh3.c:90:18: sparse:     got unsigned int
   arch/sh/mm/tlb-sh3.c:92:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected void const volatile [noderef] __iome=
m *ptr @@     got unsigned int @@
   arch/sh/mm/tlb-sh3.c:92:9: sparse:     expected void const volatile [nod=
eref] __iomem *ptr
   arch/sh/mm/tlb-sh3.c:92:9: sparse:     got unsigned int
--
>> arch/sh/kernel/cpu/sh3/clock-sh7712.c:23:21: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/clock-sh7712.c:23:21: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/clock-sh7712.c:23:21: sparse:     got unsigned int
   arch/sh/kernel/cpu/sh3/clock-sh7712.c:35:21: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/clock-sh7712.c:35:21: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/clock-sh7712.c:35:21: sparse:     got unsigned int
   arch/sh/kernel/cpu/sh3/clock-sh7712.c:47:21: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/clock-sh7712.c:47:21: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/clock-sh7712.c:47:21: sparse:     got unsigned int
--
   fs/exec.c:418:13: sparse: sparse: incorrect type in initializer (differe=
nt address spaces) @@     expected char const [noderef] __user *const *__gu=
_addr @@     got char const [noderef] __user *const [noderef] __user * @@
   fs/exec.c:418:13: sparse:     expected char const [noderef] __user *cons=
t *__gu_addr
   fs/exec.c:418:13: sparse:     got char const [noderef] __user *const [no=
deref] __user *
   fs/exec.c:418:13: sparse: sparse: incorrect type in argument 1 (differen=
t address spaces) @@     expected void const volatile [noderef] __user *ptr=
 @@     got char const [noderef] __user *const *__gu_addr @@
   fs/exec.c:418:13: sparse:     expected void const volatile [noderef] __u=
ser *ptr
   fs/exec.c:418:13: sparse:     got char const [noderef] __user *const *__=
gu_addr
   fs/exec.c:419:31: sparse: sparse: incorrect type in return expression (d=
ifferent address spaces) @@     expected char const [noderef] __user * @@  =
   got void * @@
   fs/exec.c:419:31: sparse:     expected char const [noderef] __user *
   fs/exec.c:419:31: sparse:     got void *
   fs/exec.c:1156:48: sparse: sparse: incorrect type in initializer (differ=
ent address spaces) @@     expected struct sighand_struct *oldsighand @@   =
  got struct sighand_struct [noderef] __rcu *sighand @@
   fs/exec.c:1156:48: sparse:     expected struct sighand_struct *oldsighand
   fs/exec.c:1156:48: sparse:     got struct sighand_struct [noderef] __rcu=
 *sighand
   fs/exec.c:1263:56: sparse: sparse: incorrect type in argument 2 (differe=
nt address spaces) @@     expected struct task_struct *parent @@     got st=
ruct task_struct [noderef] __rcu *parent @@
   fs/exec.c:1263:56: sparse:     expected struct task_struct *parent
   fs/exec.c:1263:56: sparse:     got struct task_struct [noderef] __rcu *p=
arent
   fs/exec.c:1298:47: sparse: sparse: incorrect type in initializer (differ=
ent address spaces) @@     expected struct sighand_struct *oldsighand @@   =
  got struct sighand_struct [noderef] __rcu *sighand @@
   fs/exec.c:1298:47: sparse:     expected struct sighand_struct *oldsighand
   fs/exec.c:1298:47: sparse:     got struct sighand_struct [noderef] __rcu=
 *sighand
   fs/exec.c:1851:70: sparse: sparse: incorrect type in argument 1 (differe=
nt address spaces) @@     expected struct task_struct *tsk @@     got struc=
t task_struct [noderef] __rcu *parent @@
   fs/exec.c:1851:70: sparse:     expected struct task_struct *tsk
   fs/exec.c:1851:70: sparse:     got struct task_struct [noderef] __rcu *p=
arent
   fs/exec.c: note: in included file (through arch/sh/include/asm/mmu_conte=
xt.h):
>> arch/sh/include/asm/mmu_context_32.h:53:9: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected void const volatile =
[noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/mmu_context_32.h:53:9: sparse:     expected void con=
st volatile [noderef] __iomem *ptr
   arch/sh/include/asm/mmu_context_32.h:53:9: sparse:     got unsigned int
--
   block/ioctl.c:66:13: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected int const *__gu_addr @@     got int [=
noderef] __user * @@
   block/ioctl.c:66:13: sparse:     expected int const *__gu_addr
   block/ioctl.c:66:13: sparse:     got int [noderef] __user *
>> block/ioctl.c:66:13: sparse: sparse: incorrect type in argument 1 (diffe=
rent address spaces) @@     expected void const volatile [noderef] __user *=
ptr @@     got int const *__gu_addr @@
   block/ioctl.c:66:13: sparse:     expected void const volatile [noderef] =
__user *ptr
   block/ioctl.c:66:13: sparse:     got int const *__gu_addr
   block/ioctl.c:66:39: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected void [noderef] __user *const *__gu_ad=
dr @@     got void [noderef] __user *[noderef] __user * @@
   block/ioctl.c:66:39: sparse:     expected void [noderef] __user *const *=
__gu_addr
   block/ioctl.c:66:39: sparse:     got void [noderef] __user *[noderef] __=
user *
>> block/ioctl.c:66:39: sparse: sparse: incorrect type in argument 1 (diffe=
rent address spaces) @@     expected void const volatile [noderef] __user *=
ptr @@     got void [noderef] __user *const *__gu_addr @@
   block/ioctl.c:66:39: sparse:     expected void const volatile [noderef] =
__user *ptr
   block/ioctl.c:66:39: sparse:     got void [noderef] __user *const *__gu_=
addr
   block/ioctl.c:393:13: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int const *__gu_addr @@     got int =
[noderef] __user * @@
   block/ioctl.c:393:13: sparse:     expected int const *__gu_addr
   block/ioctl.c:393:13: sparse:     got int [noderef] __user *
   block/ioctl.c:393:13: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected void const volatile [noderef] __user =
*ptr @@     got int const *__gu_addr @@
   block/ioctl.c:393:13: sparse:     expected void const volatile [noderef]=
 __user *ptr
   block/ioctl.c:393:13: sparse:     got int const *__gu_addr
   block/ioctl.c:474:13: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int const *__gu_addr @@     got int =
[noderef] __user *argp @@
   block/ioctl.c:474:13: sparse:     expected int const *__gu_addr
   block/ioctl.c:474:13: sparse:     got int [noderef] __user *argp
   block/ioctl.c:474:13: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected void const volatile [noderef] __user =
*ptr @@     got int const *__gu_addr @@
   block/ioctl.c:474:13: sparse:     expected void const volatile [noderef]=
 __user *ptr
   block/ioctl.c:474:13: sparse:     got int const *__gu_addr
--
   block/scsi_ioctl.c:65:28: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user *p @@
   block/scsi_ioctl.c:65:28: sparse:     expected int const *__gu_addr
   block/scsi_ioctl.c:65:28: sparse:     got int [noderef] __user *p
>> block/scsi_ioctl.c:65:28: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
   block/scsi_ioctl.c:65:28: sparse:     expected void const volatile [node=
ref] __user *ptr
   block/scsi_ioctl.c:65:28: sparse:     got int const *__gu_addr
   block/scsi_ioctl.c:91:25: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user *p @@
   block/scsi_ioctl.c:91:25: sparse:     expected int const *__gu_addr
   block/scsi_ioctl.c:91:25: sparse:     got int [noderef] __user *p
   block/scsi_ioctl.c:91:25: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
   block/scsi_ioctl.c:91:25: sparse:     expected void const volatile [node=
ref] __user *ptr
   block/scsi_ioctl.c:91:25: sparse:     got int const *__gu_addr
   block/scsi_ioctl.c:433:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected unsigned int const *__gu_addr @=
@     got unsigned int [noderef] __user * @@
   block/scsi_ioctl.c:433:13: sparse:     expected unsigned int const *__gu=
_addr
   block/scsi_ioctl.c:433:13: sparse:     got unsigned int [noderef] __user=
 *
>> block/scsi_ioctl.c:433:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got unsigned int const *__gu_addr @@
   block/scsi_ioctl.c:433:13: sparse:     expected void const volatile [nod=
eref] __user *ptr
   block/scsi_ioctl.c:433:13: sparse:     got unsigned int const *__gu_addr
   block/scsi_ioctl.c:435:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected unsigned int const *__gu_addr @=
@     got unsigned int [noderef] __user * @@
   block/scsi_ioctl.c:435:13: sparse:     expected unsigned int const *__gu=
_addr
   block/scsi_ioctl.c:435:13: sparse:     got unsigned int [noderef] __user=
 *
   block/scsi_ioctl.c:435:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got unsigned int const *__gu_addr @@
   block/scsi_ioctl.c:435:13: sparse:     expected void const volatile [nod=
eref] __user *ptr
   block/scsi_ioctl.c:435:13: sparse:     got unsigned int const *__gu_addr
   block/scsi_ioctl.c:439:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected unsigned char const *__gu_addr =
@@     got unsigned char [noderef] __user * @@
   block/scsi_ioctl.c:439:13: sparse:     expected unsigned char const *__g=
u_addr
   block/scsi_ioctl.c:439:13: sparse:     got unsigned char [noderef] __use=
r *
>> block/scsi_ioctl.c:439:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got unsigned char const *__gu_addr @@
   block/scsi_ioctl.c:439:13: sparse:     expected void const volatile [nod=
eref] __user *ptr
   block/scsi_ioctl.c:439:13: sparse:     got unsigned char const *__gu_addr
--
   drivers/gpu/drm/drm_crtc.c:708:29: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected unsigned int const *__g=
u_addr @@     got unsigned int [noderef] [usertype] __user * @@
   drivers/gpu/drm/drm_crtc.c:708:29: sparse:     expected unsigned int con=
st *__gu_addr
   drivers/gpu/drm/drm_crtc.c:708:29: sparse:     got unsigned int [noderef=
] [usertype] __user *
>> drivers/gpu/drm/drm_crtc.c:708:29: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/gpu/drm/drm_crtc.c:708:29: sparse:     expected void const volat=
ile [noderef] __user *ptr
   drivers/gpu/drm/drm_crtc.c:708:29: sparse:     got unsigned int const *_=
_gu_addr
--
   drivers/scsi/scsi_error.c:2341:17: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int const *__gu_addr @@=
     got int [noderef] __user *arg @@
   drivers/scsi/scsi_error.c:2341:17: sparse:     expected int const *__gu_=
addr
   drivers/scsi/scsi_error.c:2341:17: sparse:     got int [noderef] __user =
*arg
>> drivers/scsi/scsi_error.c:2341:17: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __user *ptr @@     got int const *__gu_addr @@
   drivers/scsi/scsi_error.c:2341:17: sparse:     expected void const volat=
ile [noderef] __user *ptr
   drivers/scsi/scsi_error.c:2341:17: sparse:     got int const *__gu_addr
--
   drivers/scsi/scsi_ioctl.c:48:21: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const *__gu_=
addr @@     got unsigned int [noderef] __user * @@
   drivers/scsi/scsi_ioctl.c:48:21: sparse:     expected unsigned int const=
 *__gu_addr
   drivers/scsi/scsi_ioctl.c:48:21: sparse:     got unsigned int [noderef] =
__user *
>> drivers/scsi/scsi_ioctl.c:48:21: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/scsi/scsi_ioctl.c:48:21: sparse:     expected void const volatil=
e [noderef] __user *ptr
   drivers/scsi/scsi_ioctl.c:48:21: sparse:     got unsigned int const *__g=
u_addr
--
   drivers/video/fbdev/s3c-fb.c:1024:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected unsigned int const *=
__gu_addr @@     got unsigned int [noderef] [usertype] __user * @@
   drivers/video/fbdev/s3c-fb.c:1024:21: sparse:     expected unsigned int =
const *__gu_addr
   drivers/video/fbdev/s3c-fb.c:1024:21: sparse:     got unsigned int [node=
ref] [usertype] __user *
>> drivers/video/fbdev/s3c-fb.c:1024:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/video/fbdev/s3c-fb.c:1024:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/video/fbdev/s3c-fb.c:1024:21: sparse:     got unsigned int const=
 *__gu_addr
--
   samples/vfio-mdev/mbochs.c:1270:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@     expected unsigned int const *__=
gu_addr @@     got unsigned int [noderef] [usertype] __user * @@
   samples/vfio-mdev/mbochs.c:1270:21: sparse:     expected unsigned int co=
nst *__gu_addr
   samples/vfio-mdev/mbochs.c:1270:21: sparse:     got unsigned int [nodere=
f] [usertype] __user *
>> samples/vfio-mdev/mbochs.c:1270:21: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void const volatile [no=
deref] __user *ptr @@     got unsigned int const *__gu_addr @@
   samples/vfio-mdev/mbochs.c:1270:21: sparse:     expected void const vola=
tile [noderef] __user *ptr
   samples/vfio-mdev/mbochs.c:1270:21: sparse:     got unsigned int const *=
__gu_addr
   samples/vfio-mdev/mbochs.c:1346:1: sparse: sparse: symbol 'mdev_type_att=
r_name' was not declared. Should it be static?
   samples/vfio-mdev/mbochs.c:1356:1: sparse: sparse: symbol 'mdev_type_att=
r_description' was not declared. Should it be static?
   samples/vfio-mdev/mbochs.c:1366:1: sparse: sparse: symbol 'mdev_type_att=
r_available_instances' was not declared. Should it be static?
   samples/vfio-mdev/mbochs.c:1373:1: sparse: sparse: symbol 'mdev_type_att=
r_device_api' was not declared. Should it be static?
--
   fs/reiserfs/ioctl.c:66:29: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user * @@
   fs/reiserfs/ioctl.c:66:29: sparse:     expected int const *__gu_addr
   fs/reiserfs/ioctl.c:66:29: sparse:     got int [noderef] __user *
>> fs/reiserfs/ioctl.c:66:29: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   fs/reiserfs/ioctl.c:66:29: sparse:     expected void const volatile [nod=
eref] __user *ptr
   fs/reiserfs/ioctl.c:66:29: sparse:     got int const *__gu_addr
   fs/reiserfs/ioctl.c:111:21: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected int const *__gu_addr @@     go=
t int [noderef] __user * @@
   fs/reiserfs/ioctl.c:111:21: sparse:     expected int const *__gu_addr
   fs/reiserfs/ioctl.c:111:21: sparse:     got int [noderef] __user *
   fs/reiserfs/ioctl.c:111:21: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] _=
_user *ptr @@     got int const *__gu_addr @@
   fs/reiserfs/ioctl.c:111:21: sparse:     expected void const volatile [no=
deref] __user *ptr
   fs/reiserfs/ioctl.c:111:21: sparse:     got int const *__gu_addr
--
   fs/ext4/ioctl.c:609:13: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected unsigned int const *__gu_addr @@  =
   got unsigned int [noderef] [usertype] __user * @@
   fs/ext4/ioctl.c:609:13: sparse:     expected unsigned int const *__gu_ad=
dr
   fs/ext4/ioctl.c:609:13: sparse:     got unsigned int [noderef] [usertype=
] __user *
>> fs/ext4/ioctl.c:609:13: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got unsigned int const *__gu_addr @@
   fs/ext4/ioctl.c:609:13: sparse:     expected void const volatile [nodere=
f] __user *ptr
   fs/ext4/ioctl.c:609:13: sparse:     got unsigned int const *__gu_addr
   fs/ext4/ioctl.c:833:21: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected int const *__gu_addr @@     got in=
t [noderef] __user * @@
   fs/ext4/ioctl.c:833:21: sparse:     expected int const *__gu_addr
   fs/ext4/ioctl.c:833:21: sparse:     got int [noderef] __user *
>> fs/ext4/ioctl.c:833:21: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got int const *__gu_addr @@
   fs/ext4/ioctl.c:833:21: sparse:     expected void const volatile [nodere=
f] __user *ptr
   fs/ext4/ioctl.c:833:21: sparse:     got int const *__gu_addr
   fs/ext4/ioctl.c:884:21: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected int const *__gu_addr @@     got in=
t [noderef] __user * @@
   fs/ext4/ioctl.c:884:21: sparse:     expected int const *__gu_addr
   fs/ext4/ioctl.c:884:21: sparse:     got int [noderef] __user *
   fs/ext4/ioctl.c:884:21: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got int const *__gu_addr @@
   fs/ext4/ioctl.c:884:21: sparse:     expected void const volatile [nodere=
f] __user *ptr
   fs/ext4/ioctl.c:884:21: sparse:     got int const *__gu_addr
   fs/ext4/ioctl.c:917:21: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected unsigned int const *__gu_addr @@  =
   got unsigned int [noderef] [usertype] __user * @@
   fs/ext4/ioctl.c:917:21: sparse:     expected unsigned int const *__gu_ad=
dr
   fs/ext4/ioctl.c:917:21: sparse:     got unsigned int [noderef] [usertype=
] __user *
   fs/ext4/ioctl.c:917:21: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got unsigned int const *__gu_addr @@
   fs/ext4/ioctl.c:917:21: sparse:     expected void const volatile [nodere=
f] __user *ptr
   fs/ext4/ioctl.c:917:21: sparse:     got unsigned int const *__gu_addr
--
   fs/ext2/ioctl.c:47:21: sparse: sparse: incorrect type in initializer (di=
fferent address spaces) @@     expected int const *__gu_addr @@     got int=
 [noderef] __user * @@
   fs/ext2/ioctl.c:47:21: sparse:     expected int const *__gu_addr
   fs/ext2/ioctl.c:47:21: sparse:     got int [noderef] __user *
>> fs/ext2/ioctl.c:47:21: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected void const volatile [noderef] __user=
 *ptr @@     got int const *__gu_addr @@
   fs/ext2/ioctl.c:47:21: sparse:     expected void const volatile [noderef=
] __user *ptr
   fs/ext2/ioctl.c:47:21: sparse:     got int const *__gu_addr
   fs/ext2/ioctl.c:92:21: sparse: sparse: incorrect type in initializer (di=
fferent address spaces) @@     expected int const *__gu_addr @@     got int=
 [noderef] __user * @@
   fs/ext2/ioctl.c:92:21: sparse:     expected int const *__gu_addr
   fs/ext2/ioctl.c:92:21: sparse:     got int [noderef] __user *
   fs/ext2/ioctl.c:92:21: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected void const volatile [noderef] __user=
 *ptr @@     got int const *__gu_addr @@
   fs/ext2/ioctl.c:92:21: sparse:     expected void const volatile [noderef=
] __user *ptr
   fs/ext2/ioctl.c:92:21: sparse:     got int const *__gu_addr
   fs/ext2/ioctl.c:123:21: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected int const *__gu_addr @@     got in=
t [noderef] __user * @@
   fs/ext2/ioctl.c:123:21: sparse:     expected int const *__gu_addr
   fs/ext2/ioctl.c:123:21: sparse:     got int [noderef] __user *
   fs/ext2/ioctl.c:123:21: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got int const *__gu_addr @@
   fs/ext2/ioctl.c:123:21: sparse:     expected void const volatile [nodere=
f] __user *ptr
   fs/ext2/ioctl.c:123:21: sparse:     got int const *__gu_addr

vim +44 fs/fat/file.c

21bea495943f9532 Christoph Hellwig 2009-06-08   34  =

21bea495943f9532 Christoph Hellwig 2009-06-08   35  static int fat_ioctl_se=
t_attributes(struct file *file, u32 __user *user_attr)
^1da177e4c3f4152 Linus Torvalds    2005-04-16   36  {
496ad9aa8ef44805 Al Viro           2013-01-23   37  	struct inode *inode =
=3D file_inode(file);
21bea495943f9532 Christoph Hellwig 2009-06-08   38  	struct msdos_sb_info *=
sbi =3D MSDOS_SB(inode->i_sb);
21bea495943f9532 Christoph Hellwig 2009-06-08   39  	int is_dir =3D S_ISDIR=
(inode->i_mode);
^1da177e4c3f4152 Linus Torvalds    2005-04-16   40  	u32 attr, oldattr;
^1da177e4c3f4152 Linus Torvalds    2005-04-16   41  	struct iattr ia;
21bea495943f9532 Christoph Hellwig 2009-06-08   42  	int err;
^1da177e4c3f4152 Linus Torvalds    2005-04-16   43  =

^1da177e4c3f4152 Linus Torvalds    2005-04-16  @44  	err =3D get_user(attr,=
 user_attr);
^1da177e4c3f4152 Linus Torvalds    2005-04-16   45  	if (err)
21bea495943f9532 Christoph Hellwig 2009-06-08   46  		goto out;
^1da177e4c3f4152 Linus Torvalds    2005-04-16   47  =

a561be7100cd610b Al Viro           2011-11-23   48  	err =3D mnt_want_write=
_file(file);
42a74f206b914db1 Dave Hansen       2008-02-15   49  	if (err)
e24f17da3560781e Jan Kara          2012-06-12   50  		goto out;
5955102c9984fa08 Al Viro           2016-01-22   51  	inode_lock(inode);
^1da177e4c3f4152 Linus Torvalds    2005-04-16   52  =

^1da177e4c3f4152 Linus Torvalds    2005-04-16   53  	/*
^1da177e4c3f4152 Linus Torvalds    2005-04-16   54  	 * ATTR_VOLUME and ATT=
R_DIR cannot be changed; this also
^1da177e4c3f4152 Linus Torvalds    2005-04-16   55  	 * prevents the user f=
rom turning us into a VFAT
^1da177e4c3f4152 Linus Torvalds    2005-04-16   56  	 * longname entry.  Al=
so, we obviously can't set
^1da177e4c3f4152 Linus Torvalds    2005-04-16   57  	 * any of the NTFS att=
ributes in the high 24 bits.
^1da177e4c3f4152 Linus Torvalds    2005-04-16   58  	 */
^1da177e4c3f4152 Linus Torvalds    2005-04-16   59  	attr &=3D 0xff & ~(ATT=
R_VOLUME | ATTR_DIR);
^1da177e4c3f4152 Linus Torvalds    2005-04-16   60  	/* Merge in ATTR_VOLUM=
E and ATTR_DIR */
^1da177e4c3f4152 Linus Torvalds    2005-04-16   61  	attr |=3D (MSDOS_I(ino=
de)->i_attrs & ATTR_VOLUME) |
^1da177e4c3f4152 Linus Torvalds    2005-04-16   62  		(is_dir ? ATTR_DIR : =
0);
9c0aa1b87bf541af OGAWA Hirofumi    2008-11-06   63  	oldattr =3D fat_make_a=
ttrs(inode);
^1da177e4c3f4152 Linus Torvalds    2005-04-16   64  =

^1da177e4c3f4152 Linus Torvalds    2005-04-16   65  	/* Equivalent to a chm=
od() */
^1da177e4c3f4152 Linus Torvalds    2005-04-16   66  	ia.ia_valid =3D ATTR_M=
ODE | ATTR_CTIME;
c2050a454c7f123d Deepa Dinamani    2016-09-14   67  	ia.ia_ctime =3D curren=
t_time(inode);
9c0aa1b87bf541af OGAWA Hirofumi    2008-11-06   68  	if (is_dir)
9c0aa1b87bf541af OGAWA Hirofumi    2008-11-06   69  		ia.ia_mode =3D fat_ma=
ke_mode(sbi, attr, S_IRWXUGO);
9c0aa1b87bf541af OGAWA Hirofumi    2008-11-06   70  	else {
9c0aa1b87bf541af OGAWA Hirofumi    2008-11-06   71  		ia.ia_mode =3D fat_ma=
ke_mode(sbi, attr,
9c0aa1b87bf541af OGAWA Hirofumi    2008-11-06   72  			S_IRUGO | S_IWUGO | =
(inode->i_mode & S_IXUGO));
^1da177e4c3f4152 Linus Torvalds    2005-04-16   73  	}
^1da177e4c3f4152 Linus Torvalds    2005-04-16   74  =

^1da177e4c3f4152 Linus Torvalds    2005-04-16   75  	/* The root directory =
has no attributes */
^1da177e4c3f4152 Linus Torvalds    2005-04-16   76  	if (inode->i_ino =3D=
=3D MSDOS_ROOT_INO && attr !=3D ATTR_DIR) {
^1da177e4c3f4152 Linus Torvalds    2005-04-16   77  		err =3D -EINVAL;
e24f17da3560781e Jan Kara          2012-06-12   78  		goto out_unlock_inode;
^1da177e4c3f4152 Linus Torvalds    2005-04-16   79  	}
^1da177e4c3f4152 Linus Torvalds    2005-04-16   80  =

21bea495943f9532 Christoph Hellwig 2009-06-08   81  	if (sbi->options.sys_i=
mmutable &&
21bea495943f9532 Christoph Hellwig 2009-06-08   82  	    ((attr | oldattr) =
& ATTR_SYS) &&
21bea495943f9532 Christoph Hellwig 2009-06-08   83  	    !capable(CAP_LINUX=
_IMMUTABLE)) {
^1da177e4c3f4152 Linus Torvalds    2005-04-16   84  		err =3D -EPERM;
e24f17da3560781e Jan Kara          2012-06-12   85  		goto out_unlock_inode;
^1da177e4c3f4152 Linus Torvalds    2005-04-16   86  	}
^1da177e4c3f4152 Linus Torvalds    2005-04-16   87  =

b1da47e29e467f1e Miklos Szeredi    2008-07-01   88  	/*
b1da47e29e467f1e Miklos Szeredi    2008-07-01   89  	 * The security check =
is questionable...  We single
b1da47e29e467f1e Miklos Szeredi    2008-07-01   90  	 * out the RO attribut=
e for checking by the security
b1da47e29e467f1e Miklos Szeredi    2008-07-01   91  	 * module, just becaus=
e it maps to a file mode.
b1da47e29e467f1e Miklos Szeredi    2008-07-01   92  	 */
21bea495943f9532 Christoph Hellwig 2009-06-08   93  	err =3D security_inode=
_setattr(file->f_path.dentry, &ia);
b1da47e29e467f1e Miklos Szeredi    2008-07-01   94  	if (err)
e24f17da3560781e Jan Kara          2012-06-12   95  		goto out_unlock_inode;
b1da47e29e467f1e Miklos Szeredi    2008-07-01   96  =

^1da177e4c3f4152 Linus Torvalds    2005-04-16   97  	/* This MUST be done b=
efore doing anything irreversible... */
21bea495943f9532 Christoph Hellwig 2009-06-08   98  	err =3D fat_setattr(fi=
le->f_path.dentry, &ia);
^1da177e4c3f4152 Linus Torvalds    2005-04-16   99  	if (err)
e24f17da3560781e Jan Kara          2012-06-12  100  		goto out_unlock_inode;
^1da177e4c3f4152 Linus Torvalds    2005-04-16  101  =

21bea495943f9532 Christoph Hellwig 2009-06-08  102  	fsnotify_change(file->=
f_path.dentry, ia.ia_valid);
^1da177e4c3f4152 Linus Torvalds    2005-04-16  103  	if (sbi->options.sys_i=
mmutable) {
^1da177e4c3f4152 Linus Torvalds    2005-04-16  104  		if (attr & ATTR_SYS)
^1da177e4c3f4152 Linus Torvalds    2005-04-16  105  			inode->i_flags |=3D =
S_IMMUTABLE;
^1da177e4c3f4152 Linus Torvalds    2005-04-16  106  		else
1adffbae22332bb5 OGAWA Hirofumi    2011-05-31  107  			inode->i_flags &=3D =
~S_IMMUTABLE;
^1da177e4c3f4152 Linus Torvalds    2005-04-16  108  	}
^1da177e4c3f4152 Linus Torvalds    2005-04-16  109  =

9c0aa1b87bf541af OGAWA Hirofumi    2008-11-06  110  	fat_save_attrs(inode, =
attr);
^1da177e4c3f4152 Linus Torvalds    2005-04-16  111  	mark_inode_dirty(inode=
);
21bea495943f9532 Christoph Hellwig 2009-06-08  112  out_unlock_inode:
5955102c9984fa08 Al Viro           2016-01-22  113  	inode_unlock(inode);
e24f17da3560781e Jan Kara          2012-06-12  114  	mnt_drop_write_file(fi=
le);
21bea495943f9532 Christoph Hellwig 2009-06-08  115  out:
^1da177e4c3f4152 Linus Torvalds    2005-04-16  116  	return err;
^1da177e4c3f4152 Linus Torvalds    2005-04-16  117  }
21bea495943f9532 Christoph Hellwig 2009-06-08  118  =


:::::: The code at line 44 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4539904534405006228==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
kh9AHS6xyigP67RNQvF/jsUNgr5iAQA=
--===============4539904534405006228==--

