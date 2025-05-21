Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B972741B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 13:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832463; cv=none; b=OXFtIWsOTZ5c4hAEfRfJdpyREgL165bLMlY7Zo/hU2FBxP9EIA+ko/IrOBFCa+oeoXRDKhypd4ZW6kbAAmTG3PhGE/kkDXyDPYE7BM18U1kWmMK5Bh7RqdjyHgeiMoToQAn98twBWiJ1jL8Uybyd/r5wQy6znCtPUAehbYJ5ht4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832463; c=relaxed/simple;
	bh=vjjoWgOuxbVJg/mfYGgiMO9bZdEF5doF67SQc9ZFZIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VzMKR4iujRPVr3LFMuS9RzWTRezRRN7KejvLT7xVkVmJ4lRfdEaSbGegDGScXPBnX4rpv+1XZuknNE/VmEChQ7YzTZCrwa41YEeM/rdXzAoE0DO+Eo4BOMj8yUu8fRKDBY1tnzObYi1+5lV3QY8A592Y6kA/ig2e7BrlSyaRxFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFL9s0/X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFL9s0/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747832461; x=1779368461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vjjoWgOuxbVJg/mfYGgiMO9bZdEF5doF67SQc9ZFZIM=;
  b=dFL9s0/XsdiMueOpZHMgC8XbXk5Ae0ZTYmnQB3n2TYcwnnE457w5ghaN
   H5l/ncIupqKJGnF7TOpyJ/vbCMmr0UQnaWB66wcnnLK5+tKKS5iZ75nyP
   xBiv6Bn4gRVtZaVDA75gvj/uvrd5Nr5mG1RDK/hD+KLZrYiSzPdsv46OH
   sLUYq6BkJASWT17x7U9oP6UYQbBw0xr8gEN7My4yITsgKRGFQfgQkVEvC
   Y8Wp4Fk5IKmTAJ0R4vAHZjCXYBS99oS5xd8FQH3bbc2B0p5dq7CAKSrhP
   9QgDYZhTVgc/vonma6pQTvbrEXceKWtzGAeM/w0KUZAwvBPcb9GberAI7
   A==;
X-CSE-ConnectionGUID: trQgwa6UTvqEvY+czhAwAA==
X-CSE-MsgGUID: AHvB/ruwQHCAZ4cM5TNqGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="75204332"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="75204332"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 06:01:01 -0700
X-CSE-ConnectionGUID: 0NKKYHE5SKmTsK2JLEAbfA==
X-CSE-MsgGUID: AhttdKtYRNOBAC9itF5qWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139964156"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 May 2025 06:00:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHj45-000OH8-1v;
	Wed, 21 May 2025 13:00:57 +0000
Date: Wed, 21 May 2025 21:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 arch/arm64/kernel/perf_event.c:1021:5: sparse: sparse: symbol
 'armv8pmu_max_events' was not declared. Should it be static?
Message-ID: <202505212010.qp6VW8sY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   a9210c1506e930df0afea77708f176a29bd80ebf
commit: 354b0c4c1ebb89a4198fdec59a447bc102320bac [1/1] CHROMIUM: arm64: Add command line to limit number of armv8pmu counters used.
config: arm64-randconfig-r133-20250521 (https://download.01.org/0day-ci/archive/20250521/202505212010.qp6VW8sY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250521/202505212010.qp6VW8sY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505212010.qp6VW8sY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/perf_event.c:1021:5: sparse: sparse: symbol 'armv8pmu_max_events' was not declared. Should it be static?

vim +/armv8pmu_max_events +1021 arch/arm64/kernel/perf_event.c

  1020	
> 1021	int armv8pmu_max_events;
  1022	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
