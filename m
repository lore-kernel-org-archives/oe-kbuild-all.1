Content-Type: multipart/mixed; boundary="===============2395277364911355323=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/scsi/myrs.c:2449:13: sparse: sparse: incorrect type in assignment (different base types)
Date: Fri, 15 Jan 2021 16:50:06 +0800
Message-ID: <202101151657.pWIXmPAS-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2395277364911355323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kefeng,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5ee88057889bbca5f5bb96031b62b3756b33e164
commit: ed1ed4c0da5447c5e322481ce2ef9f03336c6ffb riscv: mmiowb: Fix implici=
t declaration of function 'smp_processor_id'
date:   8 months ago
config: riscv-randconfig-s032-20210115 (attached as .config)
compiler: riscv32-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ded1ed4c0da5447c5e322481ce2ef9f03336c6ffb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ed1ed4c0da5447c5e322481ce2ef9f03336c6ffb
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/scsi/myrs.c:1532:5: sparse: sparse: symbol 'myrs_host_reset' was=
 not declared. Should it be static?
   drivers/scsi/myrs.c:1922:27: sparse: sparse: symbol 'myrs_template' was =
not declared. Should it be static?
   drivers/scsi/myrs.c:2036:31: sparse: sparse: symbol 'myrs_raid_functions=
' was not declared. Should it be static?
   drivers/scsi/myrs.c:2046:6: sparse: sparse: symbol 'myrs_flush_cache' wa=
s not declared. Should it be static?
   drivers/scsi/myrs.c:2275:34: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void [noderef] <asn:2> *base @=
@     got struct myrs_hba *cs @@
   drivers/scsi/myrs.c:2275:34: sparse:     expected void [noderef] <asn:2>=
 *base
   drivers/scsi/myrs.c:2275:34: sparse:     got struct myrs_hba *cs
   drivers/scsi/myrs.c:2434:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/myrs.c:2502:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/myrs.c:2427:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/myrs.c:2502:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/myrs.c:2413:9: sparse: sparse: cast from restricted __le32
>> drivers/scsi/myrs.c:2449:13: sparse: sparse: incorrect type in assignmen=
t (different base types) @@     expected restricted __le32 [usertype] val @=
@     got unsigned int [assigned] [usertype] __v @@
   drivers/scsi/myrs.c:2449:13: sparse:     expected restricted __le32 [use=
rtype] val
   drivers/scsi/myrs.c:2449:13: sparse:     got unsigned int [assigned] [us=
ertype] __v
   drivers/scsi/myrs.c:2549:13: sparse: sparse: incorrect type in assignmen=
t (different base types) @@     expected restricted __le32 [usertype] val @=
@     got unsigned int [assigned] [usertype] __v @@
   drivers/scsi/myrs.c:2549:13: sparse:     expected restricted __le32 [use=
rtype] val
   drivers/scsi/myrs.c:2549:13: sparse:     got unsigned int [assigned] [us=
ertype] __v
   drivers/scsi/myrs.c:2552:18: sparse: sparse: restricted __le32 degrades =
to integer
   drivers/scsi/myrs.c:2427:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/myrs.c:2495:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/myrs.c:2472:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/myrs.c:2441:13: sparse: sparse: incorrect type in assignmen=
t (different base types) @@     expected restricted __le32 [usertype] val @=
@     got unsigned int [assigned] [usertype] __v @@
   drivers/scsi/myrs.c:2441:13: sparse:     expected restricted __le32 [use=
rtype] val
   drivers/scsi/myrs.c:2441:13: sparse:     got unsigned int [assigned] [us=
ertype] __v
   drivers/scsi/myrs.c:2406:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/myrs.c:2479:13: sparse: sparse: incorrect type in assignmen=
t (different base types) @@     expected restricted __le32 [usertype] val @=
@     got unsigned int [assigned] [usertype] __v @@
   drivers/scsi/myrs.c:2479:13: sparse:     expected restricted __le32 [use=
rtype] val
   drivers/scsi/myrs.c:2479:13: sparse:     got unsigned int [assigned] [us=
ertype] __v
   drivers/scsi/myrs.c:2457:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/myrs.c:2413:9: sparse: sparse: cast from restricted __le32
