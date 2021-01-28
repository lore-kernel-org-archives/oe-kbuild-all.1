Content-Type: multipart/mixed; boundary="===============7174622318696048316=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [freescale-fslc:pr/78 2728/3687] drivers/memory/fsl_ifc.c:322:26: sparse: sparse: incorrect type in assignment (different base types)
Date: Thu, 28 Jan 2021 21:23:57 +0800
Message-ID: <202101282149.uRc6fR6X-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7174622318696048316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/Freescale/linux-fslc pr/78
head:   35b10ca99cd3cb57e545010466bbd588987c96f6
commit: 2f1fcd5b041750e81b18ee5166f6f8d72ddf64b0 [2728/3687] powerpc/pm: Fi=
x suspend=3Dn in menuconfig for e500mc platforms.
config: powerpc64-randconfig-s031-20210128 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-212-g56dbccf5-dirty
        # https://github.com/Freescale/linux-fslc/commit/2f1fcd5b041750e81b=
18ee5166f6f8d72ddf64b0
        git remote add freescale-fslc https://github.com/Freescale/linux-fs=
lc
        git fetch --no-tags freescale-fslc pr/78
        git checkout 2f1fcd5b041750e81b18ee5166f6f8d72ddf64b0
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> drivers/memory/fsl_ifc.c:322:26: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] c=
m_evter_intr_en @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:322:26: sparse:     expected restricted __be32 =
[usertype] cm_evter_intr_en
   drivers/memory/fsl_ifc.c:322:26: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:323:28: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
and_evter_intr_en @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:323:28: sparse:     expected restricted __be32 =
[usertype] nand_evter_intr_en
   drivers/memory/fsl_ifc.c:323:28: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:324:27: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
or_evter_intr_en @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:324:27: sparse:     expected restricted __be32 =
[usertype] nor_evter_intr_en
   drivers/memory/fsl_ifc.c:324:27: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:325:28: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] g=
pcm_evter_intr_en @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:325:28: sparse:     expected restricted __be32 =
[usertype] gpcm_evter_intr_en
   drivers/memory/fsl_ifc.c:325:28: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:336:71: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] c=
spr_ext @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:336:71: sparse:     expected restricted __be32 =
[usertype] cspr_ext
   drivers/memory/fsl_ifc.c:336:71: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:338:67: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] c=
spr @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:338:67: sparse:     expected restricted __be32 =
[usertype] cspr
   drivers/memory/fsl_ifc.c:338:67: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:340:69: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] a=
mask @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:340:69: sparse:     expected restricted __be32 =
[usertype] amask
   drivers/memory/fsl_ifc.c:340:69: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:342:71: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] c=
sor_ext @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:342:71: sparse:     expected restricted __be32 =
[usertype] csor_ext
   drivers/memory/fsl_ifc.c:342:71: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:344:67: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] c=
sor @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:344:67: sparse:     expected restricted __be32 =
[usertype] csor
   drivers/memory/fsl_ifc.c:344:67: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:347:78: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 @@     got u=
nsigned int @@
   drivers/memory/fsl_ifc.c:347:78: sparse:     expected restricted __be32
   drivers/memory/fsl_ifc.c:347:78: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:353:43: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] r=
b_map @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:353:43: sparse:     expected restricted __be32 =
[usertype] rb_map
   drivers/memory/fsl_ifc.c:353:43: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:354:43: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] w=
b_map @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:354:43: sparse:     expected restricted __be32 =
[usertype] wb_map
   drivers/memory/fsl_ifc.c:354:43: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:355:44: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] i=
fc_gcr @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:355:44: sparse:     expected restricted __be32 =
[usertype] ifc_gcr
   drivers/memory/fsl_ifc.c:355:44: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:356:48: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] d=
dr_ccr_low @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:356:48: sparse:     expected restricted __be32 =
[usertype] ddr_ccr_low
   drivers/memory/fsl_ifc.c:356:48: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:357:48: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] c=
m_evter_en @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:357:48: sparse:     expected restricted __be32 =
[usertype] cm_evter_en
   drivers/memory/fsl_ifc.c:357:48: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:362:51: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
cfgr @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:362:51: sparse:     expected restricted __be32 =
[usertype] ncfgr
   drivers/memory/fsl_ifc.c:362:51: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:364:55: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
