Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA790337BA3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507782; cv=none; b=dAIgYsLQOpYVzi3Kv5JSyX1VLDol6Ms9+6QRj6fAhAfjD3Oik3skPwFgmKdsUTfjtlk+cmhkQZnUgEDH9swGlfHJDXj9MzUugxzor98pZ+x11Nd3ky9qvG359BRCs4HrPnnLju/BRxhuaJahzn3wL/qBZdpoTRc2HSRY9aiA1Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507782; c=relaxed/simple;
	bh=4s+qGtCLwZdWoMawUXWufkLdGlLL5Dr9JzjecGNysf0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cprElxunLGwfoNnKgHxjLjD39nsVzhVqhnsM7vRRe5lOUZz5chsaOCr8OsiSMyay5s1Q61wkzZ2MezzNZ6QK67yfOsrSyyswldM48PTIVAbgNXZ6rwKjVc2N0AMCeYiBV988LBFGktHSA7xVjh6+WXTz6USofCxvl7/BTrsrcIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6pK4X+o; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6pK4X+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769507780; x=1801043780;
  h=date:from:to:cc:subject:message-id;
  bh=4s+qGtCLwZdWoMawUXWufkLdGlLL5Dr9JzjecGNysf0=;
  b=E6pK4X+opQmvNfOhmBsM+ee5EIkdTVkC1ENR0VDPjzy5Mi5hErKqIK2s
   FQ9hF83DcyZ6+zz3k98iM+bikiS+IRppF5W5waaKH/h9cYZNVAN6Jl0KV
   4P2urFgnAMlqkDiGWoYYtI4EDvX/TYVXQyX3k86L+2IdEk4GANkIUxI5W
   UwuZm7unoN9N8ZnpfhLY+iVSVG+pzxfK8mjFkXVXpNtmD7gaLJezdadBE
   X+dd18q65tze5XGAwkBJ1Vy3scgnmusNBYQ24rOXgWOsJiXgi1ax40eoL
   zvb4tF97Rlyzu/JrkFC175fxKRVE5+pVG0dALfmo2L3Y8/NXXnwV1Geev
   g==;
X-CSE-ConnectionGUID: lw0Mo2cQQKeQ9OYUvh7NBA==
X-CSE-MsgGUID: oYP7zMBoSLGSvHqeTcJ43w==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70788689"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70788689"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:56:18 -0800
X-CSE-ConnectionGUID: EL/17CjJRCGSOCeYrADZdw==
X-CSE-MsgGUID: Z1UVPJ1/QxmvYp8f71LK9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212047636"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jan 2026 01:56:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkfnx-00000000YGx-2VSc;
	Tue, 27 Jan 2026 09:56:13 +0000
Date: Tue, 27 Jan 2026 17:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [fustini:b4/ssqosid-cbqri 14/18]
 drivers/acpi/pptt.c:1105:65: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202601271700.mjit34Qy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   8182dddb709d03a64b99b430d05f8f21103aa9b3
commit: 60aed9e92fe0ca93b56a46ae251eb1ff851d572f [14/18] acpi: pptt: Add helper to find a cache from id
config: loongarch-randconfig-r134-20260127 (https://download.01.org/0day-ci/archive/20260127/202601271700.mjit34Qy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271700.mjit34Qy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271700.mjit34Qy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/pptt.c:1105:65: sparse: sparse: Using plain integer as NULL pointer

vim +1105 drivers/acpi/pptt.c

  1066	
  1067	/*
  1068	 * find_acpi_cache_from_id() is adapted from find_acpi_cache_level_from_id()
  1069	 * introduced by c4170570cc7f ("ACPI / PPTT: Find PPTT cache level by ID")
  1070	 * in the morse/mpam/snapshot/v6.14-rc1 branch.
  1071	 *
  1072	 * TODO: find_acpi_cache_level_from_id() has changed since then so this
  1073	 * function should be updated. In additon, there may be a simpler way for
  1074	 * acpi_parse_rqsc() than adding this function to get a pointer to
  1075	 * acpi_pptt_cache.
  1076	 */
  1077	struct acpi_pptt_cache *find_acpi_cache_from_id(u32 cache_id)
  1078	{
  1079		u32 acpi_cpu_id;
  1080		acpi_status status;
  1081		int level, cpu, num_levels;
  1082		struct acpi_pptt_cache *cache;
  1083		struct acpi_table_header *table;
  1084		struct acpi_pptt_cache_v1 *cache_v1;
  1085		struct acpi_pptt_processor *cpu_node;
  1086	
  1087		status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
  1088		if (ACPI_FAILURE(status)) {
  1089			acpi_pptt_warn_missing();
  1090			return NULL;
  1091		}
  1092	
  1093		if (table->revision < 3) {
  1094			acpi_put_table(table);
  1095			return NULL;
  1096		}
  1097	
  1098		for_each_possible_cpu(cpu) {
  1099			num_levels = 0;
  1100			acpi_cpu_id = get_acpi_id_for_cpu(cpu);
  1101	
  1102			cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
  1103			if (!cpu_node)
  1104				break;
> 1105			num_levels = acpi_count_levels(table, cpu_node, 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