--
   drivers/isdn/hardware/mISDN/avmfritz.c:175:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:175:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:175:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:175:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:176:16: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:176:16: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:176:16: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:176:16: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:185:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:185:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:185:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:185:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:186:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:186:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:186:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:186:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:194:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:194:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:194:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:194:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:203:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:203:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:203:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:203:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:212:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:212:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:212:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:212:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:213:23: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:213:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:213:23: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:213:23: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:221:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:221:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:221:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:221:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:222:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:222:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:222:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:222:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:231:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:231:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:231:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:231:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:233:34: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:233:34: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:233:34: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:233:34: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:242:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:242:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:242:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:242:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:244:17: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:244:17: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:244:17: sparse:     expected void=
 volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:244:17: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:325:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:325:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:325:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:325:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:332:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:332:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:332:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:332:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:417:17: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:417:17: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:417:17: sparse:     expected void=
 volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:417:17: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:421:23: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:421:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:421:23: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:421:23: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:421:23: sparse: sparse: cast to r=
estricted __le32
   drivers/isdn/hardware/mISDN/avmfritz.c:488:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:488:25: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:488:25: sparse:     expected void=
 volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:488:25: sparse:     got void *
>> drivers/isdn/hardware/mISDN/avmfritz.c:494:25: sparse: sparse: cast from=
 restricted __le32
   drivers/isdn/hardware/mISDN/avmfritz.c:494:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:494:25: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:494:25: sparse:     expected void=
 volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:494:25: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:627:16: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:627:16: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:627:16: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:627:16: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:654:16: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:654:16: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:654:16: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:654:16: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:671:17: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:671:17: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:671:17: sparse:     expected void=
 volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:671:17: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:673:17: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:673:17: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:673:17: sparse:     expected void=
 volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:673:17: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:761:17: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:761:17: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:761:17: sparse:     expected void=
 volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:761:17: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:770:17: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:770:17: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:770:17: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:770:17: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:770:17: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:770:17: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:770:17: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:770:17: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:964:23: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:964:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:964:23: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:964:23: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:965:17: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:965:17: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:965:17: sparse:     expected void=
 volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:965:17: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:966:23: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:966:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:966:23: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:966:23: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:977:23: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:977:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:977:23: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:977:23: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:978:23: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:978:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:978:23: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:978:23: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:270:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:270:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:270:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:270:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:264:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:264:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:264:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:264:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:265:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:265:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:265:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:265:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:303:16: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:303:16: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:303:16: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:303:16: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:296:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:296:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:296:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:296:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:297:16: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:297:16: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:297:16: sparse:     expected void=
 const volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:297:16: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:270:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:270:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:270:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:270:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:264:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:264:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:264:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:264:9: sparse:     got void *
   drivers/isdn/hardware/mISDN/avmfritz.c:265:9: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/isdn/hardware/mISDN/avmfritz.c:265:9: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] <asn:2> *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/avmfritz.c:265:9: sparse:     expected void =
volatile [noderef] <asn:2> *addr
   drivers/isdn/hardware/mISDN/avmfritz.c:265:9: sparse:     got void *
