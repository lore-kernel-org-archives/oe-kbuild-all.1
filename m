Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18497DA8C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734888125; cv=none; b=E0Y9cs55aclRcW6r6HCPp20Ae8tOp+3jqgrMZ+kTKdAb/9Y0+PAu+r5S/Q1tPYR3K5oVBfxZLtTIWEPcdHlh1ZE7evQpUbyr+LQNeD23fCoig2lBj4auGr6GcpNr0XBcNPRsV44zVFwjL4bulnC60qC3Dy9ijmOUIOYT9vUGbkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734888125; c=relaxed/simple;
	bh=4kb7FLWdM6a3rFpNK1JC/QmLYc0JjXfoiKY+bq3O+mE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f98Oe2a3Ys1rN9yKi6BmkeD2UilFhGL/xSltJTYl+6BGCXs5HdMXbvzfxsTxZGTJBLHx4YnppBeczZ9zUiO0yzTf3fXkpkq8Z8hA545zd0GuCdl4+impRfiuMHrVlSMncOZRlc7CCvHbHhvnz4DRvaShWEULvjZ9RQVBetlMC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLmsFcd8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLmsFcd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734888124; x=1766424124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kb7FLWdM6a3rFpNK1JC/QmLYc0JjXfoiKY+bq3O+mE=;
  b=MLmsFcd8hhAzPg21dnvAnmrWkpy9JzeoO5KPCz2CAlBQY51AVHwkx33Z
   Md6EtKjxlZhsT8Hb43oROMOszMZUX/kOUqzm6gapfTDO3zVO8Iol9ZRev
   lqkHl/K2scinpVGwGDTu6B23hESy/Onq4tlXHSStnHVAbyjpfvUhgZrWX
   ShuYx0347h7wGyzvFMrbJgcPTFftQ0i49Jmy6nxIYZ5JOjB7ABDsJUuHU
   EqgKEveRERrrJrDG9imhqRCOOe1CN68FHO5797UjTvsEXbdoJonQ32HaE
   Jd5tggDE14fOk2RP3zuECziogWd+XEm6aQzJcuZ0tKZGFY2Npo42ybFMO
   w==;
X-CSE-ConnectionGUID: 5od+2GYYSGms0nClauRrPA==
X-CSE-MsgGUID: H5dL5gglSxC4wM7KRAthwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35078109"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35078109"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 09:22:02 -0800
X-CSE-ConnectionGUID: vZZI/qg2QtG+wF5BmU1+rw==
X-CSE-MsgGUID: mKZ2vx0vQeGUDMagqh8kbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103100178"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2024 09:22:01 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPPeQ-00034l-2H;
	Sun, 22 Dec 2024 17:21:58 +0000
Date: Mon, 23 Dec 2024 01:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Li <hao3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/linux 933/1030]
 drivers/ptp/ptp-intel-pmc-tgpio.c:804:36: warning: unused variable
 'intel_pmc_acpi_match'
Message-ID: <202412230143.pVmMHxkj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   b4412bb81319acf5aa9334b91c917b1899ffd570
commit: 336527b4043dda2dfd40f37dd3817f0852b705e8 [933/1030] ptp/tgpio: Fix return type of remove function in tgpio drivers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241223/202412230143.pVmMHxkj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230143.pVmMHxkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230143.pVmMHxkj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/ptp/ptp-intel-pmc-tgpio.c:17:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
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
>> drivers/ptp/ptp-intel-pmc-tgpio.c:804:36: warning: unused variable 'intel_pmc_acpi_match' [-Wunused-const-variable]
     804 | static const struct acpi_device_id intel_pmc_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +/intel_pmc_acpi_match +804 drivers/ptp/ptp-intel-pmc-tgpio.c

b46963784ab6c4 Christopher Hall 2020-04-02  803  
b46963784ab6c4 Christopher Hall 2020-04-02 @804  static const struct acpi_device_id intel_pmc_acpi_match[] = {
b46963784ab6c4 Christopher Hall 2020-04-02  805  	{ "INTC1021", 0 }, /* EHL */
b46963784ab6c4 Christopher Hall 2020-04-02  806  	{ "INTC1022", 0 }, /* EHL */
b46963784ab6c4 Christopher Hall 2020-04-02  807  	{ "INTC1023", 0 }, /* TGL */
b46963784ab6c4 Christopher Hall 2020-04-02  808  	{ "INTC1024", 0 }, /* TGL */
b46963784ab6c4 Christopher Hall 2020-04-02  809  	{  },
b46963784ab6c4 Christopher Hall 2020-04-02  810  };
b46963784ab6c4 Christopher Hall 2020-04-02  811  

:::::: The code at line 804 was first introduced by commit
:::::: b46963784ab6c43803287df41706dd5492e23e22 drivers/ptp: Add support for PMC Time-Aware GPIO Driver

:::::: TO: Christopher Hall <christopher.s.hall@intel.com>
:::::: CC: Hao Li <hao3.li@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
