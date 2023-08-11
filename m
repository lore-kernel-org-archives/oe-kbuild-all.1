Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8B9219C7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691778003; x=1723314003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PV76BwziDHyoKLnzRCftHGB0e/bfE4M1410t2hn/wpw=;
  b=AD5FnLl8iv5rYG5iIMhDrXuQMwiV7kiCiQLvD3n+6qwDI+1rqiGdTiAD
   8RVrZIR2DwXeNP8agmzzw7PwSm4KlJyZt8gaLQAz61s2jGuYBDgrnpVjs
   dC5qxsSHAD6H6cEMF0miUzGrjX37RMCTQZRc6QwGKfDIaiUpT5rZJJn2Q
   fmVxCujMK/UnV+BxMtG0syQ8btcxcNhrigJs/3cCBZHWJQtxwSU82D6Mm
   +5Iiowz6mdUSIqCeEm9pmDm3PmR0FnyqGqcqNZr6Y8WjKhMMBEdH1hImP
   djDH1pTnR9p72FutIs4RO+h9Osvbno2nO6kKHBYS7l/H6CTpDTwxHQ4PT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="361876114"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="361876114"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 11:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="822768905"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="822768905"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Aug 2023 11:19:48 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUWjj-0007wO-1J;
	Fri, 11 Aug 2023 18:19:47 +0000
Date: Sat, 12 Aug 2023 02:19:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 17/24] drivers/acpi/numa/srat.c:535:31: warning:
 implicit conversion from 'enum acpi_cedt_type' to 'enum acpi_keyp_type'