--
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:87:41: sparse:     got unsigned int [us=
ertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:88:41: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected restricted __le32 [addr=
essable] [assigned] [usertype] dummy_buffer_addr_hi @@     got unsigned int=
 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:88:41: sparse:     expected restricted =
__le32 [addressable] [assigned] [usertype] dummy_buffer_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:88:41: sparse:     got unsigned int [us=
ertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:89:42: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected restricted __le32 [addr=
essable] [assigned] [usertype] task_list_pbl_addr_lo @@     got unsigned in=
t [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:89:42: sparse:     expected restricted =
__le32 [addressable] [assigned] [usertype] task_list_pbl_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:89:42: sparse:     got unsigned int [us=
ertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:90:42: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected restricted __le32 [addr=
essable] [assigned] [usertype] task_list_pbl_addr_hi @@     got unsigned in=
t [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:90:42: sparse:     expected restricted =
__le32 [addressable] [assigned] [usertype] task_list_pbl_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:90:42: sparse:     got unsigned int [us=
ertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:92:24: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected restricted __le16 [addr=
essable] [assigned] [usertype] mtu @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:92:24: sparse:     expected restricted =
__le16 [addressable] [assigned] [usertype] mtu
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:92:24: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:109:41: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] hash_tbl_pbl_addr_lo @@     got unsigned in=
t [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:109:41: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] hash_tbl_pbl_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:109:41: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:110:41: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] hash_tbl_pbl_addr_hi @@     got unsigned in=
t [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:110:41: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] hash_tbl_pbl_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:110:41: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:113:40: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] t2_hash_tbl_addr_lo @@     got unsigned int=
 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:113:40: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] t2_hash_tbl_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:113:40: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:114:40: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] t2_hash_tbl_addr_hi @@     got unsigned int=
 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:114:40: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] t2_hash_tbl_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:114:40: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:117:44: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] t2_ptr_hash_tbl_addr_lo @@     got unsigned=
 int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:117:44: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] t2_ptr_hash_tbl_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:117:44: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:118:44: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] t2_ptr_hash_tbl_addr_hi @@     got unsigned=
 int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:118:44: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] t2_ptr_hash_tbl_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:118:44: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:121:36: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] free_list_count @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:121:36: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] free_list_count
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:121:36: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:128:37: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] error_bit_map_lo @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:128:37: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] error_bit_map_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:128:37: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:129:37: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] error_bit_map_hi @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:129:37: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] error_bit_map_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:129:37: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:199:32: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] fcoe_conn_id @@     got unsigned short [ass=
igned] [usertype] conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:199:32: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:199:32: sparse:     got unsigned short =
[assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:202:30: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] sq_addr_lo @@     got unsigned int [usertyp=
e] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:202:30: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] sq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:202:30: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:203:30: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] sq_addr_hi @@     got unsigned int [usertyp=
e] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:203:30: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] sq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:203:30: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:205:34: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] rq_pbl_addr_lo @@     got unsigned int [use=
rtype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:205:34: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] rq_pbl_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:205:34: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:206:34: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] rq_pbl_addr_hi @@     got unsigned int [use=
rtype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:206:34: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] rq_pbl_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:206:34: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:208:40: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] rq_first_pbe_addr_lo @@     got unsigned in=
t [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:208:40: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] rq_first_pbe_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:208:40: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:209:40: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] rq_first_pbe_addr_hi @@     got unsigned in=
t [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:209:40: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] rq_first_pbe_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:209:40: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:212:27: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] rq_prod @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:212:27: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] rq_prod
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:212:27: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:221:37: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] tx_max_fc_pay_len @@     got unsigned short=
 [usertype] maxframe_size @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:221:37: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] tx_max_fc_pay_len
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:221:37: sparse:     got unsigned short =
[usertype] maxframe_size
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:223:30: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] cq_addr_lo @@     got unsigned int [usertyp=
e] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:223:30: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] cq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:223:30: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:224:30: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] cq_addr_hi @@     got unsigned int [usertyp=
e] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:224:30: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] cq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:224:30: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:226:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] xferq_addr_lo @@     got unsigned int [user=
type] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:226:33: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] xferq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:226:33: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:227:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] xferq_addr_hi @@     got unsigned int [user=
type] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:227:33: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] xferq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:227:33: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:229:35: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] conn_db_addr_lo @@     got unsigned int [us=
ertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:229:35: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] conn_db_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:229:35: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:230:35: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] conn_db_addr_hi @@     got unsigned int [us=
ertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:230:35: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] conn_db_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:230:35: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:239:28: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] vlan_tag @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:239:28: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] vlan_tag
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:239:28: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:241:28: sparse: sparse: invalid assignm=
ent: |=3D
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:241:28: sparse:    left side has type r=
estricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:241:28: sparse:    right side has type =
int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:264:38: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] tx_total_conc_seqs @@     got unsigned shor=
t [usertype] max_seq @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:264:38: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] tx_total_conc_seqs
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:264:38: sparse:     got unsigned short =
[usertype] max_seq
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:267:38: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] rx_max_fc_pay_len @@     got unsigned int [=
usertype] mfs @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:267:38: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] rx_max_fc_pay_len
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:267:38: sparse:     got unsigned int [u=
sertype] mfs
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:269:38: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [add=
ressable] [assigned] [usertype] rx_total_conc_seqs @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:269:38: sparse:     expected restricted=
 __le16 [addressable] [assigned] [usertype] rx_total_conc_seqs
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:269:38: sparse:     got int
>> drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] confq_first_pbe_addr_lo @@     got unsigned=
 int [usertype] confq_dma @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] confq_first_pbe_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse:     got unsigned int [u=
sertype] confq_dma
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:274:43: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] confq_first_pbe_addr_hi @@     got unsigned=
 int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:274:43: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] confq_first_pbe_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:274:43: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:332:31: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] lcq_addr_lo @@     got unsigned int [userty=
pe] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:332:31: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] lcq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:332:31: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:333:31: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] lcq_addr_hi @@     got unsigned int [userty=
pe] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:333:31: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] lcq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:333:31: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:335:42: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] confq_pbl_base_addr_lo @@     got unsigned =
int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:335:42: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] confq_pbl_base_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:335:42: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:336:42: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] confq_pbl_base_addr_hi @@     got unsigned =
int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:336:42: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] confq_pbl_base_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:336:42: sparse:     got unsigned int [u=
sertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:410:29: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] context_id @@     got unsigned int [usertyp=
e] context_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:410:29: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:410:29: sparse:     got unsigned int [u=
sertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:411:26: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] conn_id @@     got unsigned int [usertype] =
fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:411:26: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:411:26: sparse:     got unsigned int [u=
sertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:469:32: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] context_id @@     got unsigned int [usertyp=
e] context_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:469:32: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:469:32: sparse:     got unsigned int [u=
sertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:470:29: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] conn_id @@     got unsigned int [usertype] =
fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:470:29: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:470:29: sparse:     got unsigned int [u=
sertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:504:32: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] context_id @@     got unsigned int [usertyp=
e] context_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:504:32: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:504:32: sparse:     got unsigned int [u=
sertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 [add=
ressable] [assigned] [usertype] conn_id @@     got unsigned int [usertype] =
fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse:     expected restricted=
 __le32 [addressable] [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse:     got unsigned int [u=
sertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned int [usertype=
] fr_crc @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse:     expected unsigned i=
nt [usertype] fr_crc
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse:     got restricted __le=
32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:696:21: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned short [userty=
pe] xid @@     got restricted __le16 [usertype] ox_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:696:21: sparse:     expected unsigned s=
hort [usertype] xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:696:21: sparse:     got restricted __le=
16 [usertype] ox_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:731:27: sparse: sparse: cast from restr=
icted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:732:26: sparse: sparse: cast from restr=
icted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:812:23: sparse: sparse: cast from restr=
icted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:812:23: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned short [userty=
pe] val @@     got restricted __le16 [usertype] ox_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:812:23: sparse:     expected unsigned s=
hort [usertype] val
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:812:23: sparse:     got restricted __le=
16 [usertype] ox_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:812:23: sparse: sparse: cast from restr=
icted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:812:23: sparse: sparse: cast from restr=
icted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:812:21: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected unsigned short [userty=
pe] xid @@     got restricted __be16 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:812:21: sparse:     expected unsigned s=
hort [usertype] xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:812:21: sparse:     got restricted __be=
16 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:826:27: sparse: sparse: cast from restr=
icted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:827:26: sparse: sparse: cast from restr=
icted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:893:45: sparse: sparse: restricted __le=
16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:970:33: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le16 [use=
rtype] doorbell_cq_cons @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:970:33: sparse:     expected restricted=
 __le16 [usertype] doorbell_cq_cons
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:970:33: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:973:9: sparse: sparse: cast from restri=
cted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1027:43: sparse: sparse: restricted __l=
e16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1097:22: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected unsigned short [usert=
ype] wqe @@     got restricted __le16 [usertype] wqe @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1097:22: sparse:     expected unsigned =
short [usertype] wqe
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1097:22: sparse:     got restricted __l=
e16 [usertype] wqe
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1261:17: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected unsigned int [usertyp=
e] conn_id @@     got restricted __le32 [usertype] fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1261:17: sparse:     expected unsigned =
int [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1261:17: sparse:     got restricted __l=
e32 [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1377:53: sparse: sparse: incorrect type=
 in argument 2 (different base types) @@     expected unsigned int [usertyp=
e] err_code @@     got restricted __le32 [usertype] completion_status @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1377:53: sparse:     expected unsigned =
int [usertype] err_code
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1377:53: sparse:     got restricted __l=
e32 [usertype] completion_status
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1429:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le16 [us=
ertype] wqe @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1429:18: sparse:     expected restricte=
d __le16 [usertype] wqe
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1429:18: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1430:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1430:18: sparse:    left side has type =
restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1430:18: sparse:    right side has type=
 int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1448:9: sparse: sparse: cast from restr=
icted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1532:46: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1532:46: sparse:     expected restricte=
d __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1532:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1534:46: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1534:46: sparse:     expected restricte=
d __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1534:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1537:63: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le16 [us=
ertype] cleaned_task_id @@     got unsigned short [usertype] orig_xid @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1537:63: sparse:     expected restricte=
d __le16 [usertype] cleaned_task_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1537:63: sparse:     got unsigned short=
 [usertype] orig_xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1540:69: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] rolled_tx_data_offset @@     got unsigned int [usertype] offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1540:69: sparse:     expected restricte=
d __le32 [usertype] rolled_tx_data_offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1540:69: sparse:     got unsigned int [=
usertype] offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1546:35: sparse: sparse: restricted __l=
e16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1548:24: sparse: sparse: invalid assign=
ment: -=3D
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1548:24: sparse:    left side has type =
unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1548:24: sparse:    right side has type=
 restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1553:69: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1553:69: sparse:     expected restricte=
d __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1553:69: sparse:     got unsigned int [=
usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1555:69: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le32 [us=
ertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1555:69: sparse:     expected restricte=
d __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1555:69: sparse:     got unsigned int [=
usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1559:65: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __le16 [us=
ertype] cur_sge_off @@     got unsigned int [usertype] offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1559:65: sparse:     expected restricte=
d __le16 [usertype] cur_sge_off

vim +2449 drivers/scsi/myrs.c

77266186397c6c78 Hannes Reinecke 2018-10-17  2444  =

77266186397c6c78 Hannes Reinecke 2018-10-17  2445  static inline bool DAC96=
0_GEM_init_in_progress(void __iomem *base)
77266186397c6c78 Hannes Reinecke 2018-10-17  2446  {
77266186397c6c78 Hannes Reinecke 2018-10-17  2447  	__le32 val;
77266186397c6c78 Hannes Reinecke 2018-10-17  2448  =

77266186397c6c78 Hannes Reinecke 2018-10-17 @2449  	val =3D readl(base + DA=
C960_GEM_IDB_READ_OFFSET);
77266186397c6c78 Hannes Reinecke 2018-10-17  2450  	return (le32_to_cpu(val=
) >> 24) & DAC960_GEM_IDB_INIT_IN_PROGRESS;
77266186397c6c78 Hannes Reinecke 2018-10-17  2451  }
77266186397c6c78 Hannes Reinecke 2018-10-17  2452  =


:::::: The code at line 2449 was first introduced by commit
:::::: 77266186397c6c782a3f670d32808a9671806ec5 scsi: myrs: Add Mylex RAID =
controller (SCSI interface)

:::::: TO: Hannes Reinecke <hare@suse.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2395277364911355323==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
ZCrP5VPfJ/wfLyhFUmkIAgA=
--===============2395277364911355323==--

