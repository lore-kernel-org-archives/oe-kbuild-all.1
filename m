Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE14C1DF272
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730140404; cv=none; b=e3Rbr2UXd87K4D/0ZOq0hJS/SPzlsuKqh8maUp5HUo+5PtGAfRV7bKbAMXwo4/syyqdNzQn31q8V6F0FI76stzMJJW/L0QHDjs9AWXPQ3y7wStU/deT+zE0usvNIZQJY51A71G0UYIClzN4S7aFO6YbwwXfHFJmPfvXdlpDaO6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730140404; c=relaxed/simple;
	bh=EYvUB3FI0F4+HntkVwfEX6+4Cu0D70TDv+Kp2ji33d4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rDPCLOXq/rXOLdC1pvb4JpmsZ0BYbC7V/9QRY01IZR3t64iMswMzraYuJgZStKxyH2pqAA04QHLSEhMQOALdRHXqwcycd6bwUhPie0avLdkqWyHOAkia3pIC8fFlXvNBXMJOc8GLJpftF5QnJ9kgdX3xlDR89ubr9O1W0QcjQX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mt1uTVbE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mt1uTVbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730140401; x=1761676401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EYvUB3FI0F4+HntkVwfEX6+4Cu0D70TDv+Kp2ji33d4=;
  b=mt1uTVbEoT+BfT5HWuCM8KWPBrQiXuPKK2Ja8NzyZhyRvVTDrKKlqtQO
   UssqtC1wnbzEARULbZPEYayAzzSYiKPr5VYB69R2/aFW2jAs8EYd7oZv1
   4SG+BngqYbttVi9HGxL/xescDckr80HaJU8GnEy60tjnIr6nGXrJ/NlY4
   auk+Xx42aT8fLrhksZRmd4ec4NT5wTFdsKat9yvOrHhW4BN7X9MmTGG3v
   +gI/TpaA71ClhE8Qy9WEmzE+2zJH4pS/lNR/FJ0FmRP3ihVmMM3sm+Qb5
   EJuKB0hgHaN56Ke7qTItrnf//lHbBQxDtkXfKbzLmkvRxVl4FZ2l245GJ
   A==;
X-CSE-ConnectionGUID: hQsG7Wa2TwG8hb3m9T3JvQ==
X-CSE-MsgGUID: Ltg7KlXTSAK4bWkNGrMBYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="41142422"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="41142422"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 11:33:19 -0700
X-CSE-ConnectionGUID: VX0xI4V6QVCr8VxrU1/yfw==
X-CSE-MsgGUID: 9PLzhCv9SLGzeadN5kV3zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81859230"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Oct 2024 11:33:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5UYF-000cka-0P;
	Mon, 28 Oct 2024 18:33:15 +0000
Date: Tue, 29 Oct 2024 02:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Huaxin Lu <luhuaxin1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 15681/30000]
 arch/arm64/include/asm/kgdb.h:21:25: error: value '1025' out of range for
 constraint 'I'
Message-ID: <202410290217.j4yRbZGJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8dcdd5a432518f8f8deb6ab608551ecda71bda40
commit: 78568d28ad62c586e32e3989de5354fcb014c09f [15681/30000] scripts: Fix issue of module signing with openssl 3.x
config: arm64-randconfig-004-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290217.j4yRbZGJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290217.j4yRbZGJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290217.j4yRbZGJ-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:146:7: warning: 'ENGINE_init' is deprecated [-Wdeprecated-declarations]
     146 |                 if (ENGINE_init(e))
         |                     ^
   /usr/include/openssl/engine.h:620:1: note: 'ENGINE_init' has been explicitly marked deprecated here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:151:9: warning: 'ENGINE_ctrl_cmd_string' is deprecated [-Wdeprecated-declarations]
     151 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0),
         |                              ^
   /usr/include/openssl/engine.h:478:1: note: 'ENGINE_ctrl_cmd_string' has been explicitly marked deprecated here
     478 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/sign-file.c:153:17: warning: 'ENGINE_load_private_key' is deprecated [-Wdeprecated-declarations]
     153 |                 private_key = ENGINE_load_private_key(e, private_key_name,
         |                               ^
   /usr/include/openssl/engine.h:637:1: note: 'ENGINE_load_private_key' has been explicitly marked deprecated here
     637 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   7 warnings generated.
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:17:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:102:
   In file included from include/linux/preempt.h:78:
   In file included from arch/arm64/include/asm/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/thread_bits.h:32:
   In file included from arch/arm64/include/asm/thread_info.h:18:
   arch/arm64/include/asm/stack_pointer.h:8:51: error: register 'sp' unsuitable for global register variables on this target
       8 | register unsigned long current_stack_pointer asm ("sp");
         |                                                   ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:35:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:13:
   In file included from include/linux/memblock.h:13:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/asm-offsets.c:14:
   In file included from include/linux/kvm_host.h:36:
   In file included from arch/arm64/include/asm/kvm_host.h:20:
   In file included from arch/arm64/include/asm/arch_gicv3.h:17:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:21:
>> arch/arm64/include/asm/kgdb.h:21:25: error: value '1025' out of range for constraint 'I'
      21 |         asm ("brk %0" : : "I" (KGDB_COMPILED_DBG_BRK_IMM));
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/brk-imm.h:27:35: note: expanded from macro 'KGDB_COMPILED_DBG_BRK_IMM'
      27 | #define KGDB_COMPILED_DBG_BRK_IMM       0x401
         |                                         ^~~~~
   5 warnings and 2 errors generated.
   make[2]: *** [scripts/Makefile.build:117: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=3502639818
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1238: prepare0] Error 2 shuffle=3502639818
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:187: __sub-make] Error 2 shuffle=3502639818
   make: Target 'prepare' not remade because of errors.


vim +21 arch/arm64/include/asm/kgdb.h

bcf5763b0d58d2 Vijaya Kumar K  2014-01-28  18  
bcf5763b0d58d2 Vijaya Kumar K  2014-01-28  19  static inline void arch_kgdb_breakpoint(void)
bcf5763b0d58d2 Vijaya Kumar K  2014-01-28  20  {
7acf71d1a224b6 Catalin Marinas 2014-09-25 @21  	asm ("brk %0" : : "I" (KGDB_COMPILED_DBG_BRK_IMM));
bcf5763b0d58d2 Vijaya Kumar K  2014-01-28  22  }
bcf5763b0d58d2 Vijaya Kumar K  2014-01-28  23  

:::::: The code at line 21 was first introduced by commit
:::::: 7acf71d1a224b6e7a40a244d804cea1780a643ed arm64: Fix typos in KGDB macros

:::::: TO: Catalin Marinas <catalin.marinas@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