and_fcr0 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:364:55: sparse:     expected restricted __be32 =
[usertype] nand_fcr0
   drivers/memory/fsl_ifc.c:364:55: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:366:55: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
and_fcr1 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:366:55: sparse:     expected restricted __be32 =
[usertype] nand_fcr1
   drivers/memory/fsl_ifc.c:366:55: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:368:50: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] r=
ow0 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:368:50: sparse:     expected restricted __be32 =
[usertype] row0
   drivers/memory/fsl_ifc.c:368:50: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:370:50: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] r=
ow1 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:370:50: sparse:     expected restricted __be32 =
[usertype] row1
   drivers/memory/fsl_ifc.c:370:50: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:372:50: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] c=
ol0 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:372:50: sparse:     expected restricted __be32 =
[usertype] col0
   drivers/memory/fsl_ifc.c:372:50: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:374:50: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] c=
ol1 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:374:50: sparse:     expected restricted __be32 =
[usertype] col1
   drivers/memory/fsl_ifc.c:374:50: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:376:50: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] r=
ow2 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:376:50: sparse:     expected restricted __be32 =
[usertype] row2
   drivers/memory/fsl_ifc.c:376:50: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:378:50: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] c=
ol2 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:378:50: sparse:     expected restricted __be32 =
[usertype] col2
   drivers/memory/fsl_ifc.c:378:50: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:380:50: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] r=
ow3 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:380:50: sparse:     expected restricted __be32 =
[usertype] row3
   drivers/memory/fsl_ifc.c:380:50: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:382:50: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] c=
ol3 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:382:50: sparse:     expected restricted __be32 =
[usertype] col3
   drivers/memory/fsl_ifc.c:382:50: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:385:55: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
and_fbcr @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:385:55: sparse:     expected restricted __be32 =
[usertype] nand_fbcr
   drivers/memory/fsl_ifc.c:385:55: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:387:55: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
and_fir0 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:387:55: sparse:     expected restricted __be32 =
[usertype] nand_fir0
   drivers/memory/fsl_ifc.c:387:55: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:389:55: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
and_fir1 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:389:55: sparse:     expected restricted __be32 =
[usertype] nand_fir1
   drivers/memory/fsl_ifc.c:389:55: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:391:55: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
and_fir2 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:391:55: sparse:     expected restricted __be32 =
[usertype] nand_fir2
   drivers/memory/fsl_ifc.c:391:55: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:393:55: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
and_csel @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:393:55: sparse:     expected restricted __be32 =
[usertype] nand_csel
   drivers/memory/fsl_ifc.c:393:55: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:395:58: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
andseq_strt @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:395:58: sparse:     expected restricted __be32 =
[usertype] nandseq_strt
   drivers/memory/fsl_ifc.c:395:58: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:398:59: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
and_evter_en @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:398:59: sparse:     expected restricted __be32 =
[usertype] nand_evter_en
   drivers/memory/fsl_ifc.c:398:59: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:401:53: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
anndcr @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:401:53: sparse:     expected restricted __be32 =
[usertype] nanndcr
   drivers/memory/fsl_ifc.c:401:53: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:403:62: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
and_dll_lowcfg0 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:403:62: sparse:     expected restricted __be32 =
[usertype] nand_dll_lowcfg0
   drivers/memory/fsl_ifc.c:403:62: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:406:62: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
and_dll_lowcfg1 @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:406:62: sparse:     expected restricted __be32 =
[usertype] nand_dll_lowcfg1
   drivers/memory/fsl_ifc.c:406:62: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:411:57: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
or_evter_en @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:411:57: sparse:     expected restricted __be32 =
[usertype] nor_evter_en
   drivers/memory/fsl_ifc.c:411:57: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:414:50: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] n=
orcr @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:414:50: sparse:     expected restricted __be32 =
[usertype] norcr
   drivers/memory/fsl_ifc.c:414:50: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:418:59: sparse: sparse: incorrect type in assig=
nment (different base types) @@     expected restricted __be32 [usertype] g=
pcm_evter_en @@     got unsigned int @@
   drivers/memory/fsl_ifc.c:418:59: sparse:     expected restricted __be32 =
[usertype] gpcm_evter_en
   drivers/memory/fsl_ifc.c:418:59: sparse:     got unsigned int
