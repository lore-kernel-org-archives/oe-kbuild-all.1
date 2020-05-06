Content-Type: multipart/mixed; boundary="===============6677183828094297113=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [arc:topic-zol-remove 10/30] arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported for target arc700
Date: Thu, 07 May 2020 05:57:59 +0800
Message-ID: <202005070553.XnfuivOE%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6677183828094297113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git topi=
c-zol-remove
head:   8ce6b2a73b83a4a77f5444a0a2c27748bb27ea0f
commit: d033e9026a729efc2101065b8251f94f78e48566 [10/30] ARC: checksum: eli=
de ZOL, use double load/stores
config: arc-tb10x_defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout d033e9026a729efc2101065b8251f94f78e48566
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Darc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/arc/include/asm/checksum.h: Assembler messages:
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported fo=
r target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported fo=
r target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported fo=
r target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported fo=
r target arc700
--
   arch/arc/include/asm/checksum.h: Assembler messages:
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported fo=
r target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported fo=
r target arc700
--
   arch/arc/include/asm/checksum.h: Assembler messages:
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported fo=
r target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported fo=
r target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported fo=
r target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported fo=
r target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported fo=
r target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported fo=
r target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported fo=
r target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported fo=
r target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported fo=
r target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported fo=
r target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported fo=
r target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported fo=
r target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported fo=
r target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported fo=
r target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported fo=
r target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported fo=
r target arc700

vim +/ldd +46 arch/arc/include/asm/checksum.h

ca15c8ecd588dd Vineet Gupta 2013-01-18  33  =

ca15c8ecd588dd Vineet Gupta 2013-01-18  34  /*
ca15c8ecd588dd Vineet Gupta 2013-01-18  35   *	This is a version of ip_comp=
ute_csum() optimized for IP headers,
ca15c8ecd588dd Vineet Gupta 2013-01-18  36   *	which always checksum on 4 o=
ctet boundaries.
d033e9026a729e Vineet Gupta 2020-04-08  37   *	@ihl comes from IP hdr and i=
s number of 4-byte words
d033e9026a729e Vineet Gupta 2020-04-08  38   *	optimized for 5 words (no lo=
op taken)
ca15c8ecd588dd Vineet Gupta 2013-01-18  39   */
ca15c8ecd588dd Vineet Gupta 2013-01-18  40  static inline __sum16
ca15c8ecd588dd Vineet Gupta 2013-01-18  41  ip_fast_csum(const void *iph, u=
nsigned int ihl)
ca15c8ecd588dd Vineet Gupta 2013-01-18  42  {
d033e9026a729e Vineet Gupta 2020-04-08  43  	unsigned int tmp, sum;
d033e9026a729e Vineet Gupta 2020-04-08  44  	u64 dw1, dw2;
ca15c8ecd588dd Vineet Gupta 2013-01-18  45  =

ca15c8ecd588dd Vineet Gupta 2013-01-18 @46  	__asm__(
d033e9026a729e Vineet Gupta 2020-04-08  47  	"	ldd.ab %0, [%4, 8]	\n"
d033e9026a729e Vineet Gupta 2020-04-08  48  	"	ldd.ab %1, [%4, 8]	\n"
d033e9026a729e Vineet Gupta 2020-04-08  49  	"	sub    %5, %5,  4	\n"
d033e9026a729e Vineet Gupta 2020-04-08  50  	"	add.f  %3, %L0, %H0	\n"
d033e9026a729e Vineet Gupta 2020-04-08  51  	"	adc.f  %3, %3,  %L1	\n"
d033e9026a729e Vineet Gupta 2020-04-08  52  	"	adc.f  %3, %3,  %H1	\n"
d033e9026a729e Vineet Gupta 2020-04-08  53  	"1:	ld.ab  %2, [%4, 4]	\n"
d033e9026a729e Vineet Gupta 2020-04-08  54  	"	adc.f  %3, %3,  %2	\n"
d033e9026a729e Vineet Gupta 2020-04-08  55  #ifdef CONFIG_ARC_LACKS_ZOL
d033e9026a729e Vineet Gupta 2020-04-08  56  	"	dbnz   %5, 1b		\n"
d033e9026a729e Vineet Gupta 2020-04-08  57  #else
d033e9026a729e Vineet Gupta 2020-04-08  58  	"	sub_s  %5, %5,  1	\n"
d033e9026a729e Vineet Gupta 2020-04-08  59  	"	brne_s %5, 0,   1b	\n"
d033e9026a729e Vineet Gupta 2020-04-08  60  #endif
d033e9026a729e Vineet Gupta 2020-04-08  61  	"	add.cs %3, %3,  1	\n"
d033e9026a729e Vineet Gupta 2020-04-08  62  =

d033e9026a729e Vineet Gupta 2020-04-08  63  	: "=3D&r" (dw1), "=3D&r" (dw2)=
, "=3D&r" (tmp), "=3D&r" (sum),
d033e9026a729e Vineet Gupta 2020-04-08  64  	  "+&r" (iph), "+&r"(ihl)
d033e9026a729e Vineet Gupta 2020-04-08  65  	:
d033e9026a729e Vineet Gupta 2020-04-08  66  	: "cc", "memory");
ca15c8ecd588dd Vineet Gupta 2013-01-18  67  =

ca15c8ecd588dd Vineet Gupta 2013-01-18  68  	return csum_fold(sum);
ca15c8ecd588dd Vineet Gupta 2013-01-18  69  }
d033e9026a729e Vineet Gupta 2020-04-08  70  #define ip_fast_csum ip_fast_cs=
um
ca15c8ecd588dd Vineet Gupta 2013-01-18  71  =


:::::: The code at line 46 was first introduced by commit
:::::: ca15c8ecd588dda4377d18d6d27bc1e87b4177cb ARC: Checksum/byteorder/swa=
b routines

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6677183828094297113==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AA==
--===============6677183828094297113==--

