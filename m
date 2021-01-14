Content-Type: multipart/mixed; boundary="===============7620204186300208452=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/mmc/host/dw_mmc.c:602:29: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Thu, 14 Jan 2021 19:34:37 +0800
Message-ID: <202101141924.GIssKfzk-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7620204186300208452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mike,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   65f0d2414b7079556fbbcc070b3d1c9f9587606d
commit: 3ed6751bb8fa89c3014399bb0414348499ee202a mips: fix build when "48 b=
its virtual memory" is enabled
date:   1 year, 2 months ago
config: mips-randconfig-s032-20210114 (attached as .config)
compiler: mips64el-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3ed6751bb8fa89c3014399bb0414348499ee202a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3ed6751bb8fa89c3014399bb0414348499ee202a
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
>> drivers/mmc/host/dw_mmc.c:602:29: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] <asn:2> *mem @@     got unsigned int * @@
   drivers/mmc/host/dw_mmc.c:602:29: sparse:     expected void const volati=
le [noderef] <asn:2> *mem
   drivers/mmc/host/dw_mmc.c:602:29: sparse:     got unsigned int *
>> drivers/mmc/host/dw_mmc.c:602:29: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] <asn:2> *mem @@     got unsigned int * @@
   drivers/mmc/host/dw_mmc.c:602:29: sparse:     expected void const volati=
le [noderef] <asn:2> *mem
   drivers/mmc/host/dw_mmc.c:602:29: sparse:     got unsigned int *
   drivers/mmc/host/dw_mmc.c:615:25: sparse: sparse: restricted __le32 degr=
ades to integer
   drivers/mmc/host/dw_mmc.c:615:25: sparse: sparse: restricted __le32 degr=
ades to integer
>> drivers/mmc/host/dw_mmc.c:674:29: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] <asn:2> *mem @@     got restricted __le32 * @@
   drivers/mmc/host/dw_mmc.c:674:29: sparse:     expected void const volati=
le [noderef] <asn:2> *mem
   drivers/mmc/host/dw_mmc.c:674:29: sparse:     got restricted __le32 *
   drivers/mmc/host/dw_mmc.c:674:29: sparse: sparse: restricted __le32 degr=
ades to integer
>> drivers/mmc/host/dw_mmc.c:674:29: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] <asn:2> *mem @@     got restricted __le32 * @@
   drivers/mmc/host/dw_mmc.c:674:29: sparse:     expected void const volati=
le [noderef] <asn:2> *mem
   drivers/mmc/host/dw_mmc.c:674:29: sparse:     got restricted __le32 *
   drivers/mmc/host/dw_mmc.c:674:29: sparse: sparse: restricted __le32 degr=
ades to integer
--
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
>> drivers/tty/serial/zs.c:988:26: sparse: sparse: Using plain integer as N=
ULL pointer
>> drivers/tty/serial/zs.c:218:9: sparse: sparse: context imbalance in 'zs_=
spin_lock_cond_irq' - wrong count at exit
   drivers/tty/serial/zs.c:227:32: sparse: sparse: context imbalance in 'zs=
_spin_unlock_cond_irq' - unexpected unlock
--
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
>> drivers/watchdog/mtx-1_wdt.c:185:27: sparse: sparse: incorrect type in i=
nitializer (incompatible argument 2 (different address spaces)) @@     expe=
cted long ( *write )( ... ) @@     got long ( * )( ... ) @@
   drivers/watchdog/mtx-1_wdt.c:185:27: sparse:     expected long ( *write =
)( ... )
   drivers/watchdog/mtx-1_wdt.c:185:27: sparse:     got long ( * )( ... )
--
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   drivers/watchdog/ar7_wdt.c:193:29: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected char const [noderef] <a=
sn:1> *__gu_ptr @@     got char const * @@
   drivers/watchdog/ar7_wdt.c:193:29: sparse:     expected char const [node=
ref] <asn:1> *__gu_ptr
   drivers/watchdog/ar7_wdt.c:193:29: sparse:     got char const *
   drivers/watchdog/ar7_wdt.c:216:35: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void [noderef] <asn:1> *=
to @@     got struct watchdog_info * @@
   drivers/watchdog/ar7_wdt.c:216:35: sparse:     expected void [noderef] <=
asn:1> *to
   drivers/watchdog/ar7_wdt.c:216:35: sparse:     got struct watchdog_info *
   drivers/watchdog/ar7_wdt.c:222:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int [noderef] <asn:1> *=
__pu_addr @@     got int * @@
   drivers/watchdog/ar7_wdt.c:222:21: sparse:     expected int [noderef] <a=
sn:1> *__pu_addr
   drivers/watchdog/ar7_wdt.c:222:21: sparse:     got int *
   drivers/watchdog/ar7_wdt.c:229:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int const [noderef] <as=
n:1> *__gu_ptr @@     got int * @@
   drivers/watchdog/ar7_wdt.c:229:21: sparse:     expected int const [noder=
ef] <asn:1> *__gu_ptr
   drivers/watchdog/ar7_wdt.c:229:21: sparse:     got int *
   drivers/watchdog/ar7_wdt.c:241:21: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int [noderef] <asn:1> *=
__pu_addr @@     got int * @@
   drivers/watchdog/ar7_wdt.c:241:21: sparse:     expected int [noderef] <a=
sn:1> *__pu_addr
   drivers/watchdog/ar7_wdt.c:241:21: sparse:     got int *
>> drivers/watchdog/ar7_wdt.c:251:27: sparse: sparse: incorrect type in ini=
tializer (incompatible argument 2 (different address spaces)) @@     expect=
ed long ( *write )( ... ) @@     got long ( * )( ... ) @@
   drivers/watchdog/ar7_wdt.c:251:27: sparse:     expected long ( *write )(=
 ... )
   drivers/watchdog/ar7_wdt.c:251:27: sparse:     got long ( * )( ... )
   drivers/watchdog/ar7_wdt.c:270:17: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct ar7_wdt *static [=
toplevel] ar7_wdt @@     got void [noderef] <asn:2> * @@
   drivers/watchdog/ar7_wdt.c:270:17: sparse:     expected struct ar7_wdt *=
static [toplevel] ar7_wdt
   drivers/watchdog/ar7_wdt.c:270:17: sparse:     got void [noderef] <asn:2=
> *
--
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
>> drivers/video/fbdev/pmag-aa-fb.c:110:39: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt431_regs =
*regs @@     got struct bt431_regs [noderef] <asn:2> *bt431 @@
   drivers/video/fbdev/pmag-aa-fb.c:110:39: sparse:     expected struct bt4=
31_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:110:39: sparse:     got struct bt431_re=
gs [noderef] <asn:2> *bt431
   drivers/video/fbdev/pmag-aa-fb.c:115:39: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt431_regs =
*regs @@     got struct bt431_regs [noderef] <asn:2> *bt431 @@
   drivers/video/fbdev/pmag-aa-fb.c:115:39: sparse:     expected struct bt4=
31_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:115:39: sparse:     got struct bt431_re=
gs [noderef] <asn:2> *bt431
   drivers/video/fbdev/pmag-aa-fb.c:118:42: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt431_regs =
*regs @@     got struct bt431_regs [noderef] <asn:2> *bt431 @@
   drivers/video/fbdev/pmag-aa-fb.c:118:42: sparse:     expected struct bt4=
31_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:118:42: sparse:     got struct bt431_re=
gs [noderef] <asn:2> *bt431
>> drivers/video/fbdev/pmag-aa-fb.c:124:43: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt455_regs =
*regs @@     got struct bt455_regs [noderef] <asn:2> *bt455 @@
   drivers/video/fbdev/pmag-aa-fb.c:124:43: sparse:     expected struct bt4=
55_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:124:43: sparse:     got struct bt455_re=
gs [noderef] <asn:2> *bt455
   drivers/video/fbdev/pmag-aa-fb.c:125:42: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt455_regs =
*regs @@     got struct bt455_regs [noderef] <asn:2> *bt455 @@
   drivers/video/fbdev/pmag-aa-fb.c:125:42: sparse:     expected struct bt4=
55_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:125:42: sparse:     got struct bt455_re=
gs [noderef] <asn:2> *bt455
   drivers/video/fbdev/pmag-aa-fb.c:126:42: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt455_regs =
*regs @@     got struct bt455_regs [noderef] <asn:2> *bt455 @@
   drivers/video/fbdev/pmag-aa-fb.c:126:42: sparse:     expected struct bt4=
55_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:126:42: sparse:     got struct bt455_re=
gs [noderef] <asn:2> *bt455
   drivers/video/fbdev/pmag-aa-fb.c:129:37: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt431_regs =
*regs @@     got struct bt431_regs [noderef] <asn:2> *bt431 @@
   drivers/video/fbdev/pmag-aa-fb.c:129:37: sparse:     expected struct bt4=
31_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:129:37: sparse:     got struct bt431_re=
gs [noderef] <asn:2> *bt431
   drivers/video/fbdev/pmag-aa-fb.c:134:40: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt431_regs =
*regs @@     got struct bt431_regs [noderef] <asn:2> *bt431 @@
   drivers/video/fbdev/pmag-aa-fb.c:134:40: sparse:     expected struct bt4=
31_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:134:40: sparse:     got struct bt431_re=
gs [noderef] <asn:2> *bt431
   drivers/video/fbdev/pmag-aa-fb.c:146:35: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt455_regs =
*regs @@     got struct bt455_regs [noderef] <asn:2> *bt455 @@
   drivers/video/fbdev/pmag-aa-fb.c:146:35: sparse:     expected struct bt4=
55_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:146:35: sparse:     got struct bt455_re=
gs [noderef] <asn:2> *bt455
   drivers/video/fbdev/pmag-aa-fb.c:212:35: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt455_regs =
*regs @@     got struct bt455_regs [noderef] <asn:2> *bt455 @@
   drivers/video/fbdev/pmag-aa-fb.c:212:35: sparse:     expected struct bt4=
55_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:212:35: sparse:     got struct bt455_re=
gs [noderef] <asn:2> *bt455
   drivers/video/fbdev/pmag-aa-fb.c:213:34: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt455_regs =
*regs @@     got struct bt455_regs [noderef] <asn:2> *bt455 @@
   drivers/video/fbdev/pmag-aa-fb.c:213:34: sparse:     expected struct bt4=
55_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:213:34: sparse:     got struct bt455_re=
gs [noderef] <asn:2> *bt455
   drivers/video/fbdev/pmag-aa-fb.c:216:31: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt431_regs =
*regs @@     got struct bt431_regs [noderef] <asn:2> *bt431 @@
   drivers/video/fbdev/pmag-aa-fb.c:216:31: sparse:     expected struct bt4=
31_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:216:31: sparse:     got struct bt431_re=
gs [noderef] <asn:2> *bt431
   drivers/video/fbdev/pmag-aa-fb.c:217:30: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected struct bt431_regs =
*regs @@     got struct bt431_regs [noderef] <asn:2> *bt431 @@
   drivers/video/fbdev/pmag-aa-fb.c:217:30: sparse:     expected struct bt4=
31_regs *regs
   drivers/video/fbdev/pmag-aa-fb.c:217:30: sparse:     got struct bt431_re=
gs [noderef] <asn:2> *bt431
--
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
>> arch/mips/dec/kn01-berr.c:104:34: sparse: sparse: cast removes address s=
pace '<asn:1>' of expression
--
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
>> arch/mips/dec/tc.c:32:16: sparse: sparse: cast removes address space '<a=
sn:2>' of expression
>> arch/mips/dec/tc.c:32:16: sparse: sparse: cast removes address space '<a=
sn:2>' of expression
>> arch/mips/dec/tc.c:32:16: sparse: sparse: cast removes address space '<a=
sn:2>' of expression
>> arch/mips/dec/tc.c:32:16: sparse: sparse: cast removes address space '<a=
sn:2>' of expression
--
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   arch/mips/kernel/kgdb.c:147:56: sparse: sparse: no member 'fpu' in struc=
t thread_struct
>> arch/mips/kernel/kgdb.c:147:33: sparse: sparse: cast from unknown type
   arch/mips/kernel/kgdb.c:155:48: sparse: sparse: no member 'fpu' in struc=
t thread_struct
   arch/mips/kernel/kgdb.c:155:25: sparse: sparse: cast from unknown type
   arch/mips/kernel/kgdb.c:182:61: sparse: sparse: no member 'fpu' in struc=
t thread_struct
   arch/mips/kernel/kgdb.c:182:38: sparse: sparse: cast from unknown type
   arch/mips/kernel/kgdb.c:191:53: sparse: sparse: no member 'fpu' in struc=
t thread_struct
   arch/mips/kernel/kgdb.c:191:30: sparse: sparse: cast from unknown type

vim +602 drivers/mmc/host/dw_mmc.c

3b2a067b98b45f7a Shawn Lin         2016-09-02  573  =

