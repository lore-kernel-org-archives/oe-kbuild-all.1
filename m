Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E2D14AD20
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 11:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766662151; cv=none; b=SrUwIBJwxGDmdpkOoygG7KbYTu/T29iWy2GfBiDGJNDhtEbuBY3bd7iHItQSiFdmkA2N7LMwwx5H0qw4iP4JjVI/vP7DoCqPdzWhCf0IsIp7qRBzaY36vetC/kn2ePtGU4k9aTdbjaPdjbql/cQgEKETFN9FqVObtGmIO2XVD3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766662151; c=relaxed/simple;
	bh=zbIcdky37/kPxgGwRxTJRGaA6iffKxzN9JB/MgCDM60=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nsnfCdaX4ZgMlO25oVKHqbmvIiHERsq9DqOUG4o89Viwxv/UhIIwhzJxElGBEru9yBaJ96eHcKyg62TCXXMLhAVGILNaxObJAJAcdDiWy/hrrib0sFMs92WQhgVoFU7uWm++CN0CZJJCPQhcaoncrfr8KOOBQBszfbm4/qfrylU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DN5YmPof; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DN5YmPof"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766662150; x=1798198150;
  h=date:from:to:cc:subject:message-id;
  bh=zbIcdky37/kPxgGwRxTJRGaA6iffKxzN9JB/MgCDM60=;
  b=DN5YmPof8pOdOd4kOTyee1oF7ZzNKQOYYtV8sQV20ZISIvGgESfpu+Il
   Ugwp4WvNsQ2mMkHfSOcCXOMS6PqP9OHTvsvC2FUFYDw1FixFMFe5FIHVF
   Wzo5iLO3EpR1YXMA7BiyJIxTlkywEfzqVr8BpVr8KrhAfK/pnaToepOBw
   zBMRdoclKGdGpH05AITu0CWL9tb/MjRiMD+y7G1xBuRtvt4rffm9EiQIr
   dEpwX42VEpd/GM2PYwNSsG2yo7GneaNc+ZHm94Idhm+HseHvAH0YP23SC
   BvcCh3/Gha0UZibDYrkkncLnp4I6x5S0TR+Wh9aVL3skUySvqYy3Kdl7P
   w==;
X-CSE-ConnectionGUID: R+ZiLx4QQpW7aFndtMId1Q==
X-CSE-MsgGUID: diHbZF7rQqmr+feFHwpqhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="72320253"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="72320253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 03:29:09 -0800
X-CSE-ConnectionGUID: qqje5vCGSxOoNuDfAqgYpQ==
X-CSE-MsgGUID: PGIQ20rST329k4RMVLcreQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="200173218"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Dec 2025 03:29:07 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYjWi-0000000042L-3aXl;
	Thu, 25 Dec 2025 11:29:04 +0000
Date: Thu, 25 Dec 2025 19:28:18 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [avpatel:riscv_sbi_dbtr_v2 42/55]
 drivers/hwtracing/rvtrace/rvtrace-core.c:133:23: sparse: sparse: symbol
 'rvtrace_bustype' was not declared. Should it be static?
Message-ID: <202512251915.ylC1XnPh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v2
head:   99cb6c466559dba2b0011d84701a156c252e7c59
commit: cf30303a6684d4ede4dbe421fb13eeb325b2a159 [42/55] rvtrace: Initial implementation of driver framework
config: riscv-randconfig-r122-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251915.ylC1XnPh-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251915.ylC1XnPh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251915.ylC1XnPh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwtracing/rvtrace/rvtrace-core.c:133:23: sparse: sparse: symbol 'rvtrace_bustype' was not declared. Should it be static?

vim +/rvtrace_bustype +133 drivers/hwtracing/rvtrace/rvtrace-core.c

   132	
 > 133	const struct bus_type rvtrace_bustype = {
   134		.name	= "rvtrace",
   135		.match	= rvtrace_match_device,
   136		.probe	= rvtrace_probe,
   137		.remove	= rvtrace_remove,
   138	};
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
