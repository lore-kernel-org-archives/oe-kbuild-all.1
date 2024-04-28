Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC21619F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 00:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714264203; cv=none; b=O4jvBGgI58s9US8C1ffHmLqPeL+J4RnGGvKsn5jdAZE4xDVD8sFCneUF+aSCxDxohgvM0yvj1FcZ1UH19+4K5pNG254+twRZsBwbD58eCq1G0mnMgA/9Tso2lnfup37ZXFhCutZryXUQGK8JEFy0fVYWaUrUmh/XlyJEl7Gg7c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714264203; c=relaxed/simple;
	bh=2ECSe9ANI5CIKh7/gmuVVGFGO7VmLcLQac509ZrA+HU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AwQqrYXh8JddQ7dZsDugL8Ho9Fn5BfP6X3u+ZTboMSPqBLubXFwfe+23yX2Ts2Qy/yPeDUkoFBbVx2oVWDsGNhZSHdFs9y85opk0aHzl+c4Z1yEc0FtAvRIjsJmu9Jg621/3jlZGxIcFDF3bDWe82zDPGuP22wbs3EK766oO4uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxOUPcBC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxOUPcBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714264201; x=1745800201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ECSe9ANI5CIKh7/gmuVVGFGO7VmLcLQac509ZrA+HU=;
  b=mxOUPcBCfa56FmJK/gxm38BNnmxGNZg8YqNsx3F7VwM+nS7O0EharuvV
   dKBt0pr6ldt6up3R72ICMmzG8/jUpSTqISgyybHHhO+H92OgGJxpTp/a7
   d7lN8NcSl0fSeZnLfZlifsRhmMr4WRuflExtG+WQUr5wWhgH8BZ02WjW1
   1HcrrzPFPwu7Ub5rXgLjYbcxLwqk3mrp9FSAzRmeNMJgzqIKHqeljQjVF
   +VRV9bsdJp2BXMPg5sQu+SWEkf/aGDiseVVSsDz/a9MFkmg2NOCIPerBF
   ldeNNe2CnXAbGS3xMy1F4BYtR/K86id38DzXVlEn1zGlBRB1lXN9+HrSZ
   g==;
X-CSE-ConnectionGUID: 03wk3ZnaRtGo3wZWaHoZEQ==
X-CSE-MsgGUID: scdcOtN+RbKBnjHAL6QnpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9889350"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="9889350"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 17:30:00 -0700
X-CSE-ConnectionGUID: 2aN06n6FSV+I28QNIuLwVA==
X-CSE-MsgGUID: VY3IRdb+Q+SnUtAH/VH9tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="63231515"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Apr 2024 17:29:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0sQW-0005fA-2n;
	Sun, 28 Apr 2024 00:29:56 +0000
Date: Sun, 28 Apr 2024 08:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 4686/11728]
 drivers/soc/fsl/qbman/bman_ccsr.c:314:36: warning: unused variable
 'fsl_bman_acpi_ids'
Message-ID: <202404280812.s7r3jUS0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 3f1f5b49b69a123e15e77b20cbd73f51c9b61bbb [4686/11728] soc: fsl: qbman: add BMan CCSR ACPI support
config: arm64-randconfig-003-20240428 (https://download.01.org/0day-ci/archive/20240428/202404280812.s7r3jUS0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280812.s7r3jUS0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280812.s7r3jUS0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/fsl/qbman/bman_ccsr.c:32:
   In file included from drivers/soc/fsl/qbman/bman_priv.h:33:
   In file included from drivers/soc/fsl/qbman/dpaa_sys.h:46:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/fsl/qbman/bman_ccsr.c:314:36: warning: unused variable 'fsl_bman_acpi_ids' [-Wunused-const-variable]
     314 | static const struct acpi_device_id fsl_bman_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +/fsl_bman_acpi_ids +314 drivers/soc/fsl/qbman/bman_ccsr.c

   313	
 > 314	static const struct acpi_device_id fsl_bman_acpi_ids[] = {
   315		{"NXP0021", 0}
   316	};
   317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
