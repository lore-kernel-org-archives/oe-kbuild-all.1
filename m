Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1D32745C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 01:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730425819; cv=none; b=EoB/bLXh7AazLr9p7iNY+iLEBwYA0zpIKAtNnTMOHakGtbRkDUnKBlGF09fbGZuY5/zmquSYlDPgse4rTVt3ArZSWiP9x8dj8dbAG+ylTp+vPeBNFlKc6+0Hw/XoY2knXhhyDXQgy/MdovJpOtqfUWrgT4DK8CvWlBIxvlxHF50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730425819; c=relaxed/simple;
	bh=tfN9OMezFQAOdlnuU/juvI9M3vQtzpPnrefnoSMZNpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhAW4afa6+tpFwvpw4MD+ev/hkD1LN9l2CT5oeI4mQlF575Nnz/UCNF5CksIGDpmIFCvkGZnIhbm/5tZFC9L5EuvFA4d2IAouF7uD+QMkoisfVLpSjNAeIhQ9ZwaacXzHxqgQBD3z7uo8PP0UK484cVfDGQALrZgyBbFOm8NJU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAem/lGp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAem/lGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730425813; x=1761961813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tfN9OMezFQAOdlnuU/juvI9M3vQtzpPnrefnoSMZNpI=;
  b=AAem/lGpW2RCR7JxykfI7DWDCxM7nzjASDGxxACSHvppSSPUep0VbBX3
   4JBneHbG7JYObRnxIz3zYy6E1Q1BJQ6ejJCme4V2qThNbWIkub5r7eZCH
   b8Yqt45LmzOuxx1u5Lhp+dWmkBLhmqBEP7lCKdM68ED1bPMi5C6yUjdhR
   GNjzRdhEInXFWuShvga7MA12mJVaKZNvk3e2rCjZD38i3mN0GqApqFi1p
   o1aLaPcES0JpfUfF4i+DhQzUJfd7YQGGVLb0tkSFJzDAsKpfkqP7XD24M
   V01WXi+3kI8zUr12raYsx4PWAS5zW+CK9HBWW5tA6BEuamECSFOs8QGtZ
   Q==;
X-CSE-ConnectionGUID: D38nLVy/TJOdqXs5ovNreQ==
X-CSE-MsgGUID: R7fPQgvwQ+mtfxe8N0q/NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41290748"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41290748"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 18:50:06 -0700
X-CSE-ConnectionGUID: CJAM6PZ/QdGT8O1gybVyiQ==
X-CSE-MsgGUID: mn1JtsUcQX2TwpZX+/+j5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="113660199"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2024 18:50:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6gnY-000h1a-2L;
	Fri, 01 Nov 2024 01:50:00 +0000
Date: Fri, 1 Nov 2024 09:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
Subject: [palmer:for-next 7/7] arch/riscv/include/uapi/asm/hwprobe.h:86:1:
 error: version control conflict marker in file
Message-ID: <202411010939.osAHijt9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   95437f8c02b5907b5f2d7dc6c03e3c73523c5cd6
commit: 95437f8c02b5907b5f2d7dc6c03e3c73523c5cd6 [7/7] Merge patch series "riscv: Add support for xtheadvector"
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20241101/202411010939.osAHijt9-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010939.osAHijt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010939.osAHijt9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/hwprobe.h:9,
                    from arch/riscv/include/asm/vdso/data.h:7,
                    from include/vdso/datapage.h:23,
                    from lib/vdso/gettimeofday.c:5,
                    from <command-line>:
>> arch/riscv/include/uapi/asm/hwprobe.h:86:1: error: version control conflict marker in file
      86 | <<<<<<< HEAD
         | ^~~~~~~
   In file included from arch/riscv/include/asm/hwprobe.h:9,
                    from arch/riscv/include/asm/vdso/data.h:7,
                    from include/vdso/datapage.h:23,
                    from arch/riscv/kernel/vdso/hwprobe.c:8:
>> arch/riscv/include/uapi/asm/hwprobe.h:86:1: error: version control conflict marker in file
      86 | <<<<<<< HEAD
         | ^~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c: In function 'riscv_vdso_get_values':
