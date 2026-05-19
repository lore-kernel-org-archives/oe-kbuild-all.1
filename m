Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50041A317D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 03:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779161227; cv=none; b=UTPmK7zq6SsVk1N3NtoFyjUFamshpqJFtbXG6l3N3Lurv09zEchWh6Pf2/l+Trc2wC5wA+7HU8tYUQspJgL55vFymeqcW8nH/MPDbYkkmyW4h8jH3P5ibn+u0+32GXCk0TFo6c9+/ILe2cb0SSrSNv9WsHggszg3WlmygxjStnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779161227; c=relaxed/simple;
	bh=ke2twPJIkyNuuuAgW0dgUYQaUnSUMzNnTEgYFvDun8A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=piX+KFZhOJagjHnhjnbIjqopxzx7qlW+uLKGdOL+TZr0q8io07zrONC254yFjKBZvKuW05CO0iQ9Gehcpr8xIvU4lUCRgRwmlY0zc8a/tiFxGU90RZCe10zeGqnq+1CshNFSJbI5LHYpcjVkjPxtB3QB/ciK9JOUpBJSwVVtgIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1akCOVp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1akCOVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779161226; x=1810697226;
  h=date:from:to:cc:subject:message-id;
  bh=ke2twPJIkyNuuuAgW0dgUYQaUnSUMzNnTEgYFvDun8A=;
  b=l1akCOVphioMeRfPxvfpmK6mbDYLXIETGNHw9dNnExgmbCXQtyYP4lqd
   5BV3vWD4k9UNBgOQmpeAZYEjF88eYb3XcKhE+4AYsXo/oAGF/Jethw/iZ
   AZC3t7doMrNoikFZqvMz1tJoaJ12oC0ZwVmNlO/7uWCNZvgP3NKVVKStA
   TKP0jSaWN32/+sY6txu1Weou409/YPNkFCKl06IYg2bLXUguxlgRXicck
   PJSTELbllYzSmy2xTSqPXSU/VjV8GY6uV1/P82N+AGpW7AzDNDuxxGrLy
   GfKLpAv1c7zqLIv0BiunR5M+NtaG0sgsvtEX79m50h2kkCEtq0hA1P0yM
   A==;
X-CSE-ConnectionGUID: zyMgW+ALSD2u7YoYEs5GTw==
X-CSE-MsgGUID: vHbW/N5MS/+/pvmcERWuRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91493567"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91493567"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 20:27:05 -0700
X-CSE-ConnectionGUID: wx3MiAw3R3SezY+oZ7oDRA==
X-CSE-MsgGUID: Sozroqs4T4y9KsNNE4qx7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="238645869"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 May 2026 20:27:03 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPB6I-000000000MB-0IIZ;
	Tue, 19 May 2026 03:26:38 +0000
Date: Tue, 19 May 2026 11:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 203/238]
 arch/sparc/kernel/traps_64.c:906:22-45: WARNING: casting value returned by
 memory allocation function to (struct cheetah_err_info *) is useless.
