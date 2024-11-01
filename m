Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5EA1474A7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 04:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730435111; cv=none; b=k0Kv6QDbY4XLeAiRmea60aCAai7Hzdj8L0TMSe4/66b9HdEhnqshIEUgq0McNv3zjnvvGzSnVWlRzWdf5a1+6N9hBGPGbjYIo9tXnZnokHgcBkC3RHTAvQcJL8f8emuBi6P+Sl3C8kA0qzsDcpZT7eM/gMoMxh7B/iKfpnMJmrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730435111; c=relaxed/simple;
	bh=TMlWETvEzMtGT+pRGU98Z4FiOuSkqZZQ45EJqxdTWfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UrcoEH8BWzJKP5/nLKC7Km3WuKZoTSz3oQJnZIfLTucoO0eqyYPTXgr4RpLCRkZAmPRpFTIOwkwraNUO1SXinkDIM3M4lS6LI2TqcYhgB9JyAcWfrJw7MYRVXcpum4p5Ud/vyZ5v0wk5NkQI6KADUbMN1Hlo0fsdvZXGWqfuy3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFLJnHFw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFLJnHFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730435109; x=1761971109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TMlWETvEzMtGT+pRGU98Z4FiOuSkqZZQ45EJqxdTWfk=;
  b=hFLJnHFw1UxL2LcCyfo0Z5RaAFXZbWejx3AN+u9LxT0SQooQ13JhRHNN
   R7vY2YjEgrvQUepKEC5kTxw2v0AOddD+2kbtQWkCuqVYQ2hvxKlkwxt8G
   ShM1wwr/mYHqucE4AIMOyvvVllp/8YxU++HTPe6P6fqTSxjrpAsDWZaiN
   88IMm6LrtHN2rawKqdShRsdIga/a/MbANqqgTbrgRtKZGMv7nZaFvxvml
   NkPOoJ6uUdHPvK7iywmgXJj7BPRA8heA9ilb0wOYvKp4H2Z2+v3D1+jBl
   2/2cZc3S347LvPHgcYHa419LBhKkHLpiHRjcxZZ8Xk5gjuysZCkAtT+EC
   w==;
X-CSE-ConnectionGUID: odw95XxtT8+ukXPA4sMrLA==
X-CSE-MsgGUID: AF+PhVfwTjKn+w+L8BNpfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40743712"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40743712"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 21:25:09 -0700
X-CSE-ConnectionGUID: VvKpEOh9RjuKrzfVwWT77g==
X-CSE-MsgGUID: sgFd9cVlTIqAlWaEHN4FRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="87974114"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Oct 2024 21:25:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6jDc-000h8E-2H;
	Fri, 01 Nov 2024 04:25:04 +0000
Date: Fri, 1 Nov 2024 12:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
Subject: [palmer:for-next 7/7] arch/riscv/include/asm/hwprobe.h:24:7: error:
 use of undeclared identifier 'RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0'
Message-ID: <202411011207.BuxUlnq3-lkp@intel.com>
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
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20241101/202411011207.BuxUlnq3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011207.BuxUlnq3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011207.BuxUlnq3-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:23:
   In file included from arch/riscv/include/asm/vdso/data.h:7:
   In file included from arch/riscv/include/asm/hwprobe.h:9:
   arch/riscv/include/uapi/asm/hwprobe.h:86:1: error: version control conflict marker in file
      86 | <<<<<<< HEAD
         | ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:23:
   In file included from arch/riscv/include/asm/vdso/data.h:7:
>> arch/riscv/include/asm/hwprobe.h:24:7: error: use of undeclared identifier 'RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0'
      24 |         case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
         |              ^
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:229: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
   In file included from arch/riscv/kernel/vdso/hwprobe.c:8:
   In file included from include/vdso/datapage.h:23:
   In file included from arch/riscv/include/asm/vdso/data.h:7:
   In file included from arch/riscv/include/asm/hwprobe.h:9:
   arch/riscv/include/uapi/asm/hwprobe.h:86:1: error: version control conflict marker in file
      86 | <<<<<<< HEAD
         | ^
   In file included from arch/riscv/kernel/vdso/hwprobe.c:8:
   In file included from include/vdso/datapage.h:23:
   In file included from arch/riscv/include/asm/vdso/data.h:7:
>> arch/riscv/include/asm/hwprobe.h:24:7: error: use of undeclared identifier 'RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0'
      24 |         case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
         |              ^
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:229: arch/riscv/kernel/vdso/hwprobe.o] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/riscv/Makefile:177: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 +24 arch/riscv/include/asm/hwprobe.h

ea3de9ce8aa280 Evan Green      2023-04-07   8  
ea3de9ce8aa280 Evan Green      2023-04-07  @9  #include <uapi/asm/hwprobe.h>
ea3de9ce8aa280 Evan Green      2023-04-07  10  
d1703dc7bc8ec7 Jesse Taube     2024-10-17  11  #define RISCV_HWPROBE_MAX_KEY 10
ea3de9ce8aa280 Evan Green      2023-04-07  12  
e1c05b3bf80f82 Andrew Jones    2023-10-10  13  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
e1c05b3bf80f82 Andrew Jones    2023-10-10  14  {
e1c05b3bf80f82 Andrew Jones    2023-10-10  15  	return key >= 0 && key <= RISCV_HWPROBE_MAX_KEY;
e1c05b3bf80f82 Andrew Jones    2023-10-10  16  }
e1c05b3bf80f82 Andrew Jones    2023-10-10  17  
e178bf146e4b8c Andrew Jones    2023-11-22  18  static inline bool hwprobe_key_is_bitmask(__s64 key)
e178bf146e4b8c Andrew Jones    2023-11-22  19  {
e178bf146e4b8c Andrew Jones    2023-11-22  20  	switch (key) {
e178bf146e4b8c Andrew Jones    2023-11-22  21  	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
e178bf146e4b8c Andrew Jones    2023-11-22  22  	case RISCV_HWPROBE_KEY_IMA_EXT_0:
e178bf146e4b8c Andrew Jones    2023-11-22  23  	case RISCV_HWPROBE_KEY_CPUPERF_0:
6e0f0b958f159f Charlie Jenkins 2024-09-11 @24  	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
e178bf146e4b8c Andrew Jones    2023-11-22  25  		return true;
e178bf146e4b8c Andrew Jones    2023-11-22  26  	}
e178bf146e4b8c Andrew Jones    2023-11-22  27  
e178bf146e4b8c Andrew Jones    2023-11-22  28  	return false;
e178bf146e4b8c Andrew Jones    2023-11-22  29  }
e178bf146e4b8c Andrew Jones    2023-11-22  30  

:::::: The code at line 24 was first introduced by commit
:::::: 6e0f0b958f159fe22bf8149baecc02b58875e835 riscv: hwprobe: Add thead vendor extension probing

:::::: TO: Charlie Jenkins <charlie@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
