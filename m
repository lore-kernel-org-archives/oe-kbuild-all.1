Content-Type: multipart/mixed; boundary="===============8796211965421945915=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lee-linaro:google/android-3.18-queue 396/1294] drivers/dma/fsl-edma.c:185:24: sparse: sparse: cast to restricted __be16
Date: Mon, 24 May 2021 21:31:08 +0800
Message-ID: <202105242105.uCiUUfSy-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8796211965421945915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Lee,

First bad commit (maybe !=3D root cause):

tree:   https://git.linaro.org/people/lee.jones/linux.git google/android-3.=
18-queue
head:   bce49b06e2e709ee4068dbea44c6248b696de463
commit: 8214bf079208b146e63cd0a3ce0ed335a87ce7b3 [396/1294] scripts/dtc: Ex=
port YYLOC global declaration
config: microblaze-randconfig-s031-20210524 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 5.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        git remote add lee-linaro https://git.linaro.org/people/lee.jones/l=
inux.git
        git fetch --no-tags lee-linaro google/android-3.18-queue
        git checkout 8214bf079208b146e63cd0a3ce0ed335a87ce7b3
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-5.5.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Dmicroblaze =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/dma/fsl-edma.c:185:24: sparse: sparse: cast to restricted __be16
>> drivers/dma/fsl-edma.c:193:24: sparse: sparse: cast to restricted __be32
>> drivers/dma/fsl-edma.c:206:17: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned short [usertype] b @@  =
   got restricted __be16 [usertype] @@
   drivers/dma/fsl-edma.c:206:17: sparse:     expected unsigned short [user=
type] b
   drivers/dma/fsl-edma.c:206:17: sparse:     got restricted __be16 [userty=
pe]
>> drivers/dma/fsl-edma.c:208:17: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned short [usertype] b @@  =
   got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma.c:208:17: sparse:     expected unsigned short [user=
type] b
   drivers/dma/fsl-edma.c:208:17: sparse:     got restricted __le16 [userty=
pe]
>> drivers/dma/fsl-edma.c:214:17: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/dma/fsl-edma.c:214:17: sparse:     expected unsigned int [userty=
pe] b
   drivers/dma/fsl-edma.c:214:17: sparse:     got restricted __be32 [userty=
pe]
>> drivers/dma/fsl-edma.c:216:17: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma.c:216:17: sparse:     expected unsigned int [userty=
pe] b
   drivers/dma/fsl-edma.c:216:17: sparse:     got restricted __le32 [userty=
pe]
   drivers/dma/fsl-edma.c:366:66: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned int * @@
   drivers/dma/fsl-edma.c:366:66: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:366:66: sparse:     got unsigned int *
   drivers/dma/fsl-edma.c:367:69: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned short * @@
   drivers/dma/fsl-edma.c:367:69: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:367:69: sparse:     got unsigned short *
   drivers/dma/fsl-edma.c:379:66: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned int * @@
   drivers/dma/fsl-edma.c:379:66: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:379:66: sparse:     got unsigned int *
   drivers/dma/fsl-edma.c:380:69: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned short * @@
   drivers/dma/fsl-edma.c:380:69: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:380:69: sparse:     got unsigned short *
   drivers/dma/fsl-edma.c:383:56: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned int * @@
   drivers/dma/fsl-edma.c:383:56: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:383:56: sparse:     got unsigned int *
   drivers/dma/fsl-edma.c:386:56: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned int * @@
   drivers/dma/fsl-edma.c:386:56: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:386:56: sparse:     got unsigned int *
   drivers/dma/fsl-edma.c:439:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned short [usertype] b @@   =
  got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma.c:439:9: sparse:     expected unsigned short [usert=
ype] b
   drivers/dma/fsl-edma.c:439:9: sparse:     got restricted __le16 [usertyp=
e]
   drivers/dma/fsl-edma.c:440:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma.c:440:9: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/fsl-edma.c:440:9: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/fsl-edma.c:441:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma.c:441:9: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/fsl-edma.c:441:9: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/fsl-edma.c:442:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned short [usertype] b @@   =
  got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma.c:442:9: sparse:     expected unsigned short [usert=
ype] b
   drivers/dma/fsl-edma.c:442:9: sparse:     got restricted __le16 [usertyp=
e]
   drivers/dma/fsl-edma.c:443:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned short [usertype] b @@   =
  got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma.c:443:9: sparse:     expected unsigned short [usert=
ype] b
   drivers/dma/fsl-edma.c:443:9: sparse:     got restricted __le16 [usertyp=
e]
   drivers/dma/fsl-edma.c:444:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma.c:444:9: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/fsl-edma.c:444:9: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/fsl-edma.c:445:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma.c:445:9: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/fsl-edma.c:445:9: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/fsl-edma.c:446:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned short [usertype] b @@   =
  got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma.c:446:9: sparse:     expected unsigned short [usert=
ype] b
   drivers/dma/fsl-edma.c:446:9: sparse:     got restricted __le16 [usertyp=
e]
   drivers/dma/fsl-edma.c:447:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned short [usertype] b @@   =
  got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma.c:447:9: sparse:     expected unsigned short [usert=
ype] b
   drivers/dma/fsl-edma.c:447:9: sparse:     got restricted __le16 [usertyp=
e]
   drivers/dma/fsl-edma.c:448:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned short [usertype] b @@   =
  got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma.c:448:9: sparse:     expected unsigned short [usert=
ype] b
   drivers/dma/fsl-edma.c:448:9: sparse:     got restricted __le16 [usertyp=
e]
   drivers/dma/fsl-edma.c:449:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/fsl-edma.c:449:9: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/fsl-edma.c:449:9: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/fsl-edma.c:450:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned short [usertype] b @@   =
  got restricted __le16 [usertype] @@
   drivers/dma/fsl-edma.c:450:9: sparse:     expected unsigned short [usert=
ype] b
   drivers/dma/fsl-edma.c:450:9: sparse:     got restricted __le16 [usertyp=
e]
   drivers/dma/fsl-edma.c:466:34: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned int * @@
   drivers/dma/fsl-edma.c:466:34: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:466:34: sparse:     got unsigned int *
   drivers/dma/fsl-edma.c:467:34: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned int * @@
   drivers/dma/fsl-edma.c:467:34: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:467:34: sparse:     got unsigned int *
   drivers/dma/fsl-edma.c:468:35: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned short * @@
   drivers/dma/fsl-edma.c:468:35: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:468:35: sparse:     got unsigned short *
   drivers/dma/fsl-edma.c:469:55: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned short * @@
   drivers/dma/fsl-edma.c:469:55: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:469:55: sparse:     got unsigned short *
   drivers/dma/fsl-edma.c:470:61: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned int * @@
   drivers/dma/fsl-edma.c:470:61: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:470:61: sparse:     got unsigned int *
   drivers/dma/fsl-edma.c:471:58: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned int * @@
   drivers/dma/fsl-edma.c:471:58: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:471:58: sparse:     got unsigned int *
   drivers/dma/fsl-edma.c:472:58: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned short * @@
   drivers/dma/fsl-edma.c:472:58: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:472:58: sparse:     got unsigned short *
   drivers/dma/fsl-edma.c:473:55: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned short * @@
   drivers/dma/fsl-edma.c:473:55: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:473:55: sparse:     got unsigned short *
   drivers/dma/fsl-edma.c:474:70: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned int * @@
   drivers/dma/fsl-edma.c:474:70: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:474:70: sparse:     got unsigned int *
   drivers/dma/fsl-edma.c:475:58: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned short * @@
   drivers/dma/fsl-edma.c:475:58: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:475:58: sparse:     got unsigned short *
   drivers/dma/fsl-edma.c:485:34: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected void [noderef] <asn:2> *addr=
 @@     got unsigned short * @@
   drivers/dma/fsl-edma.c:485:34: sparse:     expected void [noderef] <asn:=