>> arch/riscv/kernel/vdso/hwprobe.c:36:21: error: implicit declaration of function 'riscv_hwprobe_key_is_valid' [-Wimplicit-function-declaration]
      36 |                 if (riscv_hwprobe_key_is_valid(p->key)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:229: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
   make[3]: *** [scripts/Makefile.build:229: arch/riscv/kernel/vdso/hwprobe.o] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/riscv/Makefile:177: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +86 arch/riscv/include/uapi/asm/hwprobe.h

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
    32	#define		RISCV_HWPROBE_EXT_ZICBOZ	(1 << 6)
    33	#define		RISCV_HWPROBE_EXT_ZBC		(1 << 7)
    34	#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 8)
    35	#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 9)
    36	#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 10)
    37	#define		RISCV_HWPROBE_EXT_ZKND		(1 << 11)
    38	#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 12)
    39	#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 13)
    40	#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 14)
    41	#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 15)
    42	#define		RISCV_HWPROBE_EXT_ZKT		(1 << 16)
    43	#define		RISCV_HWPROBE_EXT_ZVBB		(1 << 17)
    44	#define		RISCV_HWPROBE_EXT_ZVBC		(1 << 18)
    45	#define		RISCV_HWPROBE_EXT_ZVKB		(1 << 19)
    46	#define		RISCV_HWPROBE_EXT_ZVKG		(1 << 20)
    47	#define		RISCV_HWPROBE_EXT_ZVKNED	(1 << 21)
    48	#define		RISCV_HWPROBE_EXT_ZVKNHA	(1 << 22)
    49	#define		RISCV_HWPROBE_EXT_ZVKNHB	(1 << 23)
    50	#define		RISCV_HWPROBE_EXT_ZVKSED	(1 << 24)
    51	#define		RISCV_HWPROBE_EXT_ZVKSH		(1 << 25)
    52	#define		RISCV_HWPROBE_EXT_ZVKT		(1 << 26)
    53	#define		RISCV_HWPROBE_EXT_ZFH		(1 << 27)
    54	#define		RISCV_HWPROBE_EXT_ZFHMIN	(1 << 28)
    55	#define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 29)
    56	#define		RISCV_HWPROBE_EXT_ZVFH		(1 << 30)
    57	#define		RISCV_HWPROBE_EXT_ZVFHMIN	(1ULL << 31)
    58	#define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
    59	#define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
    60	#define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
    61	#define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
    62	#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
    63	#define		RISCV_HWPROBE_EXT_ZVE32X	(1ULL << 37)
    64	#define		RISCV_HWPROBE_EXT_ZVE32F	(1ULL << 38)
    65	#define		RISCV_HWPROBE_EXT_ZVE64X	(1ULL << 39)
    66	#define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
    67	#define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
    68	#define		RISCV_HWPROBE_EXT_ZIMOP		(1ULL << 42)
    69	#define		RISCV_HWPROBE_EXT_ZCA		(1ULL << 43)
    70	#define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 44)
    71	#define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
    72	#define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
    73	#define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
    74	#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
    75	#define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
    76	#define RISCV_HWPROBE_KEY_CPUPERF_0	5
    77	#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
    78	#define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
    79	#define		RISCV_HWPROBE_MISALIGNED_SLOW		(2 << 0)
    80	#define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
    81	#define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
    82	#define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
    83	#define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
    84	#define RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS	7
    85	#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
  > 86	<<<<<<< HEAD
    87	#define RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF	9
    88	#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN		0
    89	#define		RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED	1
    90	#define		RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW		2
    91	#define		RISCV_HWPROBE_MISALIGNED_SCALAR_FAST		3
    92	#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED	4
    93	#define RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF	10
    94	#define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN		0
    95	#define		RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW		2
    96	#define		RISCV_HWPROBE_MISALIGNED_VECTOR_FAST		3
    97	#define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED	4
    98	=======
    99	#define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	9
   100	>>>>>>> refs/rewritten/Merge-patch-series-riscv-Add-support-for-xtheadvector-
   101	/* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
