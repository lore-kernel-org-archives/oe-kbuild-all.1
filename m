Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9566CC8CA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686154587; x=1717690587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sda951hmfSKiZ/AELL7pEN0F9suZ+dZPxvXbA7bQukM=;
  b=mnw+cofF6Cnn/SpP0WxpY8V232bUMTsYQz+g+Ut59g9L4aEYf4ibLZR9
   mIjgKZFDssjgfeaTMxr2C1fWiTTQTManXKdBDl352O7RGJDOiK2+oVATp
   0RJzv1tVumJmpj9CJa1BNFIrxXHru0ojs0pK5fmPgDnpVjLGlZ1Z05BpE
   MzRc2XCqnWnDVJ7IOPapssuYx5bQH2fn1uXLCjhjWY0qaY6tHWNMPB8eb
   P75pQL7sevnRcqwQ9nLQ+PF2hG5Mbhym/Ux6/GiwRZ+Tcv6cvuyz++wHl
   gd4IJ/dgY01HaORoN5GyQmjQ2mKGFQWcwBzTFJgSEUwMSRij8vVwWodf/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357047518"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="357047518"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 09:16:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="742760826"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="742760826"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Jun 2023 09:16:23 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6vpe-0006jT-2e;
	Wed, 07 Jun 2023 16:16:22 +0000
Date: Thu, 8 Jun 2023 00:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Yimin Gu <ustcymgu@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: arch/riscv/mm/init.c:1204:48: sparse: sparse: cast truncates bits
 from constant value (100000000 becomes 0)
Message-ID: <202306080034.SLiCiOMn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yimin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a4d7d701121981e3c3fe69ade376fe9f26324161
commit: b5e2c507b06c9d36411845149162a804ae7b04a9 riscv: Kconfig: Allow RV32 to build with no MMU
date:   2 months ago
config: riscv-randconfig-s051-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080034.SLiCiOMn-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b5e2c507b06c9d36411845149162a804ae7b04a9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b5e2c507b06c9d36411845149162a804ae7b04a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/ drivers/char/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080034.SLiCiOMn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> arch/riscv/mm/init.c:1204:48: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
--
   WARNING: invalid argument to '-march': '_zihintpause'
   drivers/char/random.c: note: in included file (through include/linux/timex.h, include/linux/time32.h, include/linux/time.h, ...):
>> arch/riscv/include/asm/timex.h:25:16: sparse: sparse: cast removes address space '__iomem' of expression
>> arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
>> arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
>> arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
>> arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
>> arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
>> arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
>> arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
>> arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
>> arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
>> arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *

vim +1204 arch/riscv/mm/init.c