Message-ID: <202308120229.j9Q3DVIT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   ee3a63e65f46140bcb484e3d0052d641abceb9da
commit: 7e72c9ad3fa55da9f48f56720b09f5e74e00dc92 [17/24] acpi: Add KEYP support to fw_table parsing
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230812/202308120229.j9Q3DVIT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120229.j9Q3DVIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120229.j9Q3DVIT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/acpi/numa/srat.c:15:
   include/linux/acpi.h:241:19: error: conflicting types for 'acpi_table_parse_cedt'; have 'int(enum acpi_keyp_type,  int (*)(union acpi_subtable_headers *, void *, const long unsigned int), void *)'
     241 | static inline int acpi_table_parse_cedt(enum acpi_keyp_type id,
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:233:1: note: previous declaration of 'acpi_table_parse_cedt' with type 'int(enum acpi_cedt_type,  int (*)(union acpi_subtable_headers *, void *, const long unsigned int), void *)'
     233 | acpi_table_parse_cedt(enum acpi_cedt_type id,
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/numa/srat.c: In function 'acpi_numa_init':
>> drivers/acpi/numa/srat.c:535:31: warning: implicit conversion from 'enum acpi_cedt_type' to 'enum acpi_keyp_type' [-Wenum-conversion]
     535 |         acpi_table_parse_cedt(ACPI_CEDT_TYPE_CFMWS, acpi_parse_cfmws,
         |                               ^~~~~~~~~~~~~~~~~~~~


vim +535 drivers/acpi/numa/srat.c

^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  483  
20e6926dcbafa1 drivers/acpi/numa.c      Yinghai Lu          2013-03-01  484  int __init acpi_numa_init(void)
e8d1955258091e drivers/acpi/numa.c      Tang Chen           2013-02-22  485  {
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  486  	int i, fake_pxm, cnt = 0;
20e6926dcbafa1 drivers/acpi/numa.c      Yinghai Lu          2013-03-01  487  
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  488  	if (acpi_disabled)
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  489  		return -EINVAL;
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  490  
d3bd058826aa8b drivers/acpi/numa.c      Yinghai Lu          2010-12-16  491  	/*
d3bd058826aa8b drivers/acpi/numa.c      Yinghai Lu          2010-12-16  492  	 * Should not limit number with cpu num that is from NR_CPUS or nr_cpus=
d3bd058826aa8b drivers/acpi/numa.c      Yinghai Lu          2010-12-16  493  	 * SRAT cpu entries could have different order with that in MADT.
d3bd058826aa8b drivers/acpi/numa.c      Yinghai Lu          2010-12-16  494  	 * So go over all cpu entries in SRAT to get apicid to node mapping.
d3bd058826aa8b drivers/acpi/numa.c      Yinghai Lu          2010-12-16  495  	 */
8716273caef7f5 drivers/acpi/numa.c      David Rientjes      2009-09-25  496  
02cb489be7ad07 drivers/acpi/numa.c      Ross Zwisler        2017-07-21  497  	/* SRAT: System Resource Affinity Table */
7f8f97c3cc75d5 drivers/acpi/numa.c      Len Brown           2007-02-10  498  	if (!acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat)) {
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  499  		struct acpi_subtable_proc srat_proc[4];
702b07fcc9b264 drivers/acpi/numa.c      Lukasz Anaczkowski  2016-04-21  500  
702b07fcc9b264 drivers/acpi/numa.c      Lukasz Anaczkowski  2016-04-21  501  		memset(srat_proc, 0, sizeof(srat_proc));
702b07fcc9b264 drivers/acpi/numa.c      Lukasz Anaczkowski  2016-04-21  502  		srat_proc[0].id = ACPI_SRAT_TYPE_CPU_AFFINITY;
702b07fcc9b264 drivers/acpi/numa.c      Lukasz Anaczkowski  2016-04-21  503  		srat_proc[0].handler = acpi_parse_processor_affinity;
702b07fcc9b264 drivers/acpi/numa.c      Lukasz Anaczkowski  2016-04-21  504  		srat_proc[1].id = ACPI_SRAT_TYPE_X2APIC_CPU_AFFINITY;
702b07fcc9b264 drivers/acpi/numa.c      Lukasz Anaczkowski  2016-04-21  505  		srat_proc[1].handler = acpi_parse_x2apic_affinity;
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  506  		srat_proc[2].id = ACPI_SRAT_TYPE_GICC_AFFINITY;
4bac6fa73db77d drivers/acpi/numa.c      Hanjun Guo          2016-06-17  507  		srat_proc[2].handler = acpi_parse_gicc_affinity;
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  508  		srat_proc[3].id = ACPI_SRAT_TYPE_GENERIC_AFFINITY;
894c26a1c274b8 drivers/acpi/numa/srat.c Jonathan Cameron    2020-09-30  509  		srat_proc[3].handler = acpi_parse_gi_affinity;
702b07fcc9b264 drivers/acpi/numa.c      Lukasz Anaczkowski  2016-04-21  510  
702b07fcc9b264 drivers/acpi/numa.c      Lukasz Anaczkowski  2016-04-21  511  		acpi_table_parse_entries_array(ACPI_SIG_SRAT,
702b07fcc9b264 drivers/acpi/numa.c      Lukasz Anaczkowski  2016-04-21  512  					sizeof(struct acpi_table_srat),
702b07fcc9b264 drivers/acpi/numa.c      Lukasz Anaczkowski  2016-04-21  513  					srat_proc, ARRAY_SIZE(srat_proc), 0);
702b07fcc9b264 drivers/acpi/numa.c      Lukasz Anaczkowski  2016-04-21  514  
20e6926dcbafa1 drivers/acpi/numa.c      Yinghai Lu          2013-03-01  515  		cnt = acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
fd3e454366603c drivers/acpi/numa.c      Ganapatrao Kulkarni 2017-11-15  516  					    acpi_parse_memory_affinity, 0);
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  517  	}
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  518  
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  519  	/* SLIT: System Locality Information Table */
7f8f97c3cc75d5 drivers/acpi/numa.c      Len Brown           2007-02-10  520  	acpi_table_parse(ACPI_SIG_SLIT, acpi_parse_slit);
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  521  
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  522  	/*
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  523  	 * CXL Fixed Memory Window Structures (CFMWS) must be parsed
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  524  	 * after the SRAT. Create NUMA Nodes for CXL memory ranges that
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  525  	 * are defined in the CFMWS and not already defined in the SRAT.
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  526  	 * Initialize a fake_pxm as the first available PXM to emulate.
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  527  	 */
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  528  
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  529  	/* fake_pxm is the next unused PXM value after SRAT parsing */
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  530  	for (i = 0, fake_pxm = -1; i < MAX_NUMNODES - 1; i++) {
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  531  		if (node_to_pxm_map[i] > fake_pxm)
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  532  			fake_pxm = node_to_pxm_map[i];
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  533  	}
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  534  	fake_pxm++;
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29 @535  	acpi_table_parse_cedt(ACPI_CEDT_TYPE_CFMWS, acpi_parse_cfmws,
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  536  			      &fake_pxm);
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield    2021-10-29  537  
20e6926dcbafa1 drivers/acpi/numa.c      Yinghai Lu          2013-03-01  538  	if (cnt < 0)
20e6926dcbafa1 drivers/acpi/numa.c      Yinghai Lu          2013-03-01  539  		return cnt;
095adbb6441172 drivers/acpi/numa.c      Thomas Renninger    2012-07-31  540  	else if (!parsed_numa_memblks)
f3946fb6e50b75 drivers/acpi/numa.c      Thomas Renninger    2012-07-31  541  		return -ENOENT;
940fed2e79a15c drivers/acpi/numa.c      Tejun Heo           2011-02-16  542  	return 0;
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  543  }
^1da177e4c3f41 drivers/acpi/numa.c      Linus Torvalds      2005-04-16  544  

:::::: The code at line 535 was first introduced by commit
:::::: fd49f99c180996cef2d707ad71bee4f060dbe367 ACPI: NUMA: Add a node and memblk for each CFMWS not in SRAT

:::::: TO: Alison Schofield <alison.schofield@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
