Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F9E242D9B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 06:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135090; cv=none; b=bFMHLxLvhi6P75G3IC9VRy2D527iRifa5IAocrHRolZzgtjyEJIEOXCJlqEpMJZLRuLGsyj6qY9EDwHbeaRrbPBxNf1kyS380ymPGgE5kY+Vab0D7ZfwPdbFQ5CEmhLYmKPIYdAUHX9Ob2neJCjhY+84i2sIEPCqWpjw2UCpYzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135090; c=relaxed/simple;
	bh=VhcKYpNKfY+udUCQXQOiCrpoE0OmapESL+JoxnbgVR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RON35/fm4cPpC9+AII4z4DTUTiSfwGSmmW9PBe48hJ882mrb+6JGpKfhCkJTb1Y5M3G6fWD4ShrnkfogfhEwU9G/mx4AFVBQ86s9ooQdMhPL0XdrCbb8rVPgULTLIuQ8zK+IKb+wi1QDT4NGhR29TB/54f4wpaIET0Ag2zQWRcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKPqyQDZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKPqyQDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778135088; x=1809671088;
  h=date:from:to:cc:subject:message-id;
  bh=VhcKYpNKfY+udUCQXQOiCrpoE0OmapESL+JoxnbgVR4=;
  b=XKPqyQDZ2bDS0mPcooi0hcU4mt5FWpISXUsb46rX81yu4ETjtv6wk/ry
   iYJnbRHwGQlT+qO5m1oiMEqMhPREcKF1+zPyAmqjnMwDgIYI1/PBScD+s
   fllQNsCljaMqL3SuV59fHSZ6J+mlrs0WtjV5VqneHTwWZYBjpBnRxVkOD
   Z/zkfCb9X7irQYndPwAK1iYWBmpCpyhOZSQr2KDSOgGxOtd3rAQvVpNqb
   Qth11uFRABAE8a88pwWP1BtIh2xnx3PKE+NxBNNeGwZTivhR1TbM8Cg7P
   LZIs4qeGNgAXuvgaanVrw1UUullJz5soNNmV9uq5pdj+SMd99cErxVjNX
   A==;
X-CSE-ConnectionGUID: rO7l3NHpRDmViyR2wO7guQ==
X-CSE-MsgGUID: Ng28q8q+RYigT3Rps41q6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="104536183"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="104536183"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 23:24:48 -0700
X-CSE-ConnectionGUID: o2lZkr95T+ixU4uV+FHhKQ==
X-CSE-MsgGUID: ycXX/Vi2SVipdps3RQiIqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="231826130"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 May 2026 23:24:46 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKsA8-00000000015-2F1C;
	Thu, 07 May 2026 06:24:44 +0000
Date: Thu, 07 May 2026 14:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:alloc-token 2/3] WARNING: modpost: vmlinux: section
 mismatch in reference: intel_pmu_init_hybrid+0xac (section: .text) ->
 intel_hybrid_pmu_type_map (section: .init.rodata)
Message-ID: <202605071439.oF98IQpd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   a242ca2a86d31e281042b6d394cd434a2381f9a9
commit: d228104290ad6a6f5f66c8ee5aa9a81e3c99615c [2/3] slab: support for compiler-assisted type-based slab cache partitioning
config: i386-randconfig-006-20260505 (https://download.01.org/0day-ci/archive/20260507/202605071439.oF98IQpd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071439.oF98IQpd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071439.oF98IQpd-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: intel_pmu_init_hybrid+0xac (section: .text) -> intel_hybrid_pmu_type_map (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: intel_pmu_init_hybrid+0xba (section: .text) -> intel_hybrid_pmu_type_map (section: .init.rodata)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=m] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=m] && HAS_IOMEM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
