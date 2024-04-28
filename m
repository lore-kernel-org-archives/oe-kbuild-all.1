Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB79520E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 03:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714273869; cv=none; b=of9Uio/UimjvweofgYMCgx2sqBT9JEmwJyaA4K9xr3V6SYC9uoa3+9tgtiDZ6THIgqxVvvwEzP9LDFBLI23gOfo10QlsMemPwLVUrm7CnBOjtPd4he4xUVWvQkVt0nlbHKTSSa5QWKL09x/J2PgpFJoyAkTixAaVzy830cOg4R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714273869; c=relaxed/simple;
	bh=ybwo/L4oj+BRaDmpeUBgyZw1n3p8pcBx0uvOW3weI6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TDHrfQwAIqDiSCt8TSR57CQmwAwoINfjEwAVRcxbZVNFVLRwhxwT5yVDqPg512MjLhz0j9f0nuzjRpBgDqwVtbKck6C3gaG/WlBHnlZw7XAcBbXrAyGRub85k62jnk7mEj0nUWWJdMNJXNzlahCLuZM3lnmF0Wccj+raCCUf/y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwP1KAbG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwP1KAbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714273866; x=1745809866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ybwo/L4oj+BRaDmpeUBgyZw1n3p8pcBx0uvOW3weI6g=;
  b=iwP1KAbG0grDVpW2Z89Zngi4B3rx6nG1RJcQqltSiUQwNCi3BpSASwTa
   7tavYa60q1sTkZY9qU6DhS+RiZQvm6yJ2VLo1ROgD1TI0ZKu1lidN5Xux
   nzZyMPuhFRB/8V1mpMmWIKLTdSyatnkuL+oxSf+28PA4KytgykcekfxaP
   dDv1KOsHnVYoiESCVg4mhTWYnXSpNIoXIFIRRNdOmkGaF14ckwVGCVT16
   CFFDsVyr+DQH5NLcKQGEvEpg8AFrbg+s5yrshg0znHPMz+LlSgivW16RQ
   kemzRuRy98m3b7YUDOdI4J+SqpeeSq+nW40MbBwGMpstr62PEgLZtfbk/
   w==;
X-CSE-ConnectionGUID: qHyj7mpKT+qDVRGriN6Yhg==
X-CSE-MsgGUID: PRw1SJBhTzWWAhXMJtJ3lQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10078080"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="10078080"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 20:11:06 -0700
X-CSE-ConnectionGUID: GHsNvpaER3ag0GYYMoOjVA==
X-CSE-MsgGUID: 4Q8oQgHVSkeX3pE0AXlExQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="26200430"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Apr 2024 20:11:04 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0uwQ-0005mo-0S;
	Sun, 28 Apr 2024 03:11:02 +0000
Date: Sun, 28 Apr 2024 11:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 4688/11728]
 drivers/soc/fsl/qbman/qman_ccsr.c:923:36: warning: unused variable
 'fsl_qman_acpi_ids'
Message-ID: <202404281117.93DHGa3v-lkp@intel.com>
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
commit: aed5a0a4be70a0cfa0dfd32f6cd8d7e9663fbd06 [4688/11728] soc: fsl: qbman: add QMan CCSR ACPI support
config: arm64-randconfig-003-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281117.93DHGa3v-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281117.93DHGa3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281117.93DHGa3v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/fsl/qbman/qman_ccsr.c:33:
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
>> drivers/soc/fsl/qbman/qman_ccsr.c:923:36: warning: unused variable 'fsl_qman_acpi_ids' [-Wunused-const-variable]
     923 | static const struct acpi_device_id fsl_qman_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +/fsl_qman_acpi_ids +923 drivers/soc/fsl/qbman/qman_ccsr.c

   922	
 > 923	static const struct acpi_device_id fsl_qman_acpi_ids[] = {
   924		{"NXP0028", 0}
   925	};
   926	MODULE_DEVICE_TABLE(acpi, fsl_qman_acpi_ids);
   927	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