3b2a067b98b45f7a Shawn Lin         2016-09-02  574  static inline int dw_mc=
i_prepare_desc64(struct dw_mci *host,
ec0baaa6b33932a2 Shawn Lin         2016-09-02  575  					 struct mmc_data *=
data,
f95f3850f7a9e1d4 Will Newton       2011-01-02  576  					 unsigned int sg_l=
en)
f95f3850f7a9e1d4 Will Newton       2011-01-02  577  {
5959b32e3636f9bf Alexey Brodkin    2015-06-25  578  	unsigned int desc_len;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  579  	struct idmac_desc_64ad=
dr *desc_first, *desc_last, *desc;
b6d2d81c5c2de6b3 Shawn Lin         2017-02-17  580  	u32 val;
ec0baaa6b33932a2 Shawn Lin         2016-09-02  581  	int i;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  582  =

5959b32e3636f9bf Alexey Brodkin    2015-06-25  583  	desc_first =3D desc_la=
st =3D desc =3D host->sg_cpu;
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  584  =

5959b32e3636f9bf Alexey Brodkin    2015-06-25  585  	for (i =3D 0; i < sg_l=
en; i++) {
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  586  		unsigned int length =
=3D sg_dma_len(&data->sg[i]);
0e3a22c044478b61 Shawn Lin         2015-08-03  587  =

69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  588  		u64 mem_addr =3D sg_d=
ma_address(&data->sg[i]);
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  589  =

5959b32e3636f9bf Alexey Brodkin    2015-06-25  590  		for ( ; length ; desc=
++) {
5959b32e3636f9bf Alexey Brodkin    2015-06-25  591  			desc_len =3D (length=
 <=3D DW_MCI_DESC_DATA_LENGTH) ?
5959b32e3636f9bf Alexey Brodkin    2015-06-25  592  				   length : DW_MCI_=
DESC_DATA_LENGTH;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  593  =

5959b32e3636f9bf Alexey Brodkin    2015-06-25  594  			length -=3D desc_len;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  595  =

3b2a067b98b45f7a Shawn Lin         2016-09-02  596  			/*
3b2a067b98b45f7a Shawn Lin         2016-09-02  597  			 * Wait for the form=
er clear OWN bit operation
3b2a067b98b45f7a Shawn Lin         2016-09-02  598  			 * of IDMAC to make =
sure that this descriptor
3b2a067b98b45f7a Shawn Lin         2016-09-02  599  			 * isn't still owned=
 by IDMAC as IDMAC's write
3b2a067b98b45f7a Shawn Lin         2016-09-02  600  			 * ops and CPU's rea=
d ops are asynchronous.
3b2a067b98b45f7a Shawn Lin         2016-09-02  601  			 */
b6d2d81c5c2de6b3 Shawn Lin         2017-02-17 @602  			if (readl_poll_timeo=
ut_atomic(&desc->des0, val,
b6d2d81c5c2de6b3 Shawn Lin         2017-02-17  603  						!(val & IDMAC_DES=
0_OWN),
b6d2d81c5c2de6b3 Shawn Lin         2017-02-17  604  						10, 100 * USEC_PE=
R_MSEC))
3b2a067b98b45f7a Shawn Lin         2016-09-02  605  				goto err_own_bit;
3b2a067b98b45f7a Shawn Lin         2016-09-02  606  =

69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  607  			/*
5959b32e3636f9bf Alexey Brodkin    2015-06-25  608  			 * Set the OWN bit a=
nd disable interrupts
5959b32e3636f9bf Alexey Brodkin    2015-06-25  609  			 * for this descript=
or
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  610  			 */
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  611  			desc->des0 =3D IDMAC=
_DES0_OWN | IDMAC_DES0_DIC |
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  612  						IDMAC_DES0_CH;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  613  =

69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  614  			/* Buffer length */
5959b32e3636f9bf Alexey Brodkin    2015-06-25  615  			IDMAC_64ADDR_SET_BUF=
FER1_SIZE(desc, desc_len);
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  616  =

69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  617  			/* Physical address =
to DMA to/from */
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  618  			desc->des4 =3D mem_a=
ddr & 0xffffffff;
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  619  			desc->des5 =3D mem_a=
ddr >> 32;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  620  =

5959b32e3636f9bf Alexey Brodkin    2015-06-25  621  			/* Update physical a=
ddress for the next desc */
5959b32e3636f9bf Alexey Brodkin    2015-06-25  622  			mem_addr +=3D desc_l=
en;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  623  =

5959b32e3636f9bf Alexey Brodkin    2015-06-25  624  			/* Save pointer to t=
he last descriptor */
5959b32e3636f9bf Alexey Brodkin    2015-06-25  625  			desc_last =3D desc;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  626  		}
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  627  	}
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  628  =

69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  629  	/* Set first descripto=
r */
5959b32e3636f9bf Alexey Brodkin    2015-06-25  630  	desc_first->des0 |=3D =
IDMAC_DES0_FD;
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  631  =

69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  632  	/* Set last descriptor=
 */
5959b32e3636f9bf Alexey Brodkin    2015-06-25  633  	desc_last->des0 &=3D ~=
(IDMAC_DES0_CH | IDMAC_DES0_DIC);
5959b32e3636f9bf Alexey Brodkin    2015-06-25  634  	desc_last->des0 |=3D I=
DMAC_DES0_LD;
3b2a067b98b45f7a Shawn Lin         2016-09-02  635  =

3b2a067b98b45f7a Shawn Lin         2016-09-02  636  	return 0;
3b2a067b98b45f7a Shawn Lin         2016-09-02  637  err_own_bit:
3b2a067b98b45f7a Shawn Lin         2016-09-02  638  	/* restore the descrip=
tor chain as it's polluted */
26be9d705f44521d Colin Ian King    2016-11-16  639  	dev_dbg(host->dev, "de=
scriptor is still owned by IDMAC.\n");
cc190d4c6499b1b3 Shawn Lin         2016-09-02  640  	memset(host->sg_cpu, 0=
, DESC_RING_BUF_SZ);
3b2a067b98b45f7a Shawn Lin         2016-09-02  641  	dw_mci_idmac_init(host=
);
3b2a067b98b45f7a Shawn Lin         2016-09-02  642  	return -EINVAL;
ec0baaa6b33932a2 Shawn Lin         2016-09-02  643  }
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  644  =

ec0baaa6b33932a2 Shawn Lin         2016-09-02  645  =

3b2a067b98b45f7a Shawn Lin         2016-09-02  646  static inline int dw_mc=
i_prepare_desc32(struct dw_mci *host,
ec0baaa6b33932a2 Shawn Lin         2016-09-02  647  					 struct mmc_data *=
data,
ec0baaa6b33932a2 Shawn Lin         2016-09-02  648  					 unsigned int sg_l=
en)
ec0baaa6b33932a2 Shawn Lin         2016-09-02  649  {
ec0baaa6b33932a2 Shawn Lin         2016-09-02  650  	unsigned int desc_len;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  651  	struct idmac_desc *des=
c_first, *desc_last, *desc;
b6d2d81c5c2de6b3 Shawn Lin         2017-02-17  652  	u32 val;
ec0baaa6b33932a2 Shawn Lin         2016-09-02  653  	int i;
f95f3850f7a9e1d4 Will Newton       2011-01-02  654  =

5959b32e3636f9bf Alexey Brodkin    2015-06-25  655  	desc_first =3D desc_la=
st =3D desc =3D host->sg_cpu;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  656  =

5959b32e3636f9bf Alexey Brodkin    2015-06-25  657  	for (i =3D 0; i < sg_l=
en; i++) {
f95f3850f7a9e1d4 Will Newton       2011-01-02  658  		unsigned int length =
=3D sg_dma_len(&data->sg[i]);
0e3a22c044478b61 Shawn Lin         2015-08-03  659  =

f95f3850f7a9e1d4 Will Newton       2011-01-02  660  		u32 mem_addr =3D sg_d=
ma_address(&data->sg[i]);
f95f3850f7a9e1d4 Will Newton       2011-01-02  661  =

5959b32e3636f9bf Alexey Brodkin    2015-06-25  662  		for ( ; length ; desc=
++) {
5959b32e3636f9bf Alexey Brodkin    2015-06-25  663  			desc_len =3D (length=
 <=3D DW_MCI_DESC_DATA_LENGTH) ?
5959b32e3636f9bf Alexey Brodkin    2015-06-25  664  				   length : DW_MCI_=
DESC_DATA_LENGTH;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  665  =

5959b32e3636f9bf Alexey Brodkin    2015-06-25  666  			length -=3D desc_len;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  667  =

3b2a067b98b45f7a Shawn Lin         2016-09-02  668  			/*
3b2a067b98b45f7a Shawn Lin         2016-09-02  669  			 * Wait for the form=
er clear OWN bit operation
3b2a067b98b45f7a Shawn Lin         2016-09-02  670  			 * of IDMAC to make =
sure that this descriptor
3b2a067b98b45f7a Shawn Lin         2016-09-02  671  			 * isn't still owned=
 by IDMAC as IDMAC's write
3b2a067b98b45f7a Shawn Lin         2016-09-02  672  			 * ops and CPU's rea=
d ops are asynchronous.
3b2a067b98b45f7a Shawn Lin         2016-09-02  673  			 */
b6d2d81c5c2de6b3 Shawn Lin         2017-02-17 @674  			if (readl_poll_timeo=
ut_atomic(&desc->des0, val,
b6d2d81c5c2de6b3 Shawn Lin         2017-02-17  675  						      IDMAC_OWN_C=
LR64(val),
b6d2d81c5c2de6b3 Shawn Lin         2017-02-17  676  						      10,
b6d2d81c5c2de6b3 Shawn Lin         2017-02-17  677  						      100 * USEC_=
PER_MSEC))
3b2a067b98b45f7a Shawn Lin         2016-09-02  678  				goto err_own_bit;
3b2a067b98b45f7a Shawn Lin         2016-09-02  679  =

69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  680  			/*
5959b32e3636f9bf Alexey Brodkin    2015-06-25  681  			 * Set the OWN bit a=
nd disable interrupts
5959b32e3636f9bf Alexey Brodkin    2015-06-25  682  			 * for this descript=
or
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  683  			 */
6687c42fa71acd6a Ben Dooks         2015-03-25  684  			desc->des0 =3D cpu_t=
o_le32(IDMAC_DES0_OWN |
5959b32e3636f9bf Alexey Brodkin    2015-06-25  685  						 IDMAC_DES0_DIC |
5959b32e3636f9bf Alexey Brodkin    2015-06-25  686  						 IDMAC_DES0_CH);
5959b32e3636f9bf Alexey Brodkin    2015-06-25  687  =

f95f3850f7a9e1d4 Will Newton       2011-01-02  688  			/* Buffer length */
5959b32e3636f9bf Alexey Brodkin    2015-06-25  689  			IDMAC_SET_BUFFER1_SI=
ZE(desc, desc_len);
f95f3850f7a9e1d4 Will Newton       2011-01-02  690  =

f95f3850f7a9e1d4 Will Newton       2011-01-02  691  			/* Physical address =
to DMA to/from */
6687c42fa71acd6a Ben Dooks         2015-03-25  692  			desc->des2 =3D cpu_t=
o_le32(mem_addr);
5959b32e3636f9bf Alexey Brodkin    2015-06-25  693  =

5959b32e3636f9bf Alexey Brodkin    2015-06-25  694  			/* Update physical a=
ddress for the next desc */
5959b32e3636f9bf Alexey Brodkin    2015-06-25  695  			mem_addr +=3D desc_l=
en;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  696  =

5959b32e3636f9bf Alexey Brodkin    2015-06-25  697  			/* Save pointer to t=
he last descriptor */
5959b32e3636f9bf Alexey Brodkin    2015-06-25  698  			desc_last =3D desc;
5959b32e3636f9bf Alexey Brodkin    2015-06-25  699  		}
f95f3850f7a9e1d4 Will Newton       2011-01-02  700  	}
f95f3850f7a9e1d4 Will Newton       2011-01-02  701  =

f95f3850f7a9e1d4 Will Newton       2011-01-02  702  	/* Set first descripto=
r */
5959b32e3636f9bf Alexey Brodkin    2015-06-25  703  	desc_first->des0 |=3D =
cpu_to_le32(IDMAC_DES0_FD);
f95f3850f7a9e1d4 Will Newton       2011-01-02  704  =

f95f3850f7a9e1d4 Will Newton       2011-01-02  705  	/* Set last descriptor=
 */
5959b32e3636f9bf Alexey Brodkin    2015-06-25  706  	desc_last->des0 &=3D c=
pu_to_le32(~(IDMAC_DES0_CH |
5959b32e3636f9bf Alexey Brodkin    2015-06-25  707  				       IDMAC_DES0_D=
IC));
5959b32e3636f9bf Alexey Brodkin    2015-06-25  708  	desc_last->des0 |=3D c=
pu_to_le32(IDMAC_DES0_LD);
3b2a067b98b45f7a Shawn Lin         2016-09-02  709  =

3b2a067b98b45f7a Shawn Lin         2016-09-02  710  	return 0;
3b2a067b98b45f7a Shawn Lin         2016-09-02  711  err_own_bit:
3b2a067b98b45f7a Shawn Lin         2016-09-02  712  	/* restore the descrip=
tor chain as it's polluted */
26be9d705f44521d Colin Ian King    2016-11-16  713  	dev_dbg(host->dev, "de=
scriptor is still owned by IDMAC.\n");
cc190d4c6499b1b3 Shawn Lin         2016-09-02  714  	memset(host->sg_cpu, 0=
, DESC_RING_BUF_SZ);
3b2a067b98b45f7a Shawn Lin         2016-09-02  715  	dw_mci_idmac_init(host=
);
3b2a067b98b45f7a Shawn Lin         2016-09-02  716  	return -EINVAL;
69d99fdcfd7815df Prabu Thangamuthu 2014-10-20  717  }
f95f3850f7a9e1d4 Will Newton       2011-01-02  718  =


:::::: The code at line 602 was first introduced by commit
:::::: b6d2d81c5c2de6b3c69da3be9b2044dd008dbe45 mmc: dw_mmc: improve the ti=
meout polling code

:::::: TO: Shawn Lin <shawn.lin@rock-chips.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7620204186300208452==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICFsWAGAAAy5jb25maWcAjDxdc9u2su/nV2jamTvtnKaVZdlx7h0/gCAooSIJBgBlyS8c1VFS
TR3bI9tt8+/vLvgFgKCcMz1NtbtYAIvFfmGZH//z44S8vjx+3b0c7nb3998mX/YP++PuZf9p8vlw
v/+/SSwmudATFnP9KxCnh4fXf3/7enh6nlz8Ov91+u54dz5Z7Y8P+/sJfXz4fPjyCqMPjw//+fE/
8M+PAPz6BIyO/zvBQZfz/f27e+Tx7svd3eSnBaU/Tz78ev7rFIipyBO+qCituKoAc/2tBcGPas2k
4iK//jA9n0472pTkiw41tVgsiaqIyqqF0KJnZCF4nvKcDVA3ROZVRrYRq8qc51xzkvJbFveEXH6s
boRc9ZCo5GmsecYqttEkSlmlhNSANxJYGIneT573L69P/TYjKVYsr0ReqaywuMOUFcvXFZGLKuUZ
19fns26NIis4sNdMIXuQbg1fMhIzacCTw/Pk4fEFZ2tHpYKStJXRDz84q64USbUFjFlCylRXS6F0
TjJ2/cNPD48P+587AnVDrNWqrVrzwjopKoVSVcYyIbcV0ZrQZY8sFUt51MoF5Dh5fv3j+dvzy/5r
L5cFy5nk1Ii5kCKyjshGqaW4CWNYkjCq+ZpVJEngKNUqTEeXvHBPNRYZ4bkLUzwLEVVLziSRdLnt
sUuSx3A4DQHQugMTISmLK72UcFo8X4RXFbOoXCTKnO7+4dPk8bMnqHYQTg76L+hKiRI4VzHRZMjT
qOUazgl0IB2iDQO2ZrlWAWQmVFUWwJi1h6YPX/fH59C5aU5XoM0MDkZbMrmtCuAlYk5thc0FYjiI
y9ZXFx3Q5CVfLCvJlNmVdIQ0WFjPrZCMZYUGrjkLMG3Ra5GWuSZyay+0QZ4YRgWMasVDi/I3vXv+
a/ICy5nsYGnPL7uX58nu7u7x9eHl8PDFExgMqAg1PGqV6GZec6k9NB5MUF6oOOage9rAiiMV442i
DG4oEFqn5GOq9XmPLBR3fnQ2IuYKjV1sH8N3CKAzFbA3rkRKNNqlRoCSlhMVUq58WwGuXwj8AGsL
umVtQzkUZowHAmOgGj7dkt0puxu7qv/DusOr2swGLoqiS7jZ5i61G1F3f+4/vYLjm3ze715ej/tn
A27mDGA7sSykKAtrkoIsWK1lTPZQMLHU0RcDMOY5cPQ1cgV/WIeerprJLPNtflc3kmsWEboaYMxO
e2hCuKyCGJqoKgKDeMNjvbTXCVptDQiqczNXwWN1Ci/jjAT22mATuJ+3tsQa+LJcMJ1G9pIaTMzW
nIYNUkMBKovX4xSJsd+BVaEzVQWBK2b5Q62q3PoNntT5Df5S1oDeHvEYIKFdLxldFYLnGg2kFtLy
m7V6klIL77jBLcAxxQxsGQUjH9sz+bhqPQvuW7KUbEPWBtQLJGoCGmmHT/ibZMC79ltW8CHjanFr
nHLPPa4iAI1MHVfpbVAHALO59fiktyJMmd7OnTBQFGBLIeZDj43eC/7ISE6ZozIemYL/CDksAmEI
RFkxWA64w3HtpSuGgV3eGr6O6UnCAHf06joFM0hZgSQVCJZa5+7bxwysNkelcs4ZrgMGSVUTI4Tn
wePyY4ikDngsSyUU39i+uXOVoJarkI6UjgmLiAJplu4aOmxSarYJMGGFsFel+CInaWJpnFmQDTDx
TuJq+xJsY4A54cIm46IqpeddOySJ1xw20MgpdElhjohIyW2ztELabaaGkMqRdgc1UsJbhzGuI74i
CR1ih8eTN547iUMXQTErYDVmrIV1HGD5LI5ZaLjRdLwslR9NGiDMXa0zWJmwkoWCnk3nrcNskshi
f/z8ePy6e7jbT9jf+weIHQj4TIrRAwR4dZRlMa5nc/fbONnv5NiuZp3VzFpfa21BpWVUi8TRGYQ2
btfckOAlxZyNaEj3Vu5YEoVuGrB0yUQUPEscD3NLCA2acCzIDYjQD6ZcgVuA2yoyfxE9fklkDPFM
2CWrZZkkkNyYYMQcIwEfE7YVmmW19YKckyecDuwchJoJT8NBqjFhxo854b2bRHf3iZtAyShFtrv7
8/CwB4r7/V1TgeiDIyBso7Xg/gwBScFRZtvw5Zbvw3C9nF2MYd5/CGKiN5cT0Wz+frMZw12ej+AM
YyoiEtSHDLJxUBeq9OBIDOp3cnsbZotYOC+Wj6w3JZB0fBxBKRKOmAzXVIh8oUR+HnbxDs2MJW8T
Xc7HaQrQc/iTi3HhgY3S5BQHOrLSnFEgkSvG83DUasav5fxs5OzyDcTEOprNpqfRYW0rMpheFUGc
JHDZVuF7veAQds7CW2qQYcVvkFcnkOfhnTTIkTl5tNWQ78glz8OxeEtBZMbCjq7nIU7zeJMA0imZ
nSJIudYpU6U8yQW8ilBhrWpIIr4YZZLzamQRRqX05vzDmDmo8fNRPF9JofmqktHFyHlQsuZlVgmq
GZYqRfj+52lWbVJZRQKcyAmK4gSFuX4FkQQrH0GHPjTxfiK+vGF8sbRC3q6UBVcgkpDHgP2DfMXP
jUTGNXhCyNEq43ucvJGtdRWrs9nVew8o53aCrCSF+JAoTj2gQ1ZbaKwUBKpypqanyqIQUmPlDcuf
VhgC+S4WsahYMslya5e5gJlxEJy4nc0XZaOgFctjTqzSJkzdT/Q9NE3anChvKwivANFSWvUFITQk
MMn5zBuSnsFxgNghqOCJruYn0dfzrrIWdu24SXk+nTq2xsbNN9Opuyms83fDRlDNKLuwFdA7TSAC
0xVXBCLydf8A4YjufBaBdq2YzFk6It3LeYgEF/IGF4fkO7jgcWEM14VNTZD88u1pb0vVzBaQqJnC
DhxWEDYvyvDDgznONQHjBjPPr7ySFqbM1XzlxLs94uxyFY58e5LL+SoUQ5s6O1yETXUL1l1AUCuv
z85sabRGIS6zovJqQWbNSdFKbFSpVo2S1sMtVM5YrPBGKogGtGEnJLClUjThqkWM6pYKSPlNxaZK
5RCttjl1oTGJY26eoIiEVCX2eMo5aPUp9Pw0GhQfE3N16V9MMG1xcymnQwQe8vWVY8kSyFEhPwLD
gnVi51EArKktdYDMLi6D543E09k8cBDODQKGy9uR2wWsR3HI20bCfwMr1zssJdbqrVScbZjz5kXU
0iiTpeHLLTgCksLBghZcT//93PzvCk9nOnUFSLMYHyPBA4nM2E3UiaZM4yaz5p62Y9GLxKwYml6M
clcmkxriikX9RJlCspuq1rxGr8+Txye0bc+TnwrKf5kUNKOc/DJhYNx+mZh/afpzX5IHoiqWHN8V
gdeCUMupaks6WWYV4I1aZOCkKpnXKgMCyEHipwjI5vrsKkzQJtcto+8hQ3YXvWC/e+eujTifVWIs
Z6nRXkpjxFw8/rM/Tr7uHnZf9l/3Dy/tzL1YzcKXPAIjbpI0LKpBjGhfnyZKUAU4bBvdR4w1Lnyd
etYjeUQw9BpdeOeca4qso+gaAADHP93vfZ89fPyzPG09wIYM2Bt+yeH49Z/dcT+Jj4e/6/JQJ6QM
bm/GsdigBRVOlNWixA2Tg1ffGl04I60yQIu0xobLlVxmkD0wrBBlwUcZXUrJQSHFppI32n6ZqbP/
Kl9DROpU+BqEgqWFqpULIRZwtduprTC4RlBwMiYs08RTmXYkhsBRmSSwt5Y4uLuGHqtfIlfC4j2+
rHVh12ATXjEi0y0V9ot7toFQ23kBQJCi5eAq6f2X427yuVWAT0YB7De2EYIWPVCdrg4I6UeJTR+D
IskauyKaFoc6WG4s32Bxbblqd4SM5QWCxtfj/t2n/RPMHbz1tQuhzquN8TIezFRZRV0/c87vdwxl
UhKxUP3eGAyswGLLh+Z5FbldHIYrh4nQXqLWe6iVn4jUUMl0EJFn3IOYBRh/tBRi5SExq4Hfmi9K
UYYeV2FnaCyazgnPDmKIBBGf5sm2fVAaEpS5CdYgemGLzMmc6uWpDG5h3LTI+NuRbAEhTh7XXhXf
x80zeeFv0i2g9/vuj8Zb2Q3JtXnzg6QXy+NNh06AhWIUXRhc7NRJTQ2FWRaeGqMQRDovWSZ+dNCm
CcILFAJjvUFKS2E3rJh58czYRptzXfEBeqR/wde6YefCiO7kCsSE5fk2hfHo4AAbYRWMYtk5MBPb
QH4k8rqxRzvv252uQMbalMohxwitxYlOPAIzQVBP3VFewGM0oW2r0KKIxU1ej0jJVpS+vlJRbJtZ
IP+wA/gUTrfCh3sw/3ZkX2eGKGgvWRHYLsUpR8EmifNqJ1lijmTwIjeQSNOWJqult2m0OeAiQobF
VECs95YuIV1QsX73x+55/2nyVx3zPh0fPx/u696Z3gEBWZPqBqOIU2y6EDYtF9jKBVad0usfvvz3
vz84m8O2w5rGNksOsFkynTzdv3452Ca9p4ND1LhP+L+EkwuxMhoHt6yk2nn1sBn7TyFv+JZ2EiwK
4cupbabNE6LC57jrMytuFXGZsuC7ZY2Ba8gYFtpXdhNB1LS9dD9X4K8VB/35WNZ9ihYGOwIitQgC
695AD47FuIXkejtEYXofD8FwMYTWqddONcTCRm7CDyzYGNNkZMY0h+uySHYTheKdvrMGvKo5fLr1
19LhqQjWTur14iOsXXKzod3+Hb4Kq5kFSYepx+74ckDVmGjIIS1FhS1qblINEq+xz8E2XRB+5D3F
KKKiZUZyMo5nTInNOJpTNY4ksWuYfLwJxcFThV/hPGKIuCkPV8MJ3/SEQQqhkjcoSMYX5C0aTSR/
gyYjNEzR4lUsVOhgsJUv5mrlBRyQHMPuVBkFhmAPHiYim6tLh2PfOABjTSrTMQ6/9MXZyTXju0+Y
f6rlmOy7lDYPj11BRvaWwDHXOE2BfcyXV28QWTYhRNVmyt49s69u9tGERaanpO6BFn0roHUlgY6L
uvaEDUFNo3qvHD16tY1Y6Bm+xUeJ08ABP6vW8AT679qGY2dV3bVU+VmvNNgcb6ShCnBfZe46gc77
gwsoMe4GItOqPE4ibzyCvoHPiIr9u797fdn9cb83XyZMTE/Hi9MQEvE8ycybQ9hg12hFJS/CWW1D
kYGNCGsA5EhY5wtKbWyBdXfC/uvj8ZtVvxjmgE211BIAACBCi00M5b7s1BEvy4zvbWgG+IRAtrqw
XXXTl2933bYXoEghQCy04QeRIRYG3UERdn24d68B1eU1OnJze6RtjRbSW0CdAVZ+h9ByC6lWHMtK
d08PVpoOsTLktHbrlLLk1wbUJpAGA2gYXc+nHy77LYQSi1D3JgMNLbAoAkHzypqDpozUyaWtuLAX
N8OmGbEFBz+HjaJDbBJs9AQsrJeo6/f9kNuRvt/bQtiVr9uodAKG2/NEpKFurls16NVqysYgy8JJ
0lpSTKiclyGTs5vXmjZDDD3WmDfXdZt+2r1d5t0KeIa7KUCvqwgCqyX2XIzVPDCfK/ABHlNCktqh
9fiFtFs6QpFZnehhs93vvGv8j/d/H+7sMmS/E0q9F+++QnS4a0ZMhG8Nyjo3WrK0sDN+BwzS1Uvs
n+0mgwhXZ0VQb0CUeUxS4bqSQtYMu2ql+SposNquWHb/uPtkymzt+d1U3VuFDzKHDy6oTKyy3waU
oS9Q9r2//SjT9dztu6+nhgjAxqUp5rsh1eoGoAmSTDkNZf6O2lFNKr7ubL0TeYKi3zjYoG7WEXr9
OBJYWINma8mcuLaG40dczVhIoTKxDtmjrq0B6yulFt6HUgquo2MXJVs4/qH+XfEZHcCUXdhqYFnG
xXCw/YETFvHUEo7UnHfiHh0iE7irtSUIV/1H7kP3OPXJXDDrgkSSZkpH1YKrCG67lTpmYqOZ5Sk+
wvnDheUz+/xtnp1Uc2Un+vAL0ilZGw4bmOlVj+gtkqHnMmlwYbOFRGW0CdC0q9dxa1T6UPJpd3x2
I0SN1a73JhZ1lAgRTYdgjQxP4QSzdk8HoEQSgtaZcMUzuNSaLIJILTcuHFWiUGmIH6iKeYo4gYq5
NI5h29QY3p2NMoAItOlKdVPiISFWzUSebt8I3luJm4Mon/Ht6RED4rp5WB93D8/35kPXSbr7Njga
CPbhfnvb8golibb0Kq9/9a4HfkNIHNQhjshwo18SVx6utQgqia27rrLKm9AcvCjG1KUJZxzyLg+C
S59BrOkau/pzLpL9JkX2W3K/e/5zcvfn4al5h/HkRRPuyup3FjPqWTWEg+HzvwptxmP1wnyTIfLB
hUB0LvwYaUASgftruv6CH1E1ZKlFNlzGgomMafcrQsShyYxIvqrMF1HV2cgEHtnsDTYjza5DwnCf
Zmhh4TaMAOXY83cjCD62RYOcDSXH5wHYlWebdEDkWCNMIbII6EQWKx0P4RAMkSG01Dz1LBHJPIDw
ACRS9YNS/z3huM43jepPT4eHLy0Q88SaancHzsi/GBC6wNbasNu3yZAeZb4SNsCm6SGMa7tSrrxm
FIskZdYH9TYCNaD+qm/m2YOGQCQjB98SLAou6mTMdRb0YjalsbcdCMINwoVqdXHRNOjZE0BaC+If
aR49Lfb6q839/ed3d48PL7vDw/7TBHg2QULYbGVqOsvX7srwywfI3NVyBFx/XFl/G7Edo6nV3L18
dFnMzldjbVJGgErPLkZiikqlXjNBfSKeuOwJdeyrP/yGlFtjWxM+jplU2sUyaZ4WEGu1UXXeb2ZF
N/Hh+a934uEdxUMY5E+2WARdWN8jR+bFKYcoObs+mw+h2DLaf2j75oE6ukZMs5BkvpzAxyFuRFJm
GKOQAt9AdgjBsvv0MEICTpiOMJTkxozwboLFIzJ/r0LtY3f//AbRyu7+fn8/Mav8XFse2PXx8f7e
y0c7TiTDzzu9rx18IgH3deCDOgwuY1QbDRUknYuRry1akiZGPE2EpbExzTYEGZFrlg5CmnqGlFZp
Qc9nm9D3gz2LniwgeMw3Rs5EbHKiAvAEIl+e0OCa1snl2RTCvDEVqFe0oQG2CjsrqU4DqJiseU55
AKM3mw95nGQhhokKglWZb0Ksllzxi+k8gMFMKwCGfCkE3fCwaPDB76RSKp2dzyrYyyzElinv06YW
g27nFFv0Hvitb3uxssPznWuJDBn+y/lbQXrpc7USufv3igSQdQAbeG07RRubAsY0sK0BMf4tGaf2
aQ2IIm3ckeeIC96aHyOItIDpJ/9T/znD/sjJ17p8FvSKhszl+BFyFtEF7p11fpvxYFlumdACm7eE
OSbmmDIGK2BASFSBpVxH4RFOSWwKFB9LEjsVEESiwlcq8YZgFaAn75+ScDkbU0dJ+MgxlJF3rwBQ
3aSmp0MtRRr7rtUQRCxq/kag2dTHYa0/G6ZoiFqkJYtOrMTPSxG83BZMOhWkZZRRcBmXF9a9j+0+
X5HYk4sEX4j0yN9IBFjI1mF8pGwG5sUDewwc4EpEvzuAeJuTjDtTdxfEhjkFKvgNBCJdu8wFxGHO
90CQ1Db90tYXBwZUkc3V1fsPl4H9tBQQ8sztkU3TwSAtztcZm6jXp6fH40t/dxA6iD4M0Hy4j8Xe
0NMEEiQkks4beg2lHqD+XCUIxLaOIowZYQPwZkx3n519dTZ0WLuDlEkJ7Bvn6jxdT2dOyYbEF7OL
TRUXwV7SuMyyrfeXK1H14Xym/p+yK2mO3FbSf0VHO+J5zKW41MEHFsmqQosLmmCpWLpU6FmacIfb
rQ61/Mbz7wcJcMGSYGkO3ZLySwKJPZFIJDaecjwp9AWuECui8/FdtezUwX28DiJ9KNUlTIR5y9fO
Ur2PJcgwtDo1xlVGC7ZNvSBTXa8Iq4Kt54VqSSQtwG4mTTXQcxa+k9EmkBHaHf0kWftWyLH1BvXj
Y53HYYRvzAvmx2mAJAijjtcH1y1peJU0ZarTNgED3NserqzYqzcg4MD02vVME4U+0My4LzwieUCV
+GhlKbyZf8zDYTm3FwhvS/T6x4JGSiNL4nwhwUyrzoY4TfArtCPLNswHbJDP8DBsYitHviG+ptsj
LdlgYWXpe95GHShGmUeH5n+eftyRbz/e3/7+S4Qp+PHH0xvftLyDsRH47r7C7cdnPqS+fIdfdW/n
//fX2GjUzf8aoh0WZOCImoEdgVZTQ5Jv73wHwmdmvqK/vXwVQQSXVjVYwP5eTD7bcu+dkz1Cfmip
Tl3csVsKpxzW7Lpkcnz98W4kt4D509szJoKT//X72yuYCl7f7tg7L516ePhT3rL6Z2X/OsteWI7p
a/U095z82CLjiys5O7UfadPrvFQLd9dCW0b4n1Y9gZfetBv+YS5GwoWvbhXttMsI7MN6LTBGrgYH
E98U4qh7yWBMWdxcuvuJd78//3X3/vT95V93efELHwTKlaLJR4+pcaSOnaT1CO2A0NSAg0Kged7X
JllAcrAXZFb4EJWlag8H/ORawCzPGq5Tyit6S5n7acxpO2/5BSihUInOJCE+pV3Lgl6RHcswQFxM
YPphpQQ7ame3WEcMYa3Cn8UtMXf1FEd3ukbPUhZ4V4AF/MbSqG2AYmQP9bIs7/xwu7n7af/l7eXM
//1s9+U96cozUe9RTJQr21HtWHA1QU0rQ6ad73+/O8cTaajqxy3+5MuU6qQtaRCzsqwrTZmVCMQ5
4l1cG9YCYOL47R6/ZSRZ6gxc7O7lFmE+0/oKAfq+QBic/37SFLTxo5bvqdAcJ+RKWXbCjCoGG8u5
Vt9ch9/guuU6z+W3JE51lk/tBZWifDCUawOV8XqUxnF7achP7suLFZ/AFlaZl+FPXgcBQuJLpHrb
d6HvLgVG5jMN4T8pxUA+w2S01zR8BOQzgNyzKS7dE1N+ES4QqHP3xCP8dET8AzyNEsK8lDlqXFik
KeE0xjDtLFm0p/x4TxwBYWa2PYSsvZ1VrW1RJWCe2EtqRmlVisxNZJfX0TbZmOT8ktHMLgNUAWhC
K/I/sGEYMtSAJXAwQ1lCz00otSwjyQXm67+zc/JhwvSLyhPlmjUZ718YEBYYtSAINW93XYbQD/sA
y/PQ6aH8NOBaY3PVwnIiVVXW6oWRGRPhObIcgxhXc86kKXT3kxnu6wLbjiwpi9AB6KcSMqvfyReE
2D5r5jpDEDj1vtWMgHdFVWUNKoSIH9l2N0QQXDs8kt/CBDetSkyC/kwK/gcqwOOxbI4nrGvPLMVu
i/WFrC7zFi9Vf+p27aHL9rhX/tIpWeT52JnyzAHrhHYLf0YGmmH9HMh8wUXFEhgs0OtSnbPqnndH
L/FWRaNMpGfYChGYi7OeIR261U68ZySLtZAWcnYQ7puYRWWEYW6US/BSUQoRjLcQTZKoZhMVT1Na
p7E34GhWsCRVt806mKRJsoJt1eLYqDkhuxm13a2Gd1wz8c3ZV+MQFqV6wKpQ4zu1V0qGnHSulHan
wPf88EY6gitwlhzM93DZj+RNGvrpjcTyS5r39cH3Pbz4+aXvGTUuGyMMK/UzcvAavikLMG4sSyfG
c7thJ05nyxbZ1gs3rowAjbC5WmOC5bdrXWkcs5qyI+kwR02Vryx74kqjPGRVhinSNhPieqgxDbkj
GpLKtT99Ij074VV2aNuCOAbykS+xJcUxUhHeZx0fEggwjkMsZpck9l0lOpyaRzxKm1bu+34f+I5g
dRojX15vVXTV4pKeM7AIn1NPtTXbDJqpTIXrbPD91PVxnfMlznMM0bpmvr9xYGW1zyACCnUxGKqv
1jD1EJ+qa88cMpOmHIiz89f3iX9r/NCyqcco+XiLFHzb20eDh5ldVcYuY3RXdt0F1smzUyRyQEOT
qjzi906PFWfhZ+JYC3vwLAvDaHDX2rwEYJ2k6FMI4+HsJlzNFO5bLdPOZvW+4odJGrrqAFL40JwC
jDRrPhFn6wBHiMcfNNlIjzkTWXIJjc9dcjHe16Qp6hwq3r81yQmRupWuLxiKEraa9yvygLN9Vl1v
JAQvzTgmRoA/gYfsSnvLOcfdmMGtdRW4Hi8QqYGsZdNzXS/fRJMh2cEmxvxH2jJjl5V6Eb+TPvBD
B842qe7Gp6O5WOxwByKDM/A83BnW5otuTQ6Cy6GQdvW1d6jAjFRa4AcdY+7xzno/UMMk6li9d2Z4
ajZOlYKduj3fCYamSoYzD2kcYadsWr1QFkde4ljgH8s+DgLnjPQodsa3Jvj2WI+ar6PHkM8sUv2z
RrscYZpiKqnTluTaNvcl9kaBZON7A39jJSmpeptpiKZxjojYI+QZNYaERHd15utHvaOhMhwg4l7f
O+4dj0Vk9fVBxDBFF7fJzDuk223CVVIwFyF2W7lqXOm5u51hnaWbCA/hKzkONMBsARNI2uuO64q6
MUYBixIeOnAXRjCJIps1mdMcAopMhbDTz3oiLk/1JX4UPpt7GV/7Rk6nHPdD/2lr5yHIwigP9x/a
AldRJ9P9uezqbCWTSymCNFslrX1vaxK78nCqoB8427njayzeyPqmHwZ04KdaVeoc5yr2Nh7eDCf0
UIPm+8iLQ97J1Mh/M5ZGqrF1JJ9rZ1cBTOS+Ur3dfepFUIi1YS66U9fCC09wJthqlxYli9wNyunC
lkSgkT2ZIGxxeHPOGaoQm3QEGZ91JIRMO6RmvGatys7rbAxwa0g4Ao7d9ViK7iGAqfNonjsocByt
w4kCGyIIlzoxKtZqia/DoCcbna+riW09EESXYV6ArmVQgjVuVRXg3gtXQN0maYKOl2sEGGIK7Aht
jPLuI/ByEUdWx6e3Z3F1lfza3k2nzCOvUJeWT8Wf8L8RH1SQadbd7wqTWpGddqAlqV12NkmjC4hk
VryXRNIsqB1vUshvuxz/MKOQO37gLBjaiuacyxHpfiwvqEXX9XTEbGCwjAwnoxLBeG36BE60a8Oi
CL9bNbNUhl46HjVjzbi4iCBnyfK88o+nt6ff31/ebK+6Xg2S9KD6S4whGkWwAxn5gamcE8NCO55t
GudbyBAqQ3/EEILEbPlK0l+04S49sQTZ2Rp8b9VIV4zCFRx+DGZrPGMwgs2pqvTSH9qq2BN2dFNl
8Em7lFUBvjZwpxoujy/0onzQgnPwv8fn1MaLQ29fnr7a/tBj8exIlyOQBqbz30xW394a7zWu1aD4
ZA+HY1gVqUxWmVWwFraFHQ423fUkrutuMLSD+H11ObOgEpZDXzb4E0Iq2+in/QBpOesHvx6ridQH
aYqfK6lsfE7xU/RyiMrFezg9am83qej4PIoFwm1q42JB8/rtF/iGZyR6jfCPsj2w5PdiT2GlOu40
HC0pUVrkSNVJjI+AzDU9c6b7Q7Eb43ia3+cVZYnvr1QW34SEvhZYX6UPFv2RIdk8sql0a61H6hU5
oO9UmgHNAJz1NzPMHd43OPgkwnJifSjJy2cBjrvyHWHnbHFkygUlsy4WEKs5oxH19wEXoi3aNOEb
r6zJT4SDNPR7RJ4Z+0hDMrInaKSLCc/zZqBILhK4XWKW+zFhiagcpOwz7EbMwy8LdymYIyOfG3dl
V2TrFYG87mSMX6l2feqzg2NyNDg+Uv3jJ8Duzpnsh3iIkXE9ML5g4rLM2EekGJ3LKbshSA3OP2qi
tkgTB1Y9Hb5JGGG4tFdRUwBrFmybchChYsiB5FxXQN9CG3sI37wxtOsI4CM1A6vyox/ifutzarXr
TaUxkYdyd7Kq1uRqz2j8CAny7ouUg1M/VAhS7coM7AbMNOnOt3U1Lcps1LzvKsN9aoREBFHVF0yh
i6/4eqdvgUAFlO9SYjT5OsJvSqAwQXdEAqXU8EOcERntb7VyCK3J+HQ4agoD+D5n112tdaFRQQJE
sOzQy8QNzWuYmlQ2JJVdv5YIh3bj47jS+WqvvTLKNwX204IzUb6+SVr8ec2FbY6LiCRh9WyLw7r0
qUDoy6MLXg6XptUDH2dnd/CmPuf/aI0UXycLPsJMlwpJtdkMx6CJzJcc59VnlYdwSlPqVaDizemh
xQ2BwPXAJQf/nuGCfc/6MHykgdu6YjHiPiB8dq8u2iCdKNPdwem5B2uLq7aNrOruxCfP5aUUNTvp
78tltX2wNasarxbh7AtXU3WyGTlD0MTzmA86sT4Nk05f//31/cv3ry//cLEhcxHVAJMAYlVJ6wNP
sqrKRo1kPiZqTHILVWZokKs+34RebAM0z7bRxncB/yAAaWC61Ox1I9SVeLRCwItS+djJBTx1NeS0
wsOOrlahKukY+w026XoRDIdgUdvVodXiRk5EXgdT20FmszUG7hohd9FEvmSIjoX9qovobOL5+Lt/
Q1ixMcLIT3+9/nj/+r93L3/9++X5+eX57teR6xe+/4PQIz+bGcjpGJuCARwGkhn9N69NvxpBlqHR
zFbMYag5LsHLVoS3k0UUQH3WMkBlO4szsCrTXyYGvNzjkzhgdncXA0SG7yTNJ+N1AjHj1QeTwEcC
tYb4p8dNknqmMPdlTdHAlwDyXVRwbw0BWGEcH9R9rJ9JCloSB8bQa6FamZkyrnABwruoo7LVfZdC
7ggxis93lDXv/5XVHIzURshsFYQFd7+xvhHkxPXRqYnJlQZnQyh2aT6fuMZgNKBtTVGp171Oh8cx
sp5URq+UOwaDVtGtvkEWVZNn9ipR/sNXmW9c4+Qcv/LJgw/ep+en72LpQe6IQC+HgO7N9YSfnABD
1QS6PMiNcoV8rcAJyZFY1+7afn96fLy2fINsptBnLbuWD7hrjmAgzcXpsi5qlcA1f/PGiyhz+/6H
nIbHelEmNn052zOiLt7OuVTrEuMEYZLGC7NmQWVgTPMCGMIC87pzcgOG6XqMIqx9uYuEWOMiYR6s
EL4KJgPiKRsSoCn2Yq4i1U8/oKflc5we7GKSuC8odueOjMQz03o+EBKdb8nCRD/8k9y4Mimxrc+7
S6adFAF9kNcWuapCtMdjOI2vQEEaRigxOw1m9mtvVyv49cicxhTJdf2MK5kCJv0uU48mBPHUw86l
uujkMe6HQRxNnDp1WeAM+nmKj6p3Dj4ROAQsKVwiNz+Qhoe1cgPHGHHEyQPGsH1VDu7qGRdb7Su+
mvKfaLwSCVvSfnIOR0CrOvGuVYXd8REwTdONf+3U+CFzFaivgExEZPAB2awJbawxeK+YktwM2zIB
emAmGdEF1nFXgtOCrlc332Bf9+Tk+EjA1AooI59L18NTAL2Vc7ZBhBBcm8HojT0RQ8CUR0Tl8j0P
PQMCvDPCvhP5pDlCurLPhthc0bwfoxtpmXbuZkAUFSCzMI+tIrHcTwmLPUMYEUlPy48rNce1MeA2
JgMoFpq6DxIrf9oVNkW/DCeooAZZMomYVCuzElzQZvnGSMp04BuJ8UrhJnXK1U+NsFqis0BELd/H
/SNnhsC7MhF+0JHyzKQ7KgloGIw1SFHvtJwG3iEwS5DADG1O0CpqEPqyYRn/saeHTIceedVMo8Ig
1/R6GJF5/aVvr++vv79+HRdia9nl/1x2PVHmqoyDAQ3QMnUzq2VF3wOLmLt5BQu7cO2hFo8idK3j
/j2tsa52VAMy8D80G4d0H2HEiA24kL9+gdAhi4IHCYDlQy0IpXbIDdpT/vHr73+aAT/Kb+JBDHq8
8Hn9Dq6bN2UPjw9DMFBRE6zPaghtevf+ytN7ueN6J1fCn0UUZq6Zi1R//JcaP8PObBJ3MV+MhClO
+gjIt08UCwGnayYVhR+sFftTkxveEpAS/w3PQgJzTUmdEzGL6OJClFqtgkfyrvbTFPe/nFiKLI28
Kz1R3GtiYnOfb08cdU6DkHmpXlBAusfMR6kBJnP32GD3ICeY8YbW96IzMviRtyYh+EEPtiDLsbst
C3gFrqTY5mWl3jCe6ecKlTDx1huDbdFrV3MrC+MOlvJohT9g/tcmT7SWAB4adu5PoJb7q91gUeet
r4WdyWU+mpjyy6E5sdEuaiXhcGBZYHor/YYF7sQpQKs5ZCxM1ttwV3YVPJB62OTYpnzOTJ6rYHLQ
IQuidTGAJVkdjaxGm5l+Tr14tZcAhx6Dbmm/zxvP364KRm5mIDhUB15F5DSOPSxngLbxer3XRb2N
ffx8U01nSNakEzn5sVOI7c2PtzFetO02xVL9nLON49rJwgInWGzHtWoI+bQ6geSJn65NIayoY/UA
XqGnmwih16m8cWDSj1eqRvXT6YY5VgFhPbT2j3Ov5l+WdfmAn0GrXF2aJWG21hYTV7JBpF/A0CWH
hD+WAzrbLfCNCWNhzNYWvoUtR8fIjCfYVW6ba7uayHatEy1c/noiH2vIZIs7R9t86+Nk4VufBRa+
9dVO4ftogh9t6u0NrWxh/GBDbJ19kB2TwMNCBZhMMTInz5izt3A0zG4XhrMlaBhLiwlVCmf0dk8R
bLc7CrCFt4Y3MEWJs1qSdK3WkxQN9KoxDSEyS2pGBJXKp/dtis7epj1BA/abYLu2JEieeOtId59s
0PVwBON1hUBwHflEe0uCmvpYVffkStqilBF2rdQnG4G1naxfnr889S9/3n3/8u339zfEr7okTa/H
FZ9XawfxWrfaoaYKUXj/FNUa+sAI7IKwJHGwVj+CAWmeuk99XNUGJMCO2VSx/ABLMk5iRA8A+hZp
HiEamk7qJ0jnBnqKLrocify1EcNFCIUIygt8jkY2P63a/Nhkh6xDBALnj8ymc7UsqXykJgQQuoDU
BWyRYSsBpfZAMdKs1yNBRBCG6M1j9O5oef293RvK1vQJ6T6bllZpTTA3SDMsTszZhaGP/wlwtFTo
mYFXdhJ6ix+LjL/+19P37y/PdyI3a/CJ75LNMBgPw8l3XcRhlUm09r6SDGdXLnHVYA+l7vsr75bm
9fW+bbBzMYnPXhAqdTnw0VNbcWuXl1XPGTXTKkluzPeSXFup73v44fn4Uqu2znzg72zFzu4x12N1
tmuXtNj5i4BGg5CRivX4hewguzRmyWAlX5fNIz5NSZjmPAcrMcMtQl7D4hsjtTL1fMyTe62/Z3UW
FQEfk+3uZH3JGsquueG4pDFg+fGxeh3OGXYrcRpjuXqGIojCNo7R/DS2cpBRD9xdAVsXVdy0k0ti
ZQ+RR2d3zurius+P+nzsHPmzl5Ogvvzz/enbsz0jZAWNojQ1h76k6iHbR6ShBulw5v3fHE9yhvLs
Dgj0wFlE4eQW2v12pINA7k/hmrJZwz0leZD6tiC8PbdmeyoeBkalyWl2X9iVaUyOUHGo1i3hjjzy
2c+QcVdso8Svzw8GXd5sxoiRSdQcWARJektZk0WahPYMkiZRbCZprtLjsI76KA3NOs7DKN3ajTbd
VHcPGsGxXZth+8/1kOKbRonLu+6uCj/XaRjZjX+27ErLiLIbeT58utH4fHX1UUPc1PNDf+sjc7IY
KpghQsJ5GKapXQZKWMvc0w2fxTae2VLzK6uL975dLBlpmO3WJ47FDUlNDvnMECC/Vx83P/uTDuP/
8j9fRu+j5Whv5hpdc64FCzaqXqcjqbYjW7B6wJyD1G/9c40lqq/aC50dNP8pRHa1TOzr039e9OKM
h4rHstPzHU8Sa10dmQEoJHo8onOkSJoSEC+pwtvLDg4/dOeLj0KNB91TqRypFzlyDn0XEDoBrifk
TnlDzCinckTqtUYVkL6nKOAQMi29jUuQtPQTdKbRe8e8U4H4CtdMfYdWkrqSqc/AKEShNd/LdWXZ
5Bk416qxnZ7CdShr0owBHlo9wKrG5jjtMVjg115zS1M55DHeWpmqPg+26uqngqtpQ4SYvlWd3lTU
1ARt7GYNdNI790YlPCq9qyvFY8YQcGYhjrmhmCZVrru9wIM99dpn7ERpdbGll3SnB6TGdDzX+s0U
WmSSA58FxDprM4yweB9dgIusuwyc+y5IDFpwXjjAIODKlBf79idZ3qfbTaT19wmDYRpj+oDKoA5w
jY5kJuiBTWfqO1iTyBqxzppsIVqS7j5Du2Kq8Jw1hEHFRDUUw4kOkSoTb4N8MSIBJofAAnQXPRXL
3UZT4CA14QkjjEKmK+mK0FeqljIBoJMGiU3XF+QlGVHRSDJ9GEc+9sHgb6IkwaQuyl5cXZBMcYQZ
yDT5t4icEkhtQJ4s1rudDf0fY1fS5DaupP9KnV7MO7wILuKimegDRVIUXARJc5EoXxRlu9ztmGrL
UWVPzPz7yQQ3AEyw3qHbpfwS+8JMIJEJ82Fnez1VJwGR9xIyh+MRNUEgkA/PJACkdouYw/zg7siu
GQV66vhgmkxZ1GXpsHnviMU0efNYI3XrWfQ0qltY6/R10Fxl2CJdSoKeGLq4sS3ZSHHa3+SfINMq
JwsDcTRkPzHlYGbwCfH0C3RtyoHIGOwrgVrJ1oMLfWekhxSdo6drE+CZAN8E7A2AS5exd3YWBbRB
bxsA1wTsVF1chaghVDh8x5jYcBGo8pgeY488uqnJCo/Vk7AZqGFRx7rrDRkzuhmYcjY8IpsZ2r4i
Ck4a3yH7E+PGOVvdObpNi3R/IxJKKRoTwxGtHrwjlRah0DnSLw8XJs8NPDKg0sgxuT001PDYgibW
tRGIFpsFZblnhw393kbicaz3eECqoN3ZSRzk44EJHl7HFetBPLGTb7vEemFtGKypH+Kds6aCdFXb
jkPkkrMijbKUANZ3NDMkNnCP6ngBkd8iiQM+ZMRsRcCxTbnuHGer/wTHjtjrBOCTq2CA6LvAeZ6h
e+/NnQc5fMsnihaITeymAvBDqk4I7alPqMTg2tqtvIT52+tacLh0lXyfmjkC8IiJI4B9YKgH1HG/
veXyuHIt553ez/s6zXBdbLK1Me3pdtndY9UNzDj+3HcpakAtEx645BziwdZGCDDZQ0CnDiAWOCTr
EJL1Dek1w0Pac/7CsL1O+Z6cZECnznEk2HNcQnwRwM42ZAnQ9te3isPANZgcyjw78v5q4ijaeDhX
Y02rxp2eOeIWliZt1iLzBJvjDhygRhLLCYG9RXQPYX86Q03kboacLeP4VoWqMwQF24OWSWzxZUx+
PMVdyd5gI8G1+Jx62gunP2Py3a8mXk8szamlt38ANnc1wN3/JfOLyfmW8NQO3K15koJ8oRyQS4Bj
GwD/4ljEd63hTbwL+AZCL7QBPbibn4MmPnm+cIHFtSMZhWNzUQgOl1AHmrZtAo/swoZz399aAbDn
2k6YhDb5mRPBg5ytLVBwBJQ0DR0dUmI2KyLHIj5tSKe2f6C7DpVRGwc7qtLticcG79kzC69Agdpo
lmAgpo+gk10FyI68/5EZHHKQzq3tbMoul9ANAjej0iIU2ltKB3Ls7WTdFgE4JoBovKCTK39AcEfR
H9xQrHkQeu3W7jTw+MpL4gWCVXI6mpD0RKozw9EmWTHxnYmoV0KXqI1PiRy9b6JobjpmclFeomvZ
KS4HZnBwNSV859zSAoOCUcM2s5eViHfCU8zPWsHC4OiP8d7t8vTry19f738+VK/Pv77//Xz//esh
u//P8+uPu3rFOSev6nTM+5aVylM7NcNV4M6pY8tjS3TQqJAaAM8A+K4JULLSrn9HgBxUnhZHxz7w
mGRbmD5Z/p4soo2KrOy3Uo+n5euKj870qFw/MVbjjdJWpfIew9TIqWavAj1doYWxAWHQt7ayR1cD
NXBZFllBhJuI7zdbPtj+7IimjzZeBHJsoVGWTfVX48YgcNL1SS7bLR4e9G9VVrzLprKuin5nWeFW
2iQ6syJmZPK68Frf3kzedEXPiAZPvuGIroCPBLSnxwf69LQUBkxbhYIo4JB5oyLompAg8B1qbBjv
HX06Ai3o8grJRPkiAAJVdV726DhSS7Xs1Kw+NiW9XhemFk3lNpuPpl9EQ8SR/dCQefWjO4KsPxyo
LhEgRU9Y1KaP1H41+aMksNHqz7Dk8qgJttpUp0WKsca1cZjI9aeIHorxceK6OrOvH3Jit4ltGzaA
ZSDQrH5r6scezie5vwdbJr0Rh5jvxFogWwDUG297VWpih2sLW4xhf6sDtVh8IE8Uio8tDYVO5q1E
qpm+vn+V2QLLDY0TnfGsSmJD2YP/B6UBAynh8tStsHstvYL87O963zJkjZ5MI8dWM+94Lk+CyWro
X5+f3p6/LlJA/PT6VZEjgKeKt8Yfg5uVDYyV4iO2OSg/bk3CylMprpVn3mWgJQZ6EgKDSA37hqEO
ekxqpA0eJjFmX6PVRvhg0Kswsqd9y+gAsRKTwawCpkREdAeStQkWkQ1SOaT6v8uU8Si+xZw+l1MY
TdbtA5M+2xfPi99+//iCHgOmmAmrezR+TDRxGSnS7b9MbdzAVlb7RCVPlYX58mitqWUUtU4YWFTB
hK+lgY7e2dGBT1xyCjrlcRKrgIhgbslKq6BKlqBqO/rKsXpD8Bdk0M01F5p6aCTRFZ8boqv1Bxgz
0aWIIUXcWxRRNuPBjheGDT1BlK0aMPmoFGhOcyTE3CO6oexEU68QZyp9HjjCtkcdzglwsLxVEgze
aeHLHTWUqiqGILbdXh/9kbgemAnQ48wj1ENBdZQYgtsLDscD0S4iw6gjw4n5O9jccQz03AHyvN78
CPrUok+8Bj4zRN4IQo0VK2TMdLZMVooSJiakL4YF1UZzbZUyzO61bcdIF6KquaMEg3GkB1h9GbDQ
DQ9qZ4Zwt8kQ7i36KH/GHeoobkZlG5SFGGrE5TmXTJ30XVpL+iQ8z1KPUsTyRkwtRTEMlugo3asU
ynZoDkRmmtIzg/GzI7LmIW1aJWoymZrINN2yXRAfQ0vrw1F30zuxSeOVr0MZZrvAn6MYqCm5R579
CezxGsJc1vZEPDXWKEPILX0FR4fesyyzD0aRFNRGY60H56B1rH3UdBNKpCnRdbUre8Tzyt2TL1IH
MAzCcJVhzjs9myrKeURtqmiaZFuq9dQQ+pKOOLtExVTyH+iGBwcLA3mtNsOOHazbor28kMjK2wsp
k9UkE/TQN03r6TEFmWxvr76VNJPJR9vIBFu0S98btZd8Z7nr6bbAIijhWqy65LYTuASQc9fT1+ny
1kQmikciWuK1cYMQpOYXOKp8NZA3xImJg5aanJ3WJu7Z1kowQCo5HQdw3Ma1JLiPG0cE4J3hVdoI
u/ZKbKRYaB94E4Nn6c0TB5gryXJ4V7Pa4trLLiTtS8WOKsLHJsH4tlFJOWEg6VE3SeMGBjpuXomQ
Bdo+JSABNOs64W5p3HhHv1XLyYZ4llERe6nsB92k0CynMWMMUPUsZgoMajLMXjiOrMcAW2XeKgY9
CwNGZOiGUCdNx1NDQRgsr6kwONvER06PJQFIWhm98Sg8KI0FdJGotIXkdaLKoyp2EpZ4rizPSEgR
KTG8JWTQ5AwVEvriZn3WOpqEzROWgFbP+RZQE5ikwZ9UImpiCF3nnTEymuypLKr6o2AOuTdpLDZV
+WNUeK4na1sLpppsS2FwhdphRs6eaxg61uR7l3wGpfD4TmCTcwm+K75LDh3x0ZBAEGECssICcWgk
DBy6KE0gUBG6KxdpgeiVQYh6Z5Lkw/fz3+DyA8rwfeGh1CwV9UhvLApP6O/2VEMFJLtdUSHlXZAG
yZqQDpH7h6TX0Zhi5SNho1K+CmqrcAQhJfSqPOHeUEBlg6xpWK+ozL2zfyGLGttdxUi3ZSrL3jC+
1YFF9BGixDNqau+xHbtPqU1q/hLTOQwtekIIKDRsFQI0mClKXBfKc8OCixuguuInqvzxRUeCDGa8
4owCF7WTqJZQPzcrtmija0hTchdkeCxBIit9U8LyDERaixyCQdA6lKXqPl9nONfp8dAd6cYOLNWF
ej4mcwlR8nbmPCYLggZYfmQo4hqGzm5bigEVx7N9l+wCScckMcf1DdNw0BrJ17E6U2DM3rNdw16w
8S5nxUROlgHbmYve2+TAr+OBSKIo2vNQgK5QKMigPoxIPJ6qqJSibNlRLVRnAwKPFNcaOTNEEKwx
zIQILG/Yz+IxjBoNi1td8WiyVEP0iWuO7PXp51/fv7wRQaU4qGVVd9b13kR+EA4/8K6G3ZIDo6iN
Rk2qW9T167BXAhPPmDinqE2aH/GJpoo98maM2iR3JCLHA8boS3k3xKUmOwb5MM7XDTooAcWl5hiF
wcgKVY/J0DYItq1W7Qz9bOON11Q9rdomDNM1J3w+S6FnrZQmPgn/R7MnlecfX+5fn18f7q8Pfz2/
/IS/MCKUcruJ6YbQY4FlUfLPxNCw3Jb9/010jAXRgqS9D/sNcPRpITksMdVNVC6quRR6fE4nkwe+
uHr4j+j31+/3h/hevd4BeLu//hPDnXz7/ufv1yfUbpUc/q0ESidnqdbNZxgxlTKH9xt6tm7jVR+P
dyxHxilLuIXDQzcBuMALqojADMES6/UJMiJnlsw+6dOh29+Em/TD6/evfz6b6grLdbOqsAb0hTYC
p4TTh3JKdePV9tP8/vyv1aWqlCaTTTglOqtMNYH+prdRiacuW9zNt9vaxFFu6N5MPt5GepfkenXQ
vxRaeOk9o7Pk50SbW2N0z6zqVHoVFSJkt+i45Pvbz5en/3uonn48v6zGU7CKd31zhCtDHQbOdSUG
esN4pdotLNgxZdeoyG7HqxVYzi5hjh+5lmmuD2kYhr9+hH/2rvp6iGBh+zC0TfvtyFsUZY4hAq1g
/ymOqBZ8SBgoi1BDnlqepbp7WrgeWZElrKny6Hp7TKx9kJCPwqWOiXjTQePzZK+8Zpe6FMCD5Xof
LUNDkSED/ZTWPha+AgWKPLR24Skn1SmJtTwL+62idfeW6rB6YSpzxtP+lscJ/ll0PSsosw4pQc0a
fHF+upUtXoDuyY4umwT/sy27dbwwuHlu29AVgP9HTVmw+HY+97Z1tNxdQSpXSxL54UZbdvGpies0
Lej86+iasA6WF/cD2/CEhOQOnfeqUcaPoiM+nCwvgErvLXLs67I4lLf6ANMucUmOaf40fmL7yTss
qXuKDJNIYvLdD1ZPOvU1sPP3ig2jyLBempQ9lredezkfbdK2dOEESa+65R9hXtR201u2IcOBrbHc
4BwkF/K+keDeua2dp8ZMWQsjwXrQyQKTv1UDd7g/b9egLNDJR+/5XvTIqX5sqxIEIcsJW5gxhgqO
PDuXtynp51tjrTLbJgetrbv8isve8/bB7fKxzyJZ+tI+FnL6Q82SLKXynBHle8N+/Hp+/fb05VkS
JaSksLTzMoNOjIo+UE6fEY2Tohl1AlW07vgBxK7olkTmbzd+o25pIRQhQ1fxNIvQDQK+GkqqHs++
svR2CD0LtJjjRS8WZdWqLdwd6Y1l6Ik6StJb1YSKQ1shejOcMiz0HUsH2N5y+jVxeJGo1KA9sQKd
bMW+C82zLcf01WnL5sQO0XC5GOhSuYYGGgp75rHa6TMHyE3hezAc8smiMohJ9cdKwI+Sc+DJZ+wK
oJpKaGk29KdRUFpNjIGsJ1xN7PWsVGrHdUUFVFsc2jyHeT5+99cceXJYE6lajsFizFJnW0RnRod8
Ev1dx1XWGeGM205HP77EsG7IcupD1wskUXkCUIxyHOU8XobcneGmfOThDDYw9yNlcTux1GkVKXrq
BMA26skzS6IHrrfS2Ntzuvn5PdZl0+qJpgg1R+rITDQgTrTNLcc94kpteCDnpEUrzgtuHztWP2oi
MTpQnkPSi03x+Pr09/PD59/fvmGUzVl7HdMcD6DlJ7kS3BJo4nDoKpOkv8dDCHEkoaSK4b8jy/M6
jdsVEJfVFVJFK4DxKEsPOVOTNNeGzgsBMi8E6LyOZZ2yrICNOWGRIpABeCjb04gQ44MM8A+ZEopp
83QzrWhFKZs5AzFJjyAmwpSQb/SwoCh+FCFxFSq6JhvPWRqtAqgyYWNbjCGma63KuP81haVd6bE4
CKuYn5h3pvZudkj13yKo606pUXWuKTNhQPAx3RQDWuofO9EsODETGMRbFK1phzUNek3rFB6BskBp
ktgoLVjpSAIhKU5z6gEiVpE3caeaMQAVlGlyU8L5fIDtsG93nsGiBDtv9N9ElzhaH6izIEXBr+Sp
PnvrMkqaU5pS2x/WflKOJRIoQK5qYIDjg6E2ye8XuYGIKXZ4+vLfL9///OvXwz8eQFWb7DVWp7So
xsV51DTjGbByogxYvjtaIFY4LakZCA7ewB6fHWXbVUFvz65nfTzrOQ6fFGrDnVBXFomQ2Cals+Mq
7Zxlzs51op2eP+WpXGEABcX198eMPLwcW+RZ9uNRfuOM9OErqdJKvNRxZIuOeavQ+3WFrzzfL5Bu
GLYg1UVxnLoAg3kF0SSVxXPo5BUP9zv7dqEf3i58qxcFChQqoUQ0KCChtY2zVCnCflbKdLB+IQda
6UrftSh//BrPnhyIKvQ8sm6zSSdR5nTN+E7VqFstqp0mQx5pKikmKFIlzzBWgRysdMEOiW+re41U
ZB33cVGQm847W8tU0Jklaal9IUdoFIKHU8f7j7f7C3z9RlF8+AquNypU7+DPplTPE4EcY+BkfHHd
xHWZ59gISprrOL9KOVBk+DfveNH8EVo0XpeX5g/Hm3fsOuLpoTuCzEDVjYBH34u3qgZxqL7SHyEi
mThxNl1E0eWMgkwbPablWbd/G4fync6fN7oyU77N+Psmzv5ABCJP/yQOGCH1KFHC4rxrHVJpFUwJ
3o4OLPJxxOrOcUrUlF2hPLtoimQlfJ1Ysp5dJ80vIksWL6htnRZZeyK7Hhjr6EJCHRZkSDNt/ev7
jJ/PX74/vYhKruRBTBjt8ABRWkpIi2s1+ORMvB3pV3mCoapy+rZSoE1HXwcLsAMBnxayRM+l+SOj
pG4E4xOew6oNiE8Mfl31JoBM2kSMOqwZ0C5TQwAjlUcxqOVUlAyRRlxma4VfKxB9G5UIo5qVBR5c
qyrjRNU6VkqZclArjmpuaZ4O7+aUqqafHlNTRbOUH1i9mpPZkYzAghDkJU621ZIfr6mexyXKWzUE
iwKfWXoRp+umml1rsROp5TB0bqCXxFpK1kfkQ3SoI529vbDiRGprQ/sKDNPb6iXn8eR1WcmMFmMG
pCjPpZZJmbFxXam5jHT8UdF9NrMYlhridccPeVpFibPFle131hZ+AVUib7aWNChdLOZl15j6ncPY
13oP8ug6ve2VqPDtELNd42XwjcWPrUYuC9gr09UK5l3eMjEtjXUuWjJeOCBl3aaPajlVVKBHmrxU
l4ZE3uqeKm2j/FpQMrKA0UNBnGglDkTllEWmEwcDMjzkp9ZigtLEvMNOTDGjDdcFTx4V4soh3sgH
5QxTg2FzHXpYSTJe4JjS4IEZfLzXydo0onWuEYW5C588g5GR4OmKKt/46tR0ZHnck/AyL2rknX0m
rTbjBgSv9kN5xbIWRKaukrRM3zBgB2200GGCfIItytwL7anumnaIsGFk6lCiuFUN+eAU92/GeNmu
NtueFZySxBD7lNal2tyJsmrqp2sCkoO+7AdPUbdTdyDpMbQKTUDFL002yatGlt0oAWcOx6KKZosk
ha4MmGk/r9hswTTlcbgDW/V6/3X/cpejNCo5Ph6oHBERO6hc6Xfy1dlmsXSyqiJFTrzYmMROycpJ
4Z0AJVeppuUpZupZ59L7iI9WeypxdrMn0XLUFGqm+DpBepdX7EZ7SxyyKgpN90QyaI/wyYya20ne
TjvZwYVgKwoQ2OP0VqSXyQRxGkr+/e3L88vL04/n++830bP3n2hptRpGUHQi+MrcUMNkDXXUJriu
RYQv8DkrSvWsVnRjm90uJ9gMc3MOyHPIxW7ftOpKGDuwET0ofLE3h3W3R11bglBdwTjdhtijjloL
rqp3y4y+v/1CTe3X6/3lBc/5dL1AjIQf9Ja16vBbjzOEpiaHTHmpMwPTCZreTUNeTIuzsmbhLaWA
L/A5PXREsWjOpBeZjtU3DUrfObZ1qtYtxMgMtt/TgOs7I6AUdoQxhuz08tRBinoXfQls1Ins8Ym6
jmaooI2+RmbENCid7TqbNW7y0N6qbx1Gvo/X/kSPYMHo48SQdKnxKpWIh4KnP8Z6TR6a4O9TQ078
0b1e/PL09rbWhsWailf9ARJP0ZI3/IheEq72byus7IdYB/BV/c8H0WVtCbJv+vD1+SdswG8P9x8P
Tdywh8+/fz0c8kfcq25N8vD3E5Q9pH16ebs/fH5++PH8/PX5639Bsc9KTqfnl58P3+6vD3/fX5//
n7Ira27cdvJfxZWnpGr/G5G6qIc8kCAlMeYlgpTkeWE5Hmfiiseesj27ybdfNA4SR0OafZmxuhsH
cTYajV/fPL38+Wp+iJSzP0aSLwAq6VJwKGcK3VW5NO7ibeyfxEpuy3QotllclctpGnouVHQx9neM
YxXpUjRN2xkWfdUW0h+Q6bzf+7Kh+7rztWVcxH3qG9FKqK4y6zStc28BdNCXv7QnDKyRCRaQSpdl
U2Dok1WoPxbgkzoeN0KYCPnX+y9PL180B2d9RUpJNLPS82OacXrie0Ra0bldbU4cdnG6Q++pJpG9
dX/Oy+l63P2QM/lakLaYJYHvySfi1AZog41pZfNFZdGkKTwNbmvTsMXbsXm+/2AT8OvN7vm7guy8
obiyybOCW7dLtRhduG2GG51rZNEOIR4s25Bk4JcHvD/2OVN6M98Y5kGJVjN321uvAna6IHZZUl6A
a9lth8iJ5ueSvqz83QDDGZrcp5X3lK5RV5UeASybaJj5XeMi5lZXyHVW1phxztSTxNs2Sqq9nQem
tVvjunZRTIrsfV41mhDXVvdZ7JsnUgxgF8UNeuYqpKq8huk8Z5wll7Iy8nxRVjZoGGNNZNulOWva
Gi3gmNPa0fkkL2/iw7Vm8FhH9BqysWo/XPJLsZM+Ws9tFIT6izmTtZzjzbdj20Run8jUx51wet+j
dFhTmriCGHWX+J6mvC3Qhxm6BMT7GyjBh0hJuqEPzbd5OhscIK51RFnT9dqDTWWJRYvrYufe7lVM
rIqPJWpR1mSaIpzPnI1IMusuX0VL/M25JnYgcX++KsQWRTh7X1mFGtJEZ1u3kbx4m3kZQxOnaZbi
/Dxr2/iUt2whoBQXuSuTuvA0A2qjNRaKJGt/N4KuatwzWzvrEmWdTo7JQjZ8Iy8Z0F4pq7zyqita
DsS2c6gagalqKPHRfsrpPnH2b9VMtA9sbUv1b4evEH2TrqPtbD3Hk3HdXtf2TNMHeu7JynxlFcZI
ejQ0fjpK+868GBTFHmnmP0wU2a7uPEEuOd89JaptgtytyQozWwohKxYw1xdSZWvTj+GwY2SFPTD4
faXjbMur5NSoa+OKZMc8aT3vtHjh9Slu21y3WPK0ma2lZXsIUspPtNv83PWtVeGcwgXA1lrR75ic
tS9kn/j3na2u2/eg9yThMjhbp/89zQn8MV+6K5TiLVboWyPeMHl1O7DmgsCGzleRfVzTW35nMw69
5q9/358e7p9vivt/mXqMjr1mrzW/0nVdTlU3nHgmWa491JUQauwX2zMKkHB4LBuTDtmIiNyJbsPu
4v2xNiVHklBmkztlHkRsQPLVh2a79Xy9UQ119HBo4zx2OUdAC7RHuZ5q2FI8IfteuHQ+/RYiXHWI
rPpyEN4f1DApWqoxqoo3j29P3/56fGMfPVkYzf5GDVbKVNbrqK+8bq1LUxYmizrZf5yx3ZzjcO3f
UMsjFHKRPb9gEKsaSM4tar4bAKivNUsTlkR8mnmepLZhH4TZ7hSGa0dhkuQhLfFAe1rvikAJnvpJ
v/WjY4YW7krKkqePbbSjzcUiYbt0U9O8sxdkaWfTj2noWWzroe5zSy0Rf9qjXlHRXEYmYvMbeXWS
+UfNKFWCW6ayzF2V3g4FOOb+iOD2wj2JkrE8jSwuYr0cRbu7Bn3/wicT+HzRU97pJisDQaQ5tTQ7
MDUBIdqeyExmSIpaV+dGkrpCiRQHUMiH3oSMZsJywxGXOSX5laa/guT12wxIrNbS8duBSNM98SA3
Mi4PZbFH0YgZ143Ky3M0kA6h0uBxbsE0ipJzl8JfELCZTBAW78UKtDvBN6qqMEU8dU1PZobpiS1V
3ba0s2H0pOizbZ4VmG1fithmKkne5/P1JiLHUFdmJe92bn3RHv7Lt3YFfv+0WC9QsEfGPPbJ3M67
p3u3MaC9Vmz8ejAemYi0a8NA9xRGDmxoWINVhDEwiWVn+C2UWUnZIQG7rYIrSbjTm9LzGz7u0q1n
MVEH7kSDuTKCSNKCjliBmrw/ge5V7SbkDXBWcnQtnsx1jubkuJrPwuUmdmrCvno1D/Hz6iSwxDCX
xJeY4H2C1s5mwSLQwzlzOvdRn2HE0KmX8Gf3VwscsBe4xXPkb/BHA8B2ccA4mX3MhtXGl8q8uBbl
AIjvwq0+Iy+9+RTNcqmHr7N5ZmCziYy+qFDcFdKITYQjKSuu5Y+uyBH6PnVqIRNTWKf7YjaMMqu5
m9YNJ6ZzbWD8kaiDckkiCcIFneko/KJg8wkEp40QS94JmIbRDGnTbr70IJuLmSaeO3gHngDAc7Lt
SAxIV75kXUGWm+Dstp0E+PP2MZtGy3+s5qi70MSl4NSczoNtMQ823kkjJQzdnjMk2HZSdMRdofgt
5h/PTy9//xz8wlXLdpfcSHfL7y8A0IP4+Nz8PLlH/aLb/EXfwEEVs4uJ6igwbqupeFxdf88BBKyf
S8Gv5Q51UBU9xMG5PXMaFqM1tsatwrVxFh/brnt7+vLFXd6lw4i9yyg/EoX4a40tyWXHbrjn9H+j
Eiw7/DBkCO0zpsIl+I2CIah7POJZkaa/lklMuvyYd3fePC4tPEpGuf7wDuJN/fTt4/6P58f3mw/R
3tOYrB4//nx6/gDQKA7cdPMzdMvH/duXxw93QI4d0MYVhVe916pC4jJr3e1YsZsYd6i2hODBgT3Y
xhbrU323gksdCJkDcDdGK8ZBcMe0jTgvigw7+ksxiKHGTnxThkCAgLGrKIhcjtJ7NNKedDWbmihR
PXr76e3jYfbTVDkQoWAx2mOtAVzLigKk6lhm45NpRrh5Uq/1tekEgkzp3o6hH226ARenU4c+zzjS
m8lO26NxhgHfPCgcubdU4kpZ830aE4mTZPkpo3O3rDjJ6k8bjH6OdP1P0ZOWMOU1cRkplU9IUfpA
2Gju9QcYOt+MGWtyfCHtJqGVafBQnP1dGS090WeUjAvtawlAgL6Nuc1pLG9wEUPGgzJvyqAQk5OE
EyBl5PGgeEc+Pr0ZWOE2RjJdkrkBrywZOS2CEEshGCHa3pKHQhNLkTMTWLq58qDZITI4OWO28nHm
qzlWEc5DLwQMiQjJtlwEXYT3Nud4A8iN0+MwD7Fz3Ti1kVASY3cIyNoLqSk7zWxmMZZ4W87ZPLtY
t5bNaByIfBJYRgEyTljCEOm3rGTHQWTKt0dGx8YbYAajXUaXuLvXyE/ZGhI5Kg7EVjAXR6TXNp5+
1vFQjcUKmRCcjrQA0BdI/pzuWQz1QF7GMhOskCbbrE2YqKlPFqyvrvT3Cg+KYcz/BdJRYtVD2oFN
nDDAZmpJGhGGWt/pAEKnSqW5a+wwwHN0dzWnoeaG54NJH/YnK2K7WcFLiykfnBuCLmGCJ3L3e3Jd
rDgpa4r2e4iv34yzxNHGNYElPsRWEYT3LvPizpMzE7iydUYbT9J1aKZFZRY/IBP9SD6YjWMSCBcz
bK5ah3eDvkQ/ywlHZy8z3W2w7uIIS1wuos4TvkgXmV9qcRBYIspWSctVuECHZHJYsMX30nhulmSG
LNowlNFtxmsnGVuBn8PdHGmTGfEbpinngCUo3qe76lA2zlR6ffkPHNau6LUycvbl0SOiQV8aPioE
MNLsoDu55Lo0AomMey/BvlAEu75Q/rFdWBaX8fvGsN8XP1GF/75QxoTo4aQ+dtESDwGgvgsCYiNn
kPNiM8eG6tGliVjo8wj9Shl+/EINth37axYg2yKp95tZMJ8jwxvCq2HbkIUdpBjizsClFw0JF3j3
yAvoS2okj4WHnd92esTQscrVkaIrCw/CfWnZUPEiHPrawPcb1WwYD+j+tp6jhlytUefoKkQ8kQrH
jEV8anSU8ztjZwkAIx19fHl/fbu8n2o3aGPWKcRZdZDjBd5jGSf9Vnu0JZPQu4oAeJgZzPjE6fgV
q8zJ/WbBGKHdjWeGVvGaeaQ/Sx8itLQGkNyQsgBw3ngb3BserXk9NHL+5+3BZKQAxo4xmrY375IA
XGoQIYexe0yB6zzlIXGey6zqHWISF0VtamaSk1dNj41xlZsFw6WRFRodFi1Avtl7eHt9f/3z42b/
77fHt/8cb758f3z/MJ50qmBiV0RVrXZtdmc4/UjCkFFtvtEu3uWVZjYiNQA96N8hKN4AZCNbWBT5
uMo/ZcNt8ls4W0QXxJiKrkvOLNEyp0T1qV2/Iamr1CGanlqS2MStdOC2v4hStrVWODaBFMlpfGFY
SSHuPeKpZ9ptoiB0yBVPBQEokXoxTtpji7bB38YU+yjBpPkOfXomhY7lbTQztwzJicLlcqAXkt6K
/4WZUwGv3P/9/RtYhzkizvu3x8eHv7R1i+lct72200kCLFzdfohJ1dH4ErchXm5Ts8nq5fZp0xmX
ACY/qbBONWXSjHTFrT8Pxs/OnjDypiDL5mppt9ldQ/yFFT+ShwkxYfGa27r3crtz03qZ3D1K3yc8
3W4tLIOCjREhJF4+v70+fdY1ZQeZSQWPkKIqv23eZuCF7Xg4bU9ddwdrydDVHTils8lOf1stXD6J
21Sy56NXoNqcx1uCsWY7OmybXZzUnouivsrpHaVsfUH6BDAY9X4Qv4cYEGVXi9tha/iLS26Srlbz
hXkPZssAkt5ilniQOUeJdeqUzTH45ilSrsSwvVQsgAsGHku0JoJj5RoCS6QCAhD3WtJF4HwT0BdR
4Mly4TnsSpGGpNFygXkAS4E2jqL10imUrtJZGLuVAUT5IETo+yCYrVwyTYPQNF5oHCuGIS5y8fO4
iCcery6yvCwiMIP9jSQx25HPANjhwvO8WokUNApRJ2wp0JNgFbhNysjrGUJuUia+1k0tknPiN4R1
Z2yZJf5aUilK1r2hIsOC0OqPMhRDQQi7HMOLUxEt7JuRXBvuexO5bjz4fEpEoTlZZHCCdojKwR8r
SsDPp+BNfql1WrLXsTlJKXAL7ZCH0ptsOJJ9fkDya/IFN7yImFj3738/fmDhiCyOSn3OiyE+59D4
WxMEF3z7uBN4hsN/g9Z24j6kSYwDH/Un/KF3xnSvDvdYLQEBX+ENaMAc1mbjUlgzNE74dwCMGmz8
9fFYxcZgNpaFViYririqzzoAgmJxD5BhX3dNYbmLCk6Ov0qri4YM5zpYYybC/Yk2eSWdX8Ue//z6
8PcNff3+9oCANHMfjaHWYHQEpWlrHZaZFLcUYrZZxys1rngatLIwJG8hLLdfRNreXAnFV5a3wQoh
nZ6Y8pm4bibbrivbWTDz5pifm8X5bGfHzXgrm1qfCreENkU+SCldfbXI3STcmONNJMxrdtlVQ8q1
W1Fp0HTLkL2UJmfIrGlJicPqK1hub3Xirojp2i2gPFNvGo7VFbppKjYgmcro739wNt61IuZz481e
fluTM6WWrWI18t1dPli3prZE2VDcSzPmyUtfjMG4LY/rkvt+4P62cVdCaB8dHV6QjMOwqIQKMSP8
ANWYpfDWuHRG37mK2e7RUGewdrc2iTZtatNkkb/DhmBWjy13YqaTEqOWXW/FshTPXdhujV+xjik7
z6DL5MexJsHd4GVd0ZBdtlBzxl+g7KM5TKOyxX0lRnaAa22SjzqAicpDEAweJ6BzW5kCqjLRRwBh
TR7M9JmqkGuxRXns2zgvklozCEOhpaBMpj61wZV7rLbClj7MYfloT2xg2ekhmBMgMXAGlkHBdLXY
SbbP5yu29HgS7fNVGM5UIvNzlGVozIrH3Y0bAuHsMK8T2DqalNi5sYFPyvRgkfO6LHsNMExoMo8v
j29PDzecedPcf3nk/nXumyeRGoyauw5gEux8Jw7r4fgaWw/XqZ2xLUm+pljLjdKzrtTbzpWbBbf4
0sVbWWRkGzzbx6+vH4/f3l4fELt5Bih9TAsg+rBFUoicvn19/4Jk0pRU94aDn6JCO/62s2Lz/Jhd
EDAjNnPuaEaeKmUUPq5kAKYMxorRRPb6/eXz6entUQtVIhg1ufmZ/vv+8fj1pn65IX89ffsFLCkP
T3+yPpge+Ajrydfn1y+MTF+RywbhREXi6hgblnFJL27ZXzHtPVFWhdSOrS81yast5j8qRMpRRG8G
rGaiymAV+ozXmOUjb1Z09YK/zgMt04wQrDFoxY5CDqcJY5VkqpZb+rQ+bgJegwkCMXl7vf/88PoV
r61SN61DFmQx+RNOQO9YXgIq69z8un17fHx/uGez6vD6xg5FaIFpEzOVhmjgLDLvazkId97/Ls9W
vmMGDk94aTLF9J9/8LpIpfVQ7rRPl8SqMWqHZCNuOB4/P913j387lbLWVmzkMRYbcW1MtjtzMW4A
mPDUmtGcgUFJw3ZKdIFDK8Jrcvh+/8z6zDMAxNKQVfmgv0cWVJrkzu5SFAQ/uY0B4y9yG9xuIgPK
Z5jLPx5snlNPpKLUmlJyDzR0A7QJNEWrJkobw25S1ba+a7fmDJFq50SU0VwFHJNDbtjRuWZbd2Ws
ZJARjqbBjxzmZD4/PT+9eEazeB88HEmvfzqSwiz7U5ehA+rH1vDxqMLNAts2O6iqyp83u1cm+PJq
rAGCNezqo3xpOtRVmpWxidWvizVZC6pZjPsrGJKwktFY3wR1NjwCoU1MPOwmplRsoMZHOG9S4yl2
r7TGyG/XDzjyhKoyQQ54Y6sN2TGrOrdOnKxKqmrSXBFpmrLXB15HprcQ2T8fD68vCkTR+SQhzI5N
8WYRzexMrLdxkljG52CxXK8xxnyuA/JNdHCp1htKcpquWgZL3OFGioiVgK2O/BIVaU8p13bRZj2P
ncJpuVyaL74kQ+FJoPpBWevO8XCqzLfGbRZ4sESzoco8caLV6dTDztFyjaMs+2E/YwCSGwsMqPLc
a5xsGHmfJ0fMLAw82FvACcLMiN9xGZiBQOWP/PQXeEC0kVo5TZ5v8bMf/6SmTa2PtN1cRiLTkRxt
O28PPOI7AqXcHmAR1tQp1iZ6YCXwU2FT03DBYD+EpZM0vdG//Kgf53j3qc/MK3CsbQ+NB9BtlGNV
w3YZyW4/xQGXMSxdlM3IGZAx05sIFjl0pDe/R2W5j0TtjLMT+1b16px9WopiJ2lWXDMxU5dZBgDh
jkeRcTpmrCtbeW8H4b8xzQ+FgFaTLsZ8bdoM4HbYD0CIMUKoC07c7dcbh3imBoqdoCZZW+Smf7Kg
C2XX03Mgsacp+nyAM1mLrO2iAIw/P7hFMWU/iM44KoWQ4GcSb1nixMJvcdgmk9jFouY8wRKqUe2B
rtBkmhQfoiBASZnbZdpwEZIK87ZsguXarQrTLuAW+kJFuPejtxZdPr0CNRhqUPvo7BjcOzUFZ1jN
9sSfeKpu59YZLxOMM2p/hYsl+v2Pd64zTWuRdAE1wZA0Iqw5OTsX6Wwgy3HCN6e6M24zgM1dCbGF
lfGEwdwAQpLkVe4rjjE3Ko1REB9vkQCkwl3klBA7aRf/DzH82l0TC9jh187OKzVnO1Oemd9E7nYV
3CAKhlEEmMJo60GQGK9YoPTBaSpgVxynKLSzrWgoHafwgw5P3kLZcYe5I2lVw2otXXZZ93nSTgJ2
pRVHIP+ZPK7UlOeoPLiDpszPWWEMGqNG0j6Jt6MQ4OZNJ18OGw/TKXGqylgAmFLVaBOLdXU4tucQ
rmRYK3lKloIt2xdlPpNqDl7R6yXQSdFD9A23lzkq/cDEWCl9ZwZp1vkRB3qwbpUNyeYcD2FUlRyh
7brUpSEfN80e0NXKtGStOrPrVJOsqDvYUdMMO8uCDN8t3f7gC/8Ba/A25pZDq4tNEab/wZo2d+a1
LqQO0u5EHVkc0sjkyZNN2oiLeLt2ks0HKBfwlK4OSE7Z486AfbvO9H3XKOPmTTvxNiOYBzOoorPo
jvyFh5/vF7M1spRznZiR2Q+rvfihM9gshibUjoIcDUmqUOZYZ1sp3NLPrVzyYVfmYBUybI/mHjcm
gDO3gRNTksT4Ia9xpj0+dr2FJzc6NU+rtK11Q4okDElepXBzZFwNGTz9qGSlUu4LP/3xBEAA//XX
/8o//ufls/hLe5/uljheRfyQf18aayqoereu/7TPdYLINezckQVyTerOMAwKltIWMrhhwMxoppjI
w2DBTbSTOZwMs60VP8w02x22donujZiThVEybHiqZLNt+CgHjxAdbU5NN56p2xLH7YpNNp7fJXu/
JzU8BWGttGtQRwSBg6KSiucSp5uPt/sHQON3jqG00+rNfoAPSAe++FQ/i04MuAbtTIZyUNVItO5b
khk2dJd7Cb0D3AOKoTNebija4AtsOQrQawIlxQ78I7vRIbVH6gTwpiIcue06lWWfHRSZGrs0+6ki
CQ2VFXlEExHht5SBy0gtWfse3/o0EfbvQLBHKSBDDbRjTkky6dqlEWuijQp2uFZDjP2JXXjo5HF4
Q3w9dhY78xOQuKL4/vzx9O358R8Mv7Xsz0Oc7tabUFMJJZEGCx1pAKimERAoo/+SuodAStPMnXVj
LC80r/GDMC3yMvGEfuNQeuzvKiPY6CZ1DwLWvJiHyjmjwv2ewVXk0ANiNkFXdstsypt2+wQe4nwv
1Nr0+H+VHdty27juVzJ9Omem3Y2T1E0e+kDdbNaypFJSnORF4ybextPmMrEzm+7XH4AUJV5Ab89L
UwMQryAJgCAA8lLCmhTmFJ9p1KYyCiDev2I0jZAntN8dYE5VKFiT+FQWXNYcZimmk65qqjqNW8Eb
yuERSM6sMLMS0GIm01LINjkos1KnRWehumyi0FubL1FiCV74O0iM4TqjmCkvTcNmwGs89bvAnf0X
D9UjriTCLAohX9uSVM+uQoOACPKlICLKQr6SqmNhRmc1MCKtGBc2asVE4dYQGpNZVp9Ycxk1QvfL
gdDNH7AwrPGi9x+j+WYgFW0BWmwBVN342s4iCicpUnhWw5xRgzbWkWbovcQzS+8seK46TC/kk9Bc
O70fWBMdXNxVpmB9hNOyIovj6J0CePXSbJSZQGhE37triyJwgHSglIvryk3lPeKx+3ZApwF4aI30
FFHL4UCAieKzgmGg8trci4qycYY2USDy/JYYeYFmtYb5n4wCYmAdSXjcmJ4QbVNmtb0jKZizPDO5
RVHzgUnNc3ZtFTHCMH8tF5hqPTGXGkXA8hUDSSzDV1grkhS1AcuJy8BdwUjJph9sIubIYHFZDdHW
4/Xt/cbyHchquc2Rp1FPrciTDyAi/5lcJvJA8s4jXpcXaIKxx/FLmfOUPgpv4As6cnGS6VJ0O+i6
1eVpWf+ZseZPOHDJdil3c0OcqOELp5WXQZ90ROhnlzEIdxVmSzs7/WRsEw1xHujTnG6bsuPuNq93
T0d/WW0erQKg1NAtkhhQd/JEpIZdepGKwuymo/DN21na5BEB6iqVAG7QXJTzPMj0phu5/DOuEq2n
+30wNih8gop7E3rfpqSTfZGbOmleD2Hz3213T+fnHy8+TN6ZaD0DHcyA/eGA+RTGmK+RLMz5R8vE
5eBoO7NDRLn0OyShdp2bhn8HMwliToKY03BfptRjIYckOEjT6YGCL/59kC5OqdBgNsmBibg4/Y2J
uDj7jYacfwoNA+xIyHXdeWAMJlbGPBflTBarY85tkC5/4vZSIyiLrIk/pcs7C5UXYkuNn9LlfQqV
RwUhsToWaKAZxNmCf3RrWpT8vKPfGwxoSvFH5JLFaMax81FpRJyCiEJdOI4EII+2orRbKjGiZI2V
5HjAXAue5/a9tcbNWJofrBBzhS/8MnmMSWgSAlG05kMAq8ec7jTIYgte05YUpGmbjIp+2BYcGdss
sQd1BfpH5fyGoSx52Epp6a3KY3dz+/qy3f/y43NgQhezOvwNotLXFrPfEAKKPgxV9mV0TYIvBAjA
tLTeYAL0NJHFUlqqko57AqcdXTIH0TwVssfko/deJcWQG7W87G0Ejy0n8oNaq0aSx/2cXabwj0jS
ApqHYjGKcx3G2Yj7N4gDpUN0AAVyTZ5HKnHW0A6fCnc2zO9GCUaguaCgrgyBthkERiqWhWAi3nma
V/TzsF6sGofPTGmQ18vP7/Cxxd3T34/vf60f1u9/Pq3vnreP73frvzZQzvbuPUZk/Y4M9U7x12Lz
8rj5eXS/frnbPKJNz+OzWYwJWNoZKivAFKAcpGx4cbfcPDy9/DraPm732/XP7T9r/Nh6bw96KPYP
lLWiLGiWJGsIR4WmyaNr0EkpFTxMjSxhm1o5hihWnGLELA4YuxQxpt4N0g4+wOQoaXR4DgafT3cX
GAwSpVCqsBkKBBdmOagvL7+e909Ht5jN+Onl6H7z89nMG6SIocszZqbYsMAnPjxlCQn0SaN8EfNq
br3UcjD+R3NmPlo1gD6psKLJDDCS0M8xpZsebAkLtX5RVT71oqr8EvAS2ieFEwi2Cr/cHh78AP0B
5aMabduxqWbZ5OTcCpHcI4o2p4F+TfIPMb9tM4dtXzNW9frt5/b2w4/Nr6NbyWPfX9bP97881hJm
tJUelvizm8aWSDBAEypRx4AVST1G+3jd328e99vb9X5zd5Q+ylbBajn6e7u/P2K73dPtVqKS9X5t
7lG62zF9WaZHNqZu7/S3czhw2clxVebXdtzTYXHMOEa09BB1+tXMujb0bM5gh7nUfYvkI7qHpzsz
krauO4r9KcwiH9b43BYTLJTGETETuViFu19m1CcVtCz8zRVRNcgO/fMKh0/n4YFNQJBr2qXfDXQY
1+M3X+/uh+HzJh7kvnA751beIN14atAvFaWysWy/b3Z7f65EfHpCTBeC/UquyH0QiJvJccIzf/GT
9MbQuT1fJpReNyD90V5yYEzpduR3QiwTxeBuLYggE5uM+JOPU6q805Njf8HMzVgomjt5hAiqmDD4
4+SEaC0gKIcSjV2e+kU1IANEpX8ONTMxuaDqWFVQt+dnEcu8b/4Cx86x1F8tCuaWDVD63YrGF23E
/cJkJSI+82uhgCBzrOzIEg7Cy8ehmZdhmAjuHwmxvKgNfVQ3Pi8idEoMgONh5aIz+Tc8Pos5uyGk
m5rlNSPYUe/8xMaeJhR7paKi01QMHOYPd5P6A9asSnIGevg4loq3nh6eXza7nRLP3QHLctt22bPE
TenBzs/8fSq/8VsMsLm/RdzUzfBkSqwf754ejorXh2+bF/UOWGsPLsPWvIsrStBLRDRzwiqaGHLr
Vhhqo5QY6pREhAf8wjHET4qOW6biaAir3fBu1cFRJymrr5eYnhv0QNSg0d9uLNRAVm2U9zR1G9lk
Vx+PL7o4RTWTx3jR7d5yV4u4PsfwFZeIxTIoik/ojFOjiY7Gyvy6Kh9tD8dbLHwUm6qbNXkziC3g
BgNuXvb4Qg0ksJ3MTLTbfn9c719BLbm939z+AL3HjD2K9m/TBiGsqJE+vv78zvAO6/HpVSOYOSAh
Y0JZJExcu/VRhgtVcJTL1Dp1E2zaSCE5Af+nWqjvZ35jOHSRES+wdTLjZKbHM99+e1mDUvny9Lrf
PloJVhhPpl1lPjjpIV0E8jssCmEZMfDpB93biMPJhkEqrHsNkZiHP8ZCkZltIyseZVGOrvQx73iJ
97adFSbaxpMoB4wRjHXCmnFtiHgu3SPiZXUVz2fyXhe0e3NJxiDc88bS++LJ1KbwZSqov2k7+6tT
5zgHAGnSswlgxabR9TnxqcLQIfh6EiZWIdZVFDBNdNVTa1+2j/HYuFzBhLKeYBobuooriQpWJOXS
6PqIggNCul0LK309QpPUh9+g2AHbpH3+SKh3KsFxRJSMUKpkOIBIajiWaDjdPjiwCHIJpuivbhDs
/u6uzqceTPrmVj4tZ+a09UAmrHeDI7SZw8ojeaOnwYCRlHbTo6P4i1eZPaFjN7vZDa9IxNUNCbYE
A72mCTuswIgKdZmXS/vd0AjFUs0FG5nZc6Xf2SXLO5TDzUMTQ0fIuBswUoJZ1l3p7mV6ryIoWRpi
VoHVAwQ3LWmhdfccxLEkEV3TTc8iKx4SovsCu5XgTSrfU/DCLQJpZJxtJET3LnJz0yXBoKKr+FxK
HQEaje5Q8cuM0URkURYDXt4QyMpNxpJFBFJey/5W4cjM9SxXk2vMeV5ahgH8fXC7zG+6hhmmC3wO
iUF3R8iy4lbOM/iRJcZooFO4QGNLI6wJBybQHHiZ1KXPl7O0QUfEMktMTsnKojFi7RhQ2/kFyc7f
qJuhHmVyrwRN36xAkwj69DY580rFZwj5obIZHMkFEnifLnnBu7M36hJZN+HYacLk+G3iF1S3BfaA
dpXqCSYnbyfUZazEwwKdTN9MG0eNUbxyK0wXvlcojamW1wZJWpUmESw0Syao8NGQwedl9IXNTHms
QfnMjlPUy2CeCOWyhNSJ63me8FOfX3qkCCLzQ0gQVhLTsG7i2gFpX9FoIVlCn1+2j/sfMjXQ3cNm
R1zcxMoPHSN85iDF5YP1+1OQ4mvL0+bz2bDWejXAK+FsHMRgOwa1c/tz82G/fegF250kvVXwF6PV
o49fIe3byxYNAuj2SDGVYCB1SldMM+o7TnaFQQNhY1uaSYVSlqhIVLWx5cuNzPJ0mqf4/BzdyID3
zF1HI2R7DGarYMvAmPIc/UUtPUAVDrqFvPVd8nrJrJTvLkZ2Bv1Obbc/1cQSXw6s8OKq8rN2jjrF
7w72ML9sxmWaR/N1ugEc7rXUlHyGvYGickNkq0aje1XqQdHF6bN9eZhsvr1+/27pf9I/BLS3FFR/
UyRQZSDWOWgchOYh775HFlyuCkuplZpuyeuycBxGbQzqNMqvlr5Yt4lvUkE5Go4N7SwdRcFh80ot
k7wFJoOt2RR4GxmsVROp6I/hQlaloNacTYSvN+fqGjBQDLAqcKp2+//XAp0pmxgKet5Gmpi6WJd4
lNDMlYwHfs+IIOf1d9Y2g/4LHB375IkkE0x8nkyPj48DlMP9b5b54zFQoe9pV8ekc0C/XciL8ra2
/AsV6tLbuC6X8sbB9bgfkILWCwZ8NQMFa0Z5UPRLVUZYkRfd5LjKxqLjbGZ54x5ExrGUVBcMFpKR
g6nHKrD8VM6/fX0+7hOe5LuIy0uvEigLwJgZGDZPU9HqqUePFSTr2Q91FyZwEdNGZEmLx4NolyhG
w3ZzYJTruRMaRN0NYUeO8qfbH6/Paoeerx+/W2cgZlVAO0aL9o4G1kcZCCgskd0cw9g0rKaW7eor
RiOP50lpPeMKNWLcFTF2CRxQZVmZ4W1MML6oaWFl2EgpRbfN52Gx1MChSc/baZEMh6gzWPjdIk0r
xxalrF14/TkwwNF/ds/bR7wS3b0/enjdb9428J/N/vaPP/74r5G4G58IyLJlaghPiq8EMKjxUMD8
DLcTl6fRgNU26VXqbdBGIGp7CdHkq5XCwM5VrirWzL2aVnW69D6TDXMOPoSBiOyPZo8Irm7QwDGa
XZ2noa9xzFDfG9I2kRwoGwXsiW8YOt+xTTPh0OND7m//zyzr3qjlDctMbmaO8iCRI0yKWDCAXVvg
7QwwpTJkeSeAOpOIrVwh4OiGDZ18ONsPH6897ql6oLtF0A9QFFK+4OChUM2KJhbQk6IBCcx/uQ2H
NCleScYXceuuBTzU7babM2vI00CHkd8IcPgDPRnj2zAApl/J50g63qnVfrfnsLMpyViEMtkrOvVW
CMRJNK+Y7qD96HapEKWAXf2LkskN+T6DqT5EbWjPUgAwyzBe4vC8zlngqSoglTwoV3aYZskWqfbv
DFPxUu+/ARqrlYMKRPnclpWaMsthEpgkawv18WHsTLBqTtMk1wXDzSdz1qcqQK3opZQb5fCbwcgk
CUYYwmUsKUHkLjzJL+4/VKUY7CzLju29WhoIojbLzIaq6H1I7+QrA2EWOKlecVTa3O5VIH8vQSkE
rYhsnFdeDzAOp3GuZAnEzAjoEl664BJTOY/MC9B8kZiv2+VlnbyIqp3yJQaB9EtAvX3KLdvb2XVT
IrS5evGuLdNt4FPLautsF+pwmp4R9wuy1fP0KmnNbJaqL8rUo9xnax9Zx+ZFrbrFBHBjBteW0OGm
zQS6hicNlJk/HHDbchd05ZigJdAQkO1pEXjfIoNn087ZaX+xSIyrxPGEuX1y7GQZLzB6RmPdCZof
+OllVNeSNPf6AapCzKAOt3uOLa6fCHnfyN05hTJ66PgeKl0GmEfpgl3CGjR5C9FW9sZdMwx8Zkez
kyB9hNM3wYpkzhPBqDv6Hl/xJEvcurrLzN2EpHqymCWGtdr/paPsxX7UCIn2JC8TCazTKctc40Ql
luhFQgV/GrSmNpLqFpo00IZlGbwkzixQEeMLypzPiiXtwqKIBgp339VSGrXb6ZSVESjc9OT0MnZo
P1GPMnWAeFPVcQyohlSK8uCS1zVuG0kZS5XOGuz/AT0R4OPgwAEA
--===============7620204186300208452==--

