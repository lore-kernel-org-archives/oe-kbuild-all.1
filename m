Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6816B220F2A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736642; cv=none; b=efssBodNlggY4YiLyEV+HvRrdzl6OO+ubL6ZV0+ceO4EfkfHzqODOAgkrkYE46PGWeIQMKk+JHF1oZr38U1mjZvEN0X45CEPUW2RSLYAMm5L1L3t5JhWd1BK2SH0mvcS9PKT0Q42axLicXT2R8TJ59A6V+RIe0DCPulQ+tTBJus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736642; c=relaxed/simple;
	bh=F7bde/Npr4YGTsBIjpskcngwX6JWR57U9O1yVp+CEcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ug9386cMlIih46bz6J9s7ukugxmsdiLAGVq1Ou+gQItispykmNfPXuuyDB6q2yuDo/NM6BAUx4aVydSTxZrBg9Vmb2Bh9W8Ux6IVG3nW8/VwCtqRYv1SrHap/9rIx4CTeO3xTesYqZm2OLq0XjcYzaGmETYkhKKOaSDGzo/cTHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eb5ty+5c; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eb5ty+5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749736639; x=1781272639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F7bde/Npr4YGTsBIjpskcngwX6JWR57U9O1yVp+CEcw=;
  b=eb5ty+5c7eNXXTF2qb5C0cVqfdhBN9cvVIMMIahsS6R3DzERIHh8yOC2
   BIcvZBvF9x1HLP9toXZYS+VLRjSYXXrbTe3aGK0S3s5VQh/XE8lvL9X1g
   LhyqnDy/0aaFSqiyto4qTJDNmUuGmYMnZFK9BfiPMdthwRpHT+hXLrScN
   P0LhVNs3IKTXOcC0jH4KtvQXJgk9ZLnOigLYlGvlTc2Hre/HRqmeUkRyN
   Ih23AP6b5iMdNIx3FAXwTfZmwfqPbqNgAbciXEPFmS3Ua1V+hDosOYE5D
   08XFS3mt+wmqG7BkNZLq2NIjpCuAgtl1WMGK2R3a2II0mD9eq/sB+HVWo
   A==;
X-CSE-ConnectionGUID: 5ZJnCdYjS6Gm0kNhz9ey3g==
X-CSE-MsgGUID: qi23mmrbTs27y7TC0Qi7Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62955702"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="62955702"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 06:57:19 -0700
X-CSE-ConnectionGUID: hsfS+M08QceJviWNTyszOA==
X-CSE-MsgGUID: 3VjKNcKORfysjx3+fSdYkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="178431981"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2025 06:57:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPiQd-000BbW-0R;
	Thu, 12 Jun 2025 13:57:15 +0000
Date: Thu, 12 Jun 2025 21:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 12/14] arch/m68k/kernel/setup_mm.c:214:14: error:
 implicit declaration of function 'early_init_dt_verify'
Message-ID: <202506130005.zhZFq5Wk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   a227d3c7914f7e7059bba92fc8a99e4be11b0abf
commit: 57417b30738e9f804d3efecdf41a3119fce08244 [12/14] m68k: implement a builtin devicetree for mm targets
config: m68k-randconfig-r133-20250612 (https://download.01.org/0day-ci/archive/20250613/202506130005.zhZFq5Wk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250613/202506130005.zhZFq5Wk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130005.zhZFq5Wk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/kernel/setup.c:3:
   arch/m68k/kernel/setup_mm.c: In function 'm68k_setup_fdt':
>> arch/m68k/kernel/setup_mm.c:214:14: error: implicit declaration of function 'early_init_dt_verify' [-Werror=implicit-function-declaration]
     214 |         if (!early_init_dt_verify(__va(fdt), fdt)) {
         |              ^~~~~~~~~~~~~~~~~~~~
>> arch/m68k/kernel/setup_mm.c:218:9: error: implicit declaration of function 'early_init_dt_scan_nodes'; did you mean 'early_init_dt_scan_chosen_stdout'? [-Werror=implicit-function-declaration]
     218 |         early_init_dt_scan_nodes();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         early_init_dt_scan_chosen_stdout
   cc1: some warnings being treated as errors


vim +/early_init_dt_verify +214 arch/m68k/kernel/setup_mm.c

   207	
   208	#ifdef CONFIG_BUILTIN_DTB
   209	static void __init m68k_setup_fdt(void)
   210	{
   211		phys_addr_t fdt = (phys_addr_t) &__dtb_start;
   212	
   213		pr_info("m68k generic DT machine support, FDT blob at 0x%08x\n", fdt);
 > 214		if (!early_init_dt_verify(__va(fdt), fdt)) {
   215			pr_err("FDT blob is bad?!\n");
   216			return;
   217		}
 > 218		early_init_dt_scan_nodes();
   219		unflatten_device_tree();
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
