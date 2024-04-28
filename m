Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AE2EDE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 01:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714269365; cv=none; b=BZjfwJg65eXx9chLq8pwHs26HXgrP284yaN2/f7SkH785pNgf6gFNuMxgFMTdCIt9MHh6tv1QmWjOx6ItlW7EQ24grIVzAKIxS2EsF48jNl3ESN/IDYtbZM5ywwipZiWQ4jxjcEg5t7/BtpkQj5bU3U5KNPqNiFuemLCbO6Oq2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714269365; c=relaxed/simple;
	bh=6oL7Zy8fkC2x7x9lbt5yknu6zjyviMDSXA/UzNNw25U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Etl3Fr+2q0we5J3eRh2zQYjSyfarqKpJJQjraZwZkkRfniYRZAELzV/lqx2UpBoz8pbzCq8M2wKukMzqKgvf/fmSYuXsR8lJFtl/HDDeS4h+Z+F7nr/5A5RAy+/z3NnHCNTOBPBTgV9cPgONmMwH1s5x9ZkDxYF2RZ6vCVq8JZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gj3mJowH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gj3mJowH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714269364; x=1745805364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6oL7Zy8fkC2x7x9lbt5yknu6zjyviMDSXA/UzNNw25U=;
  b=gj3mJowHSNumdnLnU2PgPgo/4u0GFvG+jGxhpZnOT2QBti+dUzgp3U8H
   xvziRz0guL4TG6f9OI3AYBj9kToXsGnvlwZsn0PD3FvWFT83/h7rF/zjn
   QmixKI9VqZIOFJEx+LRlzkgmYw4JATFc5eM9ZI50Ul5pOyj5fSjmZ1jx0
   OhgusbYZeOaGlP0/m1BSdmnDQ0xfo/gc2EB0hQ/096k4uqyEJPd+oboSZ
   cgFmy/sEFp717xm1kBaugs8SYDrtZ7DtUvF30zGyRF5+1brl0WRbMLLVD
   gaCNE6lODDLXbn6bkMMPpnFXDJMjDw8bcuzh0AF6bJQ70jy2E6iI0gD33
   A==;
X-CSE-ConnectionGUID: mNRjA0YcQ+u5lQLLWt4yPQ==
X-CSE-MsgGUID: YZO/E9BrQVy/z8z2rF12ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21115705"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="21115705"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 18:56:03 -0700
X-CSE-ConnectionGUID: djAjKa1FRfKEoHiS6g9LaA==
X-CSE-MsgGUID: k4wljLDDSPWcxHyFfJ9qqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25862371"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Apr 2024 18:56:01 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0tln-0005iY-0L;
	Sun, 28 Apr 2024 01:55:59 +0000
Date: Sun, 28 Apr 2024 09:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 4687/11728]
 drivers/soc/fsl/qbman/bman_portal.c:219:36: warning: unused variable
 'bman_portal_acpi_ids'
Message-ID: <202404280911.zhwOYYKH-lkp@intel.com>
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
commit: aa5b401587aeab3ef06cb45a1de53a25597d5574 [4687/11728] soc: fsl: qbman: add BMan portal ACPI support
config: arm64-randconfig-003-20240428 (https://download.01.org/0day-ci/archive/20240428/202404280911.zhwOYYKH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280911.zhwOYYKH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280911.zhwOYYKH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/fsl/qbman/bman_portal.c:32:
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
>> drivers/soc/fsl/qbman/bman_portal.c:219:36: warning: unused variable 'bman_portal_acpi_ids' [-Wunused-const-variable]
     219 | static const struct acpi_device_id bman_portal_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +/bman_portal_acpi_ids +219 drivers/soc/fsl/qbman/bman_portal.c

   218	
 > 219	static const struct acpi_device_id bman_portal_acpi_ids[] = {
   220		{"NXP0023", 0}
   221	};
   222	MODULE_DEVICE_TABLE(acpi, bman_portal_acpi_ids);
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