>> drivers/memory/fsl_ifc.c:453:64: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] cspr_ext @@
   drivers/memory/fsl_ifc.c:453:64: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:453:64: sparse:     got restricted __be32 [user=
type] cspr_ext
>> drivers/memory/fsl_ifc.c:455:64: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] cspr @@
   drivers/memory/fsl_ifc.c:455:64: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:455:64: sparse:     got restricted __be32 [user=
type] cspr
>> drivers/memory/fsl_ifc.c:457:65: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] amask @@
   drivers/memory/fsl_ifc.c:457:65: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:457:65: sparse:     got restricted __be32 [user=
type] amask
>> drivers/memory/fsl_ifc.c:459:64: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] csor_ext @@
   drivers/memory/fsl_ifc.c:459:64: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:459:64: sparse:     got restricted __be32 [user=
type] csor_ext
>> drivers/memory/fsl_ifc.c:461:64: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] csor @@
   drivers/memory/fsl_ifc.c:461:64: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:461:64: sparse:     got restricted __be32 [user=
type] csor
>> drivers/memory/fsl_ifc.c:464:77: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 @@
   drivers/memory/fsl_ifc.c:464:77: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:464:77: sparse:     got restricted __be32
>> drivers/memory/fsl_ifc.c:468:37: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] rb_map @@
   drivers/memory/fsl_ifc.c:468:37: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:468:37: sparse:     got restricted __be32 [user=
type] rb_map
>> drivers/memory/fsl_ifc.c:469:37: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] wb_map @@
   drivers/memory/fsl_ifc.c:469:37: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:469:37: sparse:     got restricted __be32 [user=
type] wb_map
>> drivers/memory/fsl_ifc.c:470:37: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] ifc_gcr @@
   drivers/memory/fsl_ifc.c:470:37: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:470:37: sparse:     got restricted __be32 [user=
type] ifc_gcr
>> drivers/memory/fsl_ifc.c:471:37: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] ddr_ccr_low @@
   drivers/memory/fsl_ifc.c:471:37: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:471:37: sparse:     got restricted __be32 [user=
type] ddr_ccr_low
>> drivers/memory/fsl_ifc.c:472:37: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] cm_evter_en @@
   drivers/memory/fsl_ifc.c:472:37: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:472:37: sparse:     got restricted __be32 [user=
type] cm_evter_en
>> drivers/memory/fsl_ifc.c:477:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] ncfgr @@
   drivers/memory/fsl_ifc.c:477:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:477:47: sparse:     got restricted __be32 [user=
type] ncfgr
>> drivers/memory/fsl_ifc.c:479:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nand_fcr0 @@
   drivers/memory/fsl_ifc.c:479:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:479:47: sparse:     got restricted __be32 [user=
type] nand_fcr0
>> drivers/memory/fsl_ifc.c:481:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nand_fcr1 @@
   drivers/memory/fsl_ifc.c:481:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:481:47: sparse:     got restricted __be32 [user=
type] nand_fcr1
>> drivers/memory/fsl_ifc.c:483:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] row0 @@
   drivers/memory/fsl_ifc.c:483:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:483:47: sparse:     got restricted __be32 [user=
type] row0
>> drivers/memory/fsl_ifc.c:484:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] row1 @@
   drivers/memory/fsl_ifc.c:484:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:484:47: sparse:     got restricted __be32 [user=
type] row1
>> drivers/memory/fsl_ifc.c:485:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] col0 @@
   drivers/memory/fsl_ifc.c:485:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:485:47: sparse:     got restricted __be32 [user=
type] col0
>> drivers/memory/fsl_ifc.c:486:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] col1 @@
   drivers/memory/fsl_ifc.c:486:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:486:47: sparse:     got restricted __be32 [user=
type] col1
>> drivers/memory/fsl_ifc.c:487:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] row2 @@
   drivers/memory/fsl_ifc.c:487:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:487:47: sparse:     got restricted __be32 [user=
type] row2
>> drivers/memory/fsl_ifc.c:488:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] col2 @@
   drivers/memory/fsl_ifc.c:488:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:488:47: sparse:     got restricted __be32 [user=
type] col2
>> drivers/memory/fsl_ifc.c:489:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] row3 @@
   drivers/memory/fsl_ifc.c:489:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:489:47: sparse:     got restricted __be32 [user=
type] row3
>> drivers/memory/fsl_ifc.c:490:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] col3 @@
   drivers/memory/fsl_ifc.c:490:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:490:47: sparse:     got restricted __be32 [user=
type] col3
>> drivers/memory/fsl_ifc.c:491:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nand_fbcr @@
   drivers/memory/fsl_ifc.c:491:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:491:47: sparse:     got restricted __be32 [user=
type] nand_fbcr
>> drivers/memory/fsl_ifc.c:493:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nand_fir0 @@
   drivers/memory/fsl_ifc.c:493:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:493:47: sparse:     got restricted __be32 [user=
type] nand_fir0
>> drivers/memory/fsl_ifc.c:495:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nand_fir1 @@
   drivers/memory/fsl_ifc.c:495:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:495:47: sparse:     got restricted __be32 [user=
type] nand_fir1
>> drivers/memory/fsl_ifc.c:497:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nand_fir2 @@
   drivers/memory/fsl_ifc.c:497:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:497:47: sparse:     got restricted __be32 [user=
type] nand_fir2
>> drivers/memory/fsl_ifc.c:499:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nand_csel @@
   drivers/memory/fsl_ifc.c:499:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:499:47: sparse:     got restricted __be32 [user=
type] nand_csel
>> drivers/memory/fsl_ifc.c:501:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nandseq_strt @@
   drivers/memory/fsl_ifc.c:501:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:501:47: sparse:     got restricted __be32 [user=
type] nandseq_strt
>> drivers/memory/fsl_ifc.c:503:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nand_evter_en @@
   drivers/memory/fsl_ifc.c:503:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:503:47: sparse:     got restricted __be32 [user=
type] nand_evter_en
>> drivers/memory/fsl_ifc.c:505:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nanndcr @@
   drivers/memory/fsl_ifc.c:505:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:505:47: sparse:     got restricted __be32 [user=
type] nanndcr
>> drivers/memory/fsl_ifc.c:507:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nand_dll_lowcfg0 @@
   drivers/memory/fsl_ifc.c:507:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:507:47: sparse:     got restricted __be32 [user=
type] nand_dll_lowcfg0
>> drivers/memory/fsl_ifc.c:509:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nand_dll_lowcfg1 @@
   drivers/memory/fsl_ifc.c:509:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:509:47: sparse:     got restricted __be32 [user=
type] nand_dll_lowcfg1
>> drivers/memory/fsl_ifc.c:513:46: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nor_evter_en @@
   drivers/memory/fsl_ifc.c:513:46: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:513:46: sparse:     got restricted __be32 [user=
type] nor_evter_en
>> drivers/memory/fsl_ifc.c:515:46: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] norcr @@
   drivers/memory/fsl_ifc.c:515:46: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:515:46: sparse:     got restricted __be32 [user=
type] norcr
>> drivers/memory/fsl_ifc.c:518:47: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] gpcm_evter_en @@
   drivers/memory/fsl_ifc.c:518:47: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:518:47: sparse:     got restricted __be32 [user=
type] gpcm_evter_en
>> drivers/memory/fsl_ifc.c:522:44: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] cm_evter_intr_en @@
   drivers/memory/fsl_ifc.c:522:44: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:522:44: sparse:     got restricted __be32 [user=
type] cm_evter_intr_en
>> drivers/memory/fsl_ifc.c:524:54: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nand_evter_intr_en @@
   drivers/memory/fsl_ifc.c:524:54: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:524:54: sparse:     got restricted __be32 [user=
type] nand_evter_intr_en
>> drivers/memory/fsl_ifc.c:526:53: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] nor_evter_intr_en @@
   drivers/memory/fsl_ifc.c:526:53: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:526:53: sparse:     got restricted __be32 [user=
type] nor_evter_intr_en
>> drivers/memory/fsl_ifc.c:528:54: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __be32 [usertype] gpcm_evter_intr_en @@
   drivers/memory/fsl_ifc.c:528:54: sparse:     expected unsigned int [user=
type] val
   drivers/memory/fsl_ifc.c:528:54: sparse:     got restricted __be32 [user=
type] gpcm_evter_intr_en

