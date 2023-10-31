Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4549819BA5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZloqJpzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698750552; x=1730286552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kC1lRlSHy1AVs6EpBhA4hO9Na4yPiNJ6cbPFvGORlMU=;
  b=ZloqJpzxs7dw5hgSEz46VQw2I8FzW0ieKdgvPqNcMQgLTvXzsQJTPXWh
   Y0vWb+BM5gU/Bj2bmBSlTYkmio9w97rB6qan6c+gYrKNaDF5M6fPcaq+O
   ImmenahRlR221TqAnUVhljUlRep1VQsSYQBwahtkzOeWctNEU7NZevy/O
   BDEfCHEVTQQSGA9we3pN6kibBwgsfuTaisOvhb/ykazPUhkjnIF62QAgu
   pCmY9d6512fTCSDmKnVJtvMiMfiTjm60rEHzNm48HsF33xOjlOLpPOeo8
   TsRBwT8AIO/cQFM61jQLhcYlKLzTxHZ4Pba7SfnwbdG4PYHPAyhO+Wve+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="387143313"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="387143313"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 04:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="8665907"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2023 04:09:07 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxmcL-00007W-1V;
	Tue, 31 Oct 2023 11:09:05 +0000
Date: Tue, 31 Oct 2023 19:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [avpatel:riscv_sbi_nested_v1 64/76]
 arch/riscv/include/uapi/asm/hwprobe.h:58:49: warning: conversion from 'long
 long unsigned int' to 'long unsigned int' changes value from '4294967296' to
 '0'
Message-ID: <202310311801.hxduISrr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   9763a6c438da81175e07a5736eeb1e505a74e693
commit: 3b516003495c3ceb036e452b29691977d00616d0 [64/76] RISC-V: hwprobe: Expose Zicboz extension and its block size
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231031/202310311801.hxduISrr-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311801.hxduISrr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311801.hxduISrr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/hwprobe.h:9,
                    from arch/riscv/kernel/sys_riscv.c:11:
   arch/riscv/kernel/sys_riscv.c: In function 'hwprobe_one_pair':
>> arch/riscv/include/uapi/asm/hwprobe.h:58:49: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '4294967296' to '0' [-Woverflow]
      58 | #define         RISCV_HWPROBE_EXT_ZICBOZ        (1ULL << 32)
         |                                                 ^~~~~~~~~~~~
   arch/riscv/kernel/sys_riscv.c:266:44: note: in expansion of macro 'RISCV_HWPROBE_EXT_ZICBOZ'
     266 |                 if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +58 arch/riscv/include/uapi/asm/hwprobe.h

    19	
    20	#define RISCV_HWPROBE_KEY_MVENDORID	0
    21	#define RISCV_HWPROBE_KEY_MARCHID	1
    22	#define RISCV_HWPROBE_KEY_MIMPID	2
    23	#define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
    24	#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
    25	#define RISCV_HWPROBE_KEY_IMA_EXT_0	4
    26	#define		RISCV_HWPROBE_IMA_FD		(1 << 0)
    27	#define		RISCV_HWPROBE_IMA_C		(1 << 1)
    28	#define		RISCV_HWPROBE_IMA_V		(1 << 2)
    29	#define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
    30	#define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
    31	#define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
    32	#define		RISCV_HWPROBE_EXT_ZBC		(1 << 6)
    33	#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 7)
    34	#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 8)
    35	#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 9)
    36	#define		RISCV_HWPROBE_EXT_ZKND		(1 << 10)
    37	#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 11)
    38	#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 12)
    39	#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 13)
    40	#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 14)
    41	#define		RISCV_HWPROBE_EXT_ZKT		(1 << 15)
    42	#define		RISCV_HWPROBE_EXT_ZVBB		(1 << 16)
    43	#define		RISCV_HWPROBE_EXT_ZVBC		(1 << 17)
    44	#define		RISCV_HWPROBE_EXT_ZVKB		(1 << 18)
    45	#define		RISCV_HWPROBE_EXT_ZVKG		(1 << 19)
    46	#define		RISCV_HWPROBE_EXT_ZVKNED	(1 << 20)
    47	#define		RISCV_HWPROBE_EXT_ZVKNHA	(1 << 21)
    48	#define		RISCV_HWPROBE_EXT_ZVKNHB	(1 << 22)
    49	#define		RISCV_HWPROBE_EXT_ZVKSED	(1 << 23)
    50	#define		RISCV_HWPROBE_EXT_ZVKSH		(1 << 24)
    51	#define		RISCV_HWPROBE_EXT_ZVKT		(1 << 25)
    52	#define		RISCV_HWPROBE_EXT_ZFH		(1 << 26)
    53	#define		RISCV_HWPROBE_EXT_ZFHMIN	(1 << 27)
    54	#define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 28)
    55	#define		RISCV_HWPROBE_EXT_ZVFH		(1 << 29)
    56	#define		RISCV_HWPROBE_EXT_ZVFHMIN	(1 << 30)
    57	#define		RISCV_HWPROBE_EXT_ZFA		(1 << 31)
  > 58	#define		RISCV_HWPROBE_EXT_ZICBOZ	(1ULL << 32)
    59	#define RISCV_HWPROBE_KEY_CPUPERF_0	5
    60	#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
    61	#define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
    62	#define		RISCV_HWPROBE_MISALIGNED_SLOW		(2 << 0)
    63	#define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
    64	#define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
    65	#define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
    66	#define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
    67	/* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
