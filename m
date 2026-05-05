Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E0B40DFDA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 23:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778024479; cv=none; b=TrO1DFgeIXxlPHU5h1LsNcaTlzcf0OtwOdHuDESEQ8EiLML8k9YxOet14k2StAsFJ4XPttNXx836SVROD8acbWJRXSCAgVntI+fZzvzya47yoA8YxKgtQfGCi+UV2VEUlvrzHF5uQ64Gv/BU+r3a0qV/kuAM+mZ5FGhr4ttTg8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778024479; c=relaxed/simple;
	bh=RVcGj33is/ATnoERsLIwWTSIdQhSvr6QIspcZG7R5U0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VXNZFVvZjAAWjrqz54FJo8LkjqeFcWuZi6D+/SrgI5Aow9dX4cMKB6dwpYjWKwFjH66ZoHL67NO3mAFGa/NAPekqyDDxi24tH0rc5Pfs0KpRFD4/p3+JnHVSsr4iXeeA56p3OwdbDB1JjjtZyjxrCgSo3qYVo2HNxRjdleKJ/oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3RAQUtr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3RAQUtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778024477; x=1809560477;
  h=date:from:to:cc:subject:message-id;
  bh=RVcGj33is/ATnoERsLIwWTSIdQhSvr6QIspcZG7R5U0=;
  b=j3RAQUtrXeVHYl0AlyTsAkgg55rruvLGYoBm7U95ZreanQYKuCKeyITo
   JZoYM+rroK7DXVRSX9h2ZDRVFCVTo0PV66/VTDJBjgfJj/opr2ya9th12
   sokmBUR7Hwcfl0+oJtSlk8Kvn5B/kijSI1yhsismcDQc8UTISJaZIa8LU
   6Dla7efoyiWy5qH7vv59CbxMYElu7D6eyY6la1grxfiEL9hvwvXx1r7cv
   SqmGLgH9NCzm15h6JeWC9Qw4H/4HOsqc0v3rHTVq6N+d96J+j68mTEbNu
   /lWEeHYCImSJ3yTK3KsfAHJ+5lBefXkStVOmIEtOfdv7x2c30fyGRzxCU
   A==;
X-CSE-ConnectionGUID: vQIcu01cSwGnbpr4MXO8cQ==
X-CSE-MsgGUID: rMb2NeCXSvuGRmtIADlAOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78815027"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="78815027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 16:41:12 -0700
X-CSE-ConnectionGUID: Kbfp0w79RMyzAdVWa6ieDA==
X-CSE-MsgGUID: F47TdsbYTsCkW8qQa5KcLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="266297811"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 May 2026 16:41:06 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKPNv-000000000Wj-3K8T;
	Tue, 05 May 2026 23:41:03 +0000
Date: Wed, 06 May 2026 07:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:alloc-token 2/3] WARNING: modpost: vmlinux: section
 mismatch in reference: intel_pmu_init_hybrid+0xac (section:
 .text.intel_pmu_init_hybrid) -> intel_hybrid_pmu_type_map (section:
 .init.rodata)
Message-ID: <202605060727.UnwlOsYE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   a242ca2a86d31e281042b6d394cd434a2381f9a9
commit: d228104290ad6a6f5f66c8ee5aa9a81e3c99615c [2/3] slab: support for compiler-assisted type-based slab cache partitioning
config: i386-buildonly-randconfig-003-20260505 (https://download.01.org/0day-ci/archive/20260506/202605060727.UnwlOsYE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060727.UnwlOsYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060727.UnwlOsYE-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: intel_pmu_init_hybrid+0xac (section: .text.intel_pmu_init_hybrid) -> intel_hybrid_pmu_type_map (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: intel_pmu_init_hybrid+0xba (section: .text.intel_pmu_init_hybrid) -> intel_hybrid_pmu_type_map (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