2> *addr
   drivers/dma/fsl-edma.c:485:34: sparse:     got unsigned short *
   drivers/dma/fsl-edma.c: note: in included file (through arch/microblaze/=
include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
   drivers/i2c/busses/i2c-xiic.c: note: in included file (through arch/micr=
oblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
>> drivers/i2c/busses/i2c-xiic.c:185:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned short [usertype] =
b @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:185:9: sparse:     expected unsigned short=
 [usertype] b
   drivers/i2c/busses/i2c-xiic.c:185:9: sparse:     got restricted __le16 [=
usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
>> drivers/i2c/busses/i2c-xiic.c:185:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned short [usertype] =
b @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:185:9: sparse:     expected unsigned short=
 [usertype] b
   drivers/i2c/busses/i2c-xiic.c:185:9: sparse:     got restricted __le16 [=
usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
>> drivers/i2c/busses/i2c-xiic.c:185:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned short [usertype] =
b @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:185:9: sparse:     expected unsigned short=
 [usertype] b
   drivers/i2c/busses/i2c-xiic.c:185:9: sparse:     got restricted __le16 [=
usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/i2c/busses/i2c-xiic.c:190:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] b =
@@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     expected unsigned int [=
usertype] b
   drivers/i2c/busses/i2c-xiic.c:190:9: sparse:     got restricted __le32 [=
usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: too many warnings
--
>> drivers/dma/dw/core.c:134:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:134:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:134:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:135:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:135:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:135:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:138:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:138:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:138:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:139:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:139:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:139:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:243:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:243:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:243:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:244:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:244:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:244:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:246:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:246:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:246:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:247:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:247:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:247:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:350:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:350:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:350:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:478:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:478:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:478:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:529:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:529:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:529:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:557:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:557:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:557:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:558:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:558:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:558:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:559:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:559:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:559:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:561:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:561:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:561:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:562:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:562:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:562:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:563:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:563:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:563:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:572:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:572:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:572:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:604:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:604:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:604:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:605:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:605:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:605:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:623:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:623:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:623:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:624:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:624:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:624:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:625:9: sparse: sparse: incorrect type in argument =
1 (different base types) @@     expected unsigned int [usertype] b @@     g=
ot restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:625:9: sparse:     expected unsigned int [usertype=
] b
   drivers/dma/dw/core.c:625:9: sparse:     got restricted __le32 [usertype]
   drivers/dma/dw/core.c:634:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:634:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:634:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:635:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:635:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:635:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:636:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:636:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:636:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:637:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:637:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:637:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:638:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:638:17: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:638:17: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:1100:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:1100:9: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:1100:9: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:1102:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:1102:9: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:1102:9: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:1103:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:1103:9: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:1103:9: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:1104:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:1104:9: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:1104:9: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:1105:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:1105:9: sparse:     expected unsigned int [usertyp=
e] b
   drivers/dma/dw/core.c:1105:9: sparse:     got restricted __le32 [usertyp=
e]
   drivers/dma/dw/core.c:1106:9: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected unsigned int [usertype] b @@     =
got restricted __le32 [usertype] @@
   drivers/dma/dw/core.c:1106:9: sparse:     expected unsigned int [usertyp=
e] b
--
>> drivers/media/common/saa7146/saa7146_i2c.c:120:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:120:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:120:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:121:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:121:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:121:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:130:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:130:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:130:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:131:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:131:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:131:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:135:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:135:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:135:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:136:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:136:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:136:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:149:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:149:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:149:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:150:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:150:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:150:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:154:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:154:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:154:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:155:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:155:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:155:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:160:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:160:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:160:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:161:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:161:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:161:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:190:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:190:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:190:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:191:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:191:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:191:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:194:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:194:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:194:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:196:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:196:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:196:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:202:25: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:202:25: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:202:25: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:213:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:213:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:213:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:214:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:214:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:214:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c:215:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:215:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:215:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_i2c.c: note: in included file (thro=
ugh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci=
.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/common/saa7146/saa7146_i2c.c:408:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_i2c.c:408:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_i2c.c:408:9: sparse:     got restri=
cted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/common/saa7146/saa7146_i2c.c: note: in included file (thro=
ugh include/media/saa7146_vv.h):
>> include/media/saa7146.h:467:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   include/media/saa7146.h:467:9: sparse:     expected unsigned int [userty=
pe] b
   include/media/saa7146.h:467:9: sparse:     got restricted __le32 [userty=
pe]
   drivers/media/common/saa7146/saa7146_i2c.c: note: in included file (thro=
ugh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci=
.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/common/saa7146/saa7146_i2c.c: note: in included file (thro=
ugh include/media/saa7146_vv.h):
   include/media/saa7146.h:459:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   include/media/saa7146.h:459:9: sparse:     expected unsigned int [userty=
pe] b
   include/media/saa7146.h:459:9: sparse:     got restricted __le32 [userty=
pe]
   drivers/media/common/saa7146/saa7146_i2c.c: note: in included file (thro=
ugh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci=
.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: too many warnings
   In file included from include/linux/poll.h:5:0,
                    from include/media/v4l2-dev.h:12,
                    from include/media/v4l2-common.h:29,
                    from include/media/saa7146_vv.h:4,
                    from drivers/media/common/saa7146/saa7146_i2c.c:3:
   drivers/media/common/saa7146/saa7146_i2c.c: In function 'saa7146_i2c_msg=
_prepare':
   drivers/media/common/saa7146/saa7146_i2c.c:45:16: warning: comparison be=
tween signed and unsigned integer expressions [-Wsign-compare]
     if ((4 * mem) > SAA7146_I2C_MEM) {
                   ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   163-                =
              ^
   drivers/media/common/saa7146/saa7146_i2c.c:45:2: note: in expansion of m=
acro 'if'
     if ((4 * mem) > SAA7146_I2C_MEM) {
     ^
   drivers/media/common/saa7146/saa7146_i2c.c:45:16: warning: comparison be=
tween signed and unsigned integer expressions [-Wsign-compare]
     if ((4 * mem) > SAA7146_I2C_MEM) {
                   ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   172-                =
                          ^
   drivers/media/common/saa7146/saa7146_i2c.c:45:2: note: in expansion of m=
acro 'if'
     if ((4 * mem) > SAA7146_I2C_MEM) {
     ^
   drivers/media/common/saa7146/saa7146_i2c.c:45:16: warning: comparison be=
tween signed and unsigned integer expressions [-Wsign-compare]
     if ((4 * mem) > SAA7146_I2C_MEM) {
                   ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     181-                ^
   drivers/media/common/saa7146/saa7146_i2c.c:45:2: note: in expansion of m=
acro 'if'
     if ((4 * mem) > SAA7146_I2C_MEM) {
     ^
   drivers/media/common/saa7146/saa7146_i2c.c: In function 'saa7146_i2c_wri=
teout':
   drivers/media/common/saa7146/saa7146_i2c.c:200:15: warning: comparison b=
etween signed and unsigned integer expressions [-Wsign-compare]
      if (timeout =3D=3D -ERESTARTSYS || dev->i2c_op) {
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   191-                =
              ^
   drivers/media/common/saa7146/saa7146_i2c.c:200:3: note: in expansion of =
macro 'if'
      if (timeout =3D=3D -ERESTARTSYS || dev->i2c_op) {
      ^
   drivers/media/common/saa7146/saa7146_i2c.c:200:15: warning: comparison b=
etween signed and unsigned integer expressions [-Wsign-compare]
      if (timeout =3D=3D -ERESTARTSYS || dev->i2c_op) {
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   200-                =
                          ^
   drivers/media/common/saa7146/saa7146_i2c.c:200:3: note: in expansion of =
macro 'if'
      if (timeout =3D=3D -ERESTARTSYS || dev->i2c_op) {
--
>> drivers/media/common/saa7146/saa7146_core.c:57:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_core.c:57:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_core.c:57:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_core.c:346:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_core.c:346:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_core.c:346:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_core.c:408:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_core.c:408:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_core.c:408:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_core.c:411:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_core.c:411:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_core.c:411:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_core.c:414:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_core.c:414:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_core.c:414:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_core.c:459:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_core.c:459:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_core.c:459:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_core.c:526:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_core.c:526:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_core.c:526:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_core.c:529:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_core.c:529:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_core.c:529:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_core.c: note: in included file (thr=
ough arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pc=
i.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/common/saa7146/saa7146_core.c: note: in included file:
   include/media/saa7146.h:459:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   include/media/saa7146.h:459:9: sparse:     expected unsigned int [userty=
pe] b
   include/media/saa7146.h:459:9: sparse:     got restricted __le32 [userty=
pe]
   drivers/media/common/saa7146/saa7146_core.c: note: in included file (thr=
ough arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pc=
i.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
>> drivers/media/common/saa7146/saa7146_fops.c:138:25: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned in=
t [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_fops.c:138:25: sparse:     expected=
 unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_fops.c:138:25: sparse:     got rest=
ricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_fops.c:145:25: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned in=
t [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_fops.c:145:25: sparse:     expected=
 unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_fops.c:145:25: sparse:     got rest=
ricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_fops.c:146:25: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned in=
t [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_fops.c:146:25: sparse:     expected=
 unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_fops.c:146:25: sparse:     got rest=
ricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_fops.c:149:25: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned in=
t [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_fops.c:149:25: sparse:     expected=
 unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_fops.c:149:25: sparse:     got rest=
ricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_fops.c:151:25: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned in=
t [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_fops.c:151:25: sparse:     expected=
 unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_fops.c:151:25: sparse:     got rest=
ricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_fops.c:455:25: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned in=
t [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_fops.c:455:25: sparse:     expected=
 unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_fops.c:455:25: sparse:     got rest=
ricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_fops.c:510:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_fops.c:510:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_fops.c:510:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_fops.c:513:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_fops.c:513:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_fops.c:513:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_fops.c: note: in included file (thr=
ough arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pc=
i.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
>> drivers/media/common/saa7146/saa7146_video.c:378:9: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned in=
t [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_video.c:378:9: sparse:     expected=
 unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_video.c:378:9: sparse:     got rest=
ricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_video.c:423:9: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned in=
t [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_video.c:423:9: sparse:     expected=
 unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_video.c:423:9: sparse:     got rest=
ricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_video.c:429:9: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned in=
t [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_video.c:429:9: sparse:     expected=
 unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_video.c:429:9: sparse:     got rest=
ricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_video.c:543:17: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@     expected unsigned i=
nt [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_video.c:543:17: sparse:     expecte=
d unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_video.c:543:17: sparse:     got res=
tricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_video.c:544:17: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@     expected unsigned i=
nt [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_video.c:544:17: sparse:     expecte=
d unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_video.c:544:17: sparse:     got res=
tricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_video.c:551:17: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@     expected unsigned i=
nt [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_video.c:551:17: sparse:     expecte=
d unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_video.c:551:17: sparse:     got res=
tricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_video.c:552:17: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@     expected unsigned i=
nt [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_video.c:552:17: sparse:     expecte=
d unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_video.c:552:17: sparse:     got res=
tricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_video.c:559:17: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@     expected unsigned i=
nt [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_video.c:559:17: sparse:     expecte=
d unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_video.c:559:17: sparse:     got res=
tricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_video.c:560:17: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@     expected unsigned i=
nt [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_video.c:560:17: sparse:     expecte=
d unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_video.c:560:17: sparse:     got res=
tricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_video.c: note: in included file (th=
rough arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/p=
ci.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/common/saa7146/saa7146_video.c: note: in included file (th=
rough include/media/saa7146_vv.h):
>> include/media/saa7146.h:467:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   include/media/saa7146.h:467:9: sparse:     expected unsigned int [userty=
pe] b
   include/media/saa7146.h:467:9: sparse:     got restricted __le32 [userty=
pe]
   drivers/media/common/saa7146/saa7146_video.c: note: in included file (th=
rough arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/p=
ci.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/common/saa7146/saa7146_video.c: note: in included file (th=
rough include/media/saa7146_vv.h):
   include/media/saa7146.h:459:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   include/media/saa7146.h:459:9: sparse:     expected unsigned int [userty=
pe] b
   include/media/saa7146.h:459:9: sparse:     got restricted __le32 [userty=
pe]
   drivers/media/common/saa7146/saa7146_video.c: note: in included file (th=
rough arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/p=
ci.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   In file included from include/linux/poll.h:5:0,
                    from include/media/v4l2-dev.h:12,
                    from include/media/v4l2-common.h:29,
                    from include/media/saa7146_vv.h:4,
                    from drivers/media/common/saa7146/saa7146_video.c:3:
   drivers/media/common/saa7146/saa7146_video.c: In function 'saa7146_forma=
t_by_fourcc':
   drivers/media/common/saa7146/saa7146_video.c:96:30: warning: comparison =
between signed and unsigned integer expressions [-Wsign-compare]
      if (formats[i].pixelformat =3D=3D fourcc) {
                                 ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   92-                 =
             ^
   drivers/media/common/saa7146/saa7146_video.c:96:3: note: in expansion of=
 macro 'if'
      if (formats[i].pixelformat =3D=3D fourcc) {
      ^
   drivers/media/common/saa7146/saa7146_video.c:96:30: warning: comparison =
between signed and unsigned integer expressions [-Wsign-compare]
      if (formats[i].pixelformat =3D=3D fourcc) {
                                 ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   101-                =
                          ^
   drivers/media/common/saa7146/saa7146_video.c:96:3: note: in expansion of=
 macro 'if'
      if (formats[i].pixelformat =3D=3D fourcc) {
      ^
   drivers/media/common/saa7146/saa7146_video.c:96:30: warning: comparison =
between signed and unsigned integer expressions [-Wsign-compare]
      if (formats[i].pixelformat =3D=3D fourcc) {
                                 ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     110-                ^
   drivers/media/common/saa7146/saa7146_video.c:96:3: note: in expansion of=
 macro 'if'
      if (formats[i].pixelformat =3D=3D fourcc) {
      ^
   drivers/media/common/saa7146/saa7146_video.c: In function 'saa7146_pgtab=
le_build':
   drivers/media/common/saa7146/saa7146_video.c:261:25: warning: comparison=
 between signed and unsigned integer expressions [-Wsign-compare]
       for (p =3D 0; p * 4096 < list->length; p++, ptr1++) {
                            ^
   In file included from include/linux/poll.h:5:0,
                    from include/media/v4l2-dev.h:12,
                    from include/media/v4l2-common.h:29,
                    from include/media/saa7146_vv.h:4,
                    from drivers/media/common/saa7146/saa7146_video.c:3:
   drivers/media/common/saa7146/saa7146_video.c: In function 'vidioc_enum_f=
mt_vid_cap':
   drivers/media/common/saa7146/saa7146_video.c:523:15: warning: comparison=
 between signed and unsigned integer expressions [-Wsign-compare]
     if (f->index >=3D NUM_FORMATS)
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   129-                =
              ^
   drivers/media/common/saa7146/saa7146_video.c:523:2: note: in expansion o=
f macro 'if'
     if (f->index >=3D NUM_FORMATS)
     ^
   drivers/media/common/saa7146/saa7146_video.c:523:15: warning: comparison=
 between signed and unsigned integer expressions [-Wsign-compare]
     if (f->index >=3D NUM_FORMATS)
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
--
>> drivers/media/common/saa7146/saa7146_hlp.c:478:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:478:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:478:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:479:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:479:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:479:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:482:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:482:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:482:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:510:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:510:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:510:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:511:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:511:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:511:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:512:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:512:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:512:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:513:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:513:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:513:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:514:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:514:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:514:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:515:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:515:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:515:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:518:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:518:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:518:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:519:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:519:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:519:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:522:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:522:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:522:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:523:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:523:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:523:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:551:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:551:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:551:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:552:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:552:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:552:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:553:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:553:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:553:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:554:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:554:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:554:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:555:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:555:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:555:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:558:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:558:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:558:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:625:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:625:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:625:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:626:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:626:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:626:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:642:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:642:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:642:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:643:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:643:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:643:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:661:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:661:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:661:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:671:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:671:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:671:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:685:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:685:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:685:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:686:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:686:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:686:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:687:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:687:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:687:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:688:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:688:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:688:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:689:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:689:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:689:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:690:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:690:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:690:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:693:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:693:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:693:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:1011:17: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned in=
t [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:1011:17: sparse:     expected=
 unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_hlp.c:1011:17: sparse:     got rest=
ricted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_hlp.c:1044:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_hlp.c:1044:9: sparse:     expected =
unsigned int [usertype] b
--
>> drivers/media/common/saa7146/saa7146_vbi.c:29:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:29:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:29:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:30:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:30:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:30:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:31:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:31:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:31:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:32:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:32:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:32:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:33:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:33:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:33:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:34:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:34:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:34:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:35:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:35:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:35:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:88:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:88:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:88:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:90:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:90:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:90:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:91:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:91:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:91:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:101:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:101:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:101:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:102:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:102:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:102:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:115:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:115:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:115:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:123:25: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:123:25: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:123:25: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:198:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:198:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:198:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:201:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:201:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:201:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:330:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:330:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:330:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:336:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:336:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:336:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:395:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:395:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:395:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:396:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:396:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:396:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:410:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:410:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:410:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:412:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:412:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:412:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c:421:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/common/saa7146/saa7146_vbi.c:421:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/common/saa7146/saa7146_vbi.c:421:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/common/saa7146/saa7146_vbi.c: note: in included file (thro=
ugh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci=
.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/common/saa7146/saa7146_vbi.c: note: in included file (thro=
ugh include/media/saa7146_vv.h):
>> include/media/saa7146.h:467:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   include/media/saa7146.h:467:9: sparse:     expected unsigned int [userty=
pe] b
   include/media/saa7146.h:467:9: sparse:     got restricted __le32 [userty=
pe]
   drivers/media/common/saa7146/saa7146_vbi.c: note: in included file (thro=
ugh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci=
.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/common/saa7146/saa7146_vbi.c: note: in included file (thro=
ugh include/media/saa7146_vv.h):
   include/media/saa7146.h:459:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   include/media/saa7146.h:459:9: sparse:     expected unsigned int [userty=
pe] b
   include/media/saa7146.h:459:9: sparse:     got restricted __le32 [userty=
pe]
   drivers/media/common/saa7146/saa7146_vbi.c: note: in included file (thro=
ugh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci=
.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/common/saa7146/saa7146_vbi.c: note: in included file (thro=
ugh include/media/saa7146_vv.h):
>> include/media/saa7146.h:467:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   include/media/saa7146.h:467:9: sparse:     expected unsigned int [userty=
pe] b
   include/media/saa7146.h:467:9: sparse:     got restricted __le32 [userty=
pe]
   drivers/media/common/saa7146/saa7146_vbi.c: note: in included file (thro=
ugh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci=
.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/common/saa7146/saa7146_vbi.c: note: in included file (thro=
ugh include/media/saa7146_vv.h):
   include/media/saa7146.h:459:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   include/media/saa7146.h:459:9: sparse:     expected unsigned int [userty=
pe] b
   include/media/saa7146.h:459:9: sparse:     got restricted __le32 [userty=
pe]
   drivers/media/common/saa7146/saa7146_vbi.c: note: in included file (thro=
ugh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci=
.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   In file included from include/linux/poll.h:5:0,
                    from include/media/v4l2-dev.h:12,
                    from include/media/v4l2-common.h:29,
                    from include/media/saa7146_vv.h:4,
                    from drivers/media/common/saa7146/saa7146_vbi.c:1:
   drivers/media/common/saa7146/saa7146_vbi.c: In function 'buffer_prepare':
   drivers/media/common/saa7146/saa7146_vbi.c:234:44: warning: comparison b=
etween signed and unsigned integer expressions [-Wsign-compare]
     if (0 !=3D buf->vb.baddr  &&  buf->vb.bsize < size) {
                                               ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   162-                =
              ^
   drivers/media/common/saa7146/saa7146_vbi.c:234:2: note: in expansion of =
macro 'if'
     if (0 !=3D buf->vb.baddr  &&  buf->vb.bsize < size) {
     ^
   drivers/media/common/saa7146/saa7146_vbi.c:234:44: warning: comparison b=
etween signed and unsigned integer expressions [-Wsign-compare]
     if (0 !=3D buf->vb.baddr  &&  buf->vb.bsize < size) {
                                               ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   171-                =
                          ^
   drivers/media/common/saa7146/saa7146_vbi.c:234:2: note: in expansion of =
macro 'if'
     if (0 !=3D buf->vb.baddr  &&  buf->vb.bsize < size) {
     ^
   drivers/media/common/saa7146/saa7146_vbi.c:234:44: warning: comparison b=
etween signed and unsigned integer expressions [-Wsign-compare]
     if (0 !=3D buf->vb.baddr  &&  buf->vb.bsize < size) {
                                               ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     180-                ^
   drivers/media/common/saa7146/saa7146_vbi.c:234:2: note: in expansion of =
macro 'if'
     if (0 !=3D buf->vb.baddr  &&  buf->vb.bsize < size) {
     ^
   drivers/media/common/saa7146/saa7146_vbi.c:239:19: warning: comparison b=
etween signed and unsigned integer expressions [-Wsign-compare]
     if (buf->vb.size !=3D size)
                      ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   189-                =
              ^
   drivers/media/common/saa7146/saa7146_vbi.c:239:2: note: in expansion of =
macro 'if'
     if (buf->vb.size !=3D size)
     ^
   drivers/media/common/saa7146/saa7146_vbi.c:239:19: warning: comparison b=
etween signed and unsigned integer expressions [-Wsign-compare]
     if (buf->vb.size !=3D size)
                      ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   198-                =
                          ^
   drivers/media/common/saa7146/saa7146_vbi.c:239:2: note: in expansion of =
macro 'if'
     if (buf->vb.size !=3D size)
     ^
   drivers/media/common/saa7146/saa7146_vbi.c:239:19: warning: comparison b=
etween signed and unsigned integer expressions [-Wsign-compare]
     if (buf->vb.size !=3D size)
                      ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     207-                ^
   drivers/media/common/saa7146/saa7146_vbi.c:239:2: note: in expansion of =
macro 'if'
     if (buf->vb.size !=3D size)
     ^
--
   drivers/media/i2c/s5k5baf.c:1796:33: sparse: sparse: duplicate const
   drivers/media/i2c/s5k5baf.c:379:24: sparse: sparse: cast to restricted _=
_le16
   drivers/media/i2c/s5k5baf.c:379:24: sparse: sparse: cast to restricted _=
_le16
   drivers/media/i2c/s5k5baf.c:379:24: sparse: sparse: cast to restricted _=
_le16
   drivers/media/i2c/s5k5baf.c:379:24: sparse: sparse: cast to restricted _=
_le16
>> drivers/media/i2c/s5k5baf.c:437:11: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __be16 [addressa=
ble] [usertype] r @@     got unsigned short [usertype] @@
   drivers/media/i2c/s5k5baf.c:437:11: sparse:     expected restricted __be=
16 [addressable] [usertype] r
   drivers/media/i2c/s5k5baf.c:437:11: sparse:     got unsigned short [user=
type]
   drivers/media/i2c/s5k5baf.c:445:16: sparse: sparse: incorrect type in re=
turn expression (different base types) @@     expected unsigned short @@   =
  got restricted __be16 [addressable] [usertype] r @@
   drivers/media/i2c/s5k5baf.c:445:16: sparse:     expected unsigned short
   drivers/media/i2c/s5k5baf.c:445:16: sparse:     got restricted __be16 [a=
ddressable] [usertype] r
   In file included from include/linux/err.h:4:0,
                    from include/linux/clk.h:15,
                    from drivers/media/i2c/s5k5baf.c:16:
   drivers/media/i2c/s5k5baf.c: In function 's5k5baf_fw_parse':
   drivers/media/i2c/s5k5baf.c:382:12: warning: comparison between signed a=
nd unsigned integer expressions [-Wsign-compare]
     if (count < 1 + 2 * f->count) {
               ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   21-                 =
             ^
   drivers/media/i2c/s5k5baf.c:382:2: note: in expansion of macro 'if'
     if (count < 1 + 2 * f->count) {
     ^
   drivers/media/i2c/s5k5baf.c:382:12: warning: comparison between signed a=
nd unsigned integer expressions [-Wsign-compare]
     if (count < 1 + 2 * f->count) {
               ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   30-                 =
                         ^
   drivers/media/i2c/s5k5baf.c:382:2: note: in expansion of macro 'if'
     if (count < 1 + 2 * f->count) {
     ^
   drivers/media/i2c/s5k5baf.c:382:12: warning: comparison between signed a=
nd unsigned integer expressions [-Wsign-compare]
     if (count < 1 + 2 * f->count) {
               ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     39-                ^
   drivers/media/i2c/s5k5baf.c:382:2: note: in expansion of macro 'if'
     if (count < 1 + 2 * f->count) {
     ^
   drivers/media/i2c/s5k5baf.c: In function 's5k5baf_find_pixfmt':
   drivers/media/i2c/s5k5baf.c:743:16: warning: comparison between signed a=
nd unsigned integer expressions [-Wsign-compare]
     for (i =3D 0; i < ARRAY_SIZE(s5k5baf_formats); i++) {
                   ^
   In file included from include/linux/err.h:4:0,
                    from include/linux/clk.h:15,
                    from drivers/media/i2c/s5k5baf.c:16:
   drivers/media/i2c/s5k5baf.c: In function 's5k5baf_set_power':
   drivers/media/i2c/s5k5baf.c:1054:10: warning: logical not is only applie=
d to the left hand side of comparison [-Wlogical-not-parentheses]
     if (!on !=3D state->power)
             ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   56-                 =
             ^
   drivers/media/i2c/s5k5baf.c:1054:2: note: in expansion of macro 'if'
     if (!on !=3D state->power)
     ^
   drivers/media/i2c/s5k5baf.c:1054:10: warning: logical not is only applie=
d to the left hand side of comparison [-Wlogical-not-parentheses]
     if (!on !=3D state->power)
             ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   65-                 =
                         ^
   drivers/media/i2c/s5k5baf.c:1054:2: note: in expansion of macro 'if'
     if (!on !=3D state->power)
     ^
   drivers/media/i2c/s5k5baf.c:1054:10: warning: logical not is only applie=
d to the left hand side of comparison [-Wlogical-not-parentheses]
     if (!on !=3D state->power)
             ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     74-                ^
   drivers/media/i2c/s5k5baf.c:1054:2: note: in expansion of macro 'if'
     if (!on !=3D state->power)
     ^
   drivers/media/i2c/s5k5baf.c: In function 's5k5baf_configure_regulators':
   drivers/media/i2c/s5k5baf.c:1937:16: warning: comparison between signed =
and unsigned integer expressions [-Wsign-compare]
     for (i =3D 0; i < S5K5BAF_NUM_SUPPLIES; i++)
                   ^
--
>> drivers/media/pci/b2c2/flexcop-pci.c:100:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int [usert=
ype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/b2c2/flexcop-pci.c:100:9: sparse:     expected unsigne=
d int [usertype] b
   drivers/media/pci/b2c2/flexcop-pci.c:100:9: sparse:     got restricted _=
_le32 [usertype]
   drivers/media/pci/b2c2/flexcop-pci.c: note: in included file (through ar=
ch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ..=
.):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   cc1: warning: drivers/media/dvb-core/: No such file or directory [-Wmiss=
ing-include-dirs]
   cc1: warning: drivers/media/common/b2c2/: No such file or directory [-Wm=
issing-include-dirs]
   In file included from include/linux/if_ether.h:23:0,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:43,
                    from drivers/media/dvb-core/dvb_net.h:26,
                    from drivers/media/common/b2c2/flexcop-common.h:18,
                    from drivers/media/pci/b2c2/flexcop-pci.c:8:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from include/linux/interrupt.h:5,
                    from drivers/media/common/b2c2/flexcop-common.h:9,
                    from drivers/media/pci/b2c2/flexcop-pci.c:8:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   35-                 =
             ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   47-                 =
                         ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     59-                ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   72-                 =
             ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   81-                 =
                         ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     90-                ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   drivers/media/pci/b2c2/flexcop-pci.c: In function 'flexcop_pci_read_ibi_=
reg':
   drivers/media/pci/b2c2/flexcop-pci.c:82:15: warning: comparison between =
signed and unsigned integer expressions [-Wsign-compare]
     if (lastrreg !=3D r || lastrval !=3D v.raw) {
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   100-                =
              ^
   drivers/media/pci/b2c2/flexcop-pci.c:82:2: note: in expansion of macro '=
if'
--
>> drivers/media/pci/cx25821/cx25821-core.c:366:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:366:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:366:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:371:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:371:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:371:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:375:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:375:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:375:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:378:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:378:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:378:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:381:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:381:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:381:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:385:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:385:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:385:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:388:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:388:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:388:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:391:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:391:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:391:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:395:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:395:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:395:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:398:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:398:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:398:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:401:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:401:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:401:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:405:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:405:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:405:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:408:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:408:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:408:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:411:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:411:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:411:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:415:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:415:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:415:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:420:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:420:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:420:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:427:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:427:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:427:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:433:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:433:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:433:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:446:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:446:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:446:17: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:447:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:447:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:447:17: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:448:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:448:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:448:17: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:449:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:449:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:449:17: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:462:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:462:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:462:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:463:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:463:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:463:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:464:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:464:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:464:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:468:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:468:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:468:17: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:469:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:469:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:469:17: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:470:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:470:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:470:17: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:471:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:471:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:471:17: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:476:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:476:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:476:17: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:480:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:480:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:480:17: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:482:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:482:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:482:17: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:484:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:484:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-core.c:484:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-core.c:485:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-core.c:485:9: sparse:     expected uns=
igned int [usertype] b
--
>> drivers/media/pci/cx25821/cx25821-i2c.c:96:17: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-i2c.c:96:17: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/cx25821/cx25821-i2c.c:96:17: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-i2c.c:97:17: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-i2c.c:97:17: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/cx25821/cx25821-i2c.c:97:17: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-i2c.c:120:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-i2c.c:120:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/cx25821/cx25821-i2c.c:120:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-i2c.c:121:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-i2c.c:121:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/cx25821/cx25821-i2c.c:121:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-i2c.c:122:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-i2c.c:122:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/cx25821/cx25821-i2c.c:122:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-i2c.c:146:17: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-i2c.c:146:17: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-i2c.c:146:17: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-i2c.c:147:17: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-i2c.c:147:17: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-i2c.c:147:17: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-i2c.c:148:17: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-i2c.c:148:17: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-i2c.c:148:17: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-i2c.c:187:17: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-i2c.c:187:17: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-i2c.c:187:17: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-i2c.c:188:17: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-i2c.c:188:17: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-i2c.c:188:17: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-i2c.c:212:17: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-i2c.c:212:17: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-i2c.c:212:17: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-i2c.c:213:17: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-i2c.c:213:17: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/cx25821/cx25821-i2c.c:213:17: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-i2c.c: note: in included file (through=
 arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci.h,=
 ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from include/linux/module.h:9,
                    from drivers/media/pci/cx25821/cx25821-i2c.c:26:
   drivers/media/pci/cx25821/cx25821-i2c.c: In function 'i2c_readbytes':
   drivers/media/pci/cx25821/cx25821-i2c.c:209:11: warning: comparison betw=
een signed and unsigned integer expressions [-Wsign-compare]
      if (cnt < msg->len - 1)
              ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   76-                 =
             ^
   drivers/media/pci/cx25821/cx25821-i2c.c:209:3: note: in expansion of mac=
ro 'if'
      if (cnt < msg->len - 1)
      ^
   drivers/media/pci/cx25821/cx25821-i2c.c:209:11: warning: comparison betw=
een signed and unsigned integer expressions [-Wsign-compare]
      if (cnt < msg->len - 1)
              ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   85-                 =
                         ^
   drivers/media/pci/cx25821/cx25821-i2c.c:209:3: note: in expansion of mac=
ro 'if'
      if (cnt < msg->len - 1)
      ^
   drivers/media/pci/cx25821/cx25821-i2c.c:209:11: warning: comparison betw=
een signed and unsigned integer expressions [-Wsign-compare]
      if (cnt < msg->len - 1)
              ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     94-                ^
   drivers/media/pci/cx25821/cx25821-i2c.c:209:3: note: in expansion of mac=
ro 'if'
      if (cnt < msg->len - 1)
      ^
--
>> drivers/media/pci/cx25821/cx25821-gpio.c:52:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-gpio.c:52:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/cx25821/cx25821-gpio.c:52:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-gpio.c:82:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-gpio.c:82:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/cx25821/cx25821-gpio.c:82:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-gpio.c: note: in included file (throug=
h arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci.h=
, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
>> drivers/media/pci/cx25821/cx25821-video.c:125:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video.c:125:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-video.c:125:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video.c: note: in included file (throu=
gh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.=
h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/cx25821/cx25821-video.c:129:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video.c:129:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-video.c:129:9: sparse:     got restric=
ted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/cx25821/cx25821-video.c:130:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video.c:130:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-video.c:130:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video.c:133:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video.c:133:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-video.c:133:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video.c:137:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video.c:137:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-video.c:137:9: sparse:     got restric=
ted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/cx25821/cx25821-video.c:203:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video.c:203:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-video.c:203:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video.c:230:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video.c:230:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-video.c:230:9: sparse:     got restric=
ted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/cx25821/cx25821-video.c:236:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video.c:236:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video.c:236:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video.c:534:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video.c:534:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/cx25821/cx25821-video.c:534:9: sparse:     got restric=
ted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/cx25821/cx25821-video.c:1017:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video.c:1017:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video.c:1017:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video.c:1084:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video.c:1084:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video.c:1084:17: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/cx25821/cx25821-video.c:1120:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video.c:1120:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video.c:1120:9: sparse:     got restri=
cted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
>> drivers/media/pci/cx25821/cx25821-video-upstream.c:49:17: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:49:17: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:49:17: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:50:17: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:50:17: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:50:17: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:51:17: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:51:17: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:51:17: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:52:17: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:52:17: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:52:17: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:67:17: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:67:17: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:67:17: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:68:17: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:68:17: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:68:17: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:69:17: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:69:17: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:69:17: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:70:17: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:70:17: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:70:17: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:74:9: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@     expected unsign=
ed int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:74:9: sparse:     exp=
ected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:74:9: sparse:     got=
 restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:76:9: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@     expected unsign=
ed int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:76:9: sparse:     exp=
ected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:76:9: sparse:     got=
 restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:77:9: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@     expected unsign=
ed int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:77:9: sparse:     exp=
ected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:77:9: sparse:     got=
 restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:78:9: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@     expected unsign=
ed int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:78:9: sparse:     exp=
ected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:78:9: sparse:     got=
 restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:79:9: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@     expected unsign=
ed int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:79:9: sparse:     exp=
ected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:79:9: sparse:     got=
 restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:81:9: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@     expected unsign=
ed int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:81:9: sparse:     exp=
ected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:81:9: sparse:     got=
 restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:84:17: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:84:17: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:84:17: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:87:9: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@     expected unsign=
ed int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:87:9: sparse:     exp=
ected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:87:9: sparse:     got=
 restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:88:9: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@     expected unsign=
ed int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:88:9: sparse:     exp=
ected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:88:9: sparse:     got=
 restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:89:9: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@     expected unsign=
ed int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:89:9: sparse:     exp=
ected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:89:9: sparse:     got=
 restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:90:9: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@     expected unsign=
ed int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:90:9: sparse:     exp=
ected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:90:9: sparse:     got=
 restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c: note: in included fi=
le (through arch/microblaze/include/asm/io.h, include/linux/io.h, include/l=
inux/irq.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/cx25821/cx25821-video-upstream.c:258:9: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:258:9: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:258:9: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:262:9: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:262:9: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:262:9: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:266:9: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:266:9: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:266:9: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:280:9: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:280:9: sparse:     ex=
pected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:280:9: sparse:     go=
t restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:426:17: sparse: spars=
e: incorrect type in argument 1 (different base types) @@     expected unsi=
gned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:426:17: sparse:     e=
xpected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:426:17: sparse:     g=
ot restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:427:17: sparse: spars=
e: incorrect type in argument 1 (different base types) @@     expected unsi=
gned int [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/cx25821/cx25821-video-upstream.c:427:17: sparse:     e=
xpected unsigned int [usertype] b
   drivers/media/pci/cx25821/cx25821-video-upstream.c:427:17: sparse:     g=
ot restricted __le32 [usertype]
   drivers/media/pci/cx25821/cx25821-video-upstream.c:489:9: sparse: sparse=
: incorrect type in argument 1 (different base types) @@     expected unsig=
ned int [usertype] b @@     got restricted __le32 [usertype] @@
--
>> drivers/media/pci/ddbridge/ddbridge-core.c:88:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:88:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:88:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:95:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:95:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:95:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:119:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:119:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:119:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:131:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:131:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:131:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:136:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:136:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:136:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:183:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:183:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:183:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:184:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:184:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:184:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:246:25: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:246:25: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:246:25: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:247:25: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:247:25: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:247:25: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:255:25: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:255:25: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:255:25: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:256:25: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:256:25: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:256:25: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:358:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:358:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:358:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:359:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:359:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:359:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:360:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:360:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:360:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:362:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:362:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:362:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:366:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:366:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:366:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:368:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:368:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:368:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:369:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:369:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:369:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:370:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:370:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:370:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:380:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:380:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:380:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:381:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:381:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:381:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:393:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:393:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:393:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:394:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:394:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:394:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:395:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:395:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:395:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:396:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:396:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:396:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:397:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:397:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:397:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:401:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:401:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:401:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:403:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:403:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:403:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:404:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:404:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:404:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:406:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:406:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:406:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:416:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:416:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:416:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:417:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:417:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:417:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:484:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:484:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/ddbridge/ddbridge-core.c:484:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/ddbridge/ddbridge-core.c:501:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ddbridge/ddbridge-core.c:501:17: sparse:     expected =
unsigned int [usertype] b
--
>> drivers/media/pci/ngene/ngene-core.c:188:25: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:188:25: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:188:25: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:197:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int [usert=
ype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:197:9: sparse:     expected unsigne=
d int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:197:9: sparse:     got restricted _=
_le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:281:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:281:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:281:17: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:282:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:282:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:282:17: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:283:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:283:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:283:17: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:284:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:284:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:284:17: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:285:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:285:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:285:17: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:286:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:286:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:286:17: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:290:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:290:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:290:17: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:291:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:291:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:291:17: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:292:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:292:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:292:17: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:293:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:293:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:293:17: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:294:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:294:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:294:17: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:295:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:295:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:295:17: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:314:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int [usert=
ype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:314:9: sparse:     expected unsigne=
d int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:314:9: sparse:     got restricted _=
_le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:1220:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:1220:9: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:1220:9: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:1293:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:1293:9: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:1293:9: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:1294:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:1294:9: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:1294:9: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:1295:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:1295:9: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:1295:9: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:1296:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:1296:9: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:1296:9: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:1297:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:1297:9: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:1297:9: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:1298:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:1298:9: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:1298:9: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:1299:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:1299:9: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:1299:9: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:1360:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:1360:9: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:1360:9: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:1362:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:1362:9: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:1362:9: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:1403:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:1403:9: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:1403:9: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c:1612:9: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ngene/ngene-core.c:1612:9: sparse:     expected unsign=
ed int [usertype] b
   drivers/media/pci/ngene/ngene-core.c:1612:9: sparse:     got restricted =
__le32 [usertype]
   drivers/media/pci/ngene/ngene-core.c: note: in included file (through ar=
ch/microblaze/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
>> drivers/media/pci/pluto2/pluto2.c:146:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:146:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:146:9: sparse:     got restricted __le=
32 [usertype]
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     got restricted __le=
32 [usertype]
   drivers/media/pci/pluto2/pluto2.c: note: in included file (through arch/=
microblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     got restricted __le=
32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     got restricted __le=
32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     got restricted __le=
32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/media/pci/pluto2/pluto2.c:146:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:146:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:146:9: sparse:     got restricted __le=
32 [usertype]
>> drivers/media/pci/pluto2/pluto2.c:146:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:146:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:146:9: sparse:     got restricted __le=
32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/media/pci/pluto2/pluto2.c:146:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:146:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:146:9: sparse:     got restricted __le=
32 [usertype]
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     got restricted __le=
32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     got restricted __le=
32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     got restricted __le=
32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     got restricted __le=
32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     got restricted __le=
32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/pluto2/pluto2.c:154:9: sparse:     got restricted __le=
32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: too many warnings
   cc1: warning: drivers/media/dvb-core/: No such file or directory [-Wmiss=
ing-include-dirs]
   cc1: warning: drivers/media/dvb-frontends/: No such file or directory [-=
Wmissing-include-dirs]
   In file included from include/linux/if_ether.h:23:0,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:43,
                    from drivers/media/dvb-core/dvb_net.h:26,
                    from drivers/media/pci/pluto2/pluto2.c:40:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/mod_devicetable.h:11,
                    from include/linux/i2c.h:29,
                    from drivers/media/pci/pluto2/pluto2.c:26:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   156-                =
              ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   168-                =
                          ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
--
>> drivers/media/pci/pt3/pt3.c:122:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned int [usertype] b @@=
     got restricted __le32 [usertype] @@
   drivers/media/pci/pt3/pt3.c:122:9: sparse:     expected unsigned int [us=
ertype] b
   drivers/media/pci/pt3/pt3.c:122:9: sparse:     got restricted __le32 [us=
ertype]
>> drivers/media/pci/pt3/pt3.c:122:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned int [usertype] b @@=
     got restricted __le32 [usertype] @@
   drivers/media/pci/pt3/pt3.c:122:9: sparse:     expected unsigned int [us=
ertype] b
   drivers/media/pci/pt3/pt3.c:122:9: sparse:     got restricted __le32 [us=
ertype]
   drivers/media/pci/pt3/pt3.c: note: in included file (through arch/microb=
laze/include/asm/io.h, include/linux/io.h, include/linux/pci.h):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   cc1: warning: drivers/media/dvb-core: No such file or directory [-Wmissi=
ng-include-dirs]
   cc1: warning: drivers/media/dvb-frontends: No such file or directory [-W=
missing-include-dirs]
   cc1: warning: drivers/media/tuners: No such file or directory [-Wmissing=
-include-dirs]
--
>> drivers/media/pci/pt3/pt3_i2c.c:166:9: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected unsigned int [usertype] =
b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pt3/pt3_i2c.c:166:9: sparse:     expected unsigned int=
 [usertype] b
   drivers/media/pci/pt3/pt3_i2c.c:166:9: sparse:     got restricted __le32=
 [usertype]
   drivers/media/pci/pt3/pt3_i2c.c:195:9: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected unsigned int [usertype] =
b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pt3/pt3_i2c.c:195:9: sparse:     expected unsigned int=
 [usertype] b
   drivers/media/pci/pt3/pt3_i2c.c:195:9: sparse:     got restricted __le32=
 [usertype]
   drivers/media/pci/pt3/pt3_i2c.c: note: in included file (through arch/mi=
croblaze/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   cc1: warning: drivers/media/dvb-core: No such file or directory [-Wmissi=
ng-include-dirs]
   cc1: warning: drivers/media/dvb-frontends: No such file or directory [-W=
missing-include-dirs]
   cc1: warning: drivers/media/tuners: No such file or directory [-Wmissing=
-include-dirs]
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from include/linux/delay.h:10,
                    from drivers/media/pci/pt3/pt3_i2c.c:16:
   drivers/media/pci/pt3/pt3_i2c.c: In function 'cmdbuf_add':
   drivers/media/pci/pt3/pt3_i2c.c:63:15: warning: comparison between signe=
d and unsigned integer expressions [-Wsign-compare]
      if (buf_idx < ARRAY_SIZE(cbuf->data))
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   33-                 =
             ^
   drivers/media/pci/pt3/pt3_i2c.c:63:3: note: in expansion of macro 'if'
      if (buf_idx < ARRAY_SIZE(cbuf->data))
      ^
   drivers/media/pci/pt3/pt3_i2c.c:63:15: warning: comparison between signe=
d and unsigned integer expressions [-Wsign-compare]
      if (buf_idx < ARRAY_SIZE(cbuf->data))
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   42-                 =
                         ^
   drivers/media/pci/pt3/pt3_i2c.c:63:3: note: in expansion of macro 'if'
      if (buf_idx < ARRAY_SIZE(cbuf->data))
      ^
   drivers/media/pci/pt3/pt3_i2c.c:63:15: warning: comparison between signe=
d and unsigned integer expressions [-Wsign-compare]
      if (buf_idx < ARRAY_SIZE(cbuf->data))
                  ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     51-                ^
   drivers/media/pci/pt3/pt3_i2c.c:63:3: note: in expansion of macro 'if'
      if (buf_idx < ARRAY_SIZE(cbuf->data))
      ^
   drivers/media/pci/pt3/pt3_i2c.c: In function 'put_byte_read':
   drivers/media/pci/pt3/pt3_i2c.c:98:16: warning: comparison between signe=
d and unsigned integer expressions [-Wsign-compare]
     for (i =3D 0; i < size; i++) {
                   ^
   drivers/media/pci/pt3/pt3_i2c.c:101:23: warning: comparison between sign=
ed and unsigned integer expressions [-Wsign-compare]
      cmdbuf_add(cbuf, (i =3D=3D size - 1) ? I_DATA_H_NOP : I_DATA_L_NOP);
                          ^
--
>> drivers/media/pci/pt3/pt3_dma.c:45:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned int [usertype] b=
 @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pt3/pt3_dma.c:45:9: sparse:     expected unsigned int =
[usertype] b
   drivers/media/pci/pt3/pt3_dma.c:45:9: sparse:     got restricted __le32 =
[usertype]
   drivers/media/pci/pt3/pt3_dma.c:60:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned int [usertype] b=
 @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pt3/pt3_dma.c:60:9: sparse:     expected unsigned int =
[usertype] b
   drivers/media/pci/pt3/pt3_dma.c:60:9: sparse:     got restricted __le32 =
[usertype]
   drivers/media/pci/pt3/pt3_dma.c:61:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned int [usertype] b=
 @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pt3/pt3_dma.c:61:9: sparse:     expected unsigned int =
[usertype] b
   drivers/media/pci/pt3/pt3_dma.c:61:9: sparse:     got restricted __le32 =
[usertype]
   drivers/media/pci/pt3/pt3_dma.c:63:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned int [usertype] b=
 @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pt3/pt3_dma.c:63:9: sparse:     expected unsigned int =
[usertype] b
   drivers/media/pci/pt3/pt3_dma.c:63:9: sparse:     got restricted __le32 =
[usertype]
   drivers/media/pci/pt3/pt3_dma.c:65:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned int [usertype] b=
 @@     got restricted __le32 [usertype] @@
   drivers/media/pci/pt3/pt3_dma.c:65:9: sparse:     expected unsigned int =
[usertype] b
   drivers/media/pci/pt3/pt3_dma.c:65:9: sparse:     got restricted __le32 =
[usertype]
   drivers/media/pci/pt3/pt3_dma.c: note: in included file (through arch/mi=
croblaze/include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-m=
apping.h):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   cc1: warning: drivers/media/dvb-core: No such file or directory [-Wmissi=
ng-include-dirs]
   cc1: warning: drivers/media/dvb-frontends: No such file or directory [-W=
missing-include-dirs]
   cc1: warning: drivers/media/tuners: No such file or directory [-Wmissing=
-include-dirs]
   drivers/media/pci/pt3/pt3_dma.c: In function 'pt3_alloc_dmabuf':
   drivers/media/pci/pt3/pt3_dma.c:196:17: warning: comparison between sign=
ed and unsigned integer expressions [-Wsign-compare]
      for (j =3D 0; j < DESCS_IN_PAGE; j++) {
                    ^
--
   drivers/media/pci/saa7134/saa7134-cards.c: note: in included file (throu=
gh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci.=
h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/media/pci/saa7134/saa7134-cards.c:7172:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-cards.c:7172:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-cards.c:7172:17: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-cards.c:7173:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-cards.c:7173:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-cards.c:7173:17: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-cards.c:7218:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-cards.c:7218:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-cards.c:7218:17: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-cards.c:7219:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-cards.c:7219:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-cards.c:7219:17: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-cards.c:7220:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-cards.c:7220:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-cards.c:7220:17: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-cards.c:7221:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-cards.c:7221:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-cards.c:7221:17: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-cards.c:7222:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-cards.c:7222:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-cards.c:7222:17: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-cards.c:7223:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-cards.c:7223:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-cards.c:7223:17: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-cards.c:7224:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-cards.c:7224:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-cards.c:7224:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-cards.c:7428:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-cards.c:7428:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-cards.c:7428:9: sparse:     got restri=
cted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-cards.c:7522:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-cards.c:7522:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-cards.c:7522:17: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-cards.c:7523:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-cards.c:7523:17: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-cards.c:7523:17: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
   drivers/media/pci/saa7134/saa7134-core.c: note: in included file (throug=
h arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h=
, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/media/pci/saa7134/saa7134-core.c:139:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:139:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:139:17: sparse:     got restric=
ted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-core.c:140:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:140:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:140:17: sparse:     got restric=
ted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-core.c:144:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:144:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:144:17: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-core.c:467:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:467:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:467:9: sparse:     got restrict=
ed __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-core.c:468:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:468:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:468:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-core.c:549:17: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:549:17: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:549:17: sparse:     got restric=
ted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-core.c:619:25: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:619:25: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:619:25: sparse:     got restric=
ted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-core.c:624:25: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:624:25: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:624:25: sparse:     got restric=
ted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-core.c:625:25: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:625:25: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:625:25: sparse:     got restric=
ted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-core.c:630:25: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:630:25: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:630:25: sparse:     got restric=
ted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-core.c:631:25: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:631:25: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:631:25: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-core.c:636:25: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:636:25: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:636:25: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-core.c:637:25: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:637:25: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:637:25: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-core.c:652:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:652:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:652:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-core.c:653:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:653:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:653:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-core.c:656:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:656:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:656:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-core.c:685:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:685:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7134/saa7134-core.c:685:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-core.c:686:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-core.c:686:9: sparse:     expected uns=
igned int [usertype] b
--
>> drivers/media/pci/saa7134/saa7134-i2c.c:208:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-i2c.c:208:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-i2c.c:208:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-i2c.c: note: in included file (through=
 arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci.h,=
 ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/media/pci/saa7134/saa7134-i2c.c:208:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-i2c.c:208:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-i2c.c:208:9: sparse:     got restricte=
d __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/media/pci/saa7134/saa7134-i2c.c:208:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-i2c.c:208:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-i2c.c:208:9: sparse:     got restricte=
d __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   In file included from include/linux/init.h:4:0,
                    from drivers/media/pci/saa7134/saa7134-i2c.c:23:
   include/sound/pcm.h: In function 'snd_pcm_chmap_substream':
   include/sound/pcm.h:1244:17: warning: comparison between signed and unsi=
gned integer expressions [-Wsign-compare]
      if (s->number =3D=3D idx)
                    ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   37-                 =
             ^
   include/sound/pcm.h:1244:3: note: in expansion of macro 'if'
      if (s->number =3D=3D idx)
      ^
   include/sound/pcm.h:1244:17: warning: comparison between signed and unsi=
gned integer expressions [-Wsign-compare]
      if (s->number =3D=3D idx)
                    ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   46-                 =
                         ^
   include/sound/pcm.h:1244:3: note: in expansion of macro 'if'
      if (s->number =3D=3D idx)
      ^
   include/sound/pcm.h:1244:17: warning: comparison between signed and unsi=
gned integer expressions [-Wsign-compare]
      if (s->number =3D=3D idx)
                    ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     55-                ^
   include/sound/pcm.h:1244:3: note: in expansion of macro 'if'
      if (s->number =3D=3D idx)
      ^
   In file included from include/linux/if_ether.h:23:0,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:43,
                    from drivers/media/dvb-core/dvb_net.h:26,
                    from include/media/videobuf2-dvb.h:7,
                    from drivers/media/pci/saa7134/saa7134.h:48,
                    from drivers/media/pci/saa7134/saa7134-i2c.c:30:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/linux/init.h:4:0,
                    from drivers/media/pci/saa7134/saa7134-i2c.c:23:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   79-                 =
             ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   91-                 =
                         ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     103-                ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   116-                =
              ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
--
>> drivers/media/pci/saa7134/saa7134-ts.c:57:17: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected unsigned int [use=
rtype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-ts.c:57:17: sparse:     expected unsig=
ned int [usertype] b
   drivers/media/pci/saa7134/saa7134-ts.c:57:17: sparse:     got restricted=
 __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-ts.c:58:17: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected unsigned int [use=
rtype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-ts.c:58:17: sparse:     expected unsig=
ned int [usertype] b
   drivers/media/pci/saa7134/saa7134-ts.c:58:17: sparse:     got restricted=
 __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-ts.c:62:17: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected unsigned int [use=
rtype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-ts.c:62:17: sparse:     expected unsig=
ned int [usertype] b
   drivers/media/pci/saa7134/saa7134-ts.c:62:17: sparse:     got restricted=
 __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-ts.c:63:17: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected unsigned int [use=
rtype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-ts.c:63:17: sparse:     expected unsig=
ned int [usertype] b
   drivers/media/pci/saa7134/saa7134-ts.c:63:17: sparse:     got restricted=
 __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-ts.c:291:9: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected unsigned int [use=
rtype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-ts.c:291:9: sparse:     expected unsig=
ned int [usertype] b
   drivers/media/pci/saa7134/saa7134-ts.c:291:9: sparse:     got restricted=
 __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-ts.c:292:9: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected unsigned int [use=
rtype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-ts.c:292:9: sparse:     expected unsig=
ned int [usertype] b
   drivers/media/pci/saa7134/saa7134-ts.c:292:9: sparse:     got restricted=
 __le32 [usertype]
   In file included from include/linux/init.h:4:0,
                    from drivers/media/pci/saa7134/saa7134-ts.c:23:
   include/sound/pcm.h: In function 'snd_pcm_chmap_substream':
   include/sound/pcm.h:1244:17: warning: comparison between signed and unsi=
gned integer expressions [-Wsign-compare]
      if (s->number =3D=3D idx)
                    ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   27-                 =
             ^
   include/sound/pcm.h:1244:3: note: in expansion of macro 'if'
      if (s->number =3D=3D idx)
      ^
   include/sound/pcm.h:1244:17: warning: comparison between signed and unsi=
gned integer expressions [-Wsign-compare]
      if (s->number =3D=3D idx)
                    ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   36-                 =
                         ^
   include/sound/pcm.h:1244:3: note: in expansion of macro 'if'
      if (s->number =3D=3D idx)
      ^
   include/sound/pcm.h:1244:17: warning: comparison between signed and unsi=
gned integer expressions [-Wsign-compare]
      if (s->number =3D=3D idx)
                    ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     45-                ^
   include/sound/pcm.h:1244:3: note: in expansion of macro 'if'
      if (s->number =3D=3D idx)
      ^
   In file included from include/linux/if_ether.h:23:0,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:43,
                    from drivers/media/dvb-core/dvb_net.h:26,
                    from include/media/videobuf2-dvb.h:7,
                    from drivers/media/pci/saa7134/saa7134.h:48,
                    from drivers/media/pci/saa7134/saa7134-ts.c:30:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/linux/init.h:4:0,
                    from drivers/media/pci/saa7134/saa7134-ts.c:23:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   69-                 =
             ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   81-                 =
                         ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     93-                ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
--
>> drivers/media/pci/saa7134/saa7134-tvaudio.c:179:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-tvaudio.c:179:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-tvaudio.c:179:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-tvaudio.c:180:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-tvaudio.c:180:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-tvaudio.c:180:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-tvaudio.c: note: in included file (thr=
ough arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pc=
i.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-tvaudio.c:248:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-tvaudio.c:248:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-tvaudio.c:248:9: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-tvaudio.c:249:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-tvaudio.c:249:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-tvaudio.c:249:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-tvaudio.c:707:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-tvaudio.c:707:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-tvaudio.c:707:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-tvaudio.c:756:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-tvaudio.c:756:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-tvaudio.c:756:9: sparse:     got restr=
icted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-tvaudio.c:768:17: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned in=
t [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-tvaudio.c:768:17: sparse:     expected=
 unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-tvaudio.c:768:17: sparse:     got rest=
ricted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-tvaudio.c:769:17: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned in=
t [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-tvaudio.c:769:17: sparse:     expected=
 unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-tvaudio.c:769:17: sparse:     got rest=
ricted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-tvaudio.c:884:9: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-tvaudio.c:884:9: sparse:     expected =
unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-tvaudio.c:884:9: sparse:     got restr=
icted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-tvaudio.c:1008:17: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@     expected unsigned i=
nt [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-tvaudio.c:1008:17: sparse:     expecte=
d unsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-tvaudio.c:1008:17: sparse:     got res=
tricted __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
>> drivers/media/pci/saa7134/saa7134-vbi.c:100:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-vbi.c:100:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-vbi.c:100:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-vbi.c:101:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-vbi.c:101:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-vbi.c:101:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-vbi.c:102:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-vbi.c:102:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-vbi.c:102:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-vbi.c:103:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-vbi.c:103:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-vbi.c:103:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-vbi.c:104:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-vbi.c:104:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-vbi.c:104:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-vbi.c:105:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-vbi.c:105:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-vbi.c:105:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-vbi.c:106:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-vbi.c:106:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-vbi.c:106:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-vbi.c:107:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-vbi.c:107:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-vbi.c:107:9: sparse:     got restricte=
d __le32 [usertype]
   In file included from include/linux/init.h:4:0,
                    from drivers/media/pci/saa7134/saa7134-vbi.c:23:
   include/sound/pcm.h: In function 'snd_pcm_chmap_substream':
   include/sound/pcm.h:1244:17: warning: comparison between signed and unsi=
gned integer expressions [-Wsign-compare]
      if (s->number =3D=3D idx)
                    ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   33-                 =
             ^
   include/sound/pcm.h:1244:3: note: in expansion of macro 'if'
      if (s->number =3D=3D idx)
      ^
   include/sound/pcm.h:1244:17: warning: comparison between signed and unsi=
gned integer expressions [-Wsign-compare]
      if (s->number =3D=3D idx)
                    ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   42-                 =
                         ^
   include/sound/pcm.h:1244:3: note: in expansion of macro 'if'
      if (s->number =3D=3D idx)
      ^
   include/sound/pcm.h:1244:17: warning: comparison between signed and unsi=
gned integer expressions [-Wsign-compare]
      if (s->number =3D=3D idx)
                    ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     51-                ^
   include/sound/pcm.h:1244:3: note: in expansion of macro 'if'
      if (s->number =3D=3D idx)
      ^
   In file included from include/linux/if_ether.h:23:0,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:43,
                    from drivers/media/dvb-core/dvb_net.h:26,
                    from include/media/videobuf2-dvb.h:7,
                    from drivers/media/pci/saa7134/saa7134.h:48,
                    from drivers/media/pci/saa7134/saa7134-vbi.c:29:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/linux/init.h:4:0,
                    from drivers/media/pci/saa7134/saa7134-vbi.c:23:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   75-                 =
             ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   87-                 =
                         ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     99-                ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
--
>> drivers/media/pci/saa7134/saa7134-video.c:760:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:760:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:760:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:761:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:761:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:761:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:762:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:762:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:762:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:763:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:763:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:763:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:765:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:765:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:765:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:766:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:766:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:766:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:767:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:767:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:767:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:768:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:768:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:768:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:821:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:821:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:821:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:822:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:822:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:822:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:823:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:823:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:823:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:826:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:826:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:826:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:827:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:827:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:827:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:828:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:828:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:828:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:830:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:830:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:830:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:844:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:844:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:844:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:845:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:845:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:845:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:846:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:846:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:846:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:847:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:847:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:847:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:848:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:848:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:848:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:849:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:849:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:849:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:852:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:852:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:852:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:853:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:853:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:853:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:854:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:854:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:854:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:855:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:855:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:855:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:856:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:856:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:856:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:857:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:857:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:857:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:859:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:859:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:859:17: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7134/saa7134-video.c:860:17: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-video.c:860:17: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7134/saa7134-video.c:860:17: sparse:     got restri=
cted __le32 [usertype]
   In file included from include/linux/init.h:4:0,
                    from drivers/media/pci/saa7134/saa7134-video.c:23:
   include/sound/pcm.h: In function 'snd_pcm_chmap_substream':
   include/sound/pcm.h:1244:17: warning: comparison between signed and unsi=
gned integer expressions [-Wsign-compare]
      if (s->number =3D=3D idx)
                    ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   96-                 =
             ^
   include/sound/pcm.h:1244:3: note: in expansion of macro 'if'
      if (s->number =3D=3D idx)
      ^
   include/sound/pcm.h:1244:17: warning: comparison between signed and unsi=
gned integer expressions [-Wsign-compare]
      if (s->number =3D=3D idx)
--
   drivers/media/pci/saa7134/saa7134-dvb.c: note: in included file (through=
 arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h,=
 ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/media/pci/saa7134/saa7134-dvb.c:100:17: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-dvb.c:100:17: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7134/saa7134-dvb.c:100:17: sparse:     got restrict=
ed __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-dvb.c:101:17: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-dvb.c:101:17: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7134/saa7134-dvb.c:101:17: sparse:     got restrict=
ed __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-dvb.c:105:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-dvb.c:105:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-dvb.c:105:9: sparse:     got restricte=
d __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-dvb.c:106:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-dvb.c:106:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-dvb.c:106:9: sparse:     got restricte=
d __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-dvb.c:109:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-dvb.c:109:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-dvb.c:109:9: sparse:     got restricte=
d __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-dvb.c:110:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-dvb.c:110:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-dvb.c:110:9: sparse:     got restricte=
d __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-dvb.c:112:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-dvb.c:112:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7134/saa7134-dvb.c:112:9: sparse:     got restricte=
d __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7134/saa7134-dvb.c:118:17: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7134/saa7134-dvb.c:118:17: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7134/saa7134-dvb.c:118:17: sparse:     got restrict=
ed __le32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
>> drivers/media/pci/saa7146/mxb.c:380:9: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected unsigned int [usertype] =
b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/mxb.c:380:9: sparse:     expected unsigned int=
 [usertype] b
   drivers/media/pci/saa7146/mxb.c:380:9: sparse:     got restricted __le32=
 [usertype]
   drivers/media/pci/saa7146/mxb.c:444:9: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected unsigned int [usertype] =
b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/mxb.c:444:9: sparse:     expected unsigned int=
 [usertype] b
   drivers/media/pci/saa7146/mxb.c:444:9: sparse:     got restricted __le32=
 [usertype]
   drivers/media/pci/saa7146/mxb.c:445:9: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected unsigned int [usertype] =
b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/mxb.c:445:9: sparse:     expected unsigned int=
 [usertype] b
   drivers/media/pci/saa7146/mxb.c:445:9: sparse:     got restricted __le32=
 [usertype]
   drivers/media/pci/saa7146/mxb.c:446:9: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected unsigned int [usertype] =
b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/mxb.c:446:9: sparse:     expected unsigned int=
 [usertype] b
   drivers/media/pci/saa7146/mxb.c:446:9: sparse:     got restricted __le32=
 [usertype]
   drivers/media/pci/saa7146/mxb.c:773:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/mxb.c:773:17: sparse:     expected unsigned in=
t [usertype] b
   drivers/media/pci/saa7146/mxb.c:773:17: sparse:     got restricted __le3=
2 [usertype]
   drivers/media/pci/saa7146/mxb.c:785:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/mxb.c:785:17: sparse:     expected unsigned in=
t [usertype] b
   drivers/media/pci/saa7146/mxb.c:785:17: sparse:     got restricted __le3=
2 [usertype]
   In file included from include/linux/poll.h:5:0,
                    from include/media/v4l2-dev.h:12,
                    from include/media/v4l2-common.h:29,
                    from include/media/saa7146_vv.h:4,
                    from drivers/media/pci/saa7146/mxb.c:28:
   drivers/media/pci/saa7146/mxb.c: In function 'vidioc_s_audio':
   drivers/media/pci/saa7146/mxb.c:659:24: warning: comparison between sign=
ed and unsigned integer expressions [-Wsign-compare]
     if (mxb->cur_audinput !=3D a->index) {
                           ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   30-                 =
             ^
   drivers/media/pci/saa7146/mxb.c:659:2: note: in expansion of macro 'if'
     if (mxb->cur_audinput !=3D a->index) {
     ^
   drivers/media/pci/saa7146/mxb.c:659:24: warning: comparison between sign=
ed and unsigned integer expressions [-Wsign-compare]
     if (mxb->cur_audinput !=3D a->index) {
                           ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   39-                 =
                         ^
   drivers/media/pci/saa7146/mxb.c:659:2: note: in expansion of macro 'if'
     if (mxb->cur_audinput !=3D a->index) {
     ^
   drivers/media/pci/saa7146/mxb.c:659:24: warning: comparison between sign=
ed and unsigned integer expressions [-Wsign-compare]
     if (mxb->cur_audinput !=3D a->index) {
                           ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     48-                ^
   drivers/media/pci/saa7146/mxb.c:659:2: note: in expansion of macro 'if'
     if (mxb->cur_audinput !=3D a->index) {
     ^
--
>> drivers/media/pci/saa7146/hexium_orion.c:229:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/hexium_orion.c:229:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7146/hexium_orion.c:229:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/saa7146/hexium_orion.c:231:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/hexium_orion.c:231:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7146/hexium_orion.c:231:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/saa7146/hexium_orion.c:232:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/hexium_orion.c:232:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7146/hexium_orion.c:232:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/saa7146/hexium_orion.c:233:9: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned int [u=
sertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/hexium_orion.c:233:9: sparse:     expected uns=
igned int [usertype] b
   drivers/media/pci/saa7146/hexium_orion.c:233:9: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/saa7146/hexium_orion.c: In function 'hexium_init_done':
   drivers/media/pci/saa7146/hexium_orion.c:297:16: warning: comparison bet=
ween signed and unsigned integer expressions [-Wsign-compare]
     for (i =3D 0; i < sizeof(hexium_saa7110); i++) {
                   ^
--
>> drivers/media/pci/saa7146/hexium_gemini.c:271:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/hexium_gemini.c:271:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7146/hexium_gemini.c:271:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/saa7146/hexium_gemini.c:286:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/hexium_gemini.c:286:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7146/hexium_gemini.c:286:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/saa7146/hexium_gemini.c:287:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/hexium_gemini.c:287:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7146/hexium_gemini.c:287:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/saa7146/hexium_gemini.c:288:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7146/hexium_gemini.c:288:9: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7146/hexium_gemini.c:288:9: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/saa7146/hexium_gemini.c: In function 'hexium_init_done=
':
   drivers/media/pci/saa7146/hexium_gemini.c:170:16: warning: comparison be=
tween signed and unsigned integer expressions [-Wsign-compare]
     for (i =3D 0; i < sizeof(hexium_ks0127b); i++) {
                   ^
--
   drivers/media/pci/saa7164/saa7164-core.c:97:18: sparse: sparse: cast rem=
oves address space '<asn:2>' of expression
   drivers/media/pci/saa7164/saa7164-core.c:122:31: sparse: sparse: cast re=
moves address space '<asn:2>' of expression
   drivers/media/pci/saa7164/saa7164-core.c:122:31: sparse: sparse: incorre=
ct type in initializer (different address spaces) @@     expected unsigned =
char [noderef] [usertype] <asn:2> *bufcpu @@     got unsigned char [usertyp=
e] * @@
   drivers/media/pci/saa7164/saa7164-core.c:122:31: sparse:     expected un=
signed char [noderef] [usertype] <asn:2> *bufcpu
   drivers/media/pci/saa7164/saa7164-core.c:122:31: sparse:     got unsigne=
d char [usertype] *
   drivers/media/pci/saa7164/saa7164-core.c:282:44: sparse: sparse: cast re=
moves address space '<asn:2>' of expression
   drivers/media/pci/saa7164/saa7164-core.c:286:38: sparse: sparse: cast re=
moves address space '<asn:2>' of expression
   drivers/media/pci/saa7164/saa7164-core.c:286:35: sparse: sparse: incorre=
ct type in assignment (different address spaces) @@     expected unsigned c=
har [noderef] [usertype] <asn:2> *p @@     got unsigned char [usertype] * @@
   drivers/media/pci/saa7164/saa7164-core.c:286:35: sparse:     expected un=
signed char [noderef] [usertype] <asn:2> *p
   drivers/media/pci/saa7164/saa7164-core.c:286:35: sparse:     got unsigne=
d char [usertype] *
   drivers/media/pci/saa7164/saa7164-core.c:352:44: sparse: sparse: cast re=
moves address space '<asn:2>' of expression
   drivers/media/pci/saa7164/saa7164-core.c:527:53: sparse: sparse: cast re=
moves address space '<asn:2>' of expression
>> drivers/media/pci/saa7164/saa7164-core.c:715:25: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected unsigned int [=
usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-core.c:715:25: sparse:     expected un=
signed int [usertype] b
   drivers/media/pci/saa7164/saa7164-core.c:715:25: sparse:     got restric=
ted __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-core.c:129:30: sparse: sparse: derefer=
ence of noderef expression
   drivers/media/pci/saa7164/saa7164-core.c:133:38: sparse: sparse: derefer=
ence of noderef expression
   drivers/media/pci/saa7164/saa7164-core.c:133:72: sparse: sparse: derefer=
ence of noderef expression
   drivers/media/pci/saa7164/saa7164-core.c:134:35: sparse: sparse: derefer=
ence of noderef expression
   drivers/media/pci/saa7164/saa7164-core.c:287:61: sparse: sparse: derefer=
ence of noderef expression
   drivers/media/pci/saa7164/saa7164-core.c:288:65: sparse: sparse: derefer=
ence of noderef expression
   drivers/media/pci/saa7164/saa7164-core.c:289:65: sparse: sparse: derefer=
ence of noderef expression
   drivers/media/pci/saa7164/saa7164-core.c:290:65: sparse: sparse: derefer=
ence of noderef expression
   drivers/media/pci/saa7164/saa7164-core.c:291:65: sparse: sparse: derefer=
ence of noderef expression
   drivers/media/pci/saa7164/saa7164-core.c:292:65: sparse: sparse: derefer=
ence of noderef expression
   drivers/media/pci/saa7164/saa7164-core.c:293:65: sparse: sparse: derefer=
ence of noderef expression
   drivers/media/pci/saa7164/saa7164-core.c:294:65: sparse: sparse: derefer=
ence of noderef expression
   drivers/media/pci/saa7164/saa7164-core.c: note: in included file (throug=
h arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h=
, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: too many warnings
   In file included from include/linux/if_ether.h:23:0,
                    from include/media/tveeprom.h:15,
                    from drivers/media/pci/saa7164/saa7164.h:56,
                    from drivers/media/pci/saa7164/saa7164-core.c:36:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
--
>> drivers/media/pci/saa7164/saa7164-fw.c:123:9: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected unsigned int [use=
rtype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-fw.c:123:9: sparse:     expected unsig=
ned int [usertype] b
   drivers/media/pci/saa7164/saa7164-fw.c:123:9: sparse:     got restricted=
 __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-fw.c:129:9: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected unsigned int [use=
rtype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-fw.c:129:9: sparse:     expected unsig=
ned int [usertype] b
   drivers/media/pci/saa7164/saa7164-fw.c:129:9: sparse:     got restricted=
 __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-fw.c:142:17: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-fw.c:142:17: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7164/saa7164-fw.c:142:17: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-fw.c:148:17: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-fw.c:148:17: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7164/saa7164-fw.c:148:17: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-fw.c:160:9: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected unsigned int [use=
rtype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-fw.c:160:9: sparse:     expected unsig=
ned int [usertype] b
   drivers/media/pci/saa7164/saa7164-fw.c:160:9: sparse:     got restricted=
 __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-fw.c:165:9: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected unsigned int [use=
rtype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-fw.c:165:9: sparse:     expected unsig=
ned int [usertype] b
   drivers/media/pci/saa7164/saa7164-fw.c:165:9: sparse:     got restricted=
 __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-fw.c:402:17: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-fw.c:402:17: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7164/saa7164-fw.c:402:17: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-fw.c:549:52: sparse: sparse: incorrect=
 type in argument 5 (different address spaces) @@     expected unsigned cha=
r [usertype] *dst @@     got unsigned char [noderef] [usertype] <asn:2> * @@
   drivers/media/pci/saa7164/saa7164-fw.c:549:52: sparse:     expected unsi=
gned char [usertype] *dst
   drivers/media/pci/saa7164/saa7164-fw.c:549:52: sparse:     got unsigned =
char [noderef] [usertype] <asn:2> *
   drivers/media/pci/saa7164/saa7164-fw.c:580:44: sparse: sparse: incorrect=
 type in argument 5 (different address spaces) @@     expected unsigned cha=
r [usertype] *dst @@     got unsigned char [noderef] [usertype] <asn:2> * @@
   drivers/media/pci/saa7164/saa7164-fw.c:580:44: sparse:     expected unsi=
gned char [usertype] *dst
   drivers/media/pci/saa7164/saa7164-fw.c:580:44: sparse:     got unsigned =
char [noderef] [usertype] <asn:2> *
   drivers/media/pci/saa7164/saa7164-fw.c:598:44: sparse: sparse: incorrect=
 type in argument 5 (different address spaces) @@     expected unsigned cha=
r [usertype] *dst @@     got unsigned char [noderef] [usertype] <asn:2> * @@
   drivers/media/pci/saa7164/saa7164-fw.c:598:44: sparse:     expected unsi=
gned char [usertype] *dst
   drivers/media/pci/saa7164/saa7164-fw.c:598:44: sparse:     got unsigned =
char [noderef] [usertype] <asn:2> *
   drivers/media/pci/saa7164/saa7164-fw.c: note: in included file (through =
arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci.h, =
...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
   drivers/media/pci/saa7164/saa7164-bus.c:36:36: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/media/pci/saa7164/saa7164-bus.c:41:36: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/media/pci/saa7164/saa7164-bus.c:151:19: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned short =
[usertype] size @@     got restricted __le16 [usertype] @@
   drivers/media/pci/saa7164/saa7164-bus.c:151:19: sparse:     expected uns=
igned short [usertype] size
   drivers/media/pci/saa7164/saa7164-bus.c:151:19: sparse:     got restrict=
ed __le16 [usertype]
   drivers/media/pci/saa7164/saa7164-bus.c:152:22: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] command @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-bus.c:152:22: sparse:     expected uns=
igned int [usertype] command
   drivers/media/pci/saa7164/saa7164-bus.c:152:22: sparse:     got restrict=
ed __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-bus.c:153:30: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned short =
[usertype] controlselector @@     got restricted __le16 [usertype] @@
   drivers/media/pci/saa7164/saa7164-bus.c:153:30: sparse:     expected uns=
igned short [usertype] controlselector
   drivers/media/pci/saa7164/saa7164-bus.c:153:30: sparse:     got restrict=
ed __le16 [usertype]
   drivers/media/pci/saa7164/saa7164-bus.c:172:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:172:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:172:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:172:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:172:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:172:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c: note: in included file (through=
 arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci.h,=
 ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:173:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:173:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:173:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:173:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:173:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:173:20: sparse: sparse: cast to =
restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:206:28: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:206:28: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:206:28: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:206:28: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:206:28: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:206:28: sparse: sparse: cast to =
restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/media/pci/saa7164/saa7164-bus.c:287:9: sparse: sparse: cast from=
 restricted __le32
>> drivers/media/pci/saa7164/saa7164-bus.c:287:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] val @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-bus.c:287:9: sparse:     expected unsi=
gned int [usertype] val
   drivers/media/pci/saa7164/saa7164-bus.c:287:9: sparse:     got restricte=
d __le32 [usertype]
>> drivers/media/pci/saa7164/saa7164-bus.c:287:9: sparse: sparse: cast from=
 restricted __le32
>> drivers/media/pci/saa7164/saa7164-bus.c:287:9: sparse: sparse: cast from=
 restricted __le32
>> drivers/media/pci/saa7164/saa7164-bus.c:287:9: sparse: sparse: cast from=
 restricted __le32
>> drivers/media/pci/saa7164/saa7164-bus.c:287:9: sparse: sparse: cast from=
 restricted __le32
>> drivers/media/pci/saa7164/saa7164-bus.c:287:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-bus.c:287:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7164/saa7164-bus.c:287:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-bus.c:339:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:339:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:339:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:339:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:339:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:339:20: sparse: sparse: cast to =
restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:340:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:340:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:340:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:340:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:340:20: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:340:20: sparse: sparse: cast to =
restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:463:9: sparse: sparse: cast from=
 restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:463:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] val @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-bus.c:463:9: sparse:     expected unsi=
gned int [usertype] val
   drivers/media/pci/saa7164/saa7164-bus.c:463:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-bus.c:463:9: sparse: sparse: cast from=
 restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:463:9: sparse: sparse: cast from=
 restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:463:9: sparse: sparse: cast from=
 restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:463:9: sparse: sparse: cast from=
 restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:463:9: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-bus.c:463:9: sparse:     expected unsi=
gned int [usertype] b
   drivers/media/pci/saa7164/saa7164-bus.c:463:9: sparse:     got restricte=
d __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-bus.c:466:21: sparse: sparse: cast to =
restricted __le16
   drivers/media/pci/saa7164/saa7164-bus.c:466:21: sparse: sparse: cast to =
restricted __le16
   drivers/media/pci/saa7164/saa7164-bus.c:466:21: sparse: sparse: cast to =
restricted __le16
   drivers/media/pci/saa7164/saa7164-bus.c:466:21: sparse: sparse: cast to =
restricted __le16
   drivers/media/pci/saa7164/saa7164-bus.c:467:24: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:467:24: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:467:24: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:467:24: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:467:24: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:467:24: sparse: sparse: cast to =
restricted __le32
   drivers/media/pci/saa7164/saa7164-bus.c:468:32: sparse: sparse: cast to =
restricted __le16
   drivers/media/pci/saa7164/saa7164-bus.c:468:32: sparse: sparse: cast to =
restricted __le16
   drivers/media/pci/saa7164/saa7164-bus.c:468:32: sparse: sparse: cast to =
restricted __le16
   drivers/media/pci/saa7164/saa7164-bus.c:468:32: sparse: sparse: cast to =
restricted __le16
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: too many warnings
   In file included from include/linux/if_ether.h:23:0,
                    from include/media/tveeprom.h:15,
                    from drivers/media/pci/saa7164/saa7164.h:56,
                    from drivers/media/pci/saa7164/saa7164-bus.c:22:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/mod_devicetable.h:11,
                    from include/linux/pci.h:20,
                    from drivers/media/pci/saa7164/saa7164.h:47,
                    from drivers/media/pci/saa7164/saa7164-bus.c:22:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   139-                =
              ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   151-                =
                          ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
--
   drivers/media/pci/saa7164/saa7164-buffer.c:122:18: sparse: sparse: incor=
rect type in assignment (different address spaces) @@     expected unsigned=
 long long [noderef] [usertype] <asn:2> *cpu @@     got void * @@
   drivers/media/pci/saa7164/saa7164-buffer.c:122:18: sparse:     expected =
unsigned long long [noderef] [usertype] <asn:2> *cpu
   drivers/media/pci/saa7164/saa7164-buffer.c:122:18: sparse:     got void *
   drivers/media/pci/saa7164/saa7164-buffer.c:127:21: sparse: sparse: incor=
rect type in assignment (different address spaces) @@     expected unsigned=
 long long [noderef] [usertype] <asn:2> *pt_cpu @@     got void * @@
   drivers/media/pci/saa7164/saa7164-buffer.c:127:21: sparse:     expected =
unsigned long long [noderef] [usertype] <asn:2> *pt_cpu
   drivers/media/pci/saa7164/saa7164-buffer.c:127:21: sparse:     got void *
   drivers/media/pci/saa7164/saa7164-buffer.c:134:20: sparse: sparse: cast =
removes address space '<asn:2>' of expression
   drivers/media/pci/saa7164/saa7164-buffer.c:156:63: sparse: sparse: incor=
rect type in argument 3 (different address spaces) @@     expected void *va=
ddr @@     got unsigned long long [noderef] [usertype] <asn:2> *cpu @@
   drivers/media/pci/saa7164/saa7164-buffer.c:156:63: sparse:     expected =
void *vaddr
   drivers/media/pci/saa7164/saa7164-buffer.c:156:63: sparse:     got unsig=
ned long long [noderef] [usertype] <asn:2> *cpu
   drivers/media/pci/saa7164/saa7164-buffer.c:179:57: sparse: sparse: incor=
rect type in argument 3 (different address spaces) @@     expected void *va=
ddr @@     got unsigned long long [noderef] [usertype] <asn:2> *cpu @@
   drivers/media/pci/saa7164/saa7164-buffer.c:179:57: sparse:     expected =
void *vaddr
   drivers/media/pci/saa7164/saa7164-buffer.c:179:57: sparse:     got unsig=
ned long long [noderef] [usertype] <asn:2> *cpu
   drivers/media/pci/saa7164/saa7164-buffer.c:180:56: sparse: sparse: incor=
rect type in argument 3 (different address spaces) @@     expected void *va=
ddr @@     got unsigned long long [noderef] [usertype] <asn:2> *pt_cpu @@
   drivers/media/pci/saa7164/saa7164-buffer.c:180:56: sparse:     expected =
void *vaddr
   drivers/media/pci/saa7164/saa7164-buffer.c:180:56: sparse:     got unsig=
ned long long [noderef] [usertype] <asn:2> *pt_cpu
>> drivers/media/pci/saa7164/saa7164-buffer.c:196:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-buffer.c:196:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7164/saa7164-buffer.c:196:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-buffer.c:217:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-buffer.c:217:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7164/saa7164-buffer.c:217:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-buffer.c:218:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-buffer.c:218:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7164/saa7164-buffer.c:218:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-buffer.c:219:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-buffer.c:219:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7164/saa7164-buffer.c:219:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-buffer.c:245:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-buffer.c:245:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7164/saa7164-buffer.c:245:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-buffer.c:246:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-buffer.c:246:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7164/saa7164-buffer.c:246:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-buffer.c:247:9: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/saa7164/saa7164-buffer.c:247:9: sparse:     expected u=
nsigned int [usertype] b
   drivers/media/pci/saa7164/saa7164-buffer.c:247:9: sparse:     got restri=
cted __le32 [usertype]
   drivers/media/pci/saa7164/saa7164-buffer.c:84:17: sparse: sparse: derefe=
rence of noderef expression
   drivers/media/pci/saa7164/saa7164-buffer.c:84:17: sparse: sparse: derefe=
rence of noderef expression
   drivers/media/pci/saa7164/saa7164-buffer.c:147:31: sparse: sparse: deref=
erence of noderef expression
   drivers/media/pci/saa7164/saa7164-buffer.c:148:17: sparse: sparse: deref=
erence of noderef expression
   drivers/media/pci/saa7164/saa7164-buffer.c:148:17: sparse: sparse: deref=
erence of noderef expression
   drivers/media/pci/saa7164/saa7164-buffer.c: note: in included file (thro=
ugh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci=
.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   In file included from include/linux/if_ether.h:23:0,
                    from include/media/tveeprom.h:15,
                    from drivers/media/pci/saa7164/saa7164.h:56,
                    from drivers/media/pci/saa7164/saa7164-buffer.c:24:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/preempt.h:9,
                    from include/linux/spinlock.h:50,
                    from include/linux/mmzone.h:7,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:14,
                    from drivers/media/pci/saa7164/saa7164-buffer.c:22:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   101-                =
              ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   113-                =
                          ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
--
>> drivers/media/pci/ttpci/av7110_hw.c:71:9: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:71:9: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:71:9: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:73:17: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:73:17: sparse:     expected unsigned=
 int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:73:17: sparse:     got restricted __=
le32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:75:17: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:75:17: sparse:     expected unsigned=
 int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:75:17: sparse:     got restricted __=
le32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:76:9: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:76:9: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:76:9: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:77:9: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:77:9: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:77:9: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:94:9: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:94:9: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:94:9: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:95:9: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:95:9: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:95:9: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:97:9: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:97:9: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:97:9: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:98:9: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:98:9: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:98:9: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:225:9: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:225:9: sparse:     expected unsigned=
 int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:225:9: sparse:     got restricted __=
le32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:228:9: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:228:9: sparse:     expected unsigned=
 int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:228:9: sparse:     got restricted __=
le32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:229:9: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:229:9: sparse:     expected unsigned=
 int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:229:9: sparse:     got restricted __=
le32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:230:9: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:230:9: sparse:     expected unsigned=
 int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:230:9: sparse:     got restricted __=
le32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c:295:9: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_hw.c:295:9: sparse:     expected unsigned=
 int [usertype] b
   drivers/media/pci/ttpci/av7110_hw.c:295:9: sparse:     got restricted __=
le32 [usertype]
   drivers/media/pci/ttpci/av7110_hw.c: note: in included file (through arc=
h/microblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...=
):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/ttpci/av7110_hw.c: note: in included file (through inc=
lude/media/saa7146_vv.h, drivers/media/pci/ttpci/av7110.h):
   include/media/saa7146.h:459:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   include/media/saa7146.h:459:9: sparse:     expected unsigned int [userty=
pe] b
   include/media/saa7146.h:459:9: sparse:     got restricted __le32 [userty=
pe]
   drivers/media/pci/ttpci/av7110_hw.c: note: in included file (through arc=
h/microblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...=
):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/ttpci/av7110_hw.c: note: in included file (through inc=
lude/media/saa7146_vv.h, drivers/media/pci/ttpci/av7110.h):
>> include/media/saa7146.h:467:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   include/media/saa7146.h:467:9: sparse:     expected unsigned int [userty=
pe] b
   include/media/saa7146.h:467:9: sparse:     got restricted __le32 [userty=
pe]
   drivers/media/pci/ttpci/av7110_hw.c: note: in included file (through arc=
h/microblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...=
):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   cc1: warning: drivers/media/dvb-core/: No such file or directory [-Wmiss=
ing-include-dirs]
   cc1: warning: drivers/media/dvb-frontends/: No such file or directory [-=
Wmissing-include-dirs]
   cc1: warning: drivers/media/tuners: No such file or directory [-Wmissing=
-include-dirs]
   In file included from include/linux/if_ether.h:23:0,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:43,
                    from drivers/media/pci/ttpci/av7110.h:6,
                    from drivers/media/pci/ttpci/av7110_hw.c:38:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from drivers/media/pci/ttpci/av7110_hw.c:32:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   109-                =
              ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   121-                =
                          ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     133-                ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   146-                =
              ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   155-                =
                          ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     164-                ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   drivers/media/pci/ttpci/av7110_hw.c: In function 'waitdebi':
   drivers/media/pci/ttpci/av7110_hw.c:143:45: warning: comparison between =
signed and unsigned integer expressions [-Wsign-compare]
      if (irdebi(av7110, DEBINOSWAP, adr, 0, 2) =3D=3D state)
                                                ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   174-                =
              ^
--
>> drivers/media/pci/ttpci/av7110_v4l.c:798:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int [usert=
ype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_v4l.c:798:9: sparse:     expected unsigne=
d int [usertype] b
   drivers/media/pci/ttpci/av7110_v4l.c:798:9: sparse:     got restricted _=
_le32 [usertype]
   drivers/media/pci/ttpci/av7110_v4l.c:799:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int [usert=
ype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_v4l.c:799:9: sparse:     expected unsigne=
d int [usertype] b
   drivers/media/pci/ttpci/av7110_v4l.c:799:9: sparse:     got restricted _=
_le32 [usertype]
   drivers/media/pci/ttpci/av7110_v4l.c:800:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int [usert=
ype] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110_v4l.c:800:9: sparse:     expected unsigne=
d int [usertype] b
   drivers/media/pci/ttpci/av7110_v4l.c:800:9: sparse:     got restricted _=
_le32 [usertype]
   cc1: warning: drivers/media/dvb-core/: No such file or directory [-Wmiss=
ing-include-dirs]
   cc1: warning: drivers/media/dvb-frontends/: No such file or directory [-=
Wmissing-include-dirs]
   cc1: warning: drivers/media/tuners: No such file or directory [-Wmissing=
-include-dirs]
   In file included from include/linux/if_ether.h:23:0,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:43,
                    from drivers/media/pci/ttpci/av7110.h:6,
                    from drivers/media/pci/ttpci/av7110_v4l.c:37:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from drivers/media/pci/ttpci/av7110_v4l.c:30:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   32-                 =
             ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   44-                 =
                         ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     56-                ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   69-                 =
             ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   78-                 =
                         ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     87-                ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   drivers/media/pci/ttpci/av7110_v4l.c: In function 'av7110_vbi_write':
   drivers/media/pci/ttpci/av7110_v4l.c:638:23: warning: signed and unsigne=
d type in conditional expression [-Wsign-compare]
     return (rc < 0) ? rc : count;
                          ^
--
>> drivers/media/pci/ttpci/av7110.c:1215:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:1215:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/ttpci/av7110.c:1215:9: sparse:     got restricted __le=
32 [usertype]
   drivers/media/pci/ttpci/av7110.c:1217:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:1217:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/ttpci/av7110.c:1217:9: sparse:     got restricted __le=
32 [usertype]
   drivers/media/pci/ttpci/av7110.c:1229:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:1229:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/ttpci/av7110.c:1229:9: sparse:     got restricted __le=
32 [usertype]
   drivers/media/pci/ttpci/av7110.c:1231:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:1231:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/ttpci/av7110.c:1231:9: sparse:     got restricted __le=
32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2401:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2401:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2401:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2407:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2407:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2407:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2409:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2409:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2409:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2410:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2410:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2410:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2411:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2411:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2411:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2423:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2423:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2423:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2425:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2425:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2425:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2449:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2449:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2449:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2451:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2451:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2451:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2465:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2465:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2465:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2493:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2493:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/ttpci/av7110.c:2493:9: sparse:     got restricted __le=
32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2526:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2526:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2526:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2527:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2527:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2527:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2529:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2529:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2529:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2530:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2530:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2530:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2532:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2532:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2532:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2533:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2533:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2533:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c: note: in included file (through arch/m=
icroblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/ttpci/av7110.c:2536:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2536:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2536:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2537:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2537:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2537:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2538:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2538:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2538:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2539:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2539:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2539:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2540:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2540:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2540:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2541:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2541:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2541:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2542:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2542:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2542:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2543:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2543:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2543:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2554:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2554:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2554:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2555:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2555:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2555:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2557:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
--
   drivers/media/pci/ttpci/av7110.c:2562:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2562:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2562:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2563:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2563:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2563:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2564:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2564:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2564:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2566:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2566:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2566:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2567:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2567:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2567:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2570:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2570:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2570:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2571:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2571:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2571:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2611:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2611:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2611:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2620:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2620:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2620:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2623:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2623:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2623:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2628:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2628:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2628:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2629:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2629:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2629:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2632:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2632:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2632:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2633:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2633:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2633:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2634:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2634:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2634:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2637:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2637:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2637:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2638:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2638:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2638:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2778:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2778:25: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2778:25: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2782:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2782:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2782:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2784:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2784:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2784:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2799:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected unsigned int [usertype=
] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2799:9: sparse:     expected unsigned i=
nt [usertype] b
   drivers/media/pci/ttpci/av7110.c:2799:9: sparse:     got restricted __le=
32 [usertype]
   drivers/media/pci/ttpci/av7110.c:2852:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:2852:17: sparse:     expected unsigned =
int [usertype] b
   drivers/media/pci/ttpci/av7110.c:2852:17: sparse:     got restricted __l=
e32 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/ttpci/av7110.c:373:9: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 b @@     got restricted __le32 [usertype] @@
   drivers/media/pci/ttpci/av7110.c:373:9: sparse:     expected unsigned in=
t [usertype] b
   drivers/media/pci/ttpci/av7110.c:373:9: sparse:     got restricted __le3=
2 [usertype]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/media/pci/ttpci/av7110.c: note: in included file (through includ=
e/media/saa7146_vv.h, drivers/media/pci/ttpci/av7110.h):
>> include/media/saa7146.h:467:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   include/media/saa7146.h:467:9: sparse:     expected unsigned int [userty=
pe] b
   include/media/saa7146.h:467:9: sparse:     got restricted __le32 [userty=
pe]
   drivers/media/pci/ttpci/av7110.c: note: in included file (through arch/m=
icroblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: too many warnings
   cc1: warning: drivers/media/dvb-core/: No such file or directory [-Wmiss=
ing-include-dirs]
   cc1: warning: drivers/media/dvb-frontends/: No such file or directory [-=
Wmissing-include-dirs]
   cc1: warning: drivers/media/tuners: No such file or directory [-Wmissing=
-include-dirs]
   In file included from include/linux/if_ether.h:23:0,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:43,
                    from drivers/media/pci/ttpci/av7110.h:6,
                    from drivers/media/pci/ttpci/av7110.c:62:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from include/linux/module.h:9,
                    from drivers/media/pci/ttpci/av7110.c:33:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   251-                =
              ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   263-                =
                          ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     275-                ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   288-                =
              ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   297-                =
                          ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     306-                ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   drivers/media/pci/ttpci/av7110.c: In function 'DvbDmxFilterCallback':
   drivers/media/pci/ttpci/av7110.c:316:54: warning: comparison between sig=
ned and unsigned integer expressions [-Wsign-compare]
      if ((((buffer1[1] << 8) | buffer1[2]) & 0xfff) + 3 !=3D buffer1_len)
                                                         ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   316-                =
              ^
--
   drivers/media/v4l2-core/videobuf2-vmalloc.c:95:28: sparse: sparse: incor=
rect type in assignment (different address spaces) @@     expected void *va=
ddr @@     got void [noderef] <asn:2> * @@
   drivers/media/v4l2-core/videobuf2-vmalloc.c:95:28: sparse:     expected =
void *vaddr
   drivers/media/v4l2-core/videobuf2-vmalloc.c:95:28: sparse:     got void =
[noderef] <asn:2> *
>> drivers/media/v4l2-core/videobuf2-vmalloc.c:155:28: sparse: sparse: inco=
rrect type in argument 1 (different address spaces) @@     expected void [n=
oderef] <asn:2> *addr @@     got void *vaddr @@
   drivers/media/v4l2-core/videobuf2-vmalloc.c:155:28: sparse:     expected=
 void [noderef] <asn:2> *addr
   drivers/media/v4l2-core/videobuf2-vmalloc.c:155:28: sparse:     got void=
 *vaddr
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/io.h:21,
                    from drivers/media/v4l2-core/videobuf2-vmalloc.c:13:
   drivers/media/v4l2-core/videobuf2-vmalloc.c: In function 'vb2_vmalloc_ge=
t_userptr':
   drivers/media/v4l2-core/videobuf2-vmalloc.c:112:15: warning: comparison =
between signed and unsigned integer expressions [-Wsign-compare]
      if (n_pages !=3D buf->n_pages)
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   20-                 =
             ^
   drivers/media/v4l2-core/videobuf2-vmalloc.c:112:3: note: in expansion of=
 macro 'if'
      if (n_pages !=3D buf->n_pages)
      ^
   drivers/media/v4l2-core/videobuf2-vmalloc.c:112:15: warning: comparison =
between signed and unsigned integer expressions [-Wsign-compare]
      if (n_pages !=3D buf->n_pages)
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   29-                 =
                         ^
   drivers/media/v4l2-core/videobuf2-vmalloc.c:112:3: note: in expansion of=
 macro 'if'
      if (n_pages !=3D buf->n_pages)
      ^
   drivers/media/v4l2-core/videobuf2-vmalloc.c:112:15: warning: comparison =
between signed and unsigned integer expressions [-Wsign-compare]
      if (n_pages !=3D buf->n_pages)
                  ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     38-                ^
   drivers/media/v4l2-core/videobuf2-vmalloc.c:112:3: note: in expansion of=
 macro 'if'
      if (n_pages !=3D buf->n_pages)
      ^
--
>> drivers/mtd/onenand/onenand_base.c:185:9: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short [usert=
ype] b @@     got restricted __le16 [usertype] @@
   drivers/mtd/onenand/onenand_base.c:185:9: sparse:     expected unsigned =
short [usertype] b
   drivers/mtd/onenand/onenand_base.c:185:9: sparse:     got restricted __l=
e16 [usertype]
   drivers/mtd/onenand/onenand_base.c:751:34: sparse: sparse: incorrect typ=
e in argument 2 (different address spaces) @@     expected void const * @@ =
    got void [noderef] <asn:2> * @@
   drivers/mtd/onenand/onenand_base.c:751:34: sparse:     expected void con=
st *
   drivers/mtd/onenand/onenand_base.c:751:34: sparse:     got void [noderef=
] <asn:2> *
   drivers/mtd/onenand/onenand_base.c:789:34: sparse: sparse: incorrect typ=
e in argument 2 (different address spaces) @@     expected void const * @@ =
    got void [noderef] <asn:2> * @@
   drivers/mtd/onenand/onenand_base.c:789:34: sparse:     expected void con=
st *
   drivers/mtd/onenand/onenand_base.c:789:34: sparse:     got void [noderef=
] <asn:2> *
   drivers/mtd/onenand/onenand_base.c:832:26: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void * @@     go=
t void [noderef] <asn:2> * @@
   drivers/mtd/onenand/onenand_base.c:832:26: sparse:     expected void *
   drivers/mtd/onenand/onenand_base.c:832:26: sparse:     got void [noderef=
] <asn:2> *
   drivers/mtd/onenand/onenand_base.c: note: in included file (through arch=
/microblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from drivers/mtd/onenand/onenand_base.c:23:
   drivers/mtd/onenand/onenand_base.c: In function 'flexonenand_addr':
   drivers/mtd/onenand/onenand_base.c:311:36: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
     if (ONENAND_IS_DDP(this) && block >=3D this->density_mask) {
                                       ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   27-                 =
             ^
   drivers/mtd/onenand/onenand_base.c:311:2: note: in expansion of macro 'i=
f'
     if (ONENAND_IS_DDP(this) && block >=3D this->density_mask) {
     ^
   drivers/mtd/onenand/onenand_base.c:311:36: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
     if (ONENAND_IS_DDP(this) && block >=3D this->density_mask) {
                                       ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   36-                 =
                         ^
   drivers/mtd/onenand/onenand_base.c:311:2: note: in expansion of macro 'i=
f'
     if (ONENAND_IS_DDP(this) && block >=3D this->density_mask) {
     ^
   drivers/mtd/onenand/onenand_base.c:311:36: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
     if (ONENAND_IS_DDP(this) && block >=3D this->density_mask) {
                                       ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     45-                ^
   drivers/mtd/onenand/onenand_base.c:311:2: note: in expansion of macro 'i=
f'
     if (ONENAND_IS_DDP(this) && block >=3D this->density_mask) {
     ^
   drivers/mtd/onenand/onenand_base.c: In function 'flexonenand_region':
   drivers/mtd/onenand/onenand_base.c:354:12: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
      if (addr < mtd->eraseregions[i].offset)
               ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   55-                 =
             ^
   drivers/mtd/onenand/onenand_base.c:354:3: note: in expansion of macro 'i=
f'
      if (addr < mtd->eraseregions[i].offset)
      ^
   drivers/mtd/onenand/onenand_base.c:354:12: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
      if (addr < mtd->eraseregions[i].offset)
               ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   64-                 =
                         ^
   drivers/mtd/onenand/onenand_base.c:354:3: note: in expansion of macro 'i=
f'
      if (addr < mtd->eraseregions[i].offset)
      ^
   drivers/mtd/onenand/onenand_base.c:354:12: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
      if (addr < mtd->eraseregions[i].offset)
               ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     73-                ^
   drivers/mtd/onenand/onenand_base.c:354:3: note: in expansion of macro 'i=
f'
      if (addr < mtd->eraseregions[i].offset)
      ^
   drivers/mtd/onenand/onenand_base.c: In function 'onenand_transfer_auto_o=
ob':
   drivers/mtd/onenand/onenand_base.c:1046:20: warning: comparison between =
signed and unsigned integer expressions [-Wsign-compare]
      if (free->offset < readend && free_end > readcol) {
                       ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   83-                 =
             ^
   drivers/mtd/onenand/onenand_base.c:1046:3: note: in expansion of macro '=
if'
      if (free->offset < readend && free_end > readcol) {
      ^
   drivers/mtd/onenand/onenand_base.c:1046:20: warning: comparison between =
signed and unsigned integer expressions [-Wsign-compare]
      if (free->offset < readend && free_end > readcol) {
                       ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   92-                 =
                         ^
   drivers/mtd/onenand/onenand_base.c:1046:3: note: in expansion of macro '=
if'
      if (free->offset < readend && free_end > readcol) {
      ^
   drivers/mtd/onenand/onenand_base.c:1046:20: warning: comparison between =
signed and unsigned integer expressions [-Wsign-compare]
      if (free->offset < readend && free_end > readcol) {
                       ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     101-                ^
--
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
>> drivers/net/can/grcan.c:324:16: sparse: sparse: cast to restricted __be32
>> drivers/net/can/grcan.c:329:9: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __be32 [usertype] @@
   drivers/net/can/grcan.c:329:9: sparse:     expected unsigned int [userty=
pe] b
   drivers/net/can/grcan.c:329:9: sparse:     got restricted __be32 [userty=
pe]
   In file included from include/linux/if_ether.h:23:0,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:43,
                    from drivers/net/can/grcan.c:32:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from drivers/net/can/grcan.c:29:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   184-                =
              ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   196-                =
                          ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     208-                ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   221-                =
              ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   230-                =
                          ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     239-                ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
--
>> drivers/net/can/c_can/c_can_pci.c:59:9: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned short [usertyp=
e] b @@     got restricted __le16 [usertype] @@
   drivers/net/can/c_can/c_can_pci.c:59:9: sparse:     expected unsigned sh=
ort [usertype] b
   drivers/net/can/c_can/c_can_pci.c:59:9: sparse:     got restricted __le1=
6 [usertype]
   drivers/net/can/c_can/c_can_pci.c:71:9: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned short [usertyp=
e] b @@     got restricted __le16 [usertype] @@
   drivers/net/can/c_can/c_can_pci.c:71:9: sparse:     expected unsigned sh=
ort [usertype] b
   drivers/net/can/c_can/c_can_pci.c:71:9: sparse:     got restricted __le1=
6 [usertype]
>> drivers/net/can/c_can/c_can_pci.c:83:9: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 b @@     got restricted __le32 [usertype] @@
   drivers/net/can/c_can/c_can_pci.c:83:9: sparse:     expected unsigned in=
t [usertype] b
   drivers/net/can/c_can/c_can_pci.c:83:9: sparse:     got restricted __le3=
2 [usertype]
   drivers/net/can/c_can/c_can_pci.c:109:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/net/can/c_can/c_can_pci.c:109:17: sparse:     expected unsigned =
int [usertype] b
   drivers/net/can/c_can/c_can_pci.c:109:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/net/can/c_can/c_can_pci.c:110:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/net/can/c_can/c_can_pci.c:110:17: sparse:     expected unsigned =
int [usertype] b
   drivers/net/can/c_can/c_can_pci.c:110:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/net/can/c_can/c_can_pci.c: note: in included file (through arch/=
microblaze/include/asm/io.h, include/linux/scatterlist.h, include/linux/dma=
engine.h, ...):
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   In file included from include/linux/if_ether.h:23:0,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:43,
                    from drivers/net/can/c_can/c_can_pci.c:15:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from drivers/net/can/c_can/c_can_pci.c:13:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   49-                 =
             ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   61-                 =
                         ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     73-                ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   86-                 =
             ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   95-                 =
                         ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     104-                ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
--
>> drivers/phy/phy-bcm-kona-usb2.c:55:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned int [usertype] b=
 @@     got restricted __le32 [usertype] @@
   drivers/phy/phy-bcm-kona-usb2.c:55:9: sparse:     expected unsigned int =
[usertype] b
   drivers/phy/phy-bcm-kona-usb2.c:55:9: sparse:     got restricted __le32 =
[usertype]
   drivers/phy/phy-bcm-kona-usb2.c:67:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned int [usertype] b=
 @@     got restricted __le32 [usertype] @@
   drivers/phy/phy-bcm-kona-usb2.c:67:9: sparse:     expected unsigned int =
[usertype] b
   drivers/phy/phy-bcm-kona-usb2.c:67:9: sparse:     got restricted __le32 =
[usertype]
   drivers/phy/phy-bcm-kona-usb2.c:68:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned int [usertype] b=
 @@     got restricted __le32 [usertype] @@
   drivers/phy/phy-bcm-kona-usb2.c:68:9: sparse:     expected unsigned int =
[usertype] b
   drivers/phy/phy-bcm-kona-usb2.c:68:9: sparse:     got restricted __le32 =
[usertype]
   drivers/phy/phy-bcm-kona-usb2.c:71:9: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned int [usertype] b=
 @@     got restricted __le32 [usertype] @@
   drivers/phy/phy-bcm-kona-usb2.c:71:9: sparse:     expected unsigned int =
[usertype] b
   drivers/phy/phy-bcm-kona-usb2.c:71:9: sparse:     got restricted __le32 =
[usertype]
   drivers/phy/phy-bcm-kona-usb2.c: note: in included file (through arch/mi=
croblaze/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
   drivers/uio/uio_mf624.c: note: in included file (through arch/microblaze=
/include/asm/io.h, include/linux/io.h, include/linux/pci.h):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
>> drivers/uio/uio_mf624.c:52:17: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   drivers/uio/uio_mf624.c:52:17: sparse:     expected unsigned int [userty=
pe] b
   drivers/uio/uio_mf624.c:52:17: sparse:     got restricted __le32 [userty=
pe]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/uio/uio_mf624.c:58:17: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   drivers/uio/uio_mf624.c:58:17: sparse:     expected unsigned int [userty=
pe] b
   drivers/uio/uio_mf624.c:58:17: sparse:     got restricted __le32 [userty=
pe]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/uio/uio_mf624.c:65:17: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   drivers/uio/uio_mf624.c:65:17: sparse:     expected unsigned int [userty=
pe] b
   drivers/uio/uio_mf624.c:65:17: sparse:     got restricted __le32 [userty=
pe]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/uio/uio_mf624.c:80:17: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   drivers/uio/uio_mf624.c:80:17: sparse:     expected unsigned int [userty=
pe] b
   drivers/uio/uio_mf624.c:80:17: sparse:     got restricted __le32 [userty=
pe]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/uio/uio_mf624.c:86:17: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   drivers/uio/uio_mf624.c:86:17: sparse:     expected unsigned int [userty=
pe] b
   drivers/uio/uio_mf624.c:86:17: sparse:     got restricted __le32 [userty=
pe]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/uio/uio_mf624.c:93:17: sparse: sparse: incorrect type in argumen=
t 1 (different base types) @@     expected unsigned int [usertype] b @@    =
 got restricted __le32 [usertype] @@
   drivers/uio/uio_mf624.c:93:17: sparse:     expected unsigned int [userty=
pe] b
   drivers/uio/uio_mf624.c:93:17: sparse:     got restricted __le32 [userty=
pe]
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
   drivers/video/fbdev/i740fb.c:752:20: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void * @@     got char=
 [noderef] <asn:2> *screen_base @@
   drivers/video/fbdev/i740fb.c:752:20: sparse:     expected void *
   drivers/video/fbdev/i740fb.c:752:20: sparse:     got char [noderef] <asn=
:2> *screen_base
>> drivers/video/fbdev/i740fb.c:836:9: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned int [usertype] b @=
@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/i740fb.c:836:9: sparse:     expected unsigned int [u=
sertype] b
   drivers/video/fbdev/i740fb.c:836:9: sparse:     got restricted __le32 [u=
sertype]
   drivers/video/fbdev/i740fb.c: note: in included file:
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
   drivers/video/fbdev/i740fb.c: note: in included file (through arch/micro=
blaze/include/asm/io.h, include/linux/fb.h):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/video/fbdev/i740fb.c: note: in included file:
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
>> include/video/vga.h:231:9: sparse: sparse: incorrect type in argument 1 =
(different base types) @@     expected unsigned short [usertype] b @@     g=
ot restricted __le16 [usertype] @@
   include/video/vga.h:231:9: sparse:     expected unsigned short [usertype=
] b
   include/video/vga.h:231:9: sparse:     got restricted __le16 [usertype]
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from include/linux/module.h:9,
                    from drivers/video/fbdev/i740fb.c:14:
   drivers/video/fbdev/i740fb.c: In function 'i740_calc_vclk':
   drivers/video/fbdev/i740fb.c:380:19: warning: comparison between signed =
and unsigned integer expressions [-Wsign-compare]
       if (abs(f_err) < err_max) {
                      ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   168-                =
              ^
   drivers/video/fbdev/i740fb.c:380:4: note: in expansion of macro 'if'
       if (abs(f_err) < err_max) {
       ^
   drivers/video/fbdev/i740fb.c:380:19: warning: comparison between signed =
and unsigned integer expressions [-Wsign-compare]
       if (abs(f_err) < err_max) {
                      ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     177-                ^
   drivers/video/fbdev/i740fb.c:380:4: note: in expansion of macro 'if'
       if (abs(f_err) < err_max) {
       ^
   drivers/video/fbdev/i740fb.c:386:23: warning: comparison between signed =
and unsigned integer expressions [-Wsign-compare]
     } while ((abs(f_err) >=3D err_target) &&
                          ^
   drivers/video/fbdev/i740fb.c:387:43: warning: comparison between signed =
and unsigned integer expressions [-Wsign-compare]
       ((n <=3D TARGET_MAX_N) || (abs(err_best) > err_max)));
                                              ^
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from include/linux/module.h:9,
                    from drivers/video/fbdev/i740fb.c:14:
   drivers/video/fbdev/i740fb.c:389:17: warning: comparison between signed =
and unsigned integer expressions [-Wsign-compare]
     if (abs(f_err) < err_target) {
                    ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   200-                =
              ^
   drivers/video/fbdev/i740fb.c:389:2: note: in expansion of macro 'if'
     if (abs(f_err) < err_target) {
     ^
   drivers/video/fbdev/i740fb.c:389:17: warning: comparison between signed =
and unsigned integer expressions [-Wsign-compare]
     if (abs(f_err) < err_target) {
                    ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     209-                ^
   drivers/video/fbdev/i740fb.c:389:2: note: in expansion of macro 'if'
     if (abs(f_err) < err_target) {
     ^
--
>> drivers/video/fbdev/aty/radeon_backlight.c:78:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/aty/radeon_backlight.c:78:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/video/fbdev/aty/radeon_backlight.c:78:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/video/fbdev/aty/radeon_backlight.c:93:25: sparse: sparse: incorr=
ect type in argument 1 (different base types) @@     expected unsigned int =
[usertype] b @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/aty/radeon_backlight.c:93:25: sparse:     expected u=
nsigned int [usertype] b
   drivers/video/fbdev/aty/radeon_backlight.c:93:25: sparse:     got restri=
cted __le32 [usertype]
   drivers/video/fbdev/aty/radeon_backlight.c:109:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/aty/radeon_backlight.c:109:17: sparse:     expected =
unsigned int [usertype] b
   drivers/video/fbdev/aty/radeon_backlight.c:109:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/video/fbdev/aty/radeon_backlight.c:112:17: sparse: sparse: incor=
rect type in argument 1 (different base types) @@     expected unsigned int=
 [usertype] b @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/aty/radeon_backlight.c:112:17: sparse:     expected =
unsigned int [usertype] b
   drivers/video/fbdev/aty/radeon_backlight.c:112:17: sparse:     got restr=
icted __le32 [usertype]
   drivers/video/fbdev/aty/radeon_backlight.c: note: in included file (thro=
ugh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci=
.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/video/fbdev/aty/radeon_backlight.c: note: in included file:
   drivers/video/fbdev/aty/radeonfb.h:405:9: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/aty/radeonfb.h:405:9: sparse:     expected unsigned =
int [usertype] b
   drivers/video/fbdev/aty/radeonfb.h:405:9: sparse:     got restricted __l=
e32 [usertype]
   drivers/video/fbdev/aty/radeon_backlight.c: note: in included file (thro=
ugh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci=
.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   drivers/video/fbdev/aty/radeon_backlight.c: note: in included file:
   drivers/video/fbdev/aty/radeonfb.h:447:17: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/aty/radeonfb.h:447:17: sparse:     expected unsigned=
 int [usertype] b
   drivers/video/fbdev/aty/radeonfb.h:447:17: sparse:     got restricted __=
le32 [usertype]
   drivers/video/fbdev/aty/radeonfb.h:449:17: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/aty/radeonfb.h:449:17: sparse:     expected unsigned=
 int [usertype] b
   drivers/video/fbdev/aty/radeonfb.h:449:17: sparse:     got restricted __=
le32 [usertype]
   drivers/video/fbdev/aty/radeon_backlight.c: note: in included file (thro=
ugh arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci=
.h, ...):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
>> drivers/vme/boards/vme_vmivme7805.c:70:9: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/vme/boards/vme_vmivme7805.c:70:9: sparse:     expected unsigned =
int [usertype] b
   drivers/vme/boards/vme_vmivme7805.c:70:9: sparse:     got restricted __l=
e32 [usertype]
   drivers/vme/boards/vme_vmivme7805.c:75:9: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/vme/boards/vme_vmivme7805.c:75:9: sparse:     expected unsigned =
int [usertype] b
   drivers/vme/boards/vme_vmivme7805.c:75:9: sparse:     got restricted __l=
e32 [usertype]
   drivers/vme/boards/vme_vmivme7805.c:85:9: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/vme/boards/vme_vmivme7805.c:85:9: sparse:     expected unsigned =
int [usertype] b
   drivers/vme/boards/vme_vmivme7805.c:85:9: sparse:     got restricted __l=
e32 [usertype]
   drivers/vme/boards/vme_vmivme7805.c: note: in included file (through arc=
h/microblaze/include/asm/io.h, include/linux/io.h, include/linux/pci.h):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
--
>> drivers/net/can/sja1000/kvaser_pci.c:138:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int [usert=
ype] b @@     got restricted __le32 [usertype] @@
   drivers/net/can/sja1000/kvaser_pci.c:138:9: sparse:     expected unsigne=
d int [usertype] b
   drivers/net/can/sja1000/kvaser_pci.c:138:9: sparse:     got restricted _=
_le32 [usertype]
   drivers/net/can/sja1000/kvaser_pci.c:150:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int [usert=
ype] b @@     got restricted __le32 [usertype] @@
   drivers/net/can/sja1000/kvaser_pci.c:150:9: sparse:     expected unsigne=
d int [usertype] b
   drivers/net/can/sja1000/kvaser_pci.c:150:9: sparse:     got restricted _=
_le32 [usertype]
   drivers/net/can/sja1000/kvaser_pci.c:241:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int [user=
type] b @@     got restricted __le32 [usertype] @@
   drivers/net/can/sja1000/kvaser_pci.c:241:17: sparse:     expected unsign=
ed int [usertype] b
   drivers/net/can/sja1000/kvaser_pci.c:241:17: sparse:     got restricted =
__le32 [usertype]
   drivers/net/can/sja1000/kvaser_pci.c: note: in included file (through ar=
ch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ..=
.):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   In file included from include/linux/if_ether.h:23:0,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:43,
                    from drivers/net/can/sja1000/kvaser_pci.c:35:
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2535:14: warning: comparison between signed and u=
nsigned integer expressions [-Wsign-compare]
             off =3D=3D frag->page_offset + skb_frag_size(frag);
                 ^
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from drivers/net/can/sja1000/kvaser_pci.c:32:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   41-                 =
             ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   53-                 =
                         ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h:2830:15: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >=3D dev->num_rx_queues);
                  ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     65-                ^
   include/asm-generic/bug.h:146:32: note: in expansion of macro 'if'
    #define BUG_ON(condition) do { if (condition) BUG(); } while (0)
                                   ^
   include/linux/netdevice.h:2830:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >=3D dev->num_rx_queues);
     ^
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   78-                 =
             ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   87-                 =
                         ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
   include/linux/netdevice.h:3101:37: warning: comparison between signed an=
d unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
                                        ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     96-                ^
   include/linux/netdevice.h:3101:2: note: in expansion of macro 'if'
     if (debug_value < 0 || debug_value >=3D (sizeof(u32) * 8))
     ^
--
>> drivers/watchdog/i6300esb.c:125:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:125:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:125:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:140:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:140:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:140:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:154:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:154:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:154:9: sparse:     got restricted __le16 [us=
ertype]
>> drivers/watchdog/i6300esb.c:176:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned int [usertype] b @@=
     got restricted __le32 [usertype] @@
   drivers/watchdog/i6300esb.c:176:9: sparse:     expected unsigned int [us=
ertype] b
   drivers/watchdog/i6300esb.c:176:9: sparse:     got restricted __le32 [us=
ertype]
   drivers/watchdog/i6300esb.c:180:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned int [usertype] b @@=
     got restricted __le32 [usertype] @@
   drivers/watchdog/i6300esb.c:180:9: sparse:     expected unsigned int [us=
ertype] b
   drivers/watchdog/i6300esb.c:180:9: sparse:     got restricted __le32 [us=
ertype]
   drivers/watchdog/i6300esb.c:184:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:184:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:184:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:412:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:412:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:412:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:115:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:115:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:115:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:116:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:116:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:116:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:115:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:115:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:115:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:116:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:116:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:116:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:115:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:115:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:115:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:116:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:116:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:116:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:115:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:115:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:115:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:116:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:116:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:116:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:115:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:115:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:115:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:116:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:116:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:116:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:115:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:115:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:115:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:116:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:116:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:116:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:115:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:115:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:115:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:116:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:116:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:116:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c: note: in included file (through arch/microb=
laze/include/asm/io.h, include/linux/io.h, include/linux/pci.h):
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   drivers/watchdog/i6300esb.c:115:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:115:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:115:9: sparse:     got restricted __le16 [us=
ertype]
   drivers/watchdog/i6300esb.c:116:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short [usertype] b =
@@     got restricted __le16 [usertype] @@
   drivers/watchdog/i6300esb.c:116:9: sparse:     expected unsigned short [=
usertype] b
   drivers/watchdog/i6300esb.c:116:9: sparse:     got restricted __le16 [us=
ertype]
--
>> drivers/watchdog/dw_wdt.c:114:9: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   drivers/watchdog/dw_wdt.c:114:9: sparse:     expected unsigned int [user=
type] b
   drivers/watchdog/dw_wdt.c:114:9: sparse:     got restricted __le32 [user=
type]
   drivers/watchdog/dw_wdt.c:124:9: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   drivers/watchdog/dw_wdt.c:124:9: sparse:     expected unsigned int [user=
type] b
   drivers/watchdog/dw_wdt.c:124:9: sparse:     got restricted __le32 [user=
type]
   drivers/watchdog/dw_wdt.c:133:9: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   drivers/watchdog/dw_wdt.c:133:9: sparse:     expected unsigned int [user=
type] b
   drivers/watchdog/dw_wdt.c:133:9: sparse:     got restricted __le32 [user=
type]
   drivers/watchdog/dw_wdt.c:136:17: sparse: sparse: incorrect type in argu=
ment 1 (different base types) @@     expected unsigned int [usertype] b @@ =
    got restricted __le32 [usertype] @@
   drivers/watchdog/dw_wdt.c:136:17: sparse:     expected unsigned int [use=
rtype] b
   drivers/watchdog/dw_wdt.c:136:17: sparse:     got restricted __le32 [use=
rtype]
   drivers/watchdog/dw_wdt.c:139:17: sparse: sparse: incorrect type in argu=
ment 1 (different base types) @@     expected unsigned int [usertype] b @@ =
    got restricted __le32 [usertype] @@
   drivers/watchdog/dw_wdt.c:139:17: sparse:     expected unsigned int [use=
rtype] b
   drivers/watchdog/dw_wdt.c:139:17: sparse:     got restricted __le32 [use=
rtype]
   drivers/watchdog/dw_wdt.c:173:17: sparse: sparse: incorrect type in argu=
ment 1 (different base types) @@     expected unsigned int [usertype] b @@ =
    got restricted __le32 [usertype] @@
   drivers/watchdog/dw_wdt.c:173:17: sparse:     expected unsigned int [use=
rtype] b
   drivers/watchdog/dw_wdt.c:173:17: sparse:     got restricted __le32 [use=
rtype]
   drivers/watchdog/dw_wdt.c: note: in included file (through arch/microbla=
ze/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from arch/microblaze/include/asm/irqflags.h:12,
                    from include/linux/irqflags.h:15,
                    from include/asm-generic/bitops.h:12,
                    from arch/microblaze/include/asm/bitops.h:1,
                    from include/linux/bitops.h:38,
                    from drivers/watchdog/dw_wdt.c:22:
   drivers/watchdog/dw_wdt.c: In function 'dw_wdt_set_top':
   drivers/watchdog/dw_wdt.c:108:32: warning: comparison between signed and=
 unsigned integer expressions [-Wsign-compare]
      if (dw_wdt_top_in_seconds(i) >=3D top_s) {
                                   ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   61-                 =
             ^
   drivers/watchdog/dw_wdt.c:108:3: note: in expansion of macro 'if'
      if (dw_wdt_top_in_seconds(i) >=3D top_s) {
      ^
   drivers/watchdog/dw_wdt.c:108:32: warning: comparison between signed and=
 unsigned integer expressions [-Wsign-compare]
      if (dw_wdt_top_in_seconds(i) >=3D top_s) {
                                   ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     70-                ^
   drivers/watchdog/dw_wdt.c:108:3: note: in expansion of macro 'if'
      if (dw_wdt_top_in_seconds(i) >=3D top_s) {
      ^
--
>> drivers/watchdog/of_xilinx_wdt.c:61:9: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected unsigned int [usertype] =
b @@     got restricted __le32 [usertype] @@
   drivers/watchdog/of_xilinx_wdt.c:61:9: sparse:     expected unsigned int=
 [usertype] b
   drivers/watchdog/of_xilinx_wdt.c:61:9: sparse:     got restricted __le32=
 [usertype]
   drivers/watchdog/of_xilinx_wdt.c:64:9: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected unsigned int [usertype] =
b @@     got restricted __le32 [usertype] @@
   drivers/watchdog/of_xilinx_wdt.c:64:9: sparse:     expected unsigned int=
 [usertype] b
   drivers/watchdog/of_xilinx_wdt.c:64:9: sparse:     got restricted __le32=
 [usertype]
   drivers/watchdog/of_xilinx_wdt.c:80:9: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected unsigned int [usertype] =
b @@     got restricted __le32 [usertype] @@
   drivers/watchdog/of_xilinx_wdt.c:80:9: sparse:     expected unsigned int=
 [usertype] b
   drivers/watchdog/of_xilinx_wdt.c:80:9: sparse:     got restricted __le32=
 [usertype]
   drivers/watchdog/of_xilinx_wdt.c:83:9: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected unsigned int [usertype] =
b @@     got restricted __le32 [usertype] @@
   drivers/watchdog/of_xilinx_wdt.c:83:9: sparse:     expected unsigned int=
 [usertype] b
   drivers/watchdog/of_xilinx_wdt.c:83:9: sparse:     got restricted __le32=
 [usertype]
   drivers/watchdog/of_xilinx_wdt.c:100:9: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 b @@     got restricted __le32 [usertype] @@
   drivers/watchdog/of_xilinx_wdt.c:100:9: sparse:     expected unsigned in=
t [usertype] b
   drivers/watchdog/of_xilinx_wdt.c:100:9: sparse:     got restricted __le3=
2 [usertype]
   drivers/watchdog/of_xilinx_wdt.c: note: in included file (through arch/m=
icroblaze/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   In file included from include/linux/err.h:4:0,
                    from drivers/watchdog/of_xilinx_wdt.c:13:
   drivers/watchdog/of_xilinx_wdt.c: In function 'xwdt_probe':
   drivers/watchdog/of_xilinx_wdt.c:199:9: warning: comparison between sign=
ed and unsigned integer expressions [-Wsign-compare]
     if (rc =3D=3D XWT_TIMER_FAILED) {
            ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   61-                 =
             ^
   drivers/watchdog/of_xilinx_wdt.c:199:2: note: in expansion of macro 'if'
     if (rc =3D=3D XWT_TIMER_FAILED) {
     ^
   drivers/watchdog/of_xilinx_wdt.c:199:9: warning: comparison between sign=
ed and unsigned integer expressions [-Wsign-compare]
     if (rc =3D=3D XWT_TIMER_FAILED) {
            ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   70-                 =
                         ^
   drivers/watchdog/of_xilinx_wdt.c:199:2: note: in expansion of macro 'if'
     if (rc =3D=3D XWT_TIMER_FAILED) {
     ^
   drivers/watchdog/of_xilinx_wdt.c:199:9: warning: comparison between sign=
ed and unsigned integer expressions [-Wsign-compare]
     if (rc =3D=3D XWT_TIMER_FAILED) {
            ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     79-                ^
   drivers/watchdog/of_xilinx_wdt.c:199:2: note: in expansion of macro 'if'
     if (rc =3D=3D XWT_TIMER_FAILED) {
     ^
--
>> drivers/video/fbdev/sis/sis_main.c:4168:25: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short [use=
rtype] b @@     got restricted __le16 [usertype] @@
   drivers/video/fbdev/sis/sis_main.c:4168:25: sparse:     expected unsigne=
d short [usertype] b
   drivers/video/fbdev/sis/sis_main.c:4168:25: sparse:     got restricted _=
_le16 [usertype]
   drivers/video/fbdev/sis/sis_main.c:4181:9: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/sis/sis_main.c:4181:9: sparse:     expected unsigned=
 int [usertype] b
   drivers/video/fbdev/sis/sis_main.c:4181:9: sparse:     got restricted __=
le32 [usertype]
   drivers/video/fbdev/sis/sis_main.c:4182:9: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/sis/sis_main.c:4182:9: sparse:     expected unsigned=
 int [usertype] b
   drivers/video/fbdev/sis/sis_main.c:4182:9: sparse:     got restricted __=
le32 [usertype]
   drivers/video/fbdev/sis/sis_main.c:4183:9: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/sis/sis_main.c:4183:9: sparse:     expected unsigned=
 int [usertype] b
   drivers/video/fbdev/sis/sis_main.c:4183:9: sparse:     got restricted __=
le32 [usertype]
   drivers/video/fbdev/sis/sis_main.c:4184:9: sparse: sparse: incorrect typ=
e in argument 1 (different base types) @@     expected unsigned int [userty=
pe] b @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/sis/sis_main.c:4184:9: sparse:     expected unsigned=
 int [usertype] b
   drivers/video/fbdev/sis/sis_main.c:4184:9: sparse:     got restricted __=
le32 [usertype]
   drivers/video/fbdev/sis/sis_main.c:4267:17: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short [use=
rtype] b @@     got restricted __le16 [usertype] @@
   drivers/video/fbdev/sis/sis_main.c:4267:17: sparse:     expected unsigne=
d short [usertype] b
   drivers/video/fbdev/sis/sis_main.c:4267:17: sparse:     got restricted _=
_le16 [usertype]
   drivers/video/fbdev/sis/sis_main.c:4269:17: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short [use=
rtype] b @@     got restricted __le16 [usertype] @@
   drivers/video/fbdev/sis/sis_main.c:4269:17: sparse:     expected unsigne=
d short [usertype] b
   drivers/video/fbdev/sis/sis_main.c:4269:17: sparse:     got restricted _=
_le16 [usertype]
   drivers/video/fbdev/sis/sis_main.c:4271:17: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short [use=
rtype] b @@     got restricted __le16 [usertype] @@
   drivers/video/fbdev/sis/sis_main.c:4271:17: sparse:     expected unsigne=
d short [usertype] b
   drivers/video/fbdev/sis/sis_main.c:4271:17: sparse:     got restricted _=
_le16 [usertype]
   drivers/video/fbdev/sis/sis_main.c:4273:17: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short [use=
rtype] b @@     got restricted __le16 [usertype] @@
   drivers/video/fbdev/sis/sis_main.c:4273:17: sparse:     expected unsigne=
d short [usertype] b
   drivers/video/fbdev/sis/sis_main.c:4273:17: sparse:     got restricted _=
_le16 [usertype]
   drivers/video/fbdev/sis/sis_main.c: note: in included file (through arch=
/microblaze/include/asm/io.h, include/linux/fb.h):
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:66:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:60:16: sparse: sparse: cast to restricted __le16
   drivers/video/fbdev/sis/sis_main.c: In function 'sisfb_search_mode':
   drivers/video/fbdev/sis/sis_main.c:175:16: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
      for(i =3D 0; i < strlen(strbuf1); i++) {
                   ^
   drivers/video/fbdev/sis/sis_main.c: In function 'sisfb_search_crt2type':
   drivers/video/fbdev/sis/sis_main.c:264:32: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
     while(sis_crt2type[i].type_no !=3D -1) {
                                   ^
   drivers/video/fbdev/sis/sis_main.c: In function 'sisfb_search_tvstd':
   drivers/video/fbdev/sis/sis_main.c:291:30: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
     while(sis_tvtype[i].type_no !=3D -1) {
                                 ^
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from include/linux/module.h:9,
                    from drivers/video/fbdev/sis/sis_main.c:36:
   drivers/video/fbdev/sis/sis_main.c: In function 'sisfb_verify_rate':
   drivers/video/fbdev/sis/sis_main.c:602:12: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
      if(hsync < (monitor->hmin - 1))
               ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   75-                 =
             ^
   drivers/video/fbdev/sis/sis_main.c:602:3: note: in expansion of macro 'i=
f'
      if(hsync < (monitor->hmin - 1))
      ^
   drivers/video/fbdev/sis/sis_main.c:602:12: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
      if(hsync < (monitor->hmin - 1))
               ^
   include/linux/compiler.h:157:42: note: in definition of macro '__trace_i=
f'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   84-                 =
                         ^
   drivers/video/fbdev/sis/sis_main.c:602:3: note: in expansion of macro 'i=
f'
      if(hsync < (monitor->hmin - 1))
      ^
   drivers/video/fbdev/sis/sis_main.c:602:12: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
      if(hsync < (monitor->hmin - 1))
               ^
   include/linux/compiler.h:168:16: note: in definition of macro '__trace_i=
f'
      ______r =3D !!(cond);     93-                ^
   drivers/video/fbdev/sis/sis_main.c:602:3: note: in expansion of macro 'i=
f'
      if(hsync < (monitor->hmin - 1))
      ^
   drivers/video/fbdev/sis/sis_main.c:604:12: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
      if(hsync > (monitor->hmax + 1))
               ^
   include/linux/compiler.h:157:30: note: in definition of macro '__trace_i=
f'

vim +185 drivers/dma/fsl-edma.c

d6be34fbd39b7d5 Jingchang Lu 2014-02-18  176  =

d6be34fbd39b7d5 Jingchang Lu 2014-02-18  177  /*
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  178   * R/W functions for big- or =
little-endian registers
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  179   * the eDMA controller's endi=
an is independent of the CPU core's endian.
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  180   */
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  181  =

d6be34fbd39b7d5 Jingchang Lu 2014-02-18  182  static u16 edma_readw(struct =
fsl_edma_engine *edma, void __iomem *addr)
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  183  {
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  184  	if (edma->big_endian)
d6be34fbd39b7d5 Jingchang Lu 2014-02-18 @185  		return ioread16be(addr);
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  186  	else
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  187  		return ioread16(addr);
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  188  }
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  189  =

d6be34fbd39b7d5 Jingchang Lu 2014-02-18  190  static u32 edma_readl(struct =
fsl_edma_engine *edma, void __iomem *addr)
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  191  {
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  192  	if (edma->big_endian)
d6be34fbd39b7d5 Jingchang Lu 2014-02-18 @193  		return ioread32be(addr);
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  194  	else
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  195  		return ioread32(addr);
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  196  }
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  197  =

d6be34fbd39b7d5 Jingchang Lu 2014-02-18  198  static void edma_writeb(struc=
t fsl_edma_engine *edma, u8 val, void __iomem *addr)
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  199  {
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  200  	iowrite8(val, addr);
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  201  }
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  202  =

d6be34fbd39b7d5 Jingchang Lu 2014-02-18  203  static void edma_writew(struc=
t fsl_edma_engine *edma, u16 val, void __iomem *addr)
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  204  {
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  205  	if (edma->big_endian)
d6be34fbd39b7d5 Jingchang Lu 2014-02-18 @206  		iowrite16be(val, addr);
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  207  	else
d6be34fbd39b7d5 Jingchang Lu 2014-02-18 @208  		iowrite16(val, addr);
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  209  }
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  210  =

d6be34fbd39b7d5 Jingchang Lu 2014-02-18  211  static void edma_writel(struc=
t fsl_edma_engine *edma, u32 val, void __iomem *addr)
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  212  {
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  213  	if (edma->big_endian)
d6be34fbd39b7d5 Jingchang Lu 2014-02-18 @214  		iowrite32be(val, addr);
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  215  	else
d6be34fbd39b7d5 Jingchang Lu 2014-02-18 @216  		iowrite32(val, addr);
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  217  }
d6be34fbd39b7d5 Jingchang Lu 2014-02-18  218  =


:::::: The code at line 185 was first introduced by commit
:::::: d6be34fbd39b7d577d25cb4edec538e8990ba07c dma: Add Freescale eDMA eng=
ine driver support

:::::: TO: Jingchang Lu <b35083@freescale.com>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8796211965421945915==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICK+Eq2AAAy5jb25maWcAjDxfc9u2k+/9FBz35qaduTSSbDn23fgBJEERFUkwBCnLeeEottJo
KkseSW6T36e/XZAUAXLppDOZRruLxQJY7D8s8+svvzrs9bR/Xp02j6vt9rvz13q3PqxO6yfny2a7
/j/Hl04ic4f7Iv8DiKPN7vXb++fN42H/ebv6z9q5/GN888f4auTM14fdeut4+92XzV+vwGKz3/3y
6y+eTAIxK2PhZdKN2Cd+9x3Y1FB1z1Jnc3R2+5NzXJ8a4uxe8bic8YRnwitVKpJIenMYWOM/yYSX
fsxMVizzwjJkqhSRnE3K4nJiMh4ku74i5m9mDu+5mIV5O3GD8Fgk3IzlIAWP2ANBoIq4haqcefM8
Yx4vVZGmMjNY4sp8nvYRIVvwMoI5Eu8hlwSBz4OGh1D53cX77ebz++f90+t2fXz/X0XCYl5mPOJM
8fd/POpjuWjGiuxjeS8zY0/dQkR+LmAMX+bMjUDUajY4w1+dmdaKLW7S60t7qm4m5zwpZVKqOG15
iUTkJU8WsNsoXCzyu8tJgwQ9UKr0ZJyKiN9dXLRnU8PKnKucOBXYKRYteKaETHAcAS5ZkUtrh1gR
5WUoVY7bcXfx226/W/9+Hqse1EKknqlHqVRiWcYfC15wUoMq+WMey+yhZDkcbUgIG4Qs8SPeylIo
DjpjaWwBd8ocqncaTsY5vn4+fj+e1s/tTjeKhQeXwk3ifZ1DlArlPY3xQmGeEEB8GTORmBK1UNg6
t5i9cTU81Fu+4EmuCO1vkZVeNWqUb57XhyO1vlx4c9AjDgsw78CnMgWO0hfWGSUSMQL2lzwhjSZk
D+Eyw41QJap5phqhvLR4n6+OfzsnkM5Z7Z6c42l1Ojqrx8f96+602f3VERMGlMzzZJHkIpmZgrnK
x9PxOGgIUOSkeDlTc7AIueqdfeYVjqL2JnkoAWepacZ5nOYIJlaqp+gOgZ9oiaIIL1osE1o44Ksp
tbkiWOvzLF2RTDxDnebVX/qqoLyQ+5VCtEhvlskiVaZwFWhQ7Wp0ANJ94hk5cCG8gQubwt2zd9se
CwR4WNZecSWLDOy1PmVQluHReoXm2ICJrDRwlIPLS3twwzLk3jyVIslRglxmlrdEE6ZSOBZFrrPa
arSAmjcxLZi7QMFWgfJ44FiMibuYcjGxtwO8HDmpG81x77XJz6ilel4pU7hw4hMvA5mVSnwybBdL
wGiLRPrcMCNuGrQ/+BIsgHU2asbzGBQchQbTHw0utMa3vObwSz3Eqg8pKzrjesEZzOkVkwrqgpct
g8LmEhQ5XxLEPJWmWErMEhYFlhJpExVQG6rtauBb22Ustd2mEHwUHQMJSfBl/kLAGmpO1uVMPVF+
LEQ2p64Bj13u+/xs4+s4MF0fvuwPz6vd49rh/6x3YFAZmFYPTSr4gMryVhwWcbUo8rJZ0QHLIeSY
UwceMcu3qqhw6UsSSZdWmBxCzjwrFGr/nD9kHdMOZj0QEQApc4u2Ul9bQ7V0/CarYdY1LrT/phep
B11fuRA/QYg5S/BCe+hOKHeGtBAFYxCSEV4Y/WOJmlaC+SvSjmReNO9ANKtUVDbYuKIYMd8zOB6I
lMqUZaAkTRRm2mGvCnNhcTn3wHQREsfSLyLwv2CPSx4F2qwYxi/CsN4FHvcs89XlOfb05OLd59UR
UpK/K916OewhOakc81kAJIODyxIeDW9tsze4Vk+GPAO1o+1zjHfXskp4w1WMt2zUWVBLVAHQ0IHv
iCTze6giIcHViDPyLDWg682mVKAerDLvHACbhqVBi1mHZQ2tZiV3yyDqmFiKRIVs/BM0k8nVz1BN
r3+C6vKGytxsmul4Qm0G5n/h3cXx6woILnoToKHJOlfO8HcQyVDWUyVjI9hPIGUVoM2Yu+pTNcOf
NorR+ptuVyc0lc7+BXPmYxv4geOE9MkFP5J4eXXf9Ah//WWz22hiB0Y6bXI9agdXV6FSW+b72d3o
2+2o+q8hWaJBWxq5+QiCl1hED3cX/2wOp/W36cUbpHiLY5WB+1Z5dvcWU6RMvTj9SVKXZWAZfkjm
i8UPacJ7uMg/ZhWkxZs0wAYu2N3Fhz/Goz+eLupzO+wf18cj7P/p+0uVOHxZr06vh7Xl3ZpIHSId
Kp5u0AsZgfNj2QMR5VPG/1M5Ho1MWoBMpiPa9H0qL0eDKOAzIme4G7eqUgWXYYYJkHGn4qLRSXcP
w3sa7MW+vgeulIZdqqF3F49AvN+u706n70U0+p/xeDoZjS66g7WV6oQXxk430XGmI/27sRHQsMQD
qTH+BPtpbRakgp3wqMZE8h4QOkztSG1g4C5ddu5SzJKCRRi2czhM7QGBatROWd9HcJLgXZAzMblJ
A6Mfmzms3LGVbSDza0S86YgYRCyHFRiGCAAlBt9YzoAVdGMEgLq26bLA9VA9zHazIBzOBPc9kJqK
Unw24yDATGHBiSe+lY6kEURAaa5n0ad6dd7nqvDigleSnQgEA0RtJ0lNT8MHpQ1hmVcRFiFTU1jE
nZm1mrQQcGS5hNDfTB2UsZNNpSmG3QDLkVQW92p0e31WTw6aCKmMrh7MY0vwiIOiMrhhdOAbM0rU
FJXz+fzTLay44ZOOVKTXqzHwb+vH19Pq83atC7yODtJPlsWC5D6Ic4zQqESnQiovE2neO3gmC7ro
UQ+LhfLoRUKu6xdx2pPXfT06smtWICFp9x6zk6pqpWxgL/9DYGXdu9lNrASlol4bDVvkGdebW/JE
V0ox56Z1DqXICyrjQBTLOxILubABkId2AEyJc6oFAOfr/nhywI6eDvvtdn1wng6bf6r86qx45ypu
sj79uz/8DYGzYalbYSHy5vTpQTxD5bHLIDPuAP6CYHEmOyBwsFmrqBqkChczE+E9dGhjMcOyegcK
iQfc7ZYHLAlTNAC0tZEK1DAghBXVRjS/UgwMwJsxZUPPXiMDVbZLTYANIBrLM8HLXgGvwzfFOjYq
h7K4a6Y1BctDAgdxhisVtzBpknbkAEjphx5V5KmxaIKpURnLqFG4fyI1S8QVZJbhG0dcLLuIMi8S
8FUEffdYKiZuBpkN7japYLhtev1kbp6AeZBzwS0XXrFe5NTFRVzh0zIG0qqKYka4oA0vakzJqOq+
xnBlPXlocWw91UCtwbUgNqYrXUseo2PNM5Yo+8mnS/E2A5fz7tgokx2IL8DTdeTyUgqMG0qAEQQq
AoG9tGJX5AJ/beMwKlppaLzCFUY9uXGnDR4ixdfPm8cLm3vsTyGbG9CnxTUxH0v8TAofqxgswb/A
AuxnMH3kEEQsRP5QXXILh8Sl4uCSu4PSHESNmFIieOgPgeBDl/SAY5xWlaWWIhBRx9Kcgf2COEFD
bXBl2PeHNRp9cPQncA0DT7MtI/gbOMe5ZWhtFATBM+t+B3g+CRbAqKwY0DCgfm+wFhjU1pG+vPWk
y7MF1ctZ6rDlCN7u+fNmt35y6sdO04mZg0s8pd6mNFxOq8Nf69OR2gcYChH4DO+LpI7KIEiCakfe
IGnU5U0i0OdYKaCxZITI7PHrekjGmOVe2PjR9lKmWO/r/gbi5d1ket2BQhiMEatIe/RnTMw888Rt
NJon2gchEdZZKN413N4VG6ft3hs4zbUrlIFPBiIZkxJW9kMa4POz7H6SpkM2POfQAgEtAvpxribD
foBaCUwOi/6Lo0j/9w0DYV5XMMkZ04aVruHVV30guqiQONi4TlgA/hMy5QpuHjagILuoLn8HXhtL
e2XanOh7VHGktwaoIEufRbw/OmP3dNqSCX/GkYK7fYNlMvG9oWhMebmlrPj77OGqwKYMQRfRnw08
7A0M6JZdf0SPJSgjyUayzvxvYHGyFp35ylwT/IQ/ZKKKKLBu7TkioJdVwYX2KIedx+1A+AEu1rQn
DQSf/IVntqAgJmKJddQIi1NJCYkoN5tc31x1B1RQOMdK8cgDiiY5+dyaG6JWmtT9XYpZDBqSSJl2
3psWIH15M5qMP5JT+tyjDUkUGXEU/JjYOcCS5MZyFtGvncvJlJqEpa65UWkoB8wa5xwXMTXuPShT
DeokCr3X8na1HpVC+4nSD/XY/WO+04BnwgLMwurMOENLN2L0XW9JfDZQxWhJEtp3GBTxYLZjzjTQ
8CBTnizUvQAPby7DAJeQVREDFwp7b3LV2VwdvGGoPpAtxWmkypmSVkVH0epeNz7oqDcTdOXDoKmi
Yir8R2y2xLLaQ2k/ibsfo07Rwjmtj3Yvjk4+Mgl5gEwEllvPdytkccZ8Ic91ktXj3+uTk62eNnt8
PDztH/dbK2xktJ57LGm5wg/0E+bGIsj1qDIyYmb3TTwHvxx//c/mce343foMUi56E/l8YQM8FnkY
dWErhW0pEBtxn2xRQSmyHvOqBtYDqz8ZvgV0F1iDS6Eoy2lSpBHLA5nFNlseK12ws4ApZ/Maak3W
wDnlDZBgvmAKwt8+w2jZB3r1CVpTeDV9JevANDVRl2HcVwnP+/BhRIBwvygwvUlKBrqZrCOrNg91
c9NA6JH51LG4Vm3WhXsWYBZGUpZuwk1PVQHAfpX9zLRB4jO/LPs+sarZbl/Xp/3+9NV5qpS+V5QE
NqEnFqG5vwCLs4VhBBjEZcss9Qx/X0O6PQrZcs78lgyrdFn9MH+W/F5gM+zAs+69gPyIxGTBXAw8
gFcocEGzAs5U0sYSrdQtFR14TASmDoigHxVpKHAABRjgUBbKNbjwNMQXY0uNahg+Jub5w2CHXUOm
n1ZJz5oEdhdmAOcgZgJiBzLkh3jTPF4EhLpub3FQoR/1XymS9ergBJv1FjuGnp9fd5tHnZQ4v8GY
32u1shN/5CXohifEpcn0aihz8arH3owzOvzQFKCag0iVT8bwfzquMAjIKAZyNf34077udxxF24G9
eazB/SeRomqhCnmUmmdmgUtdczZbrkGx8jgNBhoKc5b4LOq8W5uP05p3ILL4nmGJF1tDiRUG97oV
xhTrPEYk9aNni+PLPGNnCkvcMyf9qNCsKmBR5HYKUK1njyJ5r1sUqSem8zZoM5uJhW3tzuY3G+q5
fFBl+ABCLIQiW57OLdFp0Zhxw2zxmfXoWv0uxcQweTUsjoXsE2YfjZppzDBHgzXCQQSBvZCAJx7v
9/SeX9iICwX/SwYbuXLD2sIP3bKvbBAIgm8QWGsdQvlgknGGh6qt5u7duJ2+x6IsEv3ohu2pdH9Q
bwReaJlEdOcqkjcdBpqcXmcpA2oJLPtwButdK45wK+OqIKk7HfPDanfcVlYrWn3v9DxqzjIlesBZ
/D6T8ftguzp+dR6/bl763lOLHlixE4L+5JAV6ubCgaWAMtYfD3RGAjOdjdSdEgPDUeVcBnnEvfDz
sDSqAQR28ib2ympI6+NvBo+sK8RAr1if0v4gqLN40VmMhk26QmroQAtbg755a5YkhxBkmduqpDc/
Bjfg9+FgglkfWuQi6twoFnfPFJRoQBTmKrDbjeLGq5cXfBGutUw3lGm1Wz1ie1NH6yQkinyJe4sF
C9XdIWyyiO1vuig8XKphEk8M4mapkLq1YmBleoPLRVYmZjqouUKERmxSpEvoXY56X9R6++UdPqyv
9FsDUA9Gs3qC2JtOx13+FRR7xgNBx5cG1VBohiQqIqRPQwAOXdbcr0a0MPhd5hLCtapByOxOqbE8
002uiB1PbupwZHP8+53cvfNQJ3qxiSWPL73Z5eAqE4gmSuHTjrQhGDLCCUesfaY1EJ/MRfBQ3mfC
7BwwKWovTA+v3skJxGSJ1nKG21iHZlGKmvLf1f8nTgqp//P6eX/4TuuEJrMn/ahbokgjrFKBejuw
A4UrbE4AKO+jMg8z/Ggq8rvnqQlc7tYf4E1G9myIDZjK37qtSDOLCu5Sb+x+bhQaZWBVqYJS8SgY
+I4PsNh4hl8amQxKzrLogUb5DwmLhTWfvrSQzlEwuz8I4FaghA69g9e9Nx0ajHHM33U+ZMEkqJ71
/adulo/xo9GqH6rqmLcf8VuA0XqjQWVKFxUb9GygearBs+XNzYdb6uG7oYBbfdUoc7w5PhqBX7MC
fzqZLks/ldbzkQHG+JSu0hZx/ID7SAsZsiSXdIKmZtj75FEd3bkIYh26txuoQR+Wy7HxNuSp28uJ
uhoZMAh5I6kKSDIUxuee+ZYUpvgBsHFuqa9ub0YTFpkPTiqa3I5Gl9ZzkYZNqIZZcKqQA6gyB5Lp
1CqjNSg3HH+4eWssEpjVpAau5bsdLY0VxN715XTSAnw1vr6ZmLMWwtctDHQNOk5HN9PBsyyUW9Z1
5kCx26sbun1Y0Q7Im9QPmFXLIU8xGDm+vrzsD6dW1Sp4yfKJ8fpXAyM+Y57V4VUjYra8vvlAP5TV
JLeX3pIOCz33w3iktann7vP1t9XREbvj6fD6rD9XOn5dHcDxnzCOR8GdLQQCzhPcms0L/rXJzBm+
na6cIJ0x58vm8PwvDHOe9v/utvtV06Ng3C+smDE8lzRqNkjsTustdvHrXKxyrg33Fhdip98Q0lsd
nlpksx9eaBX0vWX1PUA/1vGUaKKb3jEhEhuKTE4a1nnvs5H1mwNJEBSq06VbrYZz7owvb6+c34LN
YX0Pf37vixNA0oi1PCu9rWGlDAeixzMF/U7VoqWyupjEhH7fqIpy3apsfSgvr6f+brYsk7Tof/cd
wgFqzRHvpYNDDJus8Bto42kWf6JJn7v2oVRwT6SKynUqdCRcQHeZVe8aFqj+DGKZgjtVk/48tSJ3
5uoKoybY7PgGBXjMLg8bn9ryzljMu90RDaxM1HRKJWBnguiKHMfjYjyaU2/pZ5IgvtHOpTpJMA2r
R2yZIAoneU4XHEBf6E8OADG3+vL116d2k0OkG+EgAiFb6VN8LrLeeWNRVv8CARVPhvdw4IkvrS70
M7D69lRIWtiWDLviQS3NLoCcdiZYd+jgakytZOG98MxCGGSXkYBcs9lvCLQ9wSAtfWvbPfiT0vEF
bM9ApxIIED1gX/9zF4IxbWOfwUn27JBVpYMfpStZ5mN4b9sPr/5ylXodR2QIo8zHPgRiv22Tnr9u
T+Bv1t9g1SiHTsMoYeAmuVWCDCyjiCczu8+lYqspBkRBdOqx2+nVuCdOjfhmI+oCrP2vbiBCxdae
avGimXRFbu7p2eah22vXVB+5A0wA/sMG94q5GE8vp90ZAXh9SQCXXWDsf5hed7cLoDfjMWUVECsq
e2CNEIr8x0AQlQqxvOrSJ/rTJsr46U0UYM5uO4sC4PXlqAe7vV7asIVgPQBER5ZK639nwvmM9d+6
+PPbM+z29ruzfv68fnqC6Od9TfVuv3uHVaHf7X338KKgStlz+Ry/adcFfh26DyGNt1BrX0ySAYeO
ZF1dtpBzHqfkcwQiJYqlutOCjpPvwjbRkr0pVDa/pL6VqM4pznnHatTfozSh8jewbrvVFs/nfaX/
q6fVy2lI75tcsruQOt2LMBPthRry9LUyJvUMhgJYcQpKTH+8Up0Rvo3YmVkLt78DaeHVJ1RtDJBS
pQUF7qsdHP4/Y9fW3DaupP+KHpPaMxsSvG/VPlAkZXFMShyRumReVBpHyajGtly2c2Zyfv12A7zg
0lD2JY76a+LaaDSARqNVfyiKVthOYL1OGmI8MuPkxwsa81OrYQKoc0ffkKY11SkQp16CH/p586pr
OI+URp8RZfBhAllV4lnZPZ9b6fXxxNV3HznTj0z9qBsL0Afuur6aqrRroHjXh7/IwkFV3CCORYwW
Q1aKZ35VrFl+BsOR33G1ubTP3q/w2XkGwgUy+4VfTwZB5hm//be0ABrjCYjThrTiVRHBkQaDgSL0
53DKBgxvBP0z3IJQwx0J2TOZRaAQjTZsFqpUWHdGnjNNy2Lb7+n08gJakiuifgj9jxKUQErwlsuJ
qN8e3ep+aF/DlOK5LqVShhrAz0laOdG85MbJu0McUG5OopQbWaJwfuC1Ov/zAr3e10vmTzfl79B7
WjNVDazfPK04ou0cisoOGpXbGd5BMdMFfREHkbUZ9nWcJL6WVpo3sB6IDeqqmQzL8ifVnHfxwSwN
YRqoDHV1LNeULcDRTZ55zD0M+gO1oFkKLcGsYV7rxMYITbMkIr7u96upXlQTNudJIeAYDAFnBkvS
23Zub7m9O1TN/eXvS2/g1ae3d2UC27sgAy1eZqjTbrOWJGFC8pb5MaMRdy+tmSagH+Zy9u3j6d9n
Nee2wv3Zblls1EQEvcX12JNBxtI4sRXgB87oiaD4Hck8rkeIhJpKSBQHAeZZ8vVca3YefRoj80Qh
tR+pcMQOXaQodmkgLhyfLNP8NxbR0Qaa9R66DmMcVtJ2ukwlbuLmqeAgK4mnDzfgedqBsHzuK0j5
xckM0oJIoTOT3s4Vu3IgY9X/Ias+cIA+dCPHd8wke0TKDC2YO+4GuQic0FO2qAcMvooThxK4gaNq
4ohF1LdWy3pggOr4sI66kTjnSByzzAhEfK1mpAr2qOdHtHnERYGHV7iBpzsyUtJeXD+Tf8J6SNk8
E8TeqAXjwXRJO73D/E4ZyuMmfR75LnWGoTBI6mOi167DXBugNJUKUWc9Kkdi/dgj745MHAnzqZOI
vIsOrgXwXfLYQ0C3swOOkFk/jm4dmggOupXaLAoZPU+PPN2huVW2vA0ZUV88b2EulWkZ3IOBYIk/
1vMsIjd2AirAgswRs4W06piQwIuC1izSXRW4cVuTAHNIANR/StUBAHpPtofRcljIrtADsiyXoesR
7VV2cWRSf81ktTZQYTBvXEa1OrprpfI9mhHoMpb4AQmApiIGFwLMJcWGQ+xWA3AOW3YspErOAVJg
UL+HTkiZ5gqLm5jJciAklAoCSWTJLgy95KZ8ch7ftrUv8VhCDik8Ca3SR5Hptj8ZomD8es5PeKo6
pK2diSGiJkMJprqzjsg2BDp10DDBMSUCdeyRVDLj2JJxcksXAkyMJ6B6lsQC5t2asjiHT40eDhAF
b7I48qgBgIAP5oahz1ZdJgzxslWu8Yx41oGEEy2HQET1Gl8sJlKpG3U/euTryeQEyaJbA7KqGVhe
oUV7sOSmePQD3idHref71MSL5lwYEwO9a1ofjENy8txmeUIb3DIHc4j8fq9Cl6I3+7rX/EZu7bJz
LVdYJw52a64FPCOEbdgJ/2GmmNeFG3nRjTSLOnN9hxAfAJjrkAMDoHDPnJtFrdvMj2rXlOcBScgu
EejcS26Vuc2WQXg4EJETFA720zS8kCpfDXqbFvvMZXEeu7T/7cTWuo57a3QAByyOYjIPaNr4J7q8
XKXMSW6kjwzqtsw4GpZ19pM5qasbMIxvefAgAykXgPg3pQIZKEt+V6ZhHKZmZ+w6l7mkVbDrYnbT
Rt/HHqxMczMzBBIOGIlyiFHHIgoHMVo4nZQagaBSyLoNGY55YqyiOOhIlSvAkAywK/GAzC8XZOkA
KZZS5Gg+paSVQdCXgwNZ9WEcqMM9+rv17th2RXPcly19H4b6gscC57cyKNc24gN+r4UH+TYLqCZI
42MRqbogwzxd3fF/bhToZwUparzwJgUkNZ2n8Ijp6fRonlrt0eM6l8OqDBTtLGkkr9b79PN6O0Yx
22NQlC/Xb9YbtXiXcspH3fw1s+9dEEz+fC8TJ0/IqqwjUH/HfU6e6Yee4xTtHGG5D8Q2q+Wjulgd
U8aTlHam+6DHY33Rx0sNgtdkRHPmnXJttW0x1lrblvNqvGLWXp8vD2+z9vJ4ebg+z+anh79eHk/P
kptaK18r5ElkJT6jISc1DeEJpxUvOhOWlRZrWYHtcY44ym9m2XwX5lmdGlWcv15PXx6uT7O3l/PD
5evlYQZL8lS6gZrVkjbmSYj6YZC9KS0Kp8jtWrkbyYGh1Bg9I6vpqJQK443qDZufk0/I1+/PD/xy
kfVWwiLXhhRSILUgcdS5k3Nu1mD20P47iIMR5R3AItEcRiWOZQkLRhdsatnRHuw5HrMwk2aUqsmO
ZSYFv0NCqwY6wAR/TVe/Q8Otc7JZkEMMKr0qMJoWzJ3X9spsio56NgMhakd1oKF9RG8+DgyWLuR5
jmc+alG69qD7E8jwfezEegU3q6ALLTYa4m3pR+HB8HOVOepA9V4Zifat33R+CBzTe1ZOQJxFajXs
8HqT5wWHY9dmWgtKbPrJISxrYAESKIKKNCgjbd4JkDwi5MVAmLmRXuuebm9NzpC45PUxgPcVrBQ9
zc+FV6j2AlWOeGq1VUL48ayahnHIKhF7DzQl9X0d0KbtALqO3j385JRaR4ygtEwd77rLqYxE6w2m
iWNRHvB1kXXVKbt4EwN6FWIgZQDaba06QU5caJ1w42Tku5lrmnVxHAZUfmkeeElM55Ku4A/5QNnI
IqlTszXShKkb4hpGGfdSU6WrwAsCstSqy9VEFzqYQsq2SjyHTAwgsJ3dlMJwVEZkghxhNBJH7EDX
G7GA3iOQmLrMC2J6g3Liwk2UIKYd/RWuOPSptaTGI29ZqVASkNXkUOTR9RxmhJ+Urllsfy9cS2x2
iW1P+6NNHHyeuFlJUGOBG3pkVSRdS2LMo1tHqFz5ZFrHImuavS42MF3l1EVepuPrd7JX7NP5y+U0
e8Agl4YHl/gqS2t+2UJ/Ok+gMLwxKl23szH00S1ucPAwQzawzTc2CH50m3VVyTERdmVerNXAP4K0
8yuGIZMxiEHalPoXCMtCKKi3gksJDqGK63KF4gMLQtm1SnB025UcupkT59sFOjQRVB6A4I4CdnOT
yrQZc6JjhHfZ/25CdiKmOQXZMmdq7vBDyxcpSmToDpdP/VUilQ0GPDRr2uATRf/rhlOLI9hfURTt
aV4KqbmsmjY6lwYeJnwUFIn/4fSCrxzoDn0K+On0fHqE1WG3o9z7REf+voYOtgrCsjiUW3xvE8pe
6sLXg+tNudY7/Vgf5qbgdfvQdFKiSvzpzx9/vF6+qAVXksoOLIjl6UyQ2zSNXM+3kAlxExDfbpc7
4/Lt8n56xPzR/k6Fn63UOdit6S5y1Tl8oh7XrSVcHbDMtznGo7RYy5yDZey4qIpDtm7USFMUqrug
Ik9Tbbs10wvXdJRdIRBPE3x0TVRJeT5GKpw61q9G58V+sUrf4kZGGL4M334g+CQu7p3TsxgKrUTf
DEOwhoTxUy0gktjUEEKEd/Xr7FOLq8bT1KeTzSuGXO8h3Q87aubkqn0c7z9UelekQaQuTvq5ANZe
jiWU1MhAuoEJGJRMKYLXPRE5ykdGfXIg2pETLk32RRirHhUCEOsVo/XMLTxkjP+ZLepebc0+tN2M
b0l9HBTR1OTDhb3Zh/EW30d5SCkSirft8o4KaSV6et5lB30IdztKJcuj5Mb40caOpBT8kNQVfnjc
7VR1cXp+uDw+nqa7/rMP79+f4e+/oALPb1f8z4U9/Gv29fX6/H5+/vL20RQ7nMU3O35hpi0qOlJt
b5zwl2WH6aB4frh+4Xl9OQ//63PlTtlX7tL/5/nx5Syid4xO8Ol3DHo4ffUyvFokPny6/KPovKGx
8XHatdEHeRr5HmFsAJDEPnXM2ONFGvpuoM/cgs4cYqy3jedbzOJ+bmgDz6cXEhND5TEqOF6febXz
mJOWGfOMCWObpzCVMJ0MtmmkOhpNdItDRa/SGha1tSX6ai9369VnkPzFUWMTUYHyduxDc3oHkQ2D
2Jx1d5cv56v8nW4hohMSaToCQC9dJo7QofwGJjz2CUGZd7FLrcVGNDDGIxBDg3jfOi6LdGpdxSEU
LIzMjPmodu0SKvCD5cOEmlGHodIErk+oKyAHROMCEDnkFs1gPrHYMWybbp8k6omkRKeXwIPgHTym
hiuQRAM1wElREKRwRS65qyYZadxhQUr4/HwzOfLcWsJjYoxxqYxuqQTBQR1LT7gnbzFK5IQkB65h
fKZ54sUJYfem93Hs3hrg3bKNmWN2RXZ6wvgBQp2bATn61JuuXOHttEov0Bok3icEDemk2+QAJ2Hg
6Int2jBkPqGPu6R2yAhaI944ntFYQO4cdaN5BHYOuf8l4Z6hf9uN4zlN5hnlXq3XK8cloTqo15W+
nDy2wX0oh9aSqIYkANUvsjtjjAM9mKcLQmfUZdqYHsQipJutg/PGDQNiiKetF/qBfRrDbebQqDVQ
Q27bSIPy8gST/7/PaN2NNoI66zU5iJLnpmYpBBSbdiO3Lz6JDB6ukAMYF3gqRWaAE1UUsOUYNQ9j
0Jwf8ejxild9VftFHz2R5xh9UwcsSkbl0/Ym0Xc8N4VCvF0fjg9ieH3RYmMIK2vY4RAD8fvb+/Xp
8p8zLgmFbUfy4z3ORn1FQEbBGIoZ6aRncEWHG4m4gFMjRGNLYtmvVgH5isG9BUa2/OuOOQfyKEVj
Cp1bSYTUQkdjYvL0rmGuZyn+b53ryF7oMnbImMNiGxY4jvU7Xwt/rZTmUMGngSV8mcEY2U37ni3z
/TaWJVpB0wNz5RMLUzhcSxUXGahcS7NxjN3AvNsC6dIewTJj4dMOh2pWYDNYeqGO466FDrSUstum
ieNYqteWzA0so6HsEtezjrcNTM0/7bFD5TnuZmGRyNrNXWhCbvbK+uTtPIMF6WwxLAvHXTzcw357
BxsMY/d8eDu9gya8vJ8/TitIfeHcdnMnTuiFRo+HLtn6At05iSOFcOiJIRjGGhU6IW894QRHFfaB
3wr+rxms7kHhv79eTo9qsaW08s3hXt+jGtRbxnLKF40XrOwHAM8fKL+0/79GAoPUdy1nxCPOKMXE
a955rrGl9nsFrerRdvaEUwsbXpNg6Wqr3KE7WEyfOw+d6VjWwOP3N4WB9+xNYTAKhdOSNs1r3eY4
cagKC5/K5HkGibuidQ+q1znn7cdibnl1eOIR3ehRWR3MVNMbci9S0gotiJE2GEDm5LNcnjYqI0el
wdhwzLar53GYWgLSTq2nzumjcHezD9bBpHZrAxP+DalAmJq4+0rjBUy94IJMWfej+Mq2eD+oc5VS
hb5yT3KqsW/01+rQ6aKtDsGAHIJeYBPMvJxjj9TaUc9AzgwyXkOtSWqj5wx03Yee6FafOn3lZwWL
xNHFuMgU13okLXOWVMzQzaB1Il1wcwaT1UalbrqKxZ7Rs4JMT9qjkrWroLR1HXZcmAHjUGKzfhqw
Kn5UAbE+dERrMVJQmKEuhI6LjPzTroXsV9fX9z9n6RMGxj89f7q/vp5Pz7NuGkafMj5P5d3uxoAC
YYRluW3IrDeB7qA9kF1yQcw3nzNYlJnHRtVd3nmeNaseDrRxdQddpDUiH5JOohLTbRwwRtGO0AAk
fedXRMLuGOesbPPbmkn+NGFGK8HQiW8NHa4xmUMdEnGpyBJHVEkIXX9gJ5UGFnmPP/q12qemqvS+
bSrKH32aZKCAoJF1EZ0gaWlZZEOMmWEJz0Nlc8NEzxa0o5ccPv9qrXi1mjeWOxAjbBMudNfxdSnh
RLMDBNmmNXGdqmmmtjE0b3XXxncVta02ogdDw6fdHGxIzzrF52kYBv8YxT2wwAmog6HeKN3AZKxr
TlSw3miodtfr4xvGooFOOj9eX2bP57+tlikPWLsohm/vXk8vf6JjtHkefZdifDXpCEkQuE/AHT5Q
74aDkL6eH95nmzPGxMC46vXp+fSN7zxMVVVjwIjNodfT03n2x/evX8+vvWe7VNqFNLGNb2fA4kMK
UbyYD88ZKLQ8V5wEgcIfSADdnN44/MTEFnhQV1X4RIOUuQCydfMZipAaQFmnd8W8KjstU8Q2xe7Y
lIeiwvs7x/ln8rVn4MNHNcicESBzRkDOeUIW601R3q2OxQpWaoprKm+JbtkjdEnm5R39JWTTVcXN
b3ktFEcW7I1iUWzwiQ45EhEygzxp7/YsULjQ+5l8JBcLl2b3PMCXkhJ/+VnE5WsVoCsr3jydeD7M
FLo/h2h8RIgD7MFys9nSux+ANjWlrvCzz/Niow5amcrlU21bfOOOh2eztCsss9ETXWur1a6EvrAV
b1PuqB1UFNhI3TznzY7RaGj2TZoXsiPMSOLeuD9MMt1LPaidSy9Qb3525b2rkaQkJJc2VcONSg3l
qWPE69taIqU7xQt3JPWVkbPpgTTLCmpKRY5SlXX4fcSoT1o6SLXcEsVuLNYwjkvKSRzQ+8+btZKH
ly8OBkEUUsuXA7Zo14Dv1ut8vab2WxHs4pCpzdltyly8oiF1xeZeE6WmpuZeHADppi7V50kn6lE8
xrAjH9ZSeLJt261rtVN71/6JMoYYlCokvKwVWl2A2K/WtV4oNNLYgT7ZQjW0Wad5uywscVmwWbbr
472bkHYvFriFAe1Iq5xR0o9VlpselEjkb0r2DypNHyJiPq83JUd/NeHGMxFSSQxn/gmzeedOHGkO
q3Iy0JLGI5uiUgbTnRSqYKHnpFYoIZEmDmRv3wkxPXOl5lGczqXUdgFzoqqhW2eeh65DnvfepRid
Xu6/9Z0SPBd/Y8SP7QHf+KRvpUg8kKBl90ViyqptxxgZ8mC9XanxtJFwXLet4cU3saxoD0DxabMp
a8rGweD6GKlcNSPkrHn4fdM6m/A9HV6mrsnrNUXddiUPS6ZRtHtlPKhh+355+IsyAsaPtqs2XRQY
jGlbm3sDcio8Zn02Be817mqOafJHHWr5la0B+ZU/zrc6evGBQDeBHPBiVez5W6iStoBfYuAPtQSK
6YjL2fggl0bgRPRMYqj6t3Cy5fqX+ATvN/l6Og2Mw/Gav54comS4hAk1CgbEkBnEWJkTOJEHWpSV
wEgNPYMqR9rjlOkikMo5z1nsGPl3XpDoJe2yFO8HmJWG9g7+MaRq6jW+7P7j8fL81wf3I49DuLmb
cxy++Y7LrlmLdz5Pj7NlmU/eevDj2C3B+q0/av0+x5cKaq1842W2Mfvu9fLtmyk1YAnc3SnWtkwW
0dQVrSaj6xW+3kM+5C2zLYt0082LtNMbsccn41BvzoEja6gbjwqLGh9VgYYr6lODXF7ecW8Nltqi
VabGX53fv17wTQzcL/l6+Tb7gI33fnr9dn7XW35spE26ajGsrSV/cZFDrpx4nISoEhp/eH0XjJ5O
CiVYwr+rcp6qKn6iigvvdUpGjNa4RBZU2n0qcjB/CcTniURVSbjulllqR8wAiHLSdbt2bReJJL6V
5SHLTZcJLUntvUCrjE9XTpsYI9W8ZyJ2QurU3MjI9/hhNlxMnlITdCr3/gvl4vWirY4FkGWJ6C/y
77RnSabiwjx7p2yPIG28b7hMV6tCdhRClMeEGGuT6cGk0/bzKjt2B+RVkkUfdbls6faQly3YptRa
bSsPuy0G8JdfBkZCg07DYJ0qb1QhkKNDPAWkRaYSQC6ztbwk3Iq3QiSjd7IuAFoVHWWvI1QvQqZ4
KG5IV37+OsSPwQHp9R29DPVpV3CpfdvT5njXR47T0dP5S6hPBHF8zXMS1t7H6OH1+nb9+j5b/ng5
v/6ym337fgazhLgtA/boXbkyRbldZ7MPrQiXv37mbzB8nAILEAEoQCikGmXVPd7dgurcb6Wo1PyF
MMDwJd0mlS/qC3sAsaES+AryFXLmYbz5ts3f19e/piynL8wr4xLWloEXUBaFyhM5lu/TQ4l/QWZI
LSJxNgd6M0ZiWWyK3/gDVS1qVLCYO63tqY9+y9bm5un4kET7cnnmTfRFfT1ZtFt7/f5KRUqAdNtN
pgWASbu6qI5NaYlZsRQTOwjdTxjqbmsJozdwdPWWZCj6p1igjejnBv6vsSNZjhvX3d9XuHJ6hzdT
brvbaR9yoCSqxVhbKMrbReU4XY4r46W81Mz8/QNILVxAz5zsBiDuBAEQBMZ248ZjaN6jRH8myqRx
og4IGMye0i6MpzlI7297fCVAhjpVXFsYq0G2sgnzdsvnh9c7f/D/7e6Za2kr3MO4PIge8UuValn5
P2PCBIxgEgsFY4gnzXUZWQOWCh/wUqfFSNBVm82hI+bj40RJ5/cRpOx/XvEx6YFhhKAwJS/3P+7I
JJpIDAL4Kr1ck762gFadWK23U/d1cU9L7i+btVYC6T9vDzd25bGRckR8jPHmhcbXYd/g1M2VRzfH
bVimD6Baj9hSl0ZBcH7RgvA6jtEI0hkeBnyIeXRoBZ/W0X/dt7OLnakKV2NbXB10799NBpOlq3M8
/sKSD5O0Gs4wqgIoFEcuSocWNvmJlnWQ0gq4KkDx5zJpynBr5fd/7Md0Kq5xHQOedgLtlpTBj1/i
RrXnIoe9PmC6BmPKn4upG9CirYZnM8ASBTVIy6m0vY4ZChL5rW8UzdY1JlVU+/GxU96toX2WuRHq
H3JHnkz7jmJgY4pN8/XoL3/707kb61KWFq7V0oAigmn7un//8XQASsqemA3ka1AA0RRMVG9Pw7RD
5k+LfsdVmQwt21FdMX9gtu1CKtGlekKhNMUrC8NTedUq0/GFc01A4ERdF0grC6POUtxCZD++5nl3
5EzHBBlVjMMArnPrhmnlFzy+8zZ5eMnmGMKuryomKRF4LugSs7+SVZBbJCTreNpDYz9qBubjwjSx
Ajh8POO5ob02aUi8EspritUbnMQzO/xE9omghSZA6DURs1xGMPhY+xJ7XMPZf/7BXaRsKrPmHlwI
2gx4NiRXbqpbg4ShcaAthmbl/u8pJ10Ab6tuFwBzUH3TkNZJUz1ll3F3xNzpOj5SgKJtsSlvC3oj
gJ7lbC78bQRSuiBEX3AGwu0FCO9dEafq4fwjXU80NljkGhpb2hoZC+VgkHONQaFdldDSZ2oWneaT
9HimbWTUmox5vJsF0zIVUloMDX5MhqQvn+5fn7bbzelvq082GsrmyD2H9fFn98MZ8/nYupxwMZ83
kW+29ksnD3MUxWyimFjbtifRemz/WA/jCJgejro+9EjWH3xO37N6RFQSAY/kNNLh0+OTSLdON4fR
b5xsoi6OjNTjNubz2v9cdA2upYF2ZHS+Xh1tqGs4n2bltp11qRAuaKpzFWsMJcDb+GN34CbwmgZv
/EmeEPSFl01BB1+3KWJjPvfxONL3SGNX3s45a8R2kP5AaShllEYkWvzgJHLjTE+IlJdK0Df5C0mt
eC8jyXsnItnA2cnoY3kmupKiLAVlmpxIdoyXIvX7pzGS87MPvhTQFTRJPwSIuhfKHfV5SAQ9KqqX
Z6KjTOJI0at8a2kGpZNzEX5GZOWz/cvj/o+Dnze3v+4f7xahWx/lqMvlJdt1fvSa55f7x7df+nnx
j4f9693B0zOGqnTu/VB6RS1mV/JzPgfB/bKe7V3PIJ//hlGeDkDev/1l4hXcGviLVeLSC528BRMD
UlpUzRLQmi6YRLcbkP9Sprgl4Iz4qu9Awyy4fVmag4RivvyyOjxaz+K/kqIF1oCqsi23YxIoXRag
nDvdGjQcDJJYgXZI2tl1+23loICiuOz8BhlCkHRRdkUNosIosI453RSF2UVHiSW8AlokSXS4QW1G
UvYWUxTqPtqnxrriPcj239/v7sy68KpGRqqDNZE1Gpom+QpdiI9EV7Ik7BRChxL6RHynLapjgyte
IZU/av8EHziT5RWuy6ET1/zLCh8q+G2YidHOHx+ziWq+Pctzoj8KzR995+mMHtU5nTgaUcYkBete
KKL0Qrizai4zcOIOyqfbX+/PZl8VN493zmZC80KPkVMUzFFD2woMEtTeGhgC6+hk7y0wrBT1iaZp
qbl28MM5K3u+KKAGiRoVBoA+JEqValCFbBRmmydDh8PeycZBBhVp3krmVhetwvMqPvjv62g+fv3f
wcP72/6vPfyzf7v9/fffrYtLM7BQb9UrfmlHTRuHvBU1jp4Pj5BfXBgMLOzmomWq8AmwrMEEPltU
J9mcEyYgBABzc31o4GvUaT5YXONnH1Aw1WBws67kH5KNDcIodcCeyhy3BzXnulGwquDI4noPLV1w
DxbL2IIzOCmQ/nY0nCS6Q0rREVujFRrxQXc62rZikNpMJmKRsMZEYpKjk6BgLr83pvK0dxioM7OA
tBs8A+FwaTkeXCVt4OhaJjtD2TY6iTwxKPTA4zcOxo4chTgce1pSGkdi4FJiONH6qzmZIvZF5IQk
zVxcayqzYiNqxp73tTnxPsbuJAOFn6SZgvT5lghTgFl6lb6JgoFOG5l561K/yx68j81nqbvlJW6D
2WA2yRjnmLgX6Z1dC39g/6vRpSFouVWUZgMXQMhat36nvMm+7Rc0EoYelf5whAO9TB81yrSVv4Pj
LmiDYcdUy/Ceq2YtesNEEZMYQ4wAHxLJahg+2Cs5egI4nhIOjsMSq+mlPBGwGhY17rPxS9IZfSYu
y5mMqDQ6RuZQCscYyk24WSykcBRZxPPUjO2S/gQHS3uZVYOHBsH+bwOpZrndQDLNWIaEQ98qJulD
316z/54yVr/hl++PWhlQ+9c3T+TUwQSRlw8d/Zwlmc4OfSpN7G1qQaJAS/OAmneeY+xXC7fMEJe4
CqPjZI7Lk/V8CFJcGBuNOkS9C99raOQZYFXjBkBHuETbo0IVg54kpPHNk9NA9KLMhqxJO2lJE+jp
gke29xzBDKvtGKch2sUJn+EEDUvaPN6i6dlSbCj6DFThK8u/GDUE0NWYwnC5UvbtmHFk2j0Mg7C4
2eQ1aGQH0f0zUo1Cg+NTNmJyQaqQ+pTQ6cvPdpn1Fmz8NReDv4dA9HHRZxl9f6gd/Qb09AudUPa3
7y/3b3+HyvQZv3LGAdcS7AadcJ5f4QqjWwIbE2+TeKZLoBsLiElewosxn3AaufHWBR2SOn1RCws7
dYQu6mLGQzmqLw52wSTIT9y41eGSM3LwGIB+FrWMTLG0gaVx7JdPs8FZd352UUpf/n5+ezLhpJ+m
WIo2lzHksI5JNWbEsnLnhGh2wEchHBR8EhiSJuVZKtrCZus+JvwI2QAJDEmlI5LMsJCwxfuzEFyx
GlTYsHUjPPwA59S5fXHoh0x02ooS0yFG8l2+OtpWfRkUX/dlCMS7pW8973mA0X8yqj0G88GU96qA
neRcvRgMeY6x97efezjKbm8wbip/vMV1hxGz/rzHx+yvr0+39xqV3bzdWD5KYzPTKmj6joB1/Js4
n5Z2or2fHp5+2NfmU4FJGo6FCqcxVV0A42kSwEp5sfDwecUkKTGylyrUigoMkRZpacXCphYU8JKu
79xzMJ0elYNAEVYm0+MjYmQQTEHV6jATeTg15AassjUB24QwkRaMl/iXWF2yymDpx9cl4t3oXAvi
aEPfGywUx0fUPcm0ugq2CpdcwaBYCrxZHRHtN/RwoNKvp6Y9tJOrU+ouZdrR7Wa1RFy6f/7pevZN
HDVcvKzuE0GAZbomxiwBvSunrevTImAVL0vBwtXB0KQ8JXIMcRtibBBOXcuN6IzoT67/Ek0/K9g1
i1yNjzPByo59ON+cZ9QMctnGknrNLDDiBjqiLxp/VGfz/xhJMJhMONFLfDYWtgedNeKdKK+bgDOV
1+FOBFiRTitK3jz+eHo4qN8fvu9fDnb7x/3LzRvVKny/AKopdYpmMtEp3noaM7IwvzMGR4vxNgnF
rBFBnrdj/gi/rgn1D/XNZF1MFMHv9Q0MUUlxQTmHdVcVPjwVWrQc1FVrHc0Wsu2TcqTp+sQls3Ag
ZwH36qxNeLk5PB1AwUYTFV75DNpCZrW8PUu7z/N91IxdhGmNNwoZj1jdxA6F1JYbzzztB4WV0fat
RNRMXuHjwFrNzwvK++8vGFv85ekdtFv79EsEqKDo4mv1eLLw1Bz0JiVsJ4vZuTEV6Olrm0kmlP3c
AI4ukCmEUvbWSFcn7vylgznfyKUBBSrQhZ0yjz2GD4CPdOGRAGaRJ1db4lODWUdYiSZh8oIpWiM2
FImIVG15cwADCU/+1PGmx8joyqiBKAiz+dkw5XrF6qyprL4vxSKvwp0ysjIbujC4qVXXzey05kIz
TsHXJDVwtQX+YFNTpVxeI9ieCgMZLrfUwTQitatsm/rFDIKdrAMgnPxE+QBVRV/R6vFIg2ZuarxH
dJJ+DSrzbD4cL4WasqnsYA42FJVj68LcQUF5FsoxFdnMq2tSYXzzmJTM8ssFLol7034lZkA6JYWz
ZxHuPi76Zmk1dTl6knk7fLI/Wa3B9YqFzaYpPS25dqvENtozAaq3jLiwlteDYrbU38jMlU6zjLJ1
Vq0wnpTLRsszazs0ArMy7kSnpDVQeVMrK/WTDd3+tTrxCJesCk5npp53O3zk5Tph/h/Xb3LzANsA
AA==
--===============8796211965421945915==--

