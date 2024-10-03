Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8241AAE0C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 21:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727991836; cv=none; b=rdGd9fDYDslyjwY++K3bpiWYshxQzYegouokZwLgPrWWBRO6fdiyw14zlVB1UV3Azt1BnBZn7exKEhxCmStpOcFd4+E0lqb/nA7Tit6bFcSTWDsPLaSoH1skP8YdlbFDJR8R56gRt/uXMFRXxf0BOaHyuOsvMTUQ0nf+lyzBW+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727991836; c=relaxed/simple;
	bh=Wc6vUDDWJkz/T9cLjkcAg9fLZ8SFt2BX7nH0WfAXqMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FiWRc4j31PMxcQZVTdNLF1AnElkB5ipOfLuvP2eu7FSS+vQOpR5h7R7Np5dX/+Yy8DqcewahD7xuXx1QYqFpTnKFHLgLCR1gdkeW5/sNxVVAb4UboqdPCLoNpeiE2B2S9s0kVSZGmwsOxvUnwJwjdoHXVBWxLXOcQjLIJvS9e2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZ7v9dVM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZ7v9dVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727991834; x=1759527834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wc6vUDDWJkz/T9cLjkcAg9fLZ8SFt2BX7nH0WfAXqMQ=;
  b=mZ7v9dVMBATz1UwJ9ssdDAux3s6ykWSOCFFkmzveN/HyqbfUKsvxXN0z
   JA3tTmmdJD7RfYO59Ik1k/FnDkkt7U8HSP1gBvqpmKlcKWDA73EzeEePo
   kta0dh3+2K8ga781g09v5WLAL0lh7c0k7Bsag9OhMaCIawC7wSOfSJL4f
   rFraNvutzjuQNFzhYuprlei3icZOk1OCTiqtEb6Vk+2IO53YL2W5TcMbP
   q/AO6Q+VxOHjZtrLQqedyoWNKDp1z8O/wiRck2Ek20KW3NppHfWLVYYUG
   wgnBVTuN5LSUZBg0xco/Bz/xvYoiNNeOdQgYOQFHQ2950zN8+IACj9rd4
   w==;
X-CSE-ConnectionGUID: g20LQVttRPOvIbmYUZa9ng==
X-CSE-MsgGUID: 00vPoH2AQyuZZOrRqVmfuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27086272"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="27086272"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 14:43:54 -0700
X-CSE-ConnectionGUID: SD+7w1omQLqAygGlqRKb+g==
X-CSE-MsgGUID: gE4FObRBQAWB0WP6qZRD/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="97807316"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Oct 2024 14:43:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swTby-0000vo-2e;
	Thu, 03 Oct 2024 21:43:50 +0000
Date: Fri, 4 Oct 2024 05:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:memblock_align 3/3]
 drivers/acpi/numa/srat.c:534:undefined reference to
 `memory_block_size_bytes'
Message-ID: <202410040535.cQL1W8UX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux memblock_align
head:   85581c6ddb334a93f79f93e6c0e5fbee1b4649ae
commit: 85581c6ddb334a93f79f93e6c0e5fbee1b4649ae [3/3] acpi,srat: reduce memory block size if CFMWS has a smaller alignment
config: loongarch-randconfig-002-20241004 (https://download.01.org/0day-ci/archive/20241004/202410040535.cQL1W8UX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040535.cQL1W8UX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040535.cQL1W8UX-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/acpi/numa/srat.o: in function `acpi_numa_init':
>> drivers/acpi/numa/srat.c:534:(.init.text+0x1024): undefined reference to `memory_block_size_bytes'
>> loongarch64-linux-ld: drivers/acpi/numa/srat.c:592:(.init.text+0x11c8): undefined reference to `set_memory_block_size_order'


vim +534 drivers/acpi/numa/srat.c

   530	
   531	int __init acpi_numa_init(void)
   532	{
   533		int i, fake_pxm, cnt = 0;
 > 534		unsigned long block_sz = memory_block_size_bytes();
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
   588		/* Calculate and set largest supported memory block size alignment */
   589		acpi_table_parse_cedt(ACPI_CEDT_TYPE_CFMWS, acpi_align_cfmws,
   590				      &cfmw_align);
   591		if (cfmw_align < block_sz && cfmw_align >= SZ_256M) {
 > 592			if (set_memory_block_size_order(ffs(cfmw_align)-1)) {
   593				pr_warn("CFMWS: Unable to adjust memory block size\n");
   594			}
   595		}
   596	
   597		/* Then parse and fill the numa nodes with the described memory */
   598		acpi_table_parse_cedt(ACPI_CEDT_TYPE_CFMWS, acpi_parse_cfmws,
   599				      &fake_pxm);
   600	
   601		if (cnt < 0)
   602			return cnt;
   603		else if (!parsed_numa_memblks)
   604			return -ENOENT;
   605		return 0;
   606	}
   607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
