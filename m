Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C643912BEA3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 20:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709670496; cv=none; b=JAyTZUYYZbEYMl1dMO60JyP7c07b1QUfT9kMDMrfF2T7gzQow/SqGisbxbyDs4jiSbgRx0jm5YMWiVHyOiMQUghv5/pUSz7/Vj2VPQBfHYwzHToVXRPIvYPqweBRZHrR/508si7L3TRjL3KHHDw99BnmUoGoCWM3P+WM/rv+Uvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709670496; c=relaxed/simple;
	bh=JLxNQ2g0JXKrSjkFgIRSCBz6+41LfCdXGPn6BnU06Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZI1FhO0vHjmprZ1F+rOYtuS9orPt38NN0s6o1KiLmYvBNZPX1PsT6gvjWaqRHEg4B+5nDU8h1ghA/LAoQmWezmPdUKQQYYV7x/V4QFYQ7iq6XCZgS/hBFncjOHkJHwRTG4iy/atY9tFT/XTs0ye53VXV0gWAZR6shvB8GympSY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIvYUhgU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIvYUhgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709670495; x=1741206495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JLxNQ2g0JXKrSjkFgIRSCBz6+41LfCdXGPn6BnU06Rw=;
  b=kIvYUhgUkSFf8Bj9A11FsphtIAQYQJf+fZ3e5mLL4MA6nllN2CtCaSeG
   CbUY3pqyKbMZtyFErwsqDVyJzgN974VEgEZ4XaSy4J+KBIVVWUPTnEoh9
   n/GmJVM/jKM/JJ2WdMTpGvRsmR4s8OgP+jWxVDFK4r03IMabqyVshaStP
   QPdPeS5VjAB/SgHJswoHpCMxkfGLifSFZtAAN0fL5p1gYdwvCetu7xLKu
   lhpKxMVOz+qNUf0ydPxMr6BFNbuFPDlwKR1ah9ryuB1lcsd/XqkO8GZI4
   f+gSbShvM8vP9L6e/fLhpoxhj4TUAx6j1qdrR51C3/ZFfB/ug6CBNSnGh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="14900423"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="14900423"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 12:25:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="13986674"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2024 12:25:58 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhbMK-0003dS-1t;
	Tue, 05 Mar 2024 20:25:56 +0000
Date: Wed, 6 Mar 2024 04:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 3160/21720]
 drivers/acpi/arm64/iort.c:1370:73: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202403060427.t895UnKP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ba030414a07b34111e8786469740412351906964
commit: 68088650bec0647cef4d822b31f818a094f5eead [3160/21720] perf/smmuv3_pmu: Enable HiSilicon Erratum 162001800 quirk
config: arm64-randconfig-r132-20240304 (https://download.01.org/0day-ci/archive/20240306/202403060427.t895UnKP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240306/202403060427.t895UnKP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060427.t895UnKP-lkp@intel.com/

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
