Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A44C3C24
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 04:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714278371; cv=none; b=kuymJEK/r4baRREWZrhj/fkm4DhIAsIc+TaiYSWyzNFHEF8gn2j5q48fHKplG71AWxC/apexwBhFtwhUqmR4iBoBnMDYay2TYqLK8AjN+JT6iVgoOKW4xKNBalV2p/t7td/uJnUqI1k1PuvynpU4KkNwrqBUqthuvBKT01jAX9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714278371; c=relaxed/simple;
	bh=Vur25IDUFqW1qV2wGYg37krrFddR1jOAY1ip0ydXRlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mc41FWozQobBEGFEI3B+cQ6nQspM//uYMJmJtLxSj144Tou/otHDin5TpzSh5DO4+c3FhtvGkE575HaQkQvH+DIiN6M5uZa1VqzYHKSlMUXmlRahtX7sRfGVNda+bm+0lEH4cE1V9JMo1rpQfsjbChvhFSwfFMoiD96XJhR+0MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQnr+ZF7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQnr+ZF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714278369; x=1745814369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vur25IDUFqW1qV2wGYg37krrFddR1jOAY1ip0ydXRlY=;
  b=LQnr+ZF7NZHKZs5T0uLOWXJHcPle5vr8CUFRS/djY7/2L2ga1s1sko7t
   ocuA9I2VqxGrjjshgmbUJCIIIJcJfLHuz9wlYQDAnJMIRGuyZT/FLErYy
   oYOwd0eH0li4A4dLBkf5WaVv8hDFeDhMkzwT5KWMngHNEX5fhgs8npiHZ
   QFb4lSNh2au5vz7MZWEYFC5ckfZzqfRV7aOWFxhBz/lnLW0xfYKxJgExp
   /U94buczyviFFt1HycP0saRW2j3IcFtGJjwO5GlidHkaqJT1U62ZJHyiT
   4EKDOs3YP/KuQ/HczKFzZssXyKCtDBYSFp7gRCuD/Er9ZiHbxjkEHiQiy
   Q==;
X-CSE-ConnectionGUID: CRtkAzMZTJ668xsBDMOM9g==
X-CSE-MsgGUID: +gKdgRsVQtuO42C3JNUWdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="12907391"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="12907391"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 21:26:08 -0700
X-CSE-ConnectionGUID: GUMGPaHJRrix+GyEVG9L5A==
X-CSE-MsgGUID: PwZUInF1RxynSL0VyI7A+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25783209"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Apr 2024 21:26:07 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0w73-0005p8-0p;
	Sun, 28 Apr 2024 04:26:05 +0000
Date: Sun, 28 Apr 2024 12:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 4689/11728]
 drivers/soc/fsl/qbman/qman_portal.c:321:36: warning: unused variable
 'qman_portal_acpi_ids'
Message-ID: <202404281231.agkaqUJ0-lkp@intel.com>
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
commit: e7c7a6b51219cc0078496dc95eb11060c8828d15 [4689/11728] soc: fsl: qbman: add QMan portal ACPI support
config: arm64-randconfig-003-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281231.agkaqUJ0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281231.agkaqUJ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281231.agkaqUJ0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/fsl/qbman/qman_portal.c:33:
   In file included from drivers/soc/fsl/qbman/qman_priv.h:31:
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
>> drivers/soc/fsl/qbman/qman_portal.c:321:36: warning: unused variable 'qman_portal_acpi_ids' [-Wunused-const-variable]
     321 | static const struct acpi_device_id qman_portal_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +/qman_portal_acpi_ids +321 drivers/soc/fsl/qbman/qman_portal.c

   320	
 > 321	static const struct acpi_device_id qman_portal_acpi_ids[] = {
   322		{"NXP0022", 0}
   323	};
   324	MODULE_DEVICE_TABLE(acpi, qman_portal_acpi_ids);
   325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