vim +322 drivers/memory/fsl_ifc.c

a20cbdeffce247 arch/powerpc/sysdev/fsl_ifc.c Prabhakar Kushwaha 2011-12-27 =
 303  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 304  #ifdef CONFIG_PM_SLEEP
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 305  /* save ifc registers */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 306  static int fsl_ifc_suspend(struct device *dev)
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 307  {
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 308  	struct fsl_ifc_ctrl *ctrl =3D dev_get_drvdata(dev);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 309  	struct fsl_ifc_global __iomem *fcm =3D ctrl->gregs;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 310  	struct fsl_ifc_runtime __iomem *runtime =3D ctrl->rregs;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 311  	__be32 nand_evter_intr_en, cm_evter_intr_en, nor_evter_intr_en,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 312  							 gpcm_evter_intr_en;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 313  	uint32_t ifc_bank, i;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 314  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 315  	ctrl->saved_gregs =3D kzalloc(sizeof(struct fsl_ifc_global), GFP_KER=
NEL);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 316  	if (!ctrl->saved_gregs)
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 317  		return -ENOMEM;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 318  	ctrl->saved_rregs =3D kzalloc(sizeof(struct fsl_ifc_runtime), GFP_KE=
RNEL);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 319  	if (!ctrl->saved_rregs)
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 320  		return -ENOMEM;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 321  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@322  	cm_evter_intr_en =3D ifc_in32(&fcm->cm_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@323  	nand_evter_intr_en =3D ifc_in32(&runtime->ifc_nand.nand_evter_intr_e=
n);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@324  	nor_evter_intr_en =3D ifc_in32(&runtime->ifc_nor.nor_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@325  	gpcm_evter_intr_en =3D ifc_in32(&runtime->ifc_gpcm.gpcm_evter_intr_e=
n);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 326  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 327  /* IFC interrupts disabled */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 328  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 329  	ifc_out32(0x0, &fcm->cm_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 330  	ifc_out32(0x0, &runtime->ifc_nand.nand_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 331  	ifc_out32(0x0, &runtime->ifc_nor.nor_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 332  	ifc_out32(0x0, &runtime->ifc_gpcm.gpcm_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 333  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 334  	if (ctrl->saved_gregs) {
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 335  		for (ifc_bank =3D 0; ifc_bank < FSL_IFC_BANK_COUNT; ifc_bank++) {
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@336  			ctrl->saved_gregs->cspr_cs[ifc_bank].cspr_ext =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 337  				ifc_in32(&fcm->cspr_cs[ifc_bank].cspr_ext);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@338  			ctrl->saved_gregs->cspr_cs[ifc_bank].cspr =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 339  				ifc_in32(&fcm->cspr_cs[ifc_bank].cspr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@340  			ctrl->saved_gregs->amask_cs[ifc_bank].amask =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 341  				ifc_in32(&fcm->amask_cs[ifc_bank].amask);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@342  			ctrl->saved_gregs->csor_cs[ifc_bank].csor_ext =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 343  				ifc_in32(&fcm->csor_cs[ifc_bank].csor_ext);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@344  			ctrl->saved_gregs->csor_cs[ifc_bank].csor =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 345  				ifc_in32(&fcm->csor_cs[ifc_bank].csor);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 346  			for (i =3D 0; i < 4; i++) {
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@347  				ctrl->saved_gregs->ftim_cs[ifc_bank].ftim[i] =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 348  					ifc_in32(
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 349  					&fcm->ftim_cs[ifc_bank].ftim[i]);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 350  			}
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 351  		}
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 352  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@353  		ctrl->saved_gregs->rb_map =3D ifc_in32(&fcm->rb_map);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@354  		ctrl->saved_gregs->wb_map =3D ifc_in32(&fcm->wb_map);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@355  		ctrl->saved_gregs->ifc_gcr =3D ifc_in32(&fcm->ifc_gcr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@356  		ctrl->saved_gregs->ddr_ccr_low =3D ifc_in32(&fcm->ddr_ccr_low);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@357  		ctrl->saved_gregs->cm_evter_en =3D ifc_in32(&fcm->cm_evter_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 358  	}
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 359  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 360  	if (ctrl->saved_rregs) {
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 361  		/* IFC controller NAND machine registers */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@362  		ctrl->saved_rregs->ifc_nand.ncfgr =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 363  					ifc_in32(&runtime->ifc_nand.ncfgr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@364  		ctrl->saved_rregs->ifc_nand.nand_fcr0 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 365  					ifc_in32(&runtime->ifc_nand.nand_fcr0);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@366  		ctrl->saved_rregs->ifc_nand.nand_fcr1 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 367  					ifc_in32(&runtime->ifc_nand.nand_fcr1);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@368  		ctrl->saved_rregs->ifc_nand.row0 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 369  					ifc_in32(&runtime->ifc_nand.row0);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@370  		ctrl->saved_rregs->ifc_nand.row1 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 371  					ifc_in32(&runtime->ifc_nand.row1);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@372  		ctrl->saved_rregs->ifc_nand.col0 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 373  					ifc_in32(&runtime->ifc_nand.col0);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@374  		ctrl->saved_rregs->ifc_nand.col1 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 375  					ifc_in32(&runtime->ifc_nand.col1);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@376  		ctrl->saved_rregs->ifc_nand.row2 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 377  					ifc_in32(&runtime->ifc_nand.row2);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@378  		ctrl->saved_rregs->ifc_nand.col2 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 379  					ifc_in32(&runtime->ifc_nand.col2);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@380  		ctrl->saved_rregs->ifc_nand.row3 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 381  					ifc_in32(&runtime->ifc_nand.row3);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@382  		ctrl->saved_rregs->ifc_nand.col3 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 383  					ifc_in32(&runtime->ifc_nand.col3);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 384  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@385  		ctrl->saved_rregs->ifc_nand.nand_fbcr =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 386  					ifc_in32(&runtime->ifc_nand.nand_fbcr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@387  		ctrl->saved_rregs->ifc_nand.nand_fir0 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 388  					ifc_in32(&runtime->ifc_nand.nand_fir0);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@389  		ctrl->saved_rregs->ifc_nand.nand_fir1 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 390  					ifc_in32(&runtime->ifc_nand.nand_fir1);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@391  		ctrl->saved_rregs->ifc_nand.nand_fir2 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 392  					ifc_in32(&runtime->ifc_nand.nand_fir2);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@393  		ctrl->saved_rregs->ifc_nand.nand_csel =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 394  					ifc_in32(&runtime->ifc_nand.nand_csel);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@395  		ctrl->saved_rregs->ifc_nand.nandseq_strt =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 396  					ifc_in32(
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 397  					&runtime->ifc_nand.nandseq_strt);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@398  		ctrl->saved_rregs->ifc_nand.nand_evter_en =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 399  					ifc_in32(
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 400  					&runtime->ifc_nand.nand_evter_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@401  		ctrl->saved_rregs->ifc_nand.nanndcr =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 402  					ifc_in32(&runtime->ifc_nand.nanndcr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@403  		ctrl->saved_rregs->ifc_nand.nand_dll_lowcfg0 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 404  					ifc_in32(
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 405  					&runtime->ifc_nand.nand_dll_lowcfg0);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@406  		ctrl->saved_rregs->ifc_nand.nand_dll_lowcfg1 =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 407  					ifc_in32(
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 408  					&runtime->ifc_nand.nand_dll_lowcfg1);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 409  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 410  		/* IFC controller NOR machine registers */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@411  		ctrl->saved_rregs->ifc_nor.nor_evter_en =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 412  					ifc_in32(
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 413  					&runtime->ifc_nor.nor_evter_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@414  		ctrl->saved_rregs->ifc_nor.norcr =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 415  					ifc_in32(&runtime->ifc_nor.norcr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 416  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 417  		/* IFC controller GPCM Machine registers */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@418  		ctrl->saved_rregs->ifc_gpcm.gpcm_evter_en =3D
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 419  					ifc_in32(
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 420  					&runtime->ifc_gpcm.gpcm_evter_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 421  	}
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 422  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 423  /* save the interrupt values */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 424  	ctrl->saved_gregs->cm_evter_intr_en =3D cm_evter_intr_en;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 425  	ctrl->saved_rregs->ifc_nand.nand_evter_intr_en =3D nand_evter_intr_e=
n;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 426  	ctrl->saved_rregs->ifc_nor.nor_evter_intr_en =3D nor_evter_intr_en;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 427  	ctrl->saved_rregs->ifc_gpcm.gpcm_evter_intr_en =3D gpcm_evter_intr_e=
n;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 428  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 429  	return 0;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 430  }
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 431  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 432  /* restore ifc registers */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 433  static int fsl_ifc_resume(struct device *dev)
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 434  {
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 435  	struct fsl_ifc_ctrl *ctrl =3D dev_get_drvdata(dev);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 436  	struct fsl_ifc_global __iomem *fcm =3D ctrl->gregs;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 437  	struct fsl_ifc_runtime __iomem *runtime =3D ctrl->rregs;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 438  	struct fsl_ifc_global *savd_gregs =3D ctrl->saved_gregs;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 439  	struct fsl_ifc_runtime *savd_rregs =3D ctrl->saved_rregs;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 440  	uint32_t ver =3D 0, ncfgr, timeout, ifc_bank, i;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 441  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 442  /*
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 443   * IFC interrupts disabled
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 444   */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 445  	ifc_out32(0x0, &fcm->cm_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 446  	ifc_out32(0x0, &runtime->ifc_nand.nand_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 447  	ifc_out32(0x0, &runtime->ifc_nor.nor_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 448  	ifc_out32(0x0, &runtime->ifc_gpcm.gpcm_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 449  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 450  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 451  	if (ctrl->saved_gregs) {
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 452  		for (ifc_bank =3D 0; ifc_bank < FSL_IFC_BANK_COUNT; ifc_bank++) {
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@453  			ifc_out32(savd_gregs->cspr_cs[ifc_bank].cspr_ext,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 454  					&fcm->cspr_cs[ifc_bank].cspr_ext);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@455  			ifc_out32(savd_gregs->cspr_cs[ifc_bank].cspr,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 456  					&fcm->cspr_cs[ifc_bank].cspr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@457  			ifc_out32(savd_gregs->amask_cs[ifc_bank].amask,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 458  					&fcm->amask_cs[ifc_bank].amask);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@459  			ifc_out32(savd_gregs->csor_cs[ifc_bank].csor_ext,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 460  					&fcm->csor_cs[ifc_bank].csor_ext);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@461  			ifc_out32(savd_gregs->csor_cs[ifc_bank].csor,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 462  					&fcm->csor_cs[ifc_bank].csor);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 463  			for (i =3D 0; i < 4; i++) {
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@464  				ifc_out32(savd_gregs->ftim_cs[ifc_bank].ftim[i],
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 465  					&fcm->ftim_cs[ifc_bank].ftim[i]);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 466  			}
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 467  		}
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@468  		ifc_out32(savd_gregs->rb_map, &fcm->rb_map);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@469  		ifc_out32(savd_gregs->wb_map, &fcm->wb_map);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@470  		ifc_out32(savd_gregs->ifc_gcr, &fcm->ifc_gcr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@471  		ifc_out32(savd_gregs->ddr_ccr_low, &fcm->ddr_ccr_low);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@472  		ifc_out32(savd_gregs->cm_evter_en, &fcm->cm_evter_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 473  	}
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 474  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 475  	if (ctrl->saved_rregs) {
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 476  		/* IFC controller NAND machine registers */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@477  		ifc_out32(savd_rregs->ifc_nand.ncfgr,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 478  						&runtime->ifc_nand.ncfgr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@479  		ifc_out32(savd_rregs->ifc_nand.nand_fcr0,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 480  						&runtime->ifc_nand.nand_fcr0);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@481  		ifc_out32(savd_rregs->ifc_nand.nand_fcr1,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 482  						&runtime->ifc_nand.nand_fcr1);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@483  		ifc_out32(savd_rregs->ifc_nand.row0, &runtime->ifc_nand.row0);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@484  		ifc_out32(savd_rregs->ifc_nand.row1, &runtime->ifc_nand.row1);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@485  		ifc_out32(savd_rregs->ifc_nand.col0, &runtime->ifc_nand.col0);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@486  		ifc_out32(savd_rregs->ifc_nand.col1, &runtime->ifc_nand.col1);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@487  		ifc_out32(savd_rregs->ifc_nand.row2, &runtime->ifc_nand.row2);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@488  		ifc_out32(savd_rregs->ifc_nand.col2, &runtime->ifc_nand.col2);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@489  		ifc_out32(savd_rregs->ifc_nand.row3, &runtime->ifc_nand.row3);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@490  		ifc_out32(savd_rregs->ifc_nand.col3, &runtime->ifc_nand.col3);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@491  		ifc_out32(savd_rregs->ifc_nand.nand_fbcr,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 492  						&runtime->ifc_nand.nand_fbcr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@493  		ifc_out32(savd_rregs->ifc_nand.nand_fir0,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 494  						&runtime->ifc_nand.nand_fir0);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@495  		ifc_out32(savd_rregs->ifc_nand.nand_fir1,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 496  						&runtime->ifc_nand.nand_fir1);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@497  		ifc_out32(savd_rregs->ifc_nand.nand_fir2,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 498  						&runtime->ifc_nand.nand_fir2);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@499  		ifc_out32(savd_rregs->ifc_nand.nand_csel,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 500  						&runtime->ifc_nand.nand_csel);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@501  		ifc_out32(savd_rregs->ifc_nand.nandseq_strt,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 502  					&runtime->ifc_nand.nandseq_strt);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@503  		ifc_out32(savd_rregs->ifc_nand.nand_evter_en,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 504  					&runtime->ifc_nand.nand_evter_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@505  		ifc_out32(savd_rregs->ifc_nand.nanndcr,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 506  					&runtime->ifc_nand.nanndcr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@507  		ifc_out32(savd_rregs->ifc_nand.nand_dll_lowcfg0,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 508  					&runtime->ifc_nand.nand_dll_lowcfg0);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@509  		ifc_out32(savd_rregs->ifc_nand.nand_dll_lowcfg1,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 510  					&runtime->ifc_nand.nand_dll_lowcfg1);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 511  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 512  		/* IFC controller NOR machine registers */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@513  		ifc_out32(savd_rregs->ifc_nor.nor_evter_en,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 514  					&runtime->ifc_nor.nor_evter_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@515  		ifc_out32(savd_rregs->ifc_nor.norcr, &runtime->ifc_nor.norcr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 516  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 517  		/* IFC controller GPCM Machine registers */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
@518  		ifc_out32(savd_rregs->ifc_gpcm.gpcm_evter_en,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 519  					&runtime->ifc_gpcm.gpcm_evter_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 520  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 521  		/* IFC interrupts enabled */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 522  		ifc_out32(ctrl->saved_gregs->cm_evter_intr_en,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 523  					&fcm->cm_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 524  		ifc_out32(ctrl->saved_rregs->ifc_nand.nand_evter_intr_en,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 525  					&runtime->ifc_nand.nand_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 526  		ifc_out32(ctrl->saved_rregs->ifc_nor.nor_evter_intr_en,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 527  					&runtime->ifc_nor.nor_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 528  		ifc_out32(ctrl->saved_rregs->ifc_gpcm.gpcm_evter_intr_en,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 529  					&runtime->ifc_gpcm.gpcm_evter_intr_en);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 530  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 531  		kfree(ctrl->saved_gregs);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 532  		kfree(ctrl->saved_rregs);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 533  		ctrl->saved_gregs =3D NULL;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 534  		ctrl->saved_rregs =3D NULL;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 535  	}
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 536  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 537  	ver =3D ifc_in32(&fcm->ifc_rev);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 538  	ncfgr =3D ifc_in32(&runtime->ifc_nand.ncfgr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 539  	if (ver >=3D FSL_IFC_V1_3_0) {
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 540  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 541  		ifc_out32(ncfgr | IFC_NAND_NCFGR_SRAM_INIT_EN,
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 542  					&runtime->ifc_nand.ncfgr);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 543  		/* wait for  SRAM_INIT bit to be clear or timeout */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 544  		timeout =3D 10;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 545  		while ((ifc_in32(&runtime->ifc_nand.ncfgr) &
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 546  			IFC_NAND_NCFGR_SRAM_INIT_EN) && timeout) {
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 547  			mdelay(IFC_TIMEOUT_MSECS);
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 548  			timeout--;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 549  		}
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 550  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 551  		if (!timeout)
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 552  			dev_err(ctrl->dev, "Timeout waiting for IFC SRAM INIT");
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 553  	}
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 554  =

6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 555  	return 0;
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 556  }
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 557  #endif /* CONFIG_PM_SLEEP */
6f2b3d3121731f drivers/memory/fsl_ifc.c      Prabhakar Kushwaha 2017-05-03 =
 558  =


:::::: The code at line 322 was first introduced by commit
:::::: 6f2b3d3121731f1dbe20188f701e1ec96188ed60 drivers/mtd: Add deep sleep=
 support for IFC

:::::: TO: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
:::::: CC: Jens Rehsack <sno@netbsd.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7174622318696048316==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7174622318696048316==--

