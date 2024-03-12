Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA39A191
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 00:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710201970; cv=none; b=YF6M3WYis7Gup6r2nPblwRDpmPgBiP5z727Y5Xzr+P2Us46rO/FFbKX5j4zr+QjprkSWjOqxGs37JZkORfPxWfILd5JkwRiO6naG1rTYzDRcMhxRvz4RuzlDd1zSwHDzr49Fz2xAiVetHXXXwt5hHPxo3upHtlQweGlD6p8obV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710201970; c=relaxed/simple;
	bh=GV6za7UTD5nqeCGiIWJN+5asnSQ/Hkh3oifRw5gFBU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bzvvQImxyKpqx5zWCTqqPqWteyxV5i5+LqfkwkV4jCOxv35VrNCSvEt+39zBvvO4FN6bpcnHr1Z8+qc5nzpJR3LA/qFG7ezXtSvP5pJozD8P/RQnbDVZXnhjIJUMmr7mUtjlsPAoqIqCEtzmXzuZSRsubIz8x34eeVTJsnSKBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQyU3nyk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQyU3nyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710201968; x=1741737968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GV6za7UTD5nqeCGiIWJN+5asnSQ/Hkh3oifRw5gFBU4=;
  b=QQyU3nykOlnD72JGTEfZ29tKb5OwiWJH9SKh6EjV3EKCV38FQ+Kw2PnR
   OgAnvOdGZFDPEl9PSLU8tquDLsms1CzFl4a+7EaZfBNLZydYvlRijd/QQ
   sEcPdvRqdnmwIdTtPV6PsKXm77U2M0zWPj2Xx0H3aBv7xl6bTStSJ2ese
   9AEnsc17mAw1G0fL9D+YeuVvIIYLPxc88wgQPFcDMCUrg7T+lV2Urli9Q
   6E8ZP9RhP3F2EBvJNxYej8WHpecoIRcgWHc0IKVg2wnWjFZiuJoJt+pJ3
   n7+bgi9U9+9aw/0SrL1zl7mw2omE9J2Qnq1ELl+5H8+47WwynZOxH7uzT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="22408958"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="22408958"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 17:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="48796876"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Mar 2024 17:06:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjpea-0009Yp-2a;
	Tue, 12 Mar 2024 00:06:00 +0000
Date: Tue, 12 Mar 2024 08:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 3160/21845]
 drivers/acpi/arm64/iort.c:1370:73: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202403120704.BrgZdp3c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8393e1c316adfa8f2fdbba0d7c69fc7ae2293393
commit: 68088650bec0647cef4d822b31f818a094f5eead [3160/21845] perf/smmuv3_pmu: Enable HiSilicon Erratum 162001800 quirk
config: arm64-randconfig-r132-20240304 (https://download.01.org/0day-ci/archive/20240312/202403120704.BrgZdp3c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240312/202403120704.BrgZdp3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120704.BrgZdp3c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/arm64/iort.c:1370:73: sparse: sparse: Using plain integer as NULL pointer
   drivers/acpi/arm64/iort.c:61: warning: Function parameter or member 'iort_node' not described in 'iort_set_fwnode'
   drivers/acpi/arm64/iort.c:61: warning: Excess function parameter 'node' description in 'iort_set_fwnode'
   drivers/acpi/arm64/iort.c:980: warning: Function parameter or member 'dma_size' not described in 'iort_dma_setup'
   drivers/acpi/arm64/iort.c:980: warning: Excess function parameter 'size' description in 'iort_dma_setup'
   drivers/acpi/arm64/iort.c:1447: warning: Function parameter or member 'ops' not described in 'iort_add_platform_device'

vim +1370 drivers/acpi/arm64/iort.c

  1367	
  1368	static struct acpi_platform_list pmcg_plat_info[] __initdata = {
  1369		/* HiSilicon Hip08 Platform */
> 1370		{"HISI  ", "HIP08   ", 0, ACPI_SIG_IORT, greater_than_or_equal, 0,
  1371		 IORT_SMMU_V3_PMCG_HISI_HIP08},
  1372		{ }
  1373	};
  1374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