671f9a3e2e24cd Anup Patel      2019-06-28  1154  
e53d28180d4d0f Nick Kossifidis 2021-04-19  1155  /*
e53d28180d4d0f Nick Kossifidis 2021-04-19  1156   * reserve_crashkernel() - reserves memory for crash kernel
e53d28180d4d0f Nick Kossifidis 2021-04-19  1157   *
e53d28180d4d0f Nick Kossifidis 2021-04-19  1158   * This function reserves memory area given in "crashkernel=" kernel command
e53d28180d4d0f Nick Kossifidis 2021-04-19  1159   * line parameter. The memory reserved is used by dump capture kernel when
e53d28180d4d0f Nick Kossifidis 2021-04-19  1160   * primary kernel is crashing.
e53d28180d4d0f Nick Kossifidis 2021-04-19  1161   */
e53d28180d4d0f Nick Kossifidis 2021-04-19  1162  static void __init reserve_crashkernel(void)
e53d28180d4d0f Nick Kossifidis 2021-04-19  1163  {
e53d28180d4d0f Nick Kossifidis 2021-04-19  1164  	unsigned long long crash_base = 0;
e53d28180d4d0f Nick Kossifidis 2021-04-19  1165  	unsigned long long crash_size = 0;
e53d28180d4d0f Nick Kossifidis 2021-04-19  1166  	unsigned long search_start = memblock_start_of_DRAM();
e53d28180d4d0f Nick Kossifidis 2021-04-19  1167  	unsigned long search_end = memblock_end_of_DRAM();
e53d28180d4d0f Nick Kossifidis 2021-04-19  1168  
e53d28180d4d0f Nick Kossifidis 2021-04-19  1169  	int ret = 0;
e53d28180d4d0f Nick Kossifidis 2021-04-19  1170  
d414cb379ac35e Jisheng Zhang   2022-03-23  1171  	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
d414cb379ac35e Jisheng Zhang   2022-03-23  1172  		return;
5640975003d023 Nick Kossifidis 2021-04-19  1173  	/*
5640975003d023 Nick Kossifidis 2021-04-19  1174  	 * Don't reserve a region for a crash kernel on a crash kernel
5640975003d023 Nick Kossifidis 2021-04-19  1175  	 * since it doesn't make much sense and we have limited memory
5640975003d023 Nick Kossifidis 2021-04-19  1176  	 * resources.
5640975003d023 Nick Kossifidis 2021-04-19  1177  	 */
5640975003d023 Nick Kossifidis 2021-04-19  1178  	if (is_kdump_kernel()) {
5640975003d023 Nick Kossifidis 2021-04-19  1179  		pr_info("crashkernel: ignoring reservation request\n");
5640975003d023 Nick Kossifidis 2021-04-19  1180  		return;
5640975003d023 Nick Kossifidis 2021-04-19  1181  	}
5640975003d023 Nick Kossifidis 2021-04-19  1182  
e53d28180d4d0f Nick Kossifidis 2021-04-19  1183  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
e53d28180d4d0f Nick Kossifidis 2021-04-19  1184  				&crash_size, &crash_base);
e53d28180d4d0f Nick Kossifidis 2021-04-19  1185  	if (ret || !crash_size)
e53d28180d4d0f Nick Kossifidis 2021-04-19  1186  		return;
e53d28180d4d0f Nick Kossifidis 2021-04-19  1187  
e53d28180d4d0f Nick Kossifidis 2021-04-19  1188  	crash_size = PAGE_ALIGN(crash_size);
e53d28180d4d0f Nick Kossifidis 2021-04-19  1189  
a7259df7670240 Mike Rapoport   2021-09-02  1190  	if (crash_base) {
a7259df7670240 Mike Rapoport   2021-09-02  1191  		search_start = crash_base;
a7259df7670240 Mike Rapoport   2021-09-02  1192  		search_end = crash_base + crash_size;
a7259df7670240 Mike Rapoport   2021-09-02  1193  	}
a7259df7670240 Mike Rapoport   2021-09-02  1194  
e53d28180d4d0f Nick Kossifidis 2021-04-19  1195  	/*
e53d28180d4d0f Nick Kossifidis 2021-04-19  1196  	 * Current riscv boot protocol requires 2MB alignment for
e53d28180d4d0f Nick Kossifidis 2021-04-19  1197  	 * RV64 and 4MB alignment for RV32 (hugepage size)
decf89f86ecd3c Nick Kossifidis 2021-11-26  1198  	 *
decf89f86ecd3c Nick Kossifidis 2021-11-26  1199  	 * Try to alloc from 32bit addressible physical memory so that
decf89f86ecd3c Nick Kossifidis 2021-11-26  1200  	 * swiotlb can work on the crash kernel.
e53d28180d4d0f Nick Kossifidis 2021-04-19  1201  	 */
decf89f86ecd3c Nick Kossifidis 2021-11-26  1202  	crash_base = memblock_phys_alloc_range(crash_size, PMD_SIZE,
decf89f86ecd3c Nick Kossifidis 2021-11-26  1203  					       search_start,
decf89f86ecd3c Nick Kossifidis 2021-11-26 @1204  					       min(search_end, (unsigned long) SZ_4G));
decf89f86ecd3c Nick Kossifidis 2021-11-26  1205  	if (crash_base == 0) {
decf89f86ecd3c Nick Kossifidis 2021-11-26  1206  		/* Try again without restricting region to 32bit addressible memory */
a7259df7670240 Mike Rapoport   2021-09-02  1207  		crash_base = memblock_phys_alloc_range(crash_size, PMD_SIZE,
a7259df7670240 Mike Rapoport   2021-09-02  1208  						search_start, search_end);
e53d28180d4d0f Nick Kossifidis 2021-04-19  1209  		if (crash_base == 0) {
e53d28180d4d0f Nick Kossifidis 2021-04-19  1210  			pr_warn("crashkernel: couldn't allocate %lldKB\n",
e53d28180d4d0f Nick Kossifidis 2021-04-19  1211  				crash_size >> 10);
e53d28180d4d0f Nick Kossifidis 2021-04-19  1212  			return;
e53d28180d4d0f Nick Kossifidis 2021-04-19  1213  		}
decf89f86ecd3c Nick Kossifidis 2021-11-26  1214  	}
e53d28180d4d0f Nick Kossifidis 2021-04-19  1215  
e53d28180d4d0f Nick Kossifidis 2021-04-19  1216  	pr_info("crashkernel: reserved 0x%016llx - 0x%016llx (%lld MB)\n",
e53d28180d4d0f Nick Kossifidis 2021-04-19  1217  		crash_base, crash_base + crash_size, crash_size >> 20);
e53d28180d4d0f Nick Kossifidis 2021-04-19  1218  
e53d28180d4d0f Nick Kossifidis 2021-04-19  1219  	crashk_res.start = crash_base;
e53d28180d4d0f Nick Kossifidis 2021-04-19  1220  	crashk_res.end = crash_base + crash_size - 1;
e53d28180d4d0f Nick Kossifidis 2021-04-19  1221  }
e53d28180d4d0f Nick Kossifidis 2021-04-19  1222  

:::::: The code at line 1204 was first introduced by commit
:::::: decf89f86ecd3c3c3de81c562010d5797bea3de1 riscv: try to allocate crashkern region from 32bit addressible memory

:::::: TO: Nick Kossifidis <mick@ics.forth.gr>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
