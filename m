Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A7B19D074
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767431427; cv=none; b=FJxziUAd6n0orUlw+NnpPoFtLz/ATAE87TDwqjUKy2mSpaBAL55ubDegaih2MoBz1Aa7sOOiDkv1fay+YNloiuJN2T8fjG+6arh5sI+Tbumiyo3GpBvVT2++BCFkh+91TudGDoled/EEtA4jvdbH0ft5o0cCWGL4+lTlyQBhiV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767431427; c=relaxed/simple;
	bh=NjQgpm3c0YDvZe3xhZe3+yVN8WAoKDdfcYnSdq1gAeI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o9m3ljByfitj7AnRCNE7PmePiL/n6lum8lLwaU1qYaz5emPUFSPkNa8iWnEGQPmfvdqwC97QMf4rIR/sFO83kwGNQ/aGpg5iKDXQ43brwAjmLKuX360v2edZHAvdKFEp+aHSA08I+aMGfvWAc9zMAnjKTQP9te+Sxjb7ISiOoe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuizQKsU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuizQKsU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767431425; x=1798967425;
  h=date:from:to:cc:subject:message-id;
  bh=NjQgpm3c0YDvZe3xhZe3+yVN8WAoKDdfcYnSdq1gAeI=;
  b=fuizQKsUJbsWEf9jNP5wOZqCLaAMZEYdwy7JRpFX3sRRVOd3j8wPnuQl
   ARaAhwDLSa/3eEWNogQQ27cRsvAqsyvkhAFBjurJe1cR8DVxwDfaCfCkP
   tsStBQl2xrZd1EP/ThoejHykw94FFVpq02T81RSdGhdVZDB/de0/2qMxP
   XmiB2bRjm1tJQIeTkZB9ipLbCQA4fYd48CNK1rycGE3tmENBnhhhaw7pc
   7PZdYfXprbm1txElWxE8UVLT652hCHTNPf8NA/lYM96vISzRdWSeR8rwP
   +c16r0j+C7FaDHK97k4ChPb2KQVPrqt8hOUGgGAqJ4lj8GEkjy/7PYyNS
   Q==;
X-CSE-ConnectionGUID: dic6ztdSShSpWwDxzK/iPw==
X-CSE-MsgGUID: BLJIAVMZSaKJYoErXu/lLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68089234"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68089234"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 01:10:24 -0800
X-CSE-ConnectionGUID: RJLkI5evTGK1bfY/Yu/uQw==
X-CSE-MsgGUID: Oj2SprfyTbyJBxtcDgaJRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202225966"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jan 2026 01:10:24 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbxeP-000000002dp-3KK5;
	Sat, 03 Jan 2026 09:10:21 +0000
Date: Sat, 03 Jan 2026 17:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 drivers/android/debug_symbols.c:47:9: sparse: sparse: cast removes address
 space '__percpu' of expression
Message-ID: <202601031654.njxoymFh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   a0f93b828ee5433c5b427d8122a6dda0b514d985
commit: 3fcbb15c1a91a318fb9367bee24603af24648a2d [1/1] ANDROID: android: Create debug_symbols driver
config: arm64-randconfig-r122-20251224 (https://download.01.org/0day-ci/archive/20260103/202601031654.njxoymFh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601031654.njxoymFh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601031654.njxoymFh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/debug_symbols.c:47:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +47 drivers/android/debug_symbols.c

    41	
    42	/*
    43	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    44	 */
    45	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    46	#ifdef CONFIG_ARM64
  > 47		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    48	#endif
    49	#ifdef CONFIG_X86
    50		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    51	#endif
    52	};
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