Message-ID: <202605191113.R0VUzlHb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 0fa5314d11eea01143cfbe248ec53fb65147dfa0 [203/238] sparc64: replace __get_free_pages() with kmalloc()
config: sparc64-randconfig-r052-20260519 (https://download.01.org/0day-ci/archive/20260519/202605191113.R0VUzlHb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191113.R0VUzlHb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/sparc/kernel/traps_64.c:906:22-45: WARNING: casting value returned by memory allocation function to (struct cheetah_err_info *) is useless.

vim +906 arch/sparc/kernel/traps_64.c

   853	
   854	void __init cheetah_ecache_flush_init(void)
   855	{
   856		unsigned long largest_size, smallest_linesize, order, ver;
   857		int i, sz;
   858	
   859		/* Scan all cpu device tree nodes, note two values:
   860		 * 1) largest E-cache size
   861		 * 2) smallest E-cache line size
   862		 */
   863		largest_size = 0UL;
   864		smallest_linesize = ~0UL;
   865	
   866		for (i = 0; i < NR_CPUS; i++) {
   867			unsigned long val;
   868	
   869			val = cpu_data(i).ecache_size;
   870			if (!val)
   871				continue;
   872	
   873			if (val > largest_size)
   874				largest_size = val;
   875	
   876			val = cpu_data(i).ecache_line_size;
   877			if (val < smallest_linesize)
   878				smallest_linesize = val;
   879	
   880		}
   881	
   882		if (largest_size == 0UL || smallest_linesize == ~0UL) {
   883			prom_printf("cheetah_ecache_flush_init: Cannot probe cpu E-cache "
   884				    "parameters.\n");
   885			prom_halt();
   886		}
   887	
   888		ecache_flush_size = (2 * largest_size);
   889		ecache_flush_linesize = smallest_linesize;
   890	
   891		ecache_flush_physbase = find_ecache_flush_span(ecache_flush_size);
   892	
   893		if (ecache_flush_physbase == ~0UL) {
   894			prom_printf("cheetah_ecache_flush_init: Cannot find %ld byte "
   895				    "contiguous physical memory.\n",
   896				    ecache_flush_size);
   897			prom_halt();
   898		}
   899	
   900		/* Now allocate error trap reporting scoreboard. */
   901		sz = NR_CPUS * (2 * sizeof(struct cheetah_err_info));
   902		for (order = 0; order < NR_PAGE_ORDERS; order++) {
   903			if ((PAGE_SIZE << order) >= sz)
   904				break;
   905		}
 > 906		cheetah_error_log = (struct cheetah_err_info *)kmalloc(PAGE_SIZE << (order), GFP_KERNEL);
   907		if (!cheetah_error_log) {
   908			prom_printf("cheetah_ecache_flush_init: Failed to allocate "
   909				    "error logging scoreboard (%d bytes).\n", sz);
   910			prom_halt();
   911		}
   912		memset(cheetah_error_log, 0, PAGE_SIZE << order);
   913	
   914		/* Mark all AFSRs as invalid so that the trap handler will
   915		 * log new new information there.
   916		 */
   917		for (i = 0; i < 2 * NR_CPUS; i++)
   918			cheetah_error_log[i].afsr = CHAFSR_INVALID;
   919	
   920		__asm__ ("rdpr %%ver, %0" : "=r" (ver));
   921		if ((ver >> 32) == __JALAPENO_ID ||
   922		    (ver >> 32) == __SERRANO_ID) {
   923			cheetah_error_table = &__jalapeno_error_table[0];
   924			cheetah_afsr_errors = JPAFSR_ERRORS;
   925		} else if ((ver >> 32) == 0x003e0015) {
   926			cheetah_error_table = &__cheetah_plus_error_table[0];
   927			cheetah_afsr_errors = CHPAFSR_ERRORS;
   928		} else {
   929			cheetah_error_table = &__cheetah_error_table[0];
   930			cheetah_afsr_errors = CHAFSR_ERRORS;
   931		}
   932	
   933		/* Now patch trap tables. */
   934		memcpy(tl0_fecc, cheetah_fecc_trap_vector, (8 * 4));
   935		memcpy(tl1_fecc, cheetah_fecc_trap_vector_tl1, (8 * 4));
   936		memcpy(tl0_cee, cheetah_cee_trap_vector, (8 * 4));
   937		memcpy(tl1_cee, cheetah_cee_trap_vector_tl1, (8 * 4));
   938		memcpy(tl0_iae, cheetah_deferred_trap_vector, (8 * 4));
   939		memcpy(tl1_iae, cheetah_deferred_trap_vector_tl1, (8 * 4));
   940		memcpy(tl0_dae, cheetah_deferred_trap_vector, (8 * 4));
   941		memcpy(tl1_dae, cheetah_deferred_trap_vector_tl1, (8 * 4));
   942		if (tlb_type == cheetah_plus) {
   943			memcpy(tl0_dcpe, cheetah_plus_dcpe_trap_vector, (8 * 4));
   944			memcpy(tl1_dcpe, cheetah_plus_dcpe_trap_vector_tl1, (8 * 4));
   945			memcpy(tl0_icpe, cheetah_plus_icpe_trap_vector, (8 * 4));
   946			memcpy(tl1_icpe, cheetah_plus_icpe_trap_vector_tl1, (8 * 4));
   947		}
   948		flushi(PAGE_OFFSET);
   949	}
   950	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
