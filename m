Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161EE5661
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 02:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727577073; cv=none; b=B4RkZp9tldp3U8xB/il63IWoj9JPfKRKw9KxV+s6nPf/JAcJzhBLHx97bAVMBHcSpR4NT7ecXYI2p2Up5WtxeX+j9jOw5Bk4QDvNDIKnconH9mzBNO2l5FO4tfOOVxR5Row/00sGlzVRcg+thPI6gUI2gLqzIA+pMAI9f8AMLD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727577073; c=relaxed/simple;
	bh=W9x5ILf7ZJNCiXRhfnsxydvfpTjytNXTpQaae37errw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s6k6xjeAXrB7kBT5sPt1Sa8JRqHETcnAk2zox1q8oJQtGVD5rZgM8+faN6mdda0nhBc3qLXadAhEQbG82pgeMmV3nlmr3A12zaF4G8C31tWQ7MYqWAKQ1KV4OSUs4+mQFVXyWf+ELzgbwR2PAgqSqE+qfW9NPB4mBmksPC+TZLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPEKUhrs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPEKUhrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727577071; x=1759113071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9x5ILf7ZJNCiXRhfnsxydvfpTjytNXTpQaae37errw=;
  b=iPEKUhrsL8L/tgNF+u0OhBXh/TDKSUd/ZqSp0RNhqkUziFPSCz3w+Mfo
   aPywaiQmZ0RQGNeqUvFswgpup0in8Z+R0Y208AGui9p1s9Ldq+Cvyk1+D
   eylvENf3kXuUKBGmzZj+bTcNClq3QQ1x5vrxAS1DjjNp3Elyih3NWpweT
   SPeMTvuDDkBo4GY/X++EoeYlDnTwNMga68O3br8GHnUdZQgb04uAsB3Og
   7yGlvvsMEWqU0OLSu+Sr6D0X4EK69CgQtFLFlEBpJbjEuOArqiy7RCxI7
   iiYM4okeIaWX3JrxJ+rfScBiDKJU8KNJUP8GfOW7YQf2dzU34Tm16B+0D
   Q==;
X-CSE-ConnectionGUID: TKoPuTYiR3GwG/ntOHJU1Q==
X-CSE-MsgGUID: 0/H4kYOGSrupDojGajhOeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="38077380"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="38077380"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 19:31:10 -0700
X-CSE-ConnectionGUID: Cw34+QAGTEWDbpALgiqO8g==
X-CSE-MsgGUID: YKe8gznaTcOyjqQtX1blBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73243468"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 19:31:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sujiE-000Npz-2c;
	Sun, 29 Sep 2024 02:31:06 +0000
Date: Sun, 29 Sep 2024 10:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:memblock_align 2/2]
 drivers/acpi/numa/srat.c:596:undefined reference to
 `set_memory_block_size_order'
Message-ID: <202409291047.IW4OFT7q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux memblock_align
head:   f0872fa1a7074d7d5049a450c48eb97dfe49c2a4
commit: f0872fa1a7074d7d5049a450c48eb97dfe49c2a4 [2/2] acpi,srat: reduce memory block size if CFMWS has a smaller alignment
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240929/202409291047.IW4OFT7q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291047.IW4OFT7q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291047.IW4OFT7q-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/acpi/numa/srat.o: in function `acpi_numa_init':
>> drivers/acpi/numa/srat.c:596:(.init.text+0x89c): undefined reference to `set_memory_block_size_order'


vim +596 drivers/acpi/numa/srat.c

   530	
   531	int __init acpi_numa_init(void)
   532	{
   533		int i, fake_pxm, cnt = 0;
   534		unsigned long block_sz = memory_block_size_bytes();
   535		unsigned long cfmw_align = block_sz;
   536	
   537		if (acpi_disabled)
   538			return -EINVAL;
   539	
   540		/*
   541		 * Should not limit number with cpu num that is from NR_CPUS or nr_cpus=
   542		 * SRAT cpu entries could have different order with that in MADT.
   543		 * So go over all cpu entries in SRAT to get apicid to node mapping.
   544		 */
   545	
   546		/* SRAT: System Resource Affinity Table */
   547		if (!acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat)) {
   548			struct acpi_subtable_proc srat_proc[5];
   549	
   550			memset(srat_proc, 0, sizeof(srat_proc));
   551			srat_proc[0].id = ACPI_SRAT_TYPE_CPU_AFFINITY;
   552			srat_proc[0].handler = acpi_parse_processor_affinity;
   553			srat_proc[1].id = ACPI_SRAT_TYPE_X2APIC_CPU_AFFINITY;
   554			srat_proc[1].handler = acpi_parse_x2apic_affinity;
   555			srat_proc[2].id = ACPI_SRAT_TYPE_GICC_AFFINITY;
   556			srat_proc[2].handler = acpi_parse_gicc_affinity;
   557			srat_proc[3].id = ACPI_SRAT_TYPE_GENERIC_AFFINITY;
   558			srat_proc[3].handler = acpi_parse_gi_affinity;
   559			srat_proc[4].id = ACPI_SRAT_TYPE_RINTC_AFFINITY;
   560			srat_proc[4].handler = acpi_parse_rintc_affinity;
   561	
   562			acpi_table_parse_entries_array(ACPI_SIG_SRAT,
   563						sizeof(struct acpi_table_srat),
   564						srat_proc, ARRAY_SIZE(srat_proc), 0);
   565	
   566			cnt = acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
   567						    acpi_parse_memory_affinity, 0);
   568		}
   569	
   570		/* SLIT: System Locality Information Table */
   571		acpi_table_parse(ACPI_SIG_SLIT, acpi_parse_slit);
   572	
   573		/*
   574		 * CXL Fixed Memory Window Structures (CFMWS) must be parsed
   575		 * after the SRAT. Create NUMA Nodes for CXL memory ranges that
   576		 * are defined in the CFMWS and not already defined in the SRAT.
   577		 * Initialize a fake_pxm as the first available PXM to emulate.
   578		 */
   579	
   580		/* fake_pxm is the next unused PXM value after SRAT parsing */
   581		for (i = 0, fake_pxm = -1; i < MAX_NUMNODES; i++) {
   582			if (node_to_pxm_map[i] > fake_pxm)
   583				fake_pxm = node_to_pxm_map[i];
   584		}
   585		last_real_pxm = fake_pxm;
   586		fake_pxm++;
   587	
   588		/*
   589		 * First parse the CFMWS to determine if the memory block size
   590		 * should be smaller than 2G. We don't care about larger sizes,
   591		 * this simply avoids losing memory to smaller alignements.
   592		 */
   593		acpi_table_parse_cedt(ACPI_CEDT_TYPE_CFMWS, acpi_align_cfmws,
   594				      &cfmw_align);
   595		if (cfmw_align < block_sz && cfmw_align >= SZ_256M)
 > 596			set_memory_block_size_order(ffs(cfmw_align)-1);
   597	
   598		/* Then we need to make a pass to fill the numa nodes */
   599		acpi_table_parse_cedt(ACPI_CEDT_TYPE_CFMWS, acpi_parse_cfmws,
   600				      &fake_pxm);
   601	
   602		if (cnt < 0)
   603			return cnt;
   604		else if (!parsed_numa_memblks)
   605			return -ENOENT;
   606		return 0;
   607	}
   608	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
