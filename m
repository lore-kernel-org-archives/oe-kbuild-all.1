Content-Type: multipart/mixed; boundary="===============0279157043889358026=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: arch/mips/loongson2ef/common/reset.c:20:11: sparse: sparse: cast removes address space '__iomem' of expression
Date: Sat, 16 Jan 2021 18:36:53 +0800
Message-ID: <202101161842.2iRBZKeR-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0279157043889358026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jiaxun,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1d94330a437a573cfdf848f6743b1ed169242c8a
commit: b13812ddea615b6507beef24f76540c0c1143c5c MIPS: Loongson2ef: Disable=
 Loongson MMI instructions
date:   4 months ago
config: mips-randconfig-s032-20210116 (attached as .config)
compiler: mips64el-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db13812ddea615b6507beef24f76540c0c1143c5c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b13812ddea615b6507beef24f76540c0c1143c5c
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
>> arch/mips/loongson2ef/common/reset.c:20:11: sparse: sparse: cast removes=
 address space '__iomem' of expression
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
>> sound/pci/mixart/mixart_core.c:41:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:41:19: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:41:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:41:19: sparse: sparse: cast to restricted=
 __be32
>> sound/pci/mixart/mixart_core.c:41:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:41:19: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:41:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:41:19: sparse: sparse: cast to restricted=
 __be32
>> sound/pci/mixart/mixart_core.c:41:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:41:19: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:41:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:41:19: sparse: sparse: cast to restricted=
 __be32
>> sound/pci/mixart/mixart_core.c:41:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:41:19: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:41:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:41:19: sparse: sparse: cast to restricted=
 __be32
>> sound/pci/mixart/mixart_core.c:41:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:41:19: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:41:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:41:19: sparse: sparse: cast to restricted=
 __be32
>> sound/pci/mixart/mixart_core.c:41:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:41:19: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:41:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:41:19: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:42:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:42:19: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:42:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:42:19: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:42:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:42:19: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:42:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:42:19: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:42:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:42:19: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:42:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:42:19: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:42:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:42:19: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:42:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:42:19: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:42:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:42:19: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:42:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:42:19: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:42:19: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:42:19: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:42:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:42:19: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:52:22: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:52:22: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:52:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:52:22: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:52:22: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:52:22: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:52:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:52:22: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:52:22: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:52:22: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:52:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:52:22: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:52:22: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:52:22: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:52:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:52:22: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:52:22: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:52:22: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:52:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:52:22: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:52:22: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:52:22: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:52:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:52:22: sparse: sparse: cast to restricted=
 __be32
>> sound/pci/mixart/mixart_core.c:58:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] va=
l @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:58:9: sparse:     expected unsigned int [=
usertype] val
   sound/pci/mixart/mixart_core.c:58:9: sparse:     got restricted __be32 [=
usertype]
>> sound/pci/mixart/mixart_core.c:58:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:58:9: sparse:     expected void volatile =
[noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:58:9: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:77:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:77:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:77:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:77:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:77:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:77:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:77:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:77:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:77:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:77:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:77:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:77:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:78:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:78:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:78:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:78:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:78:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:78:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:78:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:78:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:78:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:78:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:78:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:78:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:78:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:78:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:78:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:78:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:78:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:78:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:78:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:78:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:78:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:78:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:78:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:78:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:79:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:79:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:79:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:79:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:79:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:79:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:79:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:79:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:79:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:79:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:79:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:79:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:79:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:79:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:79:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:79:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:79:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:79:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:79:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:79:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:79:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:79:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:79:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:79:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:80:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:80:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:80:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:80:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:80:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:80:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:80:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:80:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:80:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:80:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:80:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:80:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:80:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:80:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:80:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:80:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:80:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:80:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:80:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:80:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:80:32: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:80:32: sparse:     expected void const vo=
latile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:80:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:80:32: sparse: sparse: cast to restricted=
 __be32
   sound/pci/mixart/mixart_core.c:104:19: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const volatile =
[noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:104:19: sparse:     expected void const v=
olatile [noderef] __iomem *mem
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
>> sound/pci/mixart/mixart_hwdep.c:45:24: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const volatile =
[noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse:     expected void const v=
olatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse: sparse: cast to restricte=
d __be32
>> sound/pci/mixart/mixart_hwdep.c:45:24: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const volatile =
[noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse:     expected void const v=
olatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse: sparse: cast to restricte=
d __be32
>> sound/pci/mixart/mixart_hwdep.c:45:24: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const volatile =
[noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse:     expected void const v=
olatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse: sparse: cast to restricte=
d __be32
>> sound/pci/mixart/mixart_hwdep.c:45:24: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const volatile =
[noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse:     expected void const v=
olatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse: sparse: cast to restricte=
d __be32
>> sound/pci/mixart/mixart_hwdep.c:45:24: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const volatile =
[noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse:     expected void const v=
olatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse: sparse: cast to restricte=
d __be32
>> sound/pci/mixart/mixart_hwdep.c:45:24: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const volatile =
[noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse:     expected void const v=
olatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:45:24: sparse: sparse: cast to restricte=
d __be32
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:339:25: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:341:22: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:343:25: sparse: sparse: cast to restrict=
ed __be32
>> sound/pci/mixart/mixart_hwdep.c:374:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_hwdep.c:374:17: sparse:     expected unsigned in=
t [usertype] val
   sound/pci/mixart/mixart_hwdep.c:374:17: sparse:     got restricted __be3=
2 [usertype]
>> sound/pci/mixart/mixart_hwdep.c:374:17: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void volatile [node=
ref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:374:17: sparse:     expected void volati=
le [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:374:17: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:377:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_hwdep.c:377:17: sparse:     expected unsigned in=
t [usertype] val
   sound/pci/mixart/mixart_hwdep.c:377:17: sparse:     got restricted __be3=
2 [usertype]
   sound/pci/mixart/mixart_hwdep.c:377:17: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void volatile [node=
ref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:377:17: sparse:     expected void volati=
le [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:377:17: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:379:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_hwdep.c:379:17: sparse:     expected unsigned in=
t [usertype] val
   sound/pci/mixart/mixart_hwdep.c:379:17: sparse:     got restricted __be3=
2 [usertype]
   sound/pci/mixart/mixart_hwdep.c:379:17: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void volatile [node=
ref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:379:17: sparse:     expected void volati=
le [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:379:17: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:385:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_hwdep.c:385:17: sparse:     expected unsigned in=
t [usertype] val
   sound/pci/mixart/mixart_hwdep.c:385:17: sparse:     got restricted __be3=
2 [usertype]
   sound/pci/mixart/mixart_hwdep.c:385:17: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void volatile [node=
ref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:385:17: sparse:     expected void volati=
le [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:385:17: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:414:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_hwdep.c:414:17: sparse:     expected unsigned in=
t [usertype] val
   sound/pci/mixart/mixart_hwdep.c:414:17: sparse:     got restricted __be3=
2 [usertype]
   sound/pci/mixart/mixart_hwdep.c:414:17: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void volatile [node=
ref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:414:17: sparse:     expected void volati=
le [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:414:17: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:415:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_hwdep.c:415:17: sparse:     expected unsigned in=
t [usertype] val
   sound/pci/mixart/mixart_hwdep.c:415:17: sparse:     got restricted __be3=
2 [usertype]
   sound/pci/mixart/mixart_hwdep.c:415:17: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void volatile [node=
ref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:415:17: sparse:     expected void volati=
le [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:415:17: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:418:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_hwdep.c:418:17: sparse:     expected unsigned in=
t [usertype] val
   sound/pci/mixart/mixart_hwdep.c:418:17: sparse:     got restricted __be3=
2 [usertype]
   sound/pci/mixart/mixart_hwdep.c:418:17: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void volatile [node=
ref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:418:17: sparse:     expected void volati=
le [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:418:17: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:425:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_hwdep.c:425:17: sparse:     expected unsigned in=
t [usertype] val
   sound/pci/mixart/mixart_hwdep.c:425:17: sparse:     got restricted __be3=
2 [usertype]
   sound/pci/mixart/mixart_hwdep.c:425:17: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void volatile [node=
ref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:425:17: sparse:     expected void volati=
le [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:425:17: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:435:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_hwdep.c:435:17: sparse:     expected unsigned in=
t [usertype] val
   sound/pci/mixart/mixart_hwdep.c:435:17: sparse:     got restricted __be3=
2 [usertype]
   sound/pci/mixart/mixart_hwdep.c:435:17: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void volatile [node=
ref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:435:17: sparse:     expected void volati=
le [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:435:17: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:457:57: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:481:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_hwdep.c:481:17: sparse:     expected unsigned in=
t [usertype] val
   sound/pci/mixart/mixart_hwdep.c:481:17: sparse:     got restricted __be3=
2 [usertype]
   sound/pci/mixart/mixart_hwdep.c:481:17: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void volatile [node=
ref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:481:17: sparse:     expected void volati=
le [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:481:17: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:484:17: sparse: sparse: incorrect type i=
n argument 1 (different base types) @@     expected unsigned int [usertype]=
 val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_hwdep.c:484:17: sparse:     expected unsigned in=
t [usertype] val
   sound/pci/mixart/mixart_hwdep.c:484:17: sparse:     got restricted __be3=
2 [usertype]
   sound/pci/mixart/mixart_hwdep.c:484:17: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void volatile [node=
ref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:484:17: sparse:     expected void volati=
le [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:484:17: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse:     expected void const =
volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse:     got unsigned int *
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse: sparse: cast to restrict=
ed __be32
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void const volatile=
 [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_hwdep.c:494:23: sparse:     expected void const =
volatile [noderef] __iomem *mem
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
>> sound/pci/mixart/mixart.c:1187:23: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1187:23: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1187:23: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1187:23: sparse: sparse: cast to restricted __=
be32
>> sound/pci/mixart/mixart.c:1187:23: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1187:23: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1187:23: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1187:23: sparse: sparse: cast to restricted __=
be32
>> sound/pci/mixart/mixart.c:1187:23: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1187:23: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1187:23: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1187:23: sparse: sparse: cast to restricted __=
be32
>> sound/pci/mixart/mixart.c:1187:23: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1187:23: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1187:23: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1187:23: sparse: sparse: cast to restricted __=
be32
>> sound/pci/mixart/mixart.c:1187:23: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1187:23: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1187:23: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1187:23: sparse: sparse: cast to restricted __=
be32
>> sound/pci/mixart/mixart.c:1187:23: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1187:23: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1187:23: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1187:23: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1190:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1190:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1190:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1190:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1190:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1190:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1190:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1190:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1190:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1190:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1190:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1190:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1190:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1190:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1190:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1190:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1190:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1190:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1190:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1190:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1190:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1190:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1190:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1190:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1191:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1191:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1191:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1191:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1191:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1191:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1191:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1191:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1191:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1191:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1191:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1191:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1191:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1191:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1191:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1191:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1191:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1191:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1191:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1191:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1191:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1191:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1191:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1191:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1192:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1192:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1192:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1192:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1192:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1192:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1192:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1192:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1192:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1192:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1192:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1192:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1192:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1192:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1192:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1192:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1192:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1192:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1192:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1192:47: sparse: sparse: cast to restricted __=
be32
   sound/pci/mixart/mixart.c:1192:47: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart.c:1192:47: sparse:     expected void const volat=
ile [noderef] __iomem *mem
   sound/pci/mixart/mixart.c:1192:47: sparse:     got unsigned int *
   sound/pci/mixart/mixart.c:1192:47: sparse: sparse: cast to restricted __=
be32
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
>> arch/mips/pci/ops-loongson2.c:93:24: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected unsigned int [usertype] va=
l @@     got restricted __le32 [usertype] @@
   arch/mips/pci/ops-loongson2.c:93:24: sparse:     expected unsigned int [=
usertype] val
   arch/mips/pci/ops-loongson2.c:93:24: sparse:     got restricted __le32 [=
usertype]
>> arch/mips/pci/ops-loongson2.c:93:44: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] __iomem *mem @@     got void *[assigned] addrp @@
   arch/mips/pci/ops-loongson2.c:93:44: sparse:     expected void volatile =
[noderef] __iomem *mem
   arch/mips/pci/ops-loongson2.c:93:44: sparse:     got void *[assigned] ad=
drp
>> arch/mips/pci/ops-loongson2.c:95:25: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const volatile [n=
oderef] __iomem *mem @@     got void *[assigned] addrp @@
   arch/mips/pci/ops-loongson2.c:95:25: sparse:     expected void const vol=
atile [noderef] __iomem *mem
   arch/mips/pci/ops-loongson2.c:95:25: sparse:     got void *[assigned] ad=
drp
>> arch/mips/pci/ops-loongson2.c:95:25: sparse: sparse: cast to restricted =
__le32

vim +/__iomem +20 arch/mips/loongson2ef/common/reset.c

71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  16  =

71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  17  static inline void loong=
son_reboot(void)
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  18  {
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  19  #ifndef CONFIG_CPU_JUMP_=
WORKAROUNDS
4bdc0d676a643140 Christoph Hellwig 2020-01-06 @20  	((void (*)(void))iorema=
p(LOONGSON_BOOT_BASE, 4)) ();
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  21  #else
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  22  	void (*func)(void);
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  23  =

4bdc0d676a643140 Christoph Hellwig 2020-01-06  24  	func =3D (void *)iorema=
p(LOONGSON_BOOT_BASE, 4);
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  25  =

71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  26  	__asm__ __volatile__(
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  27  	"	.set	noat						\n"
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  28  	"	jr	%[func]						\n"
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  29  	"	.set	at						\n"
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  30  	: /* No outputs */
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  31  	: [func] "r" (func));
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  32  #endif
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  33  }
71e2f4dd5a65bd8d Jiaxun Yang       2019-10-20  34  =


:::::: The code at line 20 was first introduced by commit
:::::: 4bdc0d676a643140bdf17dbf7eafedee3d496a3c remove ioremap_nocache and =
devm_ioremap_nocache

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0279157043889358026==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
lfr/ANq88LlZtAEA
--===============0279157043889358026==--

